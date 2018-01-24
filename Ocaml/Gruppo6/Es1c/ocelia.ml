(* dropwhile: (’a -> bool) -> ’a list -> ’a list *)
(* dropwhile p lst riporti la lista che si ottiene eliminando i primi elementi di lst,  *)
(* fino a che soddisfano il predicato p *)
let rec dropwhile p lst =
		match lst with
		| [] -> []
		| hd::tl -> if p hd then dropwhile p tl else hd::tl
