let esiste_ciclo graph start =
		let rec search visited = function
		| [] -> raise Not_found
		| n:: rest ->
				if List.mem n visited
				then if start=n then true else search visited rest
				else search (n:: visited) (rest @ (successori n graph))
	in search [] [start]
