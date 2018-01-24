(* in_riga: (int * ((int * int) * ’a) list) -> int -> ’a -> bool *)
(* data una matrice matr, un numero n di riga e un valore value *)
(* verifica se la riga data contiene il valore dato *)
let in_riga matr n value = 
	List.exists (fun x -> (snd x=value) && ((fst (fst x))=n)) (snd matr)
