type col = Rosso | Giallo | Verde | Blu
type 'a col_assoc = (col * 'a list) list

(* codice scritto in classe *)
(* restituisce il colore associato ad un valore *)
(* colore : 'a -> ('b * 'a list) list -> 'b *)
let rec colore x = function
	| [] -> failwith "oggetto non presente"
	| (a, lst):: rest -> if (List.mem x lst) then a
			else colore x rest

(* controlla che il colore associato a due elementi sia diverso *)
(* notColoriUguali : 'a -> 'a -> ('b * 'a list) list -> bool *)
let notColoriUguali a b lst =
	(colore a lst) <> (colore b lst)

(* successori nodo lst grafo fornisce i successori che hanno *)
(* un colore diverso da nodo nella associazione lst in un grafo orientato *)
(* successori : 'a -> 'a graph -> 'a list  *)
let rec successori nodo lst = function
	|	[] -> []
	| (x, y):: rest ->
			if x = nodo && (notColoriUguali x y lst) then y:: successori nodo lst rest
			else successori nodo lst rest

(* colori_alterni ’a graph -> ’a col_assoc -> ’a -> ’a -> ’a list *)
(* colori_alterni grafo lst ingresso uscita , dato un grafo orientato, un nodo ingresso ed uno in uscita ed una sista associative,*)
(* riporti, se esiste, un cammino a colori alternati da ingresso a uscita, altrimenti sollevi un’eccezione  *)
(* cerca_da Ricerca da una singola casella *)
(* cerca_da: 'a list -> 'a -> 'a list  *)
(* cerca_da_una_tra , cerca fra i successori di una casella  *)
(* cerca_da_una_tra: 'a list -> 'a list *)
let colori_alterni grafo lst ingresso uscita =
	let rec cerca_da visited casella =
		if List.mem casella visited 
			then raise Not_found
		else if casella = uscita
			then [casella]
		else casella :: cerca_da_una_tra (casella:: visited) (successori casella lst grafo)
	and cerca_da_una_tra visited = function
		|	[] -> raise Not_found
		| x:: rest ->
				try cerca_da visited x
				with Not_found -> cerca_da_una_tra (x:: visited) rest
	in cerca_da [] ingresso
	
	