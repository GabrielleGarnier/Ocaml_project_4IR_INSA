open Gfile
open Tools
open Graph

(* A path is a list of nodes. *)
type path = id list

(* find_path gr forbidden id1 id2 
 *   returns None if no path can be found.
 *   returns Some p if a path p from id1 to id2 has been found. 
 *  don't return arcs where lbl <=0
 *  forbidden is a list of forbidden nodes (they have already been visited)
 *)
val find_path: int graph -> id list -> id -> id -> path option


(* update flow retourne le graphe avec les flow du path auquels on update int x (en creant les arcs inversés aussi)*)
val update_flow : int graph -> int -> id -> id -> path -> int graph

(*find max flow retourne le max d'incrementation possible*)
val find_max_flow : int graph -> int -> id -> id -> path -> int

val get_inflow : int graph -> int -> int

val etape_algo : int graph -> id -> id -> path -> int graph

val ford_fulkerson : int graph -> id -> id -> int graph
