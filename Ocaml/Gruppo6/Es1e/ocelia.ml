(* pairwith : 'a -> 'b list -> ('a * 'b) list *)
(* combina ogni elemento di lst con y creando una coppia (y, elemento) *)
(* fa uso della funzione map con predicato 'a -> 'b * 'a  che crea le coppie*)
let pairwith y lst=
	List.map (fun elem-> y,elem) lst