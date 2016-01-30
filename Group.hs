module Group
  ( Group
  , gappend
  , gempty
  , ginv
  , grpLawAp
  , grpLawEm
  , grpLawInv
  ) where

class Group a where
  gappend :: a -> a -> a
  gempty  :: a
  ginv    :: a -> a  -- inverse

-- 任意の元に対する法則
grpLawAp :: (Group a, Eq a) => a -> a -> a -> Bool
grpLawAp x y z = (x `gappend` y) `gappend` z == x `gappend` (y `gappend` z)

grpLawEm :: (Group a, Eq a) => a -> Bool
grpLawEm x =
  let left  = gempty `gappend` x
      right = x `gappend` gempty
  in left == right && right == x

grpLawInv :: (Group a, Eq a) => a -> Bool
grpLawInv x =
  let left  = x `gappend` (ginv x)
      right = (ginv x) `gappend` x
  in left == right && right == gempty
