(* explode : string -> char list = <fun> *)
let explode str =
	let rec aux res idx =
		if idx < String.length str then
			aux ((String.get str idx):: res) (idx +1)
		else res
	in aux [] 0

(* implode : char list -> string = <fun> *)
let implode lstStr =
	let rec aux res lstStr =
		match lstStr with
		| [] -> res
		| hd::tl -> aux ( (String.make 1 hd)^res) tl
	in aux "" lstStr