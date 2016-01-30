import Group
import Test.QuickCheck

instance Group Int where
  gappend = (+)
  gempty  = 0
  ginv    = negate


-- 任意の元が法則を満たすことのテスト
grpTestAp :: IO ()
grpTestAp = let grpLawAp' = grpLawAp :: Int -> Int -> Int -> Bool
             in quickCheck grpLawAp'

grpTestEm :: IO ()
grpTestEm = let grpLawEm' = grpLawEm :: Int -> Bool
             in quickCheck grpLawEm'

grpTestInv :: IO ()
grpTestInv = let grpLawInv' = grpLawInv :: Int -> Bool
              in quickCheck grpLawInv'


main :: IO ()
main = do
  grpTestAp
  grpTestEm
  grpTestInv
