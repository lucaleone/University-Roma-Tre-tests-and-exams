type 'a tree =
		Empty
	| Tr of 'a * 'a tree * 'a tree
	
(* preorder : 'a tree -> 'a list *)  
let rec preorder = function
 | Empty -> []
 | Tr(a,t1,t2) -> a::preorder(t1)@preorder(t2)
 	 

(* inorder : 'a tree -> 'a list *)
let rec inorder = function
 	| Empty -> []
 	| Tr(a,t1,t2) -> preorder(t1)@[a]@preorder(t2)

(* take : int -> 'a list -> 'a list *)
let rec take n = function
    [] -> []
  | x::xs -> if n<=0 then [] else 
             x::take (n-1) xs						
(* drop: int -> 'a list -> 'a list *)
(* drop n lst = lista che si ottiene da lst togliendone i primi n elementi.  *)
let rec drop n = function
  |  [] -> []
  | _::rest as lst -> if n>0 then drop (n-1) rest else lst
(* balpreorder : 'a list -> 'a tree *)
let rec balpreorder = function
	| [] ->Empty
	| hd::tl -> let n = (List.length tl)/2 in Tr(hd,balpreorder (take n tl), balpreorder (drop n tl))

(* balinorder : 'a list -> 'a tree *)
let rec balinorder = function
	| [] -> Empty
	| lst -> let n = (List.length lst)/2 in Tr(List.nth lst n,balinorder (take n lst), balinorder (drop (n+1) lst))



