type col = Rosso | Giallo | Verde | Blu
type 'a col_assoc = (col * 'a list) list
type 'a tree = Empty | Tr of 'a * 'a tree * 'a tree
val colore : 'a -> ('b * 'a list) list -> 'b
val equals : 'a -> ('b * 'a list) list -> 'a tree -> bool
val path_to : 'a -> ('b * 'a list) list -> 'a tree -> 'a list
