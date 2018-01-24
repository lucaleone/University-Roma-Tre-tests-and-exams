(* in_tutte: (int * ((int * int) * ’a) list) -> ’a -> bool *)
(* data una matrice matrix e un valore value, verifica *)
(* se tutte le righe della matrice contengono il valore dato. *)
(* aux: int -> bool *)
(* aux scorre l'intero n a partire dalla lunghezza della matrice-1, fino a 0*)
(* ad ogni iterazione tramite la funzione in_riga controlla se value è presente almeno una volta*)
(* nella riga. *)
let in_tutte matrix value =
		let rec aux n = 
		match n with
		| -1 -> true
		| _ -> (in_riga matrix n value)&&aux (n-1)
		in aux ((fst matrix)-1)  
		
