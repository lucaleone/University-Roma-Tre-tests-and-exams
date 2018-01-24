type expr =
Int of int
| Var of string
| Sum of expr * expr
| Diff of expr * expr
| Mult of expr * expr
| Div of expr * expr


(* subst_in_expr : expr -> 'a -> expr -> expr *)
(* subst_in_expr e1 var e2 sostituisce in ogni occorrenza di var in e1, e2*)
let rec subst_in_expr expr var expr2 =
	match expr with
	| Var var -> expr2
	| Sum(a, b) ->  Sum((subst_in_expr a var expr2), (subst_in_expr b var expr2))
	| Diff(a, b)-> Diff((subst_in_expr a var expr2), (subst_in_expr b var expr2))
	| Mult(a, b)-> Mult((subst_in_expr a var expr2), (subst_in_expr b var expr2))
	| Div(a, b) ->  Div((subst_in_expr a var expr2), (subst_in_expr b var expr2))
	| _ -> expr

type 'a tree = Empty | Tr of 'a * 'a tree * 'a tree

(* fulltree : int -> int tree *)
(* fulltree k riporta un albero binario completo di altezza k con radice 1 e figli 2x e 2x+1 *)
(* aux : int -> int -> int tree *)
(* aux x k riporta un albero binario completo di altezza k con radice x e figli 2x e 2x+1*)
let fulltree k =
	if k <0 then failwith "numero negativo"
	else let rec aux x = function
			| 0 -> Empty
			| k -> Tr(x, aux (2 * x) (k -1), aux (2 * x +1) (k -1))
		in aux 1 k

(* preorder : 'a tree -> 'a list *)
(* preorder abr riporta una lista di un albero letto nell'ordine:*)
(* etichetta,nodo sinistro,nodo destro*)		
let rec preorder = function
	| Empty -> []
	| Tr(a,t1,t2) -> a::preorder(t1)@preorder(t2)
		
(* postorder : 'a tree -> 'a list *)
(* postorder abr riporta una lista di un albero letto nell'ordine:*)
(* nodo sinistro,nodo destro,etichetta*)	
let rec postorder = function
		| Empty -> []
		| Tr(a,t1,t2) -> preorder(t1)@preorder(t2)@[a]

(* inorder : 'a tree -> 'a list *)
(* inorder abr riporta una lista di un albero letto nell'ordine:*)
(* nodo sinistro,etichetta,nodo destro*)	
let rec inorder = function
		| Empty -> []
		| Tr(a,t1,t2) -> preorder(t1)@[a]@preorder(t2)

(* foglie_in_lista : 'a list -> 'a tree -> bool *)
(* foglie_in_lista lst abr riporta true se tutte le foglie di abr sono presenti in lst,*)
(* false altrimenti*)
let rec foglie_in_lista lst = function
	| Empty -> true
	| Tr(x,Empty,Empty) -> List.mem x lst
	| Tr(a,t1,t2) -> (foglie_in_lista lst t1) && (foglie_in_lista lst t2)

(* segui_bool : bool list -> 'a tree -> 'a *)
let rec segui_bool lst abr =
	match lst,abr with
	| [],Tr(a,t1,t2)-> a
	| true::rest,Tr(_,t1,t2) -> segui_bool rest t1
	| false::rest,Tr(_,t1,t2) -> segui_bool rest t2
	| _,Empty -> failwith "Lista troppo lunga"

(* foglie_costi : int tree -> (int * int) list *)
let rec foglie_costi abr =
	let rec aux (foglia, sum) lst = function
		Empty -> (0,0)::lst
		| Tr (a, Empty, Empty) -> (a, sum + a)::lst
		| Tr (a, t1, t2) -> (aux(a, sum + a ) lst t1) @ (aux(a,sum + a ) lst t2)
		 in aux (0,0) [] abr