import Test.QuickCheck

instance Monoid Int where
  mappend = (*)
  mempty  = 1

mnLawAp :: (Monoid a, Eq a) => a -> a -> a -> Bool
mnLawAp x y z = (x `mappend` y) `mappend` z == x `mappend` (y `mappend` z)

mnLawEm :: (Monoid a, Eq a) => a -> Bool
mnLawEm x =
  let left  = mempty `mappend` x
      right = x `mappend` mempty
  in left == right && right == x

mnTestApInt :: IO ()
mnTestApInt = let mnLawAp' = mnLawAp :: Int -> Int -> Int -> Bool
              in quickCheck mnLawAp'

mnTestEmInt :: IO ()
mnTestEmInt = let mnLawEm' = mnLawEm :: Int -> Bool
              in quickCheck mnLawEm'

--instance Monoid [a] where
--  mappend = (++)
--  mempty  = []

mnTestApList :: IO ()
mnTestApList = let mnLawAp' = mnLawAp :: [Float] -> [Float] -> [Float] -> Bool
               in quickCheck mnLawAp'

mnTestEmList :: IO ()
mnTestEmList = let mnLawEm' = mnLawEm :: [Float] -> Bool
               in quickCheck mnLawEm'


main :: IO ()
main = do
  mnTestApInt
  mnTestEmInt
  mnTestApList
  mnTestEmList
