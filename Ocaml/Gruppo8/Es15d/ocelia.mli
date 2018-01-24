type 'a tree = Empty | Tr of 'a * 'a tree * 'a tree
val abr_delmin : 'a tree -> 'a * int
