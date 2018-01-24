type 'a tree = Empty | Tr of 'a * 'a tree * 'a tree
let abrBin = Tr(50, Tr(45, Tr(30,	Tr(10, Empty, Empty), Tr(40, Empty, Empty)), Empty),
		Tr(80,	Tr(70, Empty, Empty), Tr(120, Empty, Empty) ));;

let rec abr_insert abr elem =
	match abr with
	| Empty -> Tr(elem, Empty, Empty)
	| Tr(a, sx, dx) as nodo -> if elem = a then Tr(elem, nodo, Empty)
			else if elem < a then Tr(a, abr_insert sx elem, dx)
			else Tr(a, sx, abr_insert dx elem)

let rec leggiAbr = function
	| Empty -> []
	| Tr(label, sx, dx) -> (leggiAbr sx)@label@(leggiAbr dx)

let tree_sort = function
	| [] -> []
	| hd:: tl -> let abr = (abr_insert Empty hd) in leggiAbr abr






