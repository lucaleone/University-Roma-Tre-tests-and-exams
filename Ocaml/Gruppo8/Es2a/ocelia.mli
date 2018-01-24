type 'a tree = Empty | Tr of 'a * 'a tree * 'a tree
val reflect : 'a tree -> 'a tree
