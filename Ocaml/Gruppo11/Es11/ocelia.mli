type 'a graph = ('a * 'a) list
val is_prime : int -> bool
val successori : 'a -> ('a * int) list -> int list
val cammino_di_primi : (int * int) list -> int -> int -> int list
