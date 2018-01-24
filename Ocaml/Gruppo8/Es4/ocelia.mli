type 'a tree = Empty | Tr of 'a * 'a tree * 'a tree
val num_foglie : 'a tree -> int
