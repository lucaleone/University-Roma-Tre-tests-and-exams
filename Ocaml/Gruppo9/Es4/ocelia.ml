(* letterale : form -> bool*)
(* letterale applicato a una form torna true se questa è letterale *)
let rec letterale = function
	| True | Prop _ | False -> true
	| Not a -> letterale a
	| _ -> false


(* complementare : form -> form *)
(* complementare applicata a un letterale ritorna il suo complementare.*)
(* Se non è un letterale ma una formula solleverà una eccezione*)
let rec complementare = function
	| True -> False
	| False -> True
	| Prop s -> Not(Prop s)
	| Not a -> if(letterale a) then a
	           else raise Not_Atomo
	| _ -> raise Not_Atomo