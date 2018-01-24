type 'a ntree = Tr of 'a * 'a ntree list
val path_non_pred : ('a -> bool) -> 'a ntree -> 'a list
