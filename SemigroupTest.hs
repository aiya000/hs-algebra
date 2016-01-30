import Semigroup
import Test.QuickCheck

instance Semigroup Int where
  sappend = (*)

instance Semigroup [a] where
  sappend = (++)


-- 任意の元が法則を満たすことのテスト
sgTestInt :: IO ()
sgTestInt = let sgLawAp' = sgLawAp :: Int -> Int -> Int -> Bool
            in quickCheck sgLawAp'

sgTestList :: IO ()
sgTestList = let sgLawAp' = sgLawAp :: [Float] -> [Float] -> [Float] -> Bool
             in quickCheck sgLawAp'


main :: IO ()
main = do
  sgTestInt
  sgTestList
