{-# LANGUAGE StandaloneDeriving, GeneralizedNewtypeDeriving #-}

module Control.DeepSeq.Extras where

import Control.DeepSeq
import Prelude.Extras

class NFData1 f where rnf1 :: NFData a => f a -> ()
instance (NFData a, NFData1 f) => NFData (Lift1 f a) where rnf = rnf1 . lower1
deriving instance NFData1 f => NFData1 (Lift1 f)
instance NFData1 [] where rnf1 = rnf
instance NFData1 Maybe where rnf1 = rnf
