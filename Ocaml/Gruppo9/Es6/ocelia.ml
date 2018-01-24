(* duale : form -> form *)
(* duale applicata a una form NNF riporta la sua duale. *)
(* Se la form non è una NNF allora solleverà una eccezione *)
(* complementare è la funzione dell'esercizio 4 *)
let rec duale = function
	| And(f,g) -> Or(duale f,duale g)
	| Or(f,g) -> And(duale f,duale g)
	| f -> try (complementare f) with 
				Not_Atomo -> failwith "la formula non è una NNF"
