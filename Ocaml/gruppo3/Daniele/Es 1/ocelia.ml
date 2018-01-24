let verifica_orario (h,m) = h>=0 && h<=23 && m>=0 && m<=59;;

exception Orario_Non_Valido

 let somma_ore (h,m) (h1,m1) = 
  if verifica_orario(h,m) && verifica_orario(h1,m1) then
  	if (m+m1) > 59 then 
  		if h+h1+1>23 then (h+h1-23,m+m1-60)
  			else (h+h1+1,m+m1-60)
  		else if h+h1>23 then (h+h1-24,m+m1)
  	else (h+h1,m+m1)
 	else raise Orario_Non_Valido