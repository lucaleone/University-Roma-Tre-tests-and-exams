(* determina se ogni foglia dell'albero appartiene alla lista lst *)
(* foglie_in_lista : 'a list -> 'a ntree -> bool *)
let rec foglie_in_lista lst = function
		| Tr(a, []) -> List.mem a lst
		| Tr(_, figli) -> List.for_all (fun hd -> foglie_in_lista lst hd) figli
