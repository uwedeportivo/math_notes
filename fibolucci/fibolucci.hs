type Tuple6Ints = (Int, Int, Int, Int, Int, Int) 

tmul :: Tuple6Ints -> Tuple6Ints -> Tuple6Ints

tmul (a, b, c, d, e, f) (a', b', c', d', e', f') = 
    (a * a' + b * b', 
     a * b' + b * (a' + b'), 
     c * a' + d * b' + a * c' + b * e', 
     c * b' + d * (a' + b') + a * d' + b * f', 
     e * a' + f* b' + b * c' + (a + b) * e', 
     e * b' + f* (a' + b') + b * d' + (a + b) * f')

fibexp :: Tuple6Ints -> Int -> Tuple6Ints

fibexp tuple n | n == 0 = error "undefined"
	       | n == 1 = tuple
               | n `mod` 2 == 0 = 
                   fibexp (tuple `tmul` tuple) 
			      (n `div` 2)
               | n `mod` 2 == 1 = 
                   tuple `tmul` (fibexp tuple (n - 1))
               | otherwise = error "wrong input"

fourth :: Tuple6Ints -> Int

fourth (a, b, c, d, e, f) = d

fibolucci :: Int -> Int

fibolucci n | n == 0 = 0
            | otherwise = 
		fourth (fibexp (0, 1, 0, 0, 0, 1) n)
