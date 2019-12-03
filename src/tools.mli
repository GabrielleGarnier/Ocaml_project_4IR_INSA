open Graph

val clone_nodes: 'a graph -> 'b graph
val gmap: 'a graph -> ('a -> 'b) -> 'b graph
val add_arc: int graph -> id -> id -> int -> int graph

(*return the result graph of ford fulkerson with labels "flow sent/capacity" *)
val result_graph : int graph -> int graph -> string graph