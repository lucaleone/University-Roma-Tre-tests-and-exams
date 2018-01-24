type 'a ntree = Tr of 'a * 'a ntree list
type col = Rosso | Giallo | Verde | Blu
type 'a col_assoc = (col * 'a list) list
val assoc : (col * int list) list
val abr : int ntree
val getColor : 'a -> ('b * 'a list) list -> 'b
val check : 'a -> ('a * 'b list) list -> 'b -> 'b ntree -> 'b list
val checkFigli :
  'a -> 'b -> ('b * 'a list) list -> 'a -> 'a ntree list -> 'a list
val ramo_colorato : 'a -> ('b * 'a list) list -> 'a ntree -> 'a list
