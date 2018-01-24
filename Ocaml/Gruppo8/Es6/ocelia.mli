type 'a tree = Empty | Tr of 'a * 'a tree * 'a tree
val foglia_costo : int tree -> int * int
