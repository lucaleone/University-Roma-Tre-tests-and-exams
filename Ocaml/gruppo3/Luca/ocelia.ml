exception NotValidData
(* val checkValidity : int * int -> bool *)
let checkValidity (h, m) =
	(h >=0 && h <=23) && (m >=0 && m <=59)

let somma_ore (h1, m1) (h2, m2) =
	if checkValidity (h1, m1) && checkValidity(h2, m2) then
		let sommaMinuti = m1 + m2
		in let minuti = sommaMinuti mod 60
		in let ore = h1 + h2 + (sommaMinuti /60)
		in if ore >23 then (ore mod 24, minuti)
		else (ore, minuti)
	else raise NotValidData

(* secondo file #use "ocelia.ml";; dovrà terminare con stringa "" *)
let read_max () =
	let rec aux max =
		try let num = int_of_string(read_line())
			in if max < num then aux num
			else aux max
		with _ -> max
	in aux (int_of_string(read_line()))

(* dovrà terminare con stringa "" *)
let read_max_min () =
	let rec aux (max, min) =
		try let newInput = int_of_string(read_line())
			in if newInput > max then aux (newInput, min)
			else if newInput < min then aux (max, newInput)
			else aux (max, min)
		with _ -> (max, min)
	in aux (int_of_string(read_line()), int_of_string(read_line()))

(* dovrà terminare con stringa "" *)
let tutti_minori n =
	let rec aux res =
		try let newInput = int_of_string(read_line())
			in if newInput > n then aux false
			else aux res
		with _ -> res
	in aux true

(* dovrà terminare con stringa "" *)
let occorre n =
	let rec aux res =
		try let newInput = int_of_string(read_line())
			in if newInput = n then aux (res +1)
			else aux res
		with _ -> res
	in aux 0

let num_di_stringhe () =
	let rec aux (stringa, res) =
		if stringa =";;" || stringa = "/0" then res
		else aux (read_line(), (res +1))
	in aux (read_line(), 0)

(* dovrà terminare con stringa "" *)
let stringa_max () =
	let rec aux max =
		try let newString = read_line()
			in if newString =";;" || newString = "/0" then max
			else if (String.length newString) > (String.length max) then aux newString
			else aux max
		with _ -> max
	in aux (read_line())

(* terzo file *)
(* 
let sumbetween n m =
	let rec aux res current =
		if current > m then res
		else aux (res + current) (current +1)
	in aux n n +1 *)
(* *)
let rec sumbetween n m = 
	if n > m then 0 
else
		n + (sumbetween (n +1) m)

let sumto n =
	let rec aux res current =
		if current > n then res
		else aux (res + current) (current +1)
	in aux 0 0

let rec power n k =
	if k =0 then 1
	else n * (power n (k -1))

let rec fib = function
		0	| 1 -> 1
	| n -> (fib (n -1) + fib(n -2))

exception Stringa_Vuota

let maxstring s =
	let rec aux index idxMax =
		if s ="" then raise Stringa_Vuota
		else if index = String.length s then s.[idxMax]
		else if (s.[idxMax]) < (s.[index]) then aux (index + 1) index
		else aux (index + 1) idxMax
	in aux 0 0

