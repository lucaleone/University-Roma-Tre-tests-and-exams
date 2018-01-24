type 'a ntree = Tr of 'a * 'a ntree list
val listaGuida : int list -> 'a ntree -> 'a ntree
