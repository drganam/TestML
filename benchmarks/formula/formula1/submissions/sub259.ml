type formula =  TRUE
			| FALSE
			| NOT of formula
			| ANDALSO of formula * formula
			| ORELSE of formula * formula
			| IMPLY of formula * formula
			| LESS of expr * expr
			and expr = NUM of int
			| PLUS of expr * expr
			| MINUS of expr * expr

let rec etoi (e:expr) : int =
	match e with
		| NUM n -> n
		| PLUS (n1,n2) -> (etoi n1)+(etoi n2)
		| MINUS (n1,n2) -> (etoi n1)-(etoi n2)

let rec eval (f:formula) : bool =
					   match f with
						| TRUE -> true
						| FALSE -> false
						| NOT form -> not(eval form)
						| ANDALSO (f1,f2) -> (eval f1)&&(eval f2)
						| ORELSE (f1,f2) -> (eval f1)||(eval f2)
						| IMPLY (f1,f2) -> (not(eval f1))||(eval f2)
						| LESS (f1,f2) -> (etoi f1) < (etoi f2)
