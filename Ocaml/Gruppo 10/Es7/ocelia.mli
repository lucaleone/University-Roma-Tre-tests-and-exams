type 'a ntree = Tr of 'a * 'a ntree list
val tutte_foglie_costi : 'a ntree -> ('a * int) list
val a : int ntree
val res : (int * int) list
