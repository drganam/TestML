(* 4190.310 Programming Languages - Daegeun Lee <elnn@elnn.kr> *)

type formula = TRUE
             | FALSE
             | NOT of formula
             | ANDALSO of formula * formula
             | ORELSE of formula * formula
             | IMPLY of formula * formula
             | LESS of expr * expr

and expr = NUM of int
         | PLUS of expr * expr
         | MINUS of expr * expr


let rec eval e = 
    match e with
    | TRUE -> true
    | FALSE -> false
    | NOT x -> not (eval x)
    | ANDALSO (x, y) -> (eval x) && (eval y)
    | ORELSE (x, y) -> (eval x) || (eval y)
    | IMPLY (x, y) -> not (eval x) || (eval y)
    | LESS (x, y) -> (evaln x) < (evaln y)

and evaln e =
    match e with
    | NUM x -> x
    | PLUS (x, y) -> (evaln x) + (evaln y)
    | MINUS (x, y) -> (evaln x) - (evaln y)

