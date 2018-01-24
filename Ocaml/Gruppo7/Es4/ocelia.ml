type obj = Miss | Cann | Barca
type situazione = obj list * obj list

let initial = ([Miss; Miss; Miss; Cann; Cann; Cann; Barca], [])

type azione =
		From_left of obj list
	| From_right of obj list

(* safe : situazione -> bool *)
(* aux : int -> int -> situazione -> bool *)
(* safe controlla che la situazione sulla sponda sinistra e destra sia sicura, *)
(* ovvero miss>=cann, nel caso in cui ci siano missionari*)
(* aux miss cann situazione dove miss sono i numeri dei missionari,*)
(* cann il numero dei cannibali della situazione*)
let safe situazione =
		let rec aux miss cann situazione =
		match situazione with
		| [] -> miss=0 || cann <= miss
		| Miss::rest -> aux (miss +1) cann rest
		| Cann::rest -> aux miss (cann +1) rest
		| x::rest -> aux miss cann rest
	in aux 0 0(fst situazione) && aux 0 0(snd situazione)


(* checkBarcaleft : situazione -> bool*)
(* controlla che la posizione della barca sia a sinistra in situazione, restituendo un booleano *)
let checkBarcaleft situazione =
	List.exists (fun hd -> hd = Barca) (fst situazione)


(* remove_fst : 'a -> 'a list -> 'a list *)
(* remove_fst x lst elimina il primo elemento dalla lista uguale ad x.*)
(* Fallisce se non lo trova*)
let rec remove_fst x = function
	| [] -> failwith "Elemento non esistente"
	| hd:: tl -> if(hd = x) then tl
			else hd::remove_fst x tl

(* remove_lst : 'a list -> 'a list -> 'a list *)
(* aux : 'a list -> 'a list -> 'a list *)
(* remove_lst lst lst2 rimuove una volta gli elementi di lst da lst2*)
let remove_lst lst lst2 =
	let rec aux lst lst2 =
		match lst with
		| [] -> lst2
		| x::rest -> if(List.mem x lst2) then aux rest (remove_fst x lst2)
				else aux (x::rest) lst2
	in aux lst lst2

(* applica : azione -> situazione -> situazione *)
(* applica act sit controlla il tipo di act e la applica a sit*)
(* aux : azione -> situazione -> situazione *)
(* aux act sit rimuove tutti gli elementi da una sponda di sit e la aggiunge all'altra,*)
(* in base al tipo di act*)
let applica act sit =
	let aux act sit = if (checkBarcaleft sit) then
				let sit2 = (remove_fst Barca (remove_lst act (fst sit)), Barca:: (snd sit)@act)
				in if (safe sit2)
				then sit2
				else failwith "Situazione non sicura"
			else failwith "Barca in posizione sbagliata"
	in match act with
	| From_left x -> aux x sit
	| From_right x -> aux x (snd sit,fst sit)

let actions =
	let elems =
		[[Miss];[Cann];[Miss; Cann];[Miss; Miss];[Cann; Cann]]
	in (List.map (function x -> From_left x) elems)
	@ (List.map (function x -> From_right x) elems)
	
(* from_sit : situazione -> situazione list *)
(* from_sit sit restituisce una lista con tutte le possibili situazioni che si ottengono*)
(* applicando actions a sit*)
let from_sit sit =
	 List.filter (fun hd1 -> hd1<>([],[]))(List.map (fun hd2 -> try (applica hd2 sit) with _ -> [],[]) actions)
	
