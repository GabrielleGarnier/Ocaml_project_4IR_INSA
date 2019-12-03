open Gfile
open Tools
open Graph

type path = id list

let rec find_path gr forbidden id1 id2 = 
  if id1=id2 then Some [] else
  let all_arcs = out_arcs gr id1 in
  let rec is_forbidden x = function
  |[] -> false
  |a::b when x=a -> true
  |a::b->is_forbidden x b
  in
  let rec my_arcs = function
  |[] -> []
  |(x,y)::b -> if (is_forbidden x forbidden) || y<=0 then my_arcs b else x::(my_arcs b)
  in match my_arcs all_arcs with
  |[] -> None
  |x::b -> let new_path = find_path gr forbidden x id2 in match new_path with 
  |None -> find_path gr (x::forbidden) id1 id2 
  |Some y ->Some (x ::y)
  ;;

  let rec update_flow gr x id1 id2= function
  |[] -> add_arc (add_arc gr id2 id1 x) id1 id2 (-x)
  |a::b -> update_flow (add_arc (add_arc gr a id1 x) id1 a (-x)) x a id2 b
  ;;

  let rec find_max_flow gr lim id1 id2 = function
  |[] -> lim
  |a::b ->  begin
    match find_arc gr id1 a with
  |None -> 0
  |Some x -> find_max_flow gr (min lim x) a id2 b
  end
;;

let get_inflow gr idend =
  let rec sum_arc  = function
  |[] -> 0
  |(_,lbl)::b -> lbl + sum_arc b
  in let my_arc = out_arcs gr idend
  in sum_arc my_arc
  ;;


let etape_algo gr id1 id2 my_path =
  let max = find_max_flow gr max_int id1 id2 my_path in
  update_flow gr max id1 id2 my_path
  ;;

let rec ford_fulkerson gr id1 id2 =
  match find_path gr [] id1 id2 with
  |None -> Printf.printf "maxflow du graphe : %d \n%!" (get_inflow gr id2); gr
  |Some x -> ford_fulkerson (etape_algo gr id1 id2 x) id1 id2
  ;;





  