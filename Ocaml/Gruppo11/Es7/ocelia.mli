type col = Rosso | Giallo | Verde | Blu
type 'a col_assoc = (col * 'a list) list
val colore : 'a -> ('b * 'a list) list -> 'b
val notColoriUguali : 'a -> 'a -> ('b * 'a list) list -> bool
val successori : 'a -> ('b * 'a list) list -> ('a * 'a) list -> 'a list
val colori_alterni :
  ('a * 'a) list -> ('b * 'a list) list -> 'a -> 'a -> 'a list
