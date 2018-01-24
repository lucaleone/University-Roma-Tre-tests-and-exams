(* postorder : 'a ntree -> 'a list*)
(* postorder ritorna la lista dei nodi di un albero n-ario visitati in postordine *)
(* postorderlst : 'a ntree list -> 'a list *)
(* postorderlst funzione ausiliaria che applicata a una lista di alberi *)
(* chiama postorder per ogni figlio *)
let rec postorder (Tr(x,tlist)) =
	(postorderlst tlist)@[x]
	and postorderlst = function
		| [] -> []
		| hd::tl -> (postorder hd) @ (postorderlst tl)
	
(* inorder : 'a ntree -> 'a list *)
(* inorder ritorna la lista dei nodi di un albero n-ario visitati in ordine *)
let rec inorder (Tr(x, tlist)) =
	match tlist with
  | [] -> [x]
  | [y] -> [x] @ (inorder y)
  | y :: rest ->((inorder y)@[x])@(List.flatten (List.map inorder rest))