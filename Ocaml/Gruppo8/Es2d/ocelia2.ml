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
		| Tr(a,t1,t2) -> postorder(t1)@postorder(t2)@[a]

(* inorder : 'a tree -> 'a list *)
(* inorder abr riporta una lista di un albero letto nell'ordine:*)
(* nodo sinistro,etichetta,nodo destro*)	
let rec inorder = function
		| Empty -> []
		| Tr(a,t1,t2) -> inorder(t1)@[a]@inorder(t2)