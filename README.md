Base project for Ocaml project on Ford-Fulkerson. This project contains some simple configuration files to facilitate editing Ocaml in VSCode.

To use, you should install the *OCaml* extension in VSCode. Other extensions might work as well but make sure there is only one installed.
Then open VSCode in the root directory of this repository.

Features :
 - full compilation as VSCode build task (Ctrl+Shift+b)
 - highlights of compilation errors as you type
 - code completion
 - automatic indentation on file save


A makefile also provides basic automation :
 - `make` to compile. This creates an ftest.native executable
 - `make format` to indent the entire project

 Run (run the ford fulkerson algorithm (from node 0 to node 5) on the input graph and return a clear result graph with labels "flow sent/capacity"):
 -`./ftest.native "graphs/graph1" 0 1 "graphs/result" `
    where graph1 and result are graphs in dot format
 -`dot -Tsvg graphs/result > graphs/resultgraph.svg`
    where result is in dot format, return an svg file (resultgraph), easier on the eye

By Gabrielle Garnier