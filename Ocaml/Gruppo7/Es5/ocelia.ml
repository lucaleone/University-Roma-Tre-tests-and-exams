type 'a pattern = Jolly | Val of 'a

(* most_general_match applicato a due liste, confronta gli elementi, *)
(* quando sono uguali restituisce quel valore convertito in  'a pattern, se no Jolly *)
(* l'errore è gestito dalla funzione di libreia List.map2 *)
(* most_general_match: ’a list -> ’a list -> ’a pattern list *)
let most_general_match lst1 lst2 =
		List.map2 (fun hd1 hd2 ->  if (Val hd1) = (Val hd2) then Val hd1 else Jolly) lst1 lst2