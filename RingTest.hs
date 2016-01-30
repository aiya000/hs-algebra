import Ring
import Semigroup
import Group
import Test.QuickCheck

instance Ring Int where
  rempty = 0
  rplus  = (+)
  rmult  = (*)
  rinv   = negate


-- 環の乗半群と加群を取り出す
instance Semigroup Int where
  sappend = rmult

rngTestMult :: IO ()
rngTestMult = let rngLawAp = sgLawAp :: Int -> Int -> Int -> Bool
              in quickCheck rngLawAp

instance Group Int where
  gappend = rplus
  gempty  = rempty
  ginv    = rinv

rngTestAp :: IO ()
rngTestAp = let rngLawAp = grpLawAp :: Int -> Int -> Int -> Bool
            in quickCheck rngLawAp

rngTestEm :: IO ()
rngTestEm = let rngLawEm = grpLawEm :: Int -> Bool
            in quickCheck rngLawEm

rngTestInv :: IO ()
rngTestInv = let rngLawInv = grpLawInv :: Int -> Bool
             in quickCheck rngLawInv


main :: IO ()
main = do
  rngTestMult
  rngTestAp
  rngTestEm
  rngTestInv
