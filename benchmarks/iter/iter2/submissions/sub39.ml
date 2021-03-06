(* problem 3*)

let rec iter : int * (int -> int) -> (int -> int)
= fun (n,f) ->
    if n == 0 then let id x = x in id
    else let compose f g = fun x -> f (g x) in
        compose f (iter (n - 1, f))