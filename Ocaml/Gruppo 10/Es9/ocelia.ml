(* riporta true se l'etichetta della radice dell'albero passato a parametro è un numero primo *)
(* isprimo : int ntree -> bool *)
let isprimo = function
	| Tr(x, _) -> let rec aux count =
				if count < x then (x mod count <> 0) && (aux (count +1))
				else true
			in aux 2

(* riporta, se esiste, una foglia n dell’albero tale che *)
(* il ramo dell’albero dalla radice a n sia costituito da tutti numeri primi *)
(* ramo_di_primi : int ntree -> int *)
let rec ramo_di_primi abr =
	if isprimo abr then
		match abr with
		| Tr(a, []) -> a
		| Tr(a, lst) -> let rec aux = function
            					| [hd] -> ramo_di_primi hd
            					| hd:: tl -> try ramo_di_primi hd with _ -> aux tl
            				in aux lst
	else failwith "Non esiste un ramo di primi"
