(* Yes, we have to repeat open Graph. *)
open Graph 
open Printf

(* assert false is of type ∀α.α, so the type-checker is happy. *)
let clone_nodes (gr: 'a graph) = n_fold gr (fun g i -> new_node g i )  empty_graph;;
(*maps all arcs of gr by function f.*)
let gmap gr f = e_fold gr (fun g id1 id2 c -> new_arc g id1 id2 (f c)) (clone_nodes gr);;
(*adds n to the value of the arc between id1 and id2. If the arc does not exist, it is created.*)
let add_arc g id1 id2 n= match find_arc g id1 id2 with
|None -> new_arc g id1 id2 n
|Some x -> new_arc g id1 id2 (x+n)
 ;;

 let result_graph gr1 gr2 = 
  let f gr i = 
    let rec all_arcs g = function
    |[] -> g
    |(x,lbl)::b -> all_arcs (new_arc g i x 
    begin
      match find_arc gr2 x i with
      |None -> "0/" ^ string_of_int lbl
      |Some y ->  string_of_int y ^ "/" ^string_of_int (lbl)
    end) b
    in all_arcs gr (out_arcs gr1 i)
  in n_fold gr1 f (clone_nodes gr1) ;;

  