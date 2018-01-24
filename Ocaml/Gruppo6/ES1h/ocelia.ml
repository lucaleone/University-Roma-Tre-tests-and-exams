(* subset : 'a list -> 'a list -> bool *)
(* entrambi i fun hanno tipo 'a -> bool *)
(* il for_all restituisce true se per tutti gli elementi di lst1 è verificata la sua condizione*)
(* la condizione rischiede che l'elemento hd (elemnto temporaneo in testa di lst1) esista nella lista lst2 *)
let subset lst1 lst2 =
	List.for_all (fun hd -> List.exists (fun hd2 -> hd=hd2) lst2) lst1