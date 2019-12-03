open Gfile
open Tools
open Fordfulk

(* 
ocamlc -c graph.mli graph.ml gfile.mli gfile.ml tools.mli tools.ml fordfulk.mli fordfulk.ml
ocamlc -o ftest graph.cmo gfile.cmo tools.cmo fordfulk.cmo ftest.ml 
 ./ftest "../graphs/graph1" 0 1 "../graphs/outgraph"
 *)


let () =

  (* Check the number of command-line arguments *)
  if Array.length Sys.argv <> 5 then
    begin
      Printf.printf "\nUsage: %s infile source sink outfile\n\n%!" Sys.argv.(0) ;
      exit 0
    end ;


  (* Arguments are : infile(1) source-id(2) sink-id(3) outfile(4) *)

  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(4)

  (* These command-line arguments are not used for the moment. *)
  and _source = int_of_string Sys.argv.(2)
  and _sink = int_of_string Sys.argv.(3)
  in

  (* Open file *)
  let graph = from_file infile in

  (* Rewrite the graph that has been read. *)
  let new_graph = ford_fulkerson (gmap graph int_of_string) 0 5
  in export outfile (result_graph (gmap graph int_of_string) new_graph)
  

