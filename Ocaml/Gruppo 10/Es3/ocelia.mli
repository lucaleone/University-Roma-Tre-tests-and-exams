type 'a ntree = Tr of 'a * 'a ntree list
val foglie_in_lista : 'a list -> 'a ntree -> bool
