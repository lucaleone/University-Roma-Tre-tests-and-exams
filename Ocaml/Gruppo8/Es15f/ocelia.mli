type 'a tree = Empty | Tr of 'a * 'a tree * 'a tree
val abrBin : int tree
val abr_insert : 'a tree -> 'a -> 'a tree
val leggiAbr : 'a list tree -> 'a list
val tree_sort : 'a list list -> 'a list
