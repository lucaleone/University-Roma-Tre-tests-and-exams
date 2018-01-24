type 'a ntree = Tr of 'a * 'a ntree list
val same_structure : 'a ntree -> 'b ntree -> bool
