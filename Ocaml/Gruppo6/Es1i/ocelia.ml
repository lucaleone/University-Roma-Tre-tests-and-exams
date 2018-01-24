(* duplica: int list -> int list *)
(* duplica lst raddoppia tutti gli elementi di una lista lst di interi, usando la funzione List.map *)
(* il predicato di map fun x-> x*2 (int ->int) che moltiplica l'elemto passato a parametro da map *)
let duplica lst =
	List.map (fun x-> x*2) lst