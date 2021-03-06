(* trova_colonna: (int * ((int * int) * ’a) list) -> int -> ’a *)
(* data una matrice matr, un numero di riga r *)
(* e un valore value, riporta il numero di colonna c tale che (r,c) contiene *)
(* value (se esiste), altrimenti solleva un’eccezione *)
let in_colonna matr r value =
  snd (fst (List.find (fun x -> (snd x=value) && ((fst (fst x))=r)) (snd matr)))
