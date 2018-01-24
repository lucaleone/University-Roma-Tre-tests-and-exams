(* tutte_liste_con n x y riporta lista contenente tutte le possibili  *)
(* liste di lunghezza n contenenti soltanto i due valori x e y *)
(* tutte_liste_con : int -> 'a -> 'a -> 'a list list *)
let rec tutte_liste_con n x y =
	match n with
	| 0 -> [[]]
	| _ -> let tmp = tutte_liste_con (n-1) x y in (List.map (function z ->x::z) tmp) @ (List.map (function z->y::z) tmp)