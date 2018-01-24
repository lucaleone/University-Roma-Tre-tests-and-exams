let rec power n k =
	if k =0 then 1
	else n * (power n (k -1))