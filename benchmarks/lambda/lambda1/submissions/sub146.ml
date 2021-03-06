(*2009-11718 1-4*)

type metro = STATION of name
			| AREA of name * metro
			| CONNECT of metro * metro
	and name = string

let rec checkStation (m, lst) =
	match lst with
	| [] -> []
	| hd::tl -> (if hd = m then (checkStation (m, tl))
				else hd::(checkStation (m, tl)))

let rec checkMetro metro =
	let rec isInArea m lst =
	match m with
	| STATION name -> name::lst
	| AREA (name, met) -> checkStation(name, (isInArea met lst))
	| CONNECT (met1, met2) -> (isInArea met1 lst)@(isInArea met2 lst) in

	if (isInArea metro []) =[] then
		true
	else false

	
