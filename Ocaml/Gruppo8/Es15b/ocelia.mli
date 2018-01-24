type 'a tree = Empty | Tr of 'a * 'a tree * 'a tree
val abr_search : 'a -> ('a * 'b) tree -> 'b
