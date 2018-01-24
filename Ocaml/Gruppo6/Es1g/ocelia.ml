(* setdiff : 'a list -> 'a list -> 'a list *)
(* entrambi i fun hanno tipo 'a -> bool *)
(* List.filter scorre tutta la lst1 controllando che per ogni suo elemento*)
(* non esista un corrispettivo il lst2 usando exists*)
let setdiff lst1 lst2=
	List.filter (fun hd -> not(List.exists (fun hd2 -> hd=hd2) lst2)) lst1