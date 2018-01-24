type 'a graph = ('a * 'a) list
val cerchio : (int * int) list
val remove : 'a -> 'a list -> 'a list
val successori : 'a -> ('a * 'b) list -> 'b list
val cammino_con_nodi : ('a * 'a) list -> 'a -> 'a list -> bool
