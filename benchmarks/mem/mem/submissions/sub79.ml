type btree =
	| Empty
	| Node of int * btree * btree

let rec mem : int -> btree -> bool
= fun n tree -> match tree with
  	| Empty -> false
  	| Node (a, Empty, x) | Node (a, x , Empty) -> if n = a then true else mem n x
  	| Node (a, b, c) -> if n = a then true else if mem n b then true else mem n c ;;
