pairs :: [a] -> [(a, a)]

pairs xs = let
               rmap :: (a -> [a] -> [b]) -> [a] -> [b]

               rmap f (x:xs) = (f x xs) ++ (rmap f xs)

               rmap f [] = []

               mpairs :: (a -> [a] -> [(a, a)])

               mpairs x xs = map (\y -> (x, y)) xs

           in rmap mpairs xs

bridgecrossleft :: [Int] -> [Int] -> [(Int,Int)] 
		                    -> [[(Int,Int)]]

bridgecrossleft lbs rbs rs 
        = if (length lbs) >= 2 then
		let 
		   ps = pairs lbs
		   f = (\(x,y) -> 
		       (bridgecrossright 
			  (filter (\z -> (z /= x) 
				       && (z /= y)) lbs) 
		            (x:y:rbs) (rs ++ [(x, y)])))
		 in foldl (++) [] (map f ps)
	   else [rs]

bridgecrossright :: [Int] -> [Int] -> [(Int,Int)] 
		                     -> [[(Int,Int)]]

bridgecrossright lbs rbs rs 
         = if (length lbs) > 0 then
		  let 
		     f = (\x -> 
			  (bridgecrossleft (x:lbs) 
			     (filter (\z -> (z /= x)) rbs) 
				 (rs ++ [(x, x)])))
		   in foldl (++) [] (map f rbs)
	    else [rs]
			         
bridgecross :: [Int] -> [[(Int, Int)]]

bridgecross xs = bridgecrossleft xs [] []
