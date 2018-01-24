(* fulltree : int -> int tree *)
(* fulltree k riporta un albero binario completo di altezza k con radice 1 e figli 2x e 2x+1 *)
(* aux : int -> int -> int tree *)
(* aux x k riporta un albero binario completo di altezza k con radice x e figli 2x e 2x+1*)
let fulltree k =
	if k <0 then failwith "numero negativo"
	else let rec aux x = function
			| 0 -> Empty
			| k -> Tr(x, aux (2 * x) (k -1), aux (2 * x +1) (k -1))
		in aux 1 k