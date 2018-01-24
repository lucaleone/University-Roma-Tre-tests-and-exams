type interpretation = (string * bool) list
(* goTrue applicato ad un interpretation, ritorna il una Prop del letterale p se l'inaggiungendo p, *)
(* se p è vera nell'interpertazione, la Prop negata altrimenti.  *)
(* goTrue : string * bool -> form *)
let goTrue = function
	| a, true -> Prop a
	| a, false -> Not (Prop a)

(* data una lista di interpretazioni, costruisca tramite congiunzione la formula che la rappresenta *)
(* aggiungendo p, letterale,  se p è vera nell'interpertazione, e p negato altrimenti.  *)
(* int2form : (string * bool) list -> form *)
let rec int2form = function
	| [] -> failwith "Lista vuota"
	| [hd] -> goTrue hd
	| hd::tl -> And(goTrue hd, int2form tl)
	