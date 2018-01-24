(* dato un elemento x e una lista di liste l la funzione *)
(* prepend_all x lst, dove lst è una lista di liste*)
(* deve ritornare una lista composta dalla lista delle precedenti liste ma con in testa x*)
(* prepend_all : 'a -> 'a list list -> 'a list list *)
let prepend_all x lst =
	List.map (fun hd -> x::hd) lst

(* inserisce l'elemento x in tutte le posizioni della lista *)
(* insert_all : 'a -> 'a list -> 'a list list *)
let rec insert_all x = function
[] -> [[x]]
| hd::tl -> (x::hd::tl)::(prepend_all hd (insert_all x tl))

(* la funzione permut va solamente a chiamare i metodi di supporto per ogni elemento della lista passata a parametro *)
(* permut : 'a list -> 'a list list *)
let rec permut = function
	| [] -> [[]]
	| hd::tl -> List.flatten (List.map (insert_all hd) (permut tl))