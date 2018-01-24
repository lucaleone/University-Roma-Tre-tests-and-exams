(* position_of : 'a -> 'a list -> int *)
(* position_of prende a paramentro un elemento x e una lista lst e riporta la sua posizione nella lista. Se non esista ritorna -1*)
(* aux : int -> 'a list -> int *)
(* position è la posizione corrente *)
let position_of x lst =
	let rec aux position lst =
		match lst with
		| [] -> (-1)
		| hd:: tl -> if x = hd then position else aux (position +1) tl
	in aux 0 lst

(* strike_ball : 'a list -> 'a list -> int * int *)
(* strike_ball applicata a due liste test e guess  riporti una coppia (left, right).
left = numero di elementi di test che occorrono anche in guess, ma in diversa posizione;
right = numero di elementi di test che occorrono in guess nella stessa posizione in cui sono in test *)
(* aux : int * int -> 'a list -> int -> int * int *)
(* test è la lista da scorrere e da confrontare con guess; position è la posizione corrente*)
let strike_ball test guess =
	let rec aux (left, right) test position =
		match test with
		| [] -> (left, right)
		| hd:: tl -> if (position_of hd guess) = (-1) then aux (left, right) tl (position +1)
				else if position = (position_of hd guess) then aux (left, right +1) tl (position +1)
				else aux (left +1, right) tl (position +1)
	in aux (0,0) test 0
	