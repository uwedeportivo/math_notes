module Last3Digits(
    compute
) where

f :: Int -> Int -> Int
f a b = (6 * b - 4 * a) `mod` 1000

-- ds is our sequence of d_n
ds = 2 : 6 : zipWith (f) ds (tail ds)
-- this gives us the pairs
dps = zip ds (tail ds)

findCycle :: Eq a => [a] -> ([a],[a])
findCycle xxs = fCycle xxs xxs
  where fCycle (x:xs) (_:y:ys)
         | x == y              = fStart xxs xs
         | otherwise           = fCycle xs ys
        fCycle _      _        = (xxs,[]) -- not cyclic
        fStart (x:xs) (y:ys)
         | x == y              = ([], x:fLength x xs)
         | otherwise           = let (as,bs) = fStart xs ys in (x:as,bs)
        fLength x (y:ys)
         | x == y              = []
         | otherwise           = y:fLength x ys

tps = findCycle dps
-- ps is the prefix, cs the cycle of d_n
(ps, cs) = (map fst (fst tps), map fst (snd tps))

computeAux :: Int -> Int
computeAux n
    | n < (length ps) = ps!!n
    | otherwise       = cs!!((n - (length ps)) `mod` (length cs))

compute :: Int -> Int
compute n = computeAux n - 1



