type expr =
    Jolly
  | Int of int
  | Var of string
  | Sum of expr * expr
  | Diff of expr * expr
  | Mult of expr * expr
  | Div of expr * expr
val pattern_matching : expr -> expr -> bool
val e : expr
