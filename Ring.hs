module Ring
  ( Ring
  , rempty
  , rplus
  , rmult
  , rinv
  , distrib
  ) where

class Ring r where
  rempty :: r
  rplus  :: r -> r -> r
  rmult  :: r -> r -> r
  rinv   :: r -> r

-- 分配演算
distrib :: Ring r => r -> r -> r -> r
distrib x y z =
  let y' = x `rmult` y
      z' = x `rmult` z
  in y' `rplus` z'
