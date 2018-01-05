exception Error of string

let rec sigma(a,b,f) = 
	if a > b then raise(Error "a is bigger than b") else
		if a = b then f(a)
	  	else f(a) + sigma((a+1),b,f);;