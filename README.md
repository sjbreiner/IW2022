# IW2022
Resources for category theory tutorial @ INCOSE IW 2022


In order to run the Catlab notebook example:

0. Download the files from this repository into a folder on your computer.

1. Install Julia as described [here](https://julialang.org/downloads/)

2. Open a terminal window and type `julia` to open the Julia prompt. You should get something that looks like this:
		```
		julia> _
		```
3. Run `Pkg.add("IJulia")` at the Julia prompts to install Julia's Jupyter notebook package. If you already have Jupyter installed (e.g., with Anaconda) you can use that, but you may need to install a new kernel.

4. Run `Pkg.add("Catlab")` to install the Catlab package.

5. Run `using IJulia` to import the Jupyter package.

6. Run `notebook()`. A Jupyter window should open in your web browser, showing your file system.

7. Locate the `IW2022_Demo.ipynb` file saved on your machine and click to open. The notebook should open a new tab in your web browser.

8. Run the notebook cells (in order!) using the buttons at the top, or by hitting `Ctrl+Enter` from within a cell.
