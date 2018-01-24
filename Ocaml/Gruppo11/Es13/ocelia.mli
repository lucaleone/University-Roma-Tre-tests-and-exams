type 'a graph = ('a * 'a) list
val successori : 'a -> ('b -> bool) -> ('a * 'b) list -> 'b list
val path_n_p : ('a * 'a) list -> ('a -> bool) -> int -> 'a -> 'a -> 'a list
