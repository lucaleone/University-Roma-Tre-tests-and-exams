(* mapcons: (’a * ’b list) list -> ’b -> (’a * ’b list) list *)
(* mapcons lst x: con lst lista di coppien e x l'elemento da inserire in testa a ogni secondo elemento delle coppie in lst *)
(* il predicato di map è  (’a * ’b list) -> (’a * ’b list) list va ad aggiungere x in testa al secondo elemnto *)
let mapcons lst x = 
	List.map (fun (first,sec) -> (first,(x::sec))) lst