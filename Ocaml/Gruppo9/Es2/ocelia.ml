(* mkand : form list -> form *)
(*mkand applicata a una lista di form, riporta la congiunzione di     *)
(* tutte le formule nella lista se la lista è vuota riporta un True.       *)
let rec mkand = function
	| [] -> True
	| [hd] -> hd
	| hd::tl -> And(hd,mkand tl)
