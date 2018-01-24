type 'a tree = Empty | Tr of 'a * 'a tree * 'a tree
val altezza : 'a tree -> int
val confrontaAltezze : 'a tree -> 'b tree -> bool
val bilanciato : 'a tree -> bool
val albero : int tree
