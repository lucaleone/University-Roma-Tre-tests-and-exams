type 'a graph = ('a * 'a) list
val grafo : (int * int) list
val successori : 'a -> ('a * 'b) list -> 'b list
val test_connessi : ('a * 'a) list -> 'a -> 'a -> bool
