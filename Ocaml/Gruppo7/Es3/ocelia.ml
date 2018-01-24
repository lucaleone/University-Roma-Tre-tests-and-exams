type chiave = Aperta | Chiusa
type cassaforte = chiave list

(* giraPrima inverte il primo elemento di tipo chiave di una lista cassaforte e restituisce la cassaforte aggiornata*)
(* Fallisce sa la lista è vuota*)
(* giraPrima : chiave list -> chiave list *)
let giraPrima = function
	| [] -> failwith "Lista chiavi vuota"
	| hd:: tl -> if hd = Aperta then Chiusa:: tl else Aperta:: tl

(*giraDopoChiusa inverte l' elemento di tipo chiave appena successivo al primo eleme con valore 'Chiusa'*)
(*  e restituisce la cassaforte aggiornata.*)
(* Fallisce se non contine nessun 'Chiusa' o non c'è alcun elemnto dopo il priom valore 'Chiusa'*)
(* giraDopoChiusa : chiave list -> chiave list *)
(* aux cerca il pimo elemnto con valore chiuso, capbia il successivo e restituisce la lista aggiornata*)
(* prev contiene tutti gli elementi precedenti al primo chiusa *)
(* aux : chiave list -> chiave list -> chiave list *)
let giraDopoChiusa lst =
	let rec aux prev = function
		| [] -> failwith "Errore nella ricerca elemento"
		| hd:: tl -> if hd = Chiusa then (List.rev (hd::prev))@(giraPrima tl) else aux (hd:: prev) tl
	in aux [] lst

(* esegue la funzioni giraPrima e giraDopoChiusa, riporta la lista con le configurazioni (una o due) che si
possono ottentere dalla cassaforte con una delle due operazioni, se giraDopoChiusa non è applicabile, 
la lista conterrà un solo elemento*)
(* successori : chiave list -> chiave list list *)
let successori lst=
	let primoElem = giraPrima lst in
		try [primoElem; giraDopoChiusa lst]	with _-> [primoElem]
		