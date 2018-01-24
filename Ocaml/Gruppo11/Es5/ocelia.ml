(* ============ Es4:miss-cann ============= *)

(* definizioni preliminari *)
type obj = Miss | Cann | Barca
type situazione = obj list * obj list
let initial = ([Miss; Miss; Miss; Cann; Cann; Cann; Barca], [])
type azione =
		From_left of obj list
	| From_right of obj list

	
	let conta x lst =
  List.length (List.filter ((=) x) lst)

(*  safe : situazione -> bool
    determina se una situazione e' sicura (nessun missionario
    mangiato) *)
let safe (left,right) =
  (* aux: obj list -> bool
         determina se una riva e` safe *)
  let aux riva =
    let missionari=conta Miss riva
    in missionari=0 || missionari >= conta Cann riva
  in aux left & aux right
exception Impossible
(* quando si sposta un miss o cann, un'occorrenza di Miss (o Cann) 
   viene tolta da una lista e aggiunta  all'altra *)
(* togli_un : 'a -> 'a list -> 'a list *)
(* togli x lst : elimina un'occorrenza di x dalla lista lst *)
let rec togli_un x = function
    [] -> raise Impossible
  | y::rest -> 
      if y=x then rest
      else y::togli_un x rest
			(* togli : 'a list -> 'a list -> 'a list
   togli source lst = elimina da source un'occorrenza di ogni elemento
                      di lst *)
let rec togli source = function
    [] -> source
  | x::rest ->
      togli (togli_un x source) rest

(* applica : azione -> situazione -> situazione  *)
let applica act (left,right) =
  (* result e' la situazione che risulterebbe dall'applicazione 
     di act a (left,right), ma potrebbe non essere safe *)
  let result = 
    match act with
      From_left lst ->
	if List.length lst > 2 || lst=[]
	then raise Impossible
	else (togli_un Barca (togli left lst),
	      Barca::lst @ right)
    | From_right lst ->
	if List.length lst > 2 || lst=[]
	then raise Impossible
	else (Barca::lst @ left,
	      togli_un Barca (togli right lst))
  in if safe result then result
  else raise Impossible
	
	(* actions: azione list *)
let actions =
  let elems =
    [[Miss];[Cann];[Miss;Cann];[Miss;Miss];[Cann;Cann]]
  in (List.map (function x -> From_left x) elems)
  @ (List.map (function x -> From_right x) elems)
(* from_sit : situazione -> situazione list aux: azione list -> situazione *)
(* list aux actlist = lista delle situazioni safe che risultano            *)
(* dall'applicazione di tutte le azioni in actlist applicabili alla        *)
(* situazione sit (parametro della principale)                             *)
let from_sit sit =
	let rec aux = function
			[] -> []
		| a:: rest ->
				try applica a sit :: aux rest
				with Impossible -> aux rest
	in aux actions

(* da qui si comincia  *)
(* from_sit è uguale a successivi scrivere una sunzione *)
let goal (left, right) =
	let aux riva =
		let missionari = conta Miss riva
		in missionari =0 || missionari >= conta Cann riva
	in aux left & aux right

let remove x lst =
	let rec aux prev = function
		| [] -> prev
		| hd::tl -> if hd = x then (prev@tl) else aux (hd::prev) tl
	in aux [] lst	

(* listeUguali : 'a list -> 'a list -> bool *)
let rec listeUguali lst2 = function
	| [] -> true
	| hd:: tl -> (List.mem hd lst2) && listeUguali (remove hd lst2) tl

(* existSituation : 'a list * 'b list -> ('a list * 'b list) list -> bool *)
(* come mem ma non tiene conto dell'ordine *)
let rec existSituation sit = function
	| [] -> false
	| [hd] -> listeUguali (fst sit) (fst hd) && listeUguali (snd sit) (snd hd)
	| hd:: tl -> listeUguali (fst sit) (fst hd)
			&& listeUguali (snd sit) (snd hd)
			&& existSituation sit tl
			
let initial = ([Miss; Miss; Miss; Cann; Cann; Cann; Barca], [])
	(** visita in profondità (grafo orientato) **)		
let miss_cann =
let rec search visited = function
      | [] -> print_string "fine\n"; visited
      | n::rest -> print_string "boh\n";
            if existSituation n visited 
            	then  (print_string "primo\n"; search visited rest )
            else if goal n 
							then (print_string "secondo\n"; (n::visited) )
							else (print_string "terzo\n";
							search (n::visited) ((from_sit n) @ rest) )
    in search [] [initial]

		
		
		
