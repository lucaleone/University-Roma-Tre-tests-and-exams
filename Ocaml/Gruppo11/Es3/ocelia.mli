type 'a graph = ('a * 'a) list
val successori : 'a -> ('a * 'b) list -> 'b list
val ciclo : ('a * 'a) list -> 'a -> 'a list
