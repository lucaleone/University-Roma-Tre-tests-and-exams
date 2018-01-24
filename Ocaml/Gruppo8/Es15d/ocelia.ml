type 'a tree = Empty | Tr of 'a * 'a tree * 'a tree

let rec abr_delmin = function
	| Empty -> failwith "chiave non esistente"
  | Tr(label, Empty, Empty) ->  label,5 (* usare 15e *)
	| Tr(_, sx, _) -> abr_delmin sx
  