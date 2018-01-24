(* mkor applicata a una lista di form, riporta la disgiunzione di     *)
(* tutte le formule nella lista se la lista è vuota riporta un False. *)
(* mkor : form list -> form *)
let rec mkor = function 
	| [] -> False
	| [hd] -> hd
	| hd:: tl -> Or(hd, mkor tl)
