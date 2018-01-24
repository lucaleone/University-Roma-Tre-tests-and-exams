type expr =
    Int of int
  | Var of string
  | Sum of expr * expr
  | Diff of expr * expr
  | Mult of expr * expr
  | Div of expr * expr
val subexpr : expr -> expr -> bool
