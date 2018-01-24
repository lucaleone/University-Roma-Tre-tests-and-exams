type form =
	| True
	| False
	| Prop of string
	| Not of form
	| And of form * form
	| Or of form * form
	| Imp of form * form

(* es 1 *)
(* complessita prende a parametro un tipo form e calcola la sua complessità *)
(* complessita : form -> int *)
let rec complessita = function
	| And(a, b) | Or(a, b) | Imp(a, b) -> 1 + (complessita a) + (complessita b)
	| Not a -> 1 + (complessita a)
	| _ -> 0


(* es 3 *)
(* mkor applicata a una lista di form, riporta la disgiunzione di     *)
(* tutte le formule nella lista se la lista è vuota riporta un False.       *)
(* mkor : form list -> form *)
let rec mkor = function 
	| [] -> False
	| [hd] -> hd
	| hd:: tl -> And(hd, mkor tl)

(* es5 *)
(* isAtomo torna true se l'argomento passato a parametro è un atomo, quindi True, False o Prop *)
(* isAtomo : form -> bool *)
let isAtomo = function
	| True | False | Prop _ -> true
	| _ -> false

(* test_nnf applicata ad una form controlla che essa sia in forma normale negativa, ovvero contanga solamente *)
(* ovvero che contenga solo ¬,∧ e ∨ e che ¬ sia applicato solo ad atomi*)
(* test_nnf : form -> bool *)
let rec test_nnf = function
	| Imp _ -> false
	| Not a -> isAtomo a
	| And(a, b) | Or(a, b) -> (test_nnf a) && (test_nnf b)
	| _ -> true

(* es 7 *)
exception NotConjunction
(* and2list applicata a una congiunzione di letterali, riporti la lista dei letterali che la compongono *)
(* Se la formula non è una congiunzione di letterali, la funzione solleverà l'eccezione NotConjunction  *)
(* and2list : form -> form list *)
let rec and2list = function
	| Imp _ | Or _ -> raise NotConjunction
	| And(a, b) -> (and2list a)@(and2list b)
	| p -> [p]

(* ( match (isAtomo a), (isAtomo b) with | true, true -> a::b | true,      *)
(* false -> a::(and2list b) | false, true -> b::(and2list a) | false,      *)
(* false ->                                                                *)

(* es 9 *)
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
	| hd:: tl -> And(goTrue hd, int2form tl)

(* es 11 *)
	
	
	
	
	
	
	
	