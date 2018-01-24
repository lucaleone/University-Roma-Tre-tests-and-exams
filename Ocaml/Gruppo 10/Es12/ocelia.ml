(* getColor : 'a -> ('b * 'a list) list -> 'b *)
(* getColor x lst riporta il colore associato all'elemento x di lst*)
(* se x non è presente in lst riporta un eccezione *)
let rec getColor x = function
	| [] -> failwith "oggetto non presente"
	| (a, lst):: rest -> if (List.mem x lst) then a
			else getColor x rest
			
(* check : 'a -> ('a * 'b list) list -> 'b -> 'b ntree -> 'b list *)
(* check dato
   un valore prev, un’associazione di colori, un valore x e un albero n-ario, 
	 controlla se il colore corrente e diverso da prev e ritorna
	 un ramo a colori alterni, dalla radice dell’albero a una foglia etichettata
   da x *)
(* checkFigli :  'a -> 'b -> ('b * 'a list) list -> 'a -> 'a ntree list -> 'a list *)
(* checkFigli funzione ausiliaria di check applicata a una lista di alberi *)
(* chiama check per ogni figlio *)
let rec check prev colAssoc x = function
	| Tr(a, []) -> if (prev <> (getColor a colAssoc) && (a = x)) then [a] else failwith "foglia diversa da x o colori non alternati"
	| Tr(a, lst) -> let currentColor = getColor a colAssoc
			in if (prev <> currentColor) then	checkFigli a currentColor colAssoc x lst
			else failwith "Colori non alternati"
and checkFigli a currentColor colAssoc x = function
	| [hd] -> a:: (check currentColor colAssoc x hd)
	| hd:: tl -> try a:: (check currentColor colAssoc x hd) with _ -> checkFigli a currentColor colAssoc x tl

(* ramo_colorato : 'a -> ('b * 'a list) list -> 'a ntree -> 'a list *)
(* ramo_colorato dato
   un valore x, un’associazione di colori e un albero n-ario, riporta – se esiste
   – un ramo a colori alterni, dalla radice dell’albero a una foglia etichettata
   da x. *)
let rec ramo_colorato x colAssoc = function
	| Tr(a, []) -> if a = x then [a] else failwith "foglia diversa da x o colori non alternati"
	| Tr(a, lst) -> let currentColor = getColor a colAssoc
			in checkFigli a currentColor colAssoc x ls