(* lst= la lista da invertire *)
(* reverse : 'a list -> 'a list = <fun> *)
let reverse lst =	
	(* rev = la lista di ritorno uguale la lst ma invertita *)
	(* e' "tail recursive": al ritorno dalla chiamata ricorsiva non si deve fare nulla *)
	(*  aux : 'a list -> 'a list -> 'a list = <fun> *)
	let rec aux lst rev =
		match lst with [] -> rev
		| x:: rest -> aux rest (x:: rev)
	in aux lst []