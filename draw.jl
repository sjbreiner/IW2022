


draw(g::AbstractIWGraph;kw...) = begin
	GV = Catlab.Graphics.Graphviz
	stmts = GV.Statement[]
	label(x) = begin
		val = subpart(g,:label)[x]
		if val isa Tuple
			mapreduce(string,(x,y)->x*","*y,val)
		else val
		end
	end
	src(x) = subpart(g,:src)[x]
	tgt(x) = subpart(g,:tgt)[x]
	weight(x) = subpart(g,:weight)[x]

	for v in parts(g,:V)
		push!(stmts, GV.Node(string(v),Dict(:label=>label(v))))
	end

	for e in parts(g,:E)
		push!(stmts,
			GV.Edge(
				[string(src(e)),string(tgt(e))],
				Dict(:label=>string(weight(e)))
			)
		)
	end

	GV.Digraph("myGraph",stmts,kw...)
end



draw(S::Subobject{<:AbstractIWGraph};kw...) = begin
	GV = Catlab.Graphics.Graphviz
	stmts = GV.Statement[]
	label(x) = begin
		val = subpart(S.ob,:label)[x]
		if val isa Tuple
			mapreduce(string,(x,y)->x*","*y,val)
		else val
		end
	end
	src(x) = subpart(S.ob,:src)[x]
	tgt(x) = subpart(S.ob,:tgt)[x]
	weight(x) = subpart(S.ob,:weight)[x]
	nodecolor(x) = if isin(x,:V)
		"red"
	else
		"black"
	end
	edgecolor(x) = if isin(x,:E)
		"red"
	else
		"black"
	end

	isin(x,T) = begin
		comp = S.components[T]
		if hasproperty(comp,:hom)
			x in comp.hom.func
		elseif hasproperty(comp,:predicate)
			comp.predicate[x]
		else
			throw(error("Unknown type"))
		end
	end

	for v in parts(S.ob,:V)
		push!(stmts, GV.Node(string(v),Dict(
			:label => label(v),
			:color => nodecolor(v)
		)))
	end

	for e in parts(S.ob,:E)
		push!(stmts,
			GV.Edge(
				[string(src(e)),string(tgt(e))],
				Dict(
					:label => string(weight(e)),
					:color => edgecolor(e)
				)
			)
		)
	end

	GV.Digraph("myGraph",stmts,kw...)
end
