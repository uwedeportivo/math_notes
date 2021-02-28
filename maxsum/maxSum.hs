maxSum :: [Int] -> (Int, Int)

maxSum (x:xs) = let (a, b) = maxSum xs
	            c = x + b		   
	        in (max c (max a 0), max c 0) 
		      
maxSum [] = (0, 0)
