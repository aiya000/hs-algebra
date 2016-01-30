module Semigroup
  ( Semigroup
  , sappend
  , sgLawAp
  ) where

class Semigroup a where
  sappend :: a -> a -> a

-- 任意の元に対する法則
sgLawAp :: (Semigroup a, Eq a) => a -> a -> a -> Bool
sgLawAp x y z = (x `sappend` y) `sappend` z == x `sappend` (y `sappend` z)
