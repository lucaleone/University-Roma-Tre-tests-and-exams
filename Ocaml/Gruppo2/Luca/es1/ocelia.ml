(* val ultime_cifre : int -> int * int *)
let ultime_cifre  n = 
	let x = abs n 
		in ((x/10) mod 10,x mod 10)