type 'a tree = Empty | Tr of 'a * 'a tree * 'a tree
val path : ('a -> bool) -> 'a tree -> 'a list
val albero : int tree
