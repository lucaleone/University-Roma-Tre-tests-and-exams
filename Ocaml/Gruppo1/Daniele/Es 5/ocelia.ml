(* pi1 : 'a * 'b * 'c * 'd -> 'a *)
let pi1 (x,y,w,z) = x
(* pi2 : 'a * 'b * 'c * 'd -> 'b *)
let pi2 (x,y,w,z) = y
(* pi3 : 'a * 'b * 'c * 'd -> 'c *)
let pi3 (x,y,w,z) = w
(* pi4 : 'a * 'b * 'c * 'd -> 'd *)
let pi4 (x,y,w,z) = z
(* queste funzioni non possono essere applicate a delle quintuple*)
(* pi3 (pi2 quadrupla) = () *)
(* pi4 (pi2 quadrupla) = 1*)