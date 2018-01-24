(* spezza: ’a -> ’a list -> ’a list * ’a list *)
(* spezza elem lst applicata a un elemento elem e una lista lst riporta una coppia di liste(lst1 e lst2) *)
(* dove lst1 contiene tutti gli elementi di lst che vanno dalla prima alla seconda occorrenza di elem (esculsa),  *)
(* e lst2 contiene tutti gli altri elementi di lst *)
(* per fare quest utilizziamo la funzione prima definita find due volte la prima sull'intera lista lst,*)
(* la seconda volta solo su gli elementi dopo la prima occorrenza*)
let spezza elem lst =
	find elem ( snd (find elem lst))