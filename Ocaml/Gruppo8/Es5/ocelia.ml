(* segui_bool : bool list -> 'a tree -> 'a *)
(* segui_bool abr lst riporta la radice del sottoalbero *)
(* di abr determinato da lst, se questo non è vuoto, un errore altrimenti. *)
let rec segui_bool lst abr =
	match lst,abr with
	| [],Tr(a,_,_)-> a
	| true::rest,Tr(_,t1,_) -> segui_bool rest t1
	| false::rest,Tr(_,_,t2) -> segui_bool rest t2
	| _,Empty -> failwith "Lista troppo lunga"