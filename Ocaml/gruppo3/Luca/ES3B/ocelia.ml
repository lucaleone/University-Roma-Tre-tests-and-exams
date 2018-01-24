let sumto n =
	let rec aux res current =
		if current > n then res
		else aux (res + current) (current +1)
	in aux 0 0