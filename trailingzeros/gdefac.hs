gdefac :: Int -> Int

gdefac n = fst (until (\(x, y) -> y == 0) 
                  (\(x, y) -> let
                                y' = div y 5 
                              in (x + y', y')) 
                  (0, n))
