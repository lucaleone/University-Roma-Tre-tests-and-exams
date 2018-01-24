(* data una lista lst di interi e un albero n-ario abr,  *)
(* riporti la radice del sottoalbero di abr determinato da lst, *)
(* se lst determina un sottoalbero di abr, un errore altrimenti *)
(* listaGuida : int list -> 'a ntree -> 'a ntree *)
let rec listaGuida lst abr =
	match lst, abr with
	| [], a -> a
	| [hd], (Tr(_,figli)) -> List.nth figli hd
	| hd::tl, (Tr(_,figli)) -> listaGuida tl (List.nth figli hd)