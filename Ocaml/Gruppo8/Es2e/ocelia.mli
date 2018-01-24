type 'a tree = Empty | Tr of 'a * 'a tree * 'a tree
val preorder : 'a tree -> 'a list
val inorder : 'a tree -> 'a list
val take : int -> 'a list -> 'a list
val drop : int -> 'a list -> 'a list
val balpreorder : 'a list -> 'a tree
val balinorder : 'a list -> 'a tree
