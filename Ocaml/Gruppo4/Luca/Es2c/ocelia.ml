(* e' "tail recursive": al ritorno dalla chiamata ricorsiva non si deve  fare nulla  *)
(* lst da accoppiare a x x è l'elemento da mettere in coppia con ogni singlio elemento di lst*)
(* pairwith : 'a -> 'b list -> ('a * 'b) list = <fun>    *)
let pairwith x lst =
	(* res è la lista di coppie prodatta dall'accoppiamento di x con lst *)
	(* aux : ('a * 'b) list -> 'b list -> ('a * 'b) list = <fun>         *)
	let rec aux res lst =
		match lst with
		| [] -> List.rev res
		| hd:: tl -> aux ((x, hd) :: res) tl
	in aux [] lst