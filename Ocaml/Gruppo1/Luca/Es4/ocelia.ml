
(* pi1 : 'a * 'b * 'c * 'd -> 'a *)
let pi1 (x, y, z, w) = x
  
(* pi2 : 'a * 'b * 'c * 'd -> 'b *)
let pi2 (x, y, z, w) = y
  
(* pi3 : 'a * 'b * 'c * 'd -> 'c *)
let pi3 (x, y, z, w) = z
  
(* pi4 : 'a * 'b * 'c * 'd -> 'd *)
let pi4 (x, y, z, w) = w

(* Si possono applicare a una quintupla?
Le funzioni scritte sopra non possono essere usate su quintuple in quanto il tipo di dell'argomento è una quadrupla.
Di seguito l'output fornito da ocaml se si prova ad utilizzare una delle funzioni su una quintupla.
# # pi2 (4,8,7,6,5);;
  # pi2 (4,8,7,6,5);;
Error: Syntax error: operator expected.

Con:
let quadrupla =(5,('c',"antonio",(),if 3>4 then 0 else 1),"pippo",true)
L'espressione pi3 (pi2 quadrupla) restituisce un unit = ()
L'espressione pi4 (pi2 quadrupla) , invece, restituisce l'espressione if 3>4 then 0 else 1 ,
che a sua volta restituisce in int = 1 (3>4 falsa, quindi si esegue l'else)

*)

