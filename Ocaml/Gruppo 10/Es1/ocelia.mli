type multi_expr =
    MultiInt of int
  | MultiVar of string
  | MultiDiff of multi_expr * multi_expr
  | MultiDiv of multi_expr * multi_expr
  | MultiSum of multi_expr list
  | MultiMult of multi_expr list
val subexpr : multi_expr -> multi_expr -> bool
val subst : multi_expr -> string -> multi_expr -> multi_expr
