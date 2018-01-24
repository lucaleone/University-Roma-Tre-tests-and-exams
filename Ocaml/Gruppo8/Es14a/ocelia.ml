(* colore : 'a -> ('b * 'a list) list -> 'b*)
(* colore x lst riporta il colore associato all'elemento x di lst*)
(* se x non è presente in lst riporta un eccezione *)
let rec colore x = function
	| [] -> failwith "oggetto non presente"
	| (a,lst)::rest -> if (List.mem x lst) then a
										else colore x rest