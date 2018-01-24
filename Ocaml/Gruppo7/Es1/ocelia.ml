(* esegui pos actions prende una posizione ed una lista di azioni. *)
(* Esegue tutte questa azioni a partire dalla posizione p e restituisce la posizione aggiornata*)
(* esegui : posizione -> azione list -> posizione *)
let rec esegui pos actions =
	match actions with
	| [] -> pos
	| hd::tl -> esegui (sposta pos hd) tl
