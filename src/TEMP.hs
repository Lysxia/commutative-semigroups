module TEMP
  ( CommutativeProduct (..)
  )
  where

import Control.Applicative (Const)
import Data.Complex (Complex)
import Data.Fixed
import Data.Functor.Contravariant (Op)
import Data.Functor.Identity
import Data.Int
import Data.Monoid
import Data.Ord (Down)
import Data.Ratio (Ratio)
import Data.Semigroup (Max, Min, Product, Sum)
import Data.Word
import Numeric.Natural

-- | Subclass of 'Num' where '(*)' is commutative.
--
-- 'Num' doesn't demand commutative '(*)', and there are reasonable
-- "real-world" instances with non-commutative multiplication. There
-- is also no canonical subclass in @base@ that would suffice, as both
-- 'Integral' and 'Floating' imply commutative '(*)' for different
-- reasons.
--
-- Two examples of non-commutative '(*)':
--
-- * @Linear.Quaternion.Quaterion@ from the @linear@ package has a
--   'Num' instance, and quaternion multiplication is
--   noncommutative.
--
-- * @Data.Matrix.Matrix@ from the @matrix@ package uses '(*)' for
--   matrix multiplication, which is also non-commutative (on square
--   matrices, which is the only time the question makes sense).
class Num a => CommutativeProduct a

instance CommutativeProduct Int8
instance CommutativeProduct Int16
instance CommutativeProduct Int32
instance CommutativeProduct Int64
instance CommutativeProduct Int
instance CommutativeProduct Integer

instance CommutativeProduct Word8
instance CommutativeProduct Word16
instance CommutativeProduct Word32
instance CommutativeProduct Word64
instance CommutativeProduct Word
instance CommutativeProduct Natural

instance (RealFloat a, CommutativeProduct a) => CommutativeProduct (Complex a)

instance CommutativeProduct a => CommutativeProduct (Identity a)

-- @since: base-4.9.0.0
instance CommutativeProduct a => CommutativeProduct (Down a)

-- @since: base-4.11.0.0
instance CommutativeProduct a => CommutativeProduct (Max a)

-- @since: base-4.9.0.0
instance CommutativeProduct a => CommutativeProduct (Min a)

-- @since: base-4.9.0.0
instance CommutativeProduct a => CommutativeProduct (Product a)

-- @since: base-4.7.0.0
instance CommutativeProduct a => CommutativeProduct (Sum a)

-- @since: base-4.7.0.0
instance (Integral a, CommutativeProduct a) => CommutativeProduct (Ratio a)

instance (HasResolution a, CommutativeProduct a) => CommutativeProduct (Fixed a)

instance CommutativeProduct a => CommutativeProduct (Op a b)

-- @since: base-4.9.0.0
instance CommutativeProduct a => CommutativeProduct (Const a b)

-- @since: base-4.12.0.0
instance CommutativeProduct (f a) => CommutativeProduct (Alt f a)
