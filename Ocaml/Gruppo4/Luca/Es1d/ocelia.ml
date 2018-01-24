(* e' "tail recursive": al ritorno dalla chiamata ricorsiva non si deve    *)
(* fare nulla n= numero elementi da eliminare, lst = la lista da cui       *)
(* eliminarli drop : int -> 'a list -> 'a list = <fun>                     *)
let rec drop n lst =
	match lst with
	| [] -> []
	| hd:: tl -> if n >0 then drop (n -1) tl
			else hd:: tl