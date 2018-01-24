type obj = Miss | Cann | Barca
type situazione = obj list * obj list
type azione = From_left of obj list | From_right of obj list
val conta : 'a -> 'a list -> int
val safe : obj list * obj list -> bool
exception Impossible
val togli_un : 'a -> 'a list -> 'a list
val togli : 'a list -> 'a list -> 'a list
val applica : azione -> obj list * obj list -> obj list * obj list
val actions : azione list
val from_sit : obj list * obj list -> (obj list * obj list) list
val goal : obj list * obj list -> bool
val remove : 'a -> 'a list -> 'a list
val listeUguali : 'a list -> 'a list -> bool
val existSituation : 'a list * 'b list -> ('a list * 'b list) list -> bool
val initial : obj list * 'a list
val miss_cann : (obj list * obj list) list
