{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
module Pascal.Parser where

import Pascal.Base
import Pascal.Data
import Pascal.Lexer
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.12

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
newtype HappyWrap4 = HappyWrap4 (Program)
happyIn4 :: (Program) -> (HappyAbsSyn )
happyIn4 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap4 x)
{-# INLINE happyIn4 #-}
happyOut4 :: (HappyAbsSyn ) -> HappyWrap4
happyOut4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut4 #-}
newtype HappyWrap5 = HappyWrap5 ([VarDec])
happyIn5 :: ([VarDec]) -> (HappyAbsSyn )
happyIn5 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap5 x)
{-# INLINE happyIn5 #-}
happyOut5 :: (HappyAbsSyn ) -> HappyWrap5
happyOut5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut5 #-}
newtype HappyWrap6 = HappyWrap6 ([VarDec])
happyIn6 :: ([VarDec]) -> (HappyAbsSyn )
happyIn6 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap6 x)
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn ) -> HappyWrap6
happyOut6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut6 #-}
newtype HappyWrap7 = HappyWrap7 (VarDec)
happyIn7 :: (VarDec) -> (HappyAbsSyn )
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap7 x)
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn ) -> HappyWrap7
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
newtype HappyWrap8 = HappyWrap8 (RealExp)
happyIn8 :: (RealExp) -> (HappyAbsSyn )
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap8 x)
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn ) -> HappyWrap8
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
newtype HappyWrap9 = HappyWrap9 (BoolExp)
happyIn9 :: (BoolExp) -> (HappyAbsSyn )
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap9 x)
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn ) -> HappyWrap9
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
newtype HappyWrap10 = HappyWrap10 ([Statement])
happyIn10 :: ([Statement]) -> (HappyAbsSyn )
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap10 x)
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn ) -> HappyWrap10
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
newtype HappyWrap11 = HappyWrap11 ([Statement])
happyIn11 :: ([Statement]) -> (HappyAbsSyn )
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap11 x)
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn ) -> HappyWrap11
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
newtype HappyWrap12 = HappyWrap12 ([Statement])
happyIn12 :: ([Statement]) -> (HappyAbsSyn )
happyIn12 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap12 x)
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn ) -> HappyWrap12
happyOut12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut12 #-}
newtype HappyWrap13 = HappyWrap13 (Statement)
happyIn13 :: (Statement) -> (HappyAbsSyn )
happyIn13 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap13 x)
{-# INLINE happyIn13 #-}
happyOut13 :: (HappyAbsSyn ) -> HappyWrap13
happyOut13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut13 #-}
newtype HappyWrap14 = HappyWrap14 ([Val])
happyIn14 :: ([Val]) -> (HappyAbsSyn )
happyIn14 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap14 x)
{-# INLINE happyIn14 #-}
happyOut14 :: (HappyAbsSyn ) -> HappyWrap14
happyOut14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut14 #-}
newtype HappyWrap15 = HappyWrap15 (Val)
happyIn15 :: (Val) -> (HappyAbsSyn )
happyIn15 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap15 x)
{-# INLINE happyIn15 #-}
happyOut15 :: (HappyAbsSyn ) -> HappyWrap15
happyOut15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut15 #-}
newtype HappyWrap16 = HappyWrap16 ([Val])
happyIn16 :: ([Val]) -> (HappyAbsSyn )
happyIn16 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap16 x)
{-# INLINE happyIn16 #-}
happyOut16 :: (HappyAbsSyn ) -> HappyWrap16
happyOut16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut16 #-}
newtype HappyWrap17 = HappyWrap17 (Val)
happyIn17 :: (Val) -> (HappyAbsSyn )
happyIn17 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap17 x)
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn ) -> HappyWrap17
happyOut17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut17 #-}
newtype HappyWrap18 = HappyWrap18 ([Function])
happyIn18 :: ([Function]) -> (HappyAbsSyn )
happyIn18 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap18 x)
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn ) -> HappyWrap18
happyOut18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut18 #-}
newtype HappyWrap19 = HappyWrap19 (Function)
happyIn19 :: (Function) -> (HappyAbsSyn )
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap19 x)
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn ) -> HappyWrap19
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
newtype HappyWrap20 = HappyWrap20 ([String])
happyIn20 :: ([String]) -> (HappyAbsSyn )
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap20 x)
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn ) -> HappyWrap20
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
newtype HappyWrap21 = HappyWrap21 ([String])
happyIn21 :: ([String]) -> (HappyAbsSyn )
happyIn21 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap21 x)
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn ) -> HappyWrap21
happyOut21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut21 #-}
newtype HappyWrap22 = HappyWrap22 ([String])
happyIn22 :: ([String]) -> (HappyAbsSyn )
happyIn22 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap22 x)
{-# INLINE happyIn22 #-}
happyOut22 :: (HappyAbsSyn ) -> HappyWrap22
happyOut22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut22 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x30\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x03\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x21\x00\x00\x00\x00\x00\x00\x00\x00\x08\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x08\x00\x00\x00\x00\xa0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xbc\x08\x80\x0f\x80\x00\x00\x00\x00\x60\x45\x00\x7c\x00\x04\x00\x00\x00\x00\x2b\x02\xe0\x03\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x56\x04\xc0\x07\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x14\x01\xf0\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x1e\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x8a\x00\xf8\x00\x00\x00\x00\x00\x00\x52\x04\xc0\x07\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x80\x0f\xf8\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x15\x01\xf0\x01\x10\x00\x00\x00\x00\xc0\x07\x7c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0a\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf8\x80\x0f\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x60\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\xbc\x08\x80\x0f\x80\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x2b\x02\xe0\x03\x20\x00\x00\x00\x00\x58\x11\x00\x1f\x00\x01\x00\x00\x00\x40\x8a\x00\xf8\x00\x00\x00\x00\x00\x00\x52\x04\xc0\x07\x00\x00\x00\x00\x00\x90\x22\x00\x3e\x00\x00\x00\x00\x00\x80\x14\x01\xf0\x01\x00\x00\x00\x00\x00\xa4\x08\x80\x0f\x00\x00\x00\x00\x00\x20\x45\x00\x7c\x00\x00\x00\x00\x00\x00\x29\x02\xe0\x03\x00\x00\x00\x00\x00\x48\x11\x00\x1f\x00\x00\x00\x00\x00\x40\x8a\x00\xf8\x00\x00\x00\x00\x00\x00\x52\x04\xc0\x07\x00\x00\x00\x00\x00\xb0\x22\x00\x3e\x00\x02\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\xac\x08\x80\x0f\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x8a\x00\xf8\x00\x00\x00\x00\x00\x00\x52\x04\xc0\x07\x00\x00\x00\x00\x00\x90\x22\x00\x3e\x00\x00\x00\x00\x00\x80\x14\x01\xf0\x01\x00\x00\x00\x00\x00\xa4\x08\x80\x0f\x00\x00\x00\x00\x00\x00\x9e\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe0\x09\x00\x00\x00\x00\x00\x00\x00\x00\x4f\x00\x00\x00\x00\x00\x00\x00\x00\x78\x02\x00\x00\x00\x00\x00\x00\x00\xc0\x13\x00\x00\x00\x00\x00\x00\x00\x00\x9e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe0\x01\x00\x00\x00\x00\x00\x00\x00\x00\x0f\x00\x00\x00\x00\x00\x00\x00\x00\x78\x00\x00\x00\x00\x00\x00\x00\x00\xc0\x03\x00\x00\x00\x00\x00\x00\x00\x00\x1e\x00\x00\x00\x00\x00\x00\x00\x00\xf0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x01\x00\x00\x00\x00\x00\x00\x00\x00\x0c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_happyParser","Program","VarBlock","VarDecs","VarDec","RealExp","BoolExp","StateBlock","Block","Statements","Statement","Vals","Val","Parameters","Generic","FuncDecBlock","FuncDec","FormalParamList","ParamGroup","VariableList","float","bool","string","ID","'+'","'-'","'*'","'/'","'='","'('","')'","':='","','","';'","':'","'.'","'<>'","'>'","'<'","'<='","'>='","'sqrt'","'ln'","'exp'","'sin'","'cos'","'program'","'var'","'procedure'","'function'","'real'","'boolean'","'begin'","'end'","'true'","'false'","'and'","'not'","'or'","'for'","'while'","'case'","'writeln'","'readln'","'break'","'continue'","'if'","'else'","'then'","'of'","'to'","'do'","%eof"]
        bit_start = st * 75
        bit_end = (st + 1) * 75
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..74]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\xf5\xff\xf5\xff\x19\x00\xee\xff\x17\x00\x0d\x00\x20\x00\x28\x00\x00\x00\x28\x00\x2a\x00\x16\x00\x20\x00\x37\x00\x54\x00\x55\x00\x5f\x00\x00\x00\x5b\x00\xfd\xff\x32\x00\x00\x00\x27\x00\x66\x00\x57\x00\xfd\xff\xfc\xff\x68\x00\x00\x00\xc3\x00\xc3\x00\xd5\x00\xc0\x00\xd3\x00\xd7\x00\xdb\x00\x01\x00\x08\x00\x29\x00\x00\x00\x00\x00\x30\x00\x00\x00\x64\x00\x00\x00\x0e\x00\x00\x00\x00\x00\x64\x00\x64\x00\xd9\x00\xdd\x00\xde\x00\xdf\x00\xe0\x00\x7a\x00\xff\xff\x00\x00\x4c\x00\x30\x00\x7a\x00\xea\xff\xe1\x00\x2e\x00\xe2\x00\xe3\x00\x50\x00\x7a\x00\xea\xff\xe6\x00\xe5\x00\x00\x00\x51\x00\xe7\x00\xe8\x00\x77\x00\xe8\x00\xdc\x00\x85\x00\xe9\x00\x00\x00\x00\x00\x00\x00\xc5\x00\x01\x00\xea\x00\x30\x00\x30\x00\x64\x00\x64\x00\x64\x00\x64\x00\x64\x00\x64\x00\x64\x00\x64\x00\x64\x00\x64\x00\x4a\x00\xeb\x00\x4a\x00\x00\x00\xea\xff\x00\x00\x64\x00\x64\x00\x64\x00\x64\x00\x64\x00\x7f\x00\xa4\x00\x00\x00\x00\x00\x9b\x00\xa2\x00\xa9\x00\xb0\x00\xb7\x00\xec\x00\x00\x00\xef\x00\xbe\x00\xbe\x00\xbe\x00\xbe\x00\xbe\x00\xbe\x00\x00\x00\x00\x00\xa4\x00\xa4\x00\xea\xff\xea\xff\x00\x00\xf0\x00\xc4\x00\xee\x00\xf1\x00\xe4\x00\xe4\x00\xf3\x00\xf4\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xcd\x00\xcd\x00\xf5\x00\xf6\x00\x00\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\xfd\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf2\x00\xab\x00\xd0\x00\x00\x00\xd2\x00\x00\x00\xf7\x00\xb2\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xaa\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xce\x00\x00\x00\x00\x00\x00\x00\xb8\x00\xbb\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x62\x00\x84\x00\x40\x00\x00\x00\x00\x00\xd4\x00\x00\x00\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x02\x01\x03\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd6\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf8\x00\x00\x00\xbf\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x07\x01\x94\x00\x00\x00\xd8\x00\xda\x00\x05\x01\x08\x01\x09\x01\x0a\x01\x0b\x01\x0c\x01\x0d\x01\x0e\x01\x0f\x01\x10\x01\x8e\x00\x00\x00\x90\x00\x00\x00\x00\x00\x00\x00\x11\x01\x12\x01\x13\x01\x14\x01\x15\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x01\x00\x00\x00\x00\x19\x01\x1a\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x16\x01\x17\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc6\xff\xfc\xff\xfd\xff\xfc\xff\x00\x00\x00\x00\xc6\xff\x00\x00\x00\x00\x00\x00\x00\x00\xc5\xff\x00\x00\xdb\xff\x00\x00\xfb\xff\x00\x00\x00\x00\x00\x00\xdb\xff\x00\x00\x00\x00\xfe\xff\xc1\xff\xc1\xff\x00\x00\xc0\xff\x00\x00\xbb\xff\x00\x00\xd5\xff\xcd\xff\x00\x00\xda\xff\xdc\xff\x00\x00\xf7\xff\x00\x00\xf8\xff\x00\x00\xeb\xff\xea\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xe0\xff\xea\xff\x00\x00\xc8\xff\xc7\xff\x00\x00\xea\xff\x00\x00\xcc\xff\xea\xff\xd0\xff\xcf\xff\x00\x00\xd4\xff\xce\xff\xea\xff\x00\x00\x00\x00\x00\x00\xc1\xff\x00\x00\x00\x00\xbe\xff\xbd\xff\xbc\xff\xba\xff\x00\x00\xd5\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xcd\xff\x00\x00\xcd\xff\xd9\xff\xe7\xff\xf9\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf6\xff\xfa\xff\xec\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd8\xff\xca\xff\xe3\xff\xe1\xff\xe2\xff\xe4\xff\xe5\xff\xe6\xff\xef\xff\xf0\xff\xed\xff\xee\xff\xe8\xff\xe9\xff\xd6\xff\xd2\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf1\xff\xf2\xff\xf3\xff\xf4\xff\xf5\xff\xd7\xff\xc2\xff\x00\x00\x00\x00\x00\x00\x00\x00\xc4\xff\xc3\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x04\x00\x01\x00\x02\x00\x03\x00\x04\x00\x0a\x00\x06\x00\x0c\x00\x01\x00\x02\x00\x0a\x00\x04\x00\x0e\x00\x06\x00\x25\x00\x1b\x00\x27\x00\x0a\x00\x05\x00\x06\x00\x07\x00\x08\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x0e\x00\x04\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x35\x00\x25\x00\x0e\x00\x27\x00\x26\x00\x2b\x00\x1c\x00\x01\x00\x02\x00\x04\x00\x04\x00\x26\x00\x06\x00\x09\x00\x01\x00\x02\x00\x0a\x00\x04\x00\x0e\x00\x06\x00\x21\x00\x0a\x00\x0f\x00\x0a\x00\x04\x00\x0e\x00\x1d\x00\x1e\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x04\x00\x05\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x01\x00\x02\x00\x0d\x00\x04\x00\x26\x00\x06\x00\x1f\x00\x20\x00\x25\x00\x0a\x00\x27\x00\x26\x00\x0b\x00\x04\x00\x0d\x00\x0e\x00\x0b\x00\x0b\x00\x0d\x00\x0d\x00\x0a\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x01\x00\x04\x00\x05\x00\x04\x00\x0a\x00\x06\x00\x10\x00\x0a\x00\x0b\x00\x0a\x00\x09\x00\x26\x00\x25\x00\x0a\x00\x27\x00\x0e\x00\x25\x00\x25\x00\x27\x00\x27\x00\x22\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1a\x00\x05\x00\x06\x00\x07\x00\x08\x00\x09\x00\x05\x00\x06\x00\x07\x00\x08\x00\x04\x00\x05\x00\x0b\x00\x11\x00\x12\x00\x13\x00\x14\x00\x15\x00\x0c\x00\x0d\x00\x04\x00\x05\x00\x04\x00\x05\x00\x1f\x00\x20\x00\x04\x00\x05\x00\x0c\x00\x0d\x00\x0c\x00\x0d\x00\x0a\x00\x0b\x00\x05\x00\x06\x00\x07\x00\x08\x00\x1f\x00\x20\x00\x0b\x00\x05\x00\x06\x00\x07\x00\x08\x00\x07\x00\x08\x00\x0b\x00\x05\x00\x06\x00\x07\x00\x08\x00\x08\x00\x09\x00\x0b\x00\x05\x00\x06\x00\x07\x00\x08\x00\x0e\x00\x0f\x00\x0b\x00\x05\x00\x06\x00\x07\x00\x08\x00\x0e\x00\x0f\x00\x0b\x00\x05\x00\x06\x00\x07\x00\x08\x00\x04\x00\x10\x00\x11\x00\x12\x00\x10\x00\x11\x00\x12\x00\x0e\x00\x10\x00\x11\x00\x12\x00\x02\x00\x03\x00\x02\x00\x03\x00\x08\x00\x09\x00\x04\x00\x05\x00\x04\x00\x05\x00\x04\x00\x05\x00\x04\x00\x05\x00\x0b\x00\x1c\x00\x0f\x00\x0a\x00\x0d\x00\x21\x00\x0b\x00\x0a\x00\x0a\x00\x0a\x00\x0a\x00\x0f\x00\x04\x00\x0b\x00\x21\x00\x0e\x00\x0d\x00\x0b\x00\x0d\x00\x01\x00\x0b\x00\x0e\x00\xff\xff\x0b\x00\x0e\x00\x0e\x00\x0b\x00\x0b\x00\x0e\x00\x00\x00\x07\x00\x0e\x00\x1c\x00\x0e\x00\x0e\x00\x0e\x00\x0e\x00\x04\x00\x04\x00\x04\x00\x01\x00\x04\x00\x12\x00\x07\x00\x04\x00\x04\x00\x04\x00\x04\x00\x04\x00\x04\x00\x04\x00\x04\x00\x04\x00\x04\x00\x04\x00\x04\x00\x04\x00\x04\x00\x01\x00\x01\x00\xff\xff\x07\x00\x07\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x1b\x00\x2f\x00\x3a\x00\x48\x00\x49\x00\x26\x00\x31\x00\x27\x00\x2f\x00\x3a\x00\x32\x00\x43\x00\x68\x00\x31\x00\x57\x00\x03\x00\x58\x00\x32\x00\x59\x00\x5a\x00\x5b\x00\x5c\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x70\x00\x05\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\xff\xff\x57\x00\x06\x00\x58\x00\x3c\x00\x1c\x00\x08\x00\x2f\x00\x3a\x00\x0b\x00\x40\x00\x3c\x00\x31\x00\x2c\x00\x2f\x00\x3a\x00\x32\x00\x3b\x00\x2d\x00\x31\x00\x14\x00\x65\x00\x15\x00\x32\x00\x11\x00\xc9\xff\x0e\x00\x0f\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x3c\x00\x3d\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x2f\x00\x3a\x00\x3e\x00\x43\x00\x3c\x00\x31\x00\x17\x00\x18\x00\xdf\xff\x32\x00\xdf\xff\x3c\x00\xdf\xff\x10\x00\xdf\xff\xdf\xff\xc9\xff\xd1\xff\xc9\xff\xd1\xff\x1f\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x2f\x00\x43\x00\x44\x00\x30\x00\x1e\x00\x31\x00\x1d\x00\x45\x00\x46\x00\x32\x00\x2a\x00\x3c\x00\xdf\xff\x25\x00\xdf\xff\x2b\x00\xdf\xff\xdf\xff\xdf\xff\xdf\xff\x29\x00\x33\x00\x34\x00\x35\x00\x36\x00\x37\x00\x59\x00\x5a\x00\x5b\x00\x5c\x00\x5d\x00\x59\x00\x5a\x00\x5b\x00\x5c\x00\x3c\x00\x3d\x00\x71\x00\x5e\x00\x5f\x00\x60\x00\x61\x00\x62\x00\x40\x00\x41\x00\x3c\x00\x3d\x00\x3c\x00\x3d\x00\x51\x00\x52\x00\x43\x00\x44\x00\x78\x00\x41\x00\x76\x00\x41\x00\x86\x00\x46\x00\x59\x00\x5a\x00\x5b\x00\x5c\x00\x89\x00\x8a\x00\x93\x00\x59\x00\x5a\x00\x5b\x00\x5c\x00\x5b\x00\x5c\x00\x92\x00\x59\x00\x5a\x00\x5b\x00\x5c\x00\x18\x00\x19\x00\x91\x00\x59\x00\x5a\x00\x5b\x00\x5c\x00\x0b\x00\x0c\x00\x90\x00\x59\x00\x5a\x00\x5b\x00\x5c\x00\x11\x00\x0c\x00\x8f\x00\x59\x00\x5a\x00\x5b\x00\x5c\x00\x23\x00\x23\x00\x20\x00\x21\x00\x1f\x00\x20\x00\x21\x00\x4d\x00\x4f\x00\x20\x00\x21\x00\x08\x00\x09\x00\x15\x00\x09\x00\x27\x00\x19\x00\x37\x00\x38\x00\x37\x00\x66\x00\x37\x00\x84\x00\x37\x00\x83\x00\x4e\x00\x08\x00\x4c\x00\x6d\x00\x4b\x00\x14\x00\x4a\x00\x6c\x00\x6b\x00\x6a\x00\x69\x00\x4f\x00\x23\x00\x64\x00\x14\x00\x66\x00\x63\x00\x56\x00\x55\x00\x06\x00\xbe\xff\x54\x00\x00\x00\x8e\x00\x86\x00\x78\x00\xca\xff\xd2\xff\x8c\x00\x03\x00\x12\x00\x8b\x00\x08\x00\x95\x00\x94\x00\x9b\x00\x9a\x00\x2d\x00\x6e\x00\x6d\x00\x87\x00\x82\x00\x52\x00\x8c\x00\x81\x00\x80\x00\x7f\x00\x7e\x00\x7d\x00\x7c\x00\x7b\x00\x7a\x00\x79\x00\x75\x00\x74\x00\x73\x00\x72\x00\x71\x00\x96\x00\x95\x00\x00\x00\x98\x00\x97\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 69) [
	(1 , happyReduce_1),
	(2 , happyReduce_2),
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68),
	(69 , happyReduce_69)
	]

happy_n_terms = 54 :: Int
happy_n_nonterms = 19 :: Int

happyReduce_1 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_1 = happyReduce 7# 0# happyReduction_1
happyReduction_1 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut5 happy_x_4 of { (HappyWrap5 happy_var_4) -> 
	case happyOut18 happy_x_5 of { (HappyWrap18 happy_var_5) -> 
	case happyOut11 happy_x_6 of { (HappyWrap11 happy_var_6) -> 
	happyIn4
		 (((happy_var_4, happy_var_5), happy_var_6)
	) `HappyStk` happyRest}}}

happyReduce_2 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_2 = happySpecReduce_2  1# happyReduction_2
happyReduction_2 happy_x_2
	happy_x_1
	 =  case happyOut6 happy_x_2 of { (HappyWrap6 happy_var_2) -> 
	happyIn5
		 (happy_var_2
	)}

happyReduce_3 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_3 = happySpecReduce_0  2# happyReduction_3
happyReduction_3  =  happyIn6
		 ([]
	)

happyReduce_4 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_4 = happySpecReduce_2  2# happyReduction_4
happyReduction_4 happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { (HappyWrap7 happy_var_1) -> 
	case happyOut6 happy_x_2 of { (HappyWrap6 happy_var_2) -> 
	happyIn6
		 (happy_var_1:happy_var_2
	)}}

happyReduce_5 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_5 = happyReduce 6# 3# happyReduction_5
happyReduction_5 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut8 happy_x_5 of { (HappyWrap8 happy_var_5) -> 
	happyIn7
		 (Init happy_var_1 (FloatExp happy_var_5)
	) `HappyStk` happyRest}}

happyReduce_6 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_6 = happyReduce 6# 3# happyReduction_6
happyReduction_6 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut9 happy_x_5 of { (HappyWrap9 happy_var_5) -> 
	happyIn7
		 (Init happy_var_1 (BoolExp happy_var_5)
	) `HappyStk` happyRest}}

happyReduce_7 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_7 = happyReduce 4# 3# happyReduction_7
happyReduction_7 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn7
		 (DecFloat happy_var_1
	) `HappyStk` happyRest}

happyReduce_8 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_8 = happyReduce 4# 3# happyReduction_8
happyReduction_8 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn7
		 (DecBool happy_var_1
	) `HappyStk` happyRest}

happyReduce_9 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_9 = happySpecReduce_2  4# happyReduction_9
happyReduction_9 happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_2 of { (HappyWrap8 happy_var_2) -> 
	happyIn8
		 (Op1 "-" happy_var_2
	)}

happyReduce_10 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_10 = happyReduce 4# 4# happyReduction_10
happyReduction_10 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn8
		 (Op3 "sqrt" happy_var_3
	) `HappyStk` happyRest}

happyReduce_11 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_11 = happyReduce 4# 4# happyReduction_11
happyReduction_11 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn8
		 (Op3 "ln" happy_var_3
	) `HappyStk` happyRest}

happyReduce_12 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_12 = happyReduce 4# 4# happyReduction_12
happyReduction_12 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn8
		 (Op3 "exp" happy_var_3
	) `HappyStk` happyRest}

happyReduce_13 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_13 = happyReduce 4# 4# happyReduction_13
happyReduction_13 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn8
		 (Op3 "sin" happy_var_3
	) `HappyStk` happyRest}

happyReduce_14 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_14 = happyReduce 4# 4# happyReduction_14
happyReduction_14 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn8
		 (Op3 "cos" happy_var_3
	) `HappyStk` happyRest}

happyReduce_15 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_15 = happySpecReduce_3  4# happyReduction_15
happyReduction_15 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn8
		 (Op2 "*" happy_var_1 happy_var_3
	)}}

happyReduce_16 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_16 = happySpecReduce_3  4# happyReduction_16
happyReduction_16 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn8
		 (Op2 "/" happy_var_1 happy_var_3
	)}}

happyReduce_17 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_17 = happySpecReduce_3  4# happyReduction_17
happyReduction_17 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn8
		 (Op2 "+" happy_var_1 happy_var_3
	)}}

happyReduce_18 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_18 = happySpecReduce_3  4# happyReduction_18
happyReduction_18 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn8
		 (Op2 "-" happy_var_1 happy_var_3
	)}}

happyReduce_19 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_19 = happySpecReduce_3  4# happyReduction_19
happyReduction_19 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_2 of { (HappyWrap8 happy_var_2) -> 
	happyIn8
		 (happy_var_2
	)}

happyReduce_20 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_20 = happySpecReduce_1  4# happyReduction_20
happyReduction_20 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenReal happy_var_1)) -> 
	happyIn8
		 (Real happy_var_1
	)}

happyReduce_21 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_21 = happySpecReduce_1  4# happyReduction_21
happyReduction_21 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn8
		 (RealVar happy_var_1
	)}

happyReduce_22 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_22 = happySpecReduce_3  5# happyReduction_22
happyReduction_22 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_1 of { (HappyWrap9 happy_var_1) -> 
	case happyOut9 happy_x_3 of { (HappyWrap9 happy_var_3) -> 
	happyIn9
		 (BoolOp "and" happy_var_1 happy_var_3
	)}}

happyReduce_23 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_23 = happySpecReduce_3  5# happyReduction_23
happyReduction_23 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_1 of { (HappyWrap9 happy_var_1) -> 
	case happyOut9 happy_x_3 of { (HappyWrap9 happy_var_3) -> 
	happyIn9
		 (BoolOp "or" happy_var_1 happy_var_3
	)}}

happyReduce_24 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_24 = happySpecReduce_2  5# happyReduction_24
happyReduction_24 happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_2 of { (HappyWrap9 happy_var_2) -> 
	happyIn9
		 (Not happy_var_2
	)}

happyReduce_25 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_25 = happySpecReduce_3  5# happyReduction_25
happyReduction_25 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn9
		 (Comp "=" happy_var_1 happy_var_3
	)}}

happyReduce_26 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_26 = happySpecReduce_3  5# happyReduction_26
happyReduction_26 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn9
		 (Comp "<>" happy_var_1 happy_var_3
	)}}

happyReduce_27 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_27 = happySpecReduce_3  5# happyReduction_27
happyReduction_27 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn9
		 (Comp ">" happy_var_1 happy_var_3
	)}}

happyReduce_28 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_28 = happySpecReduce_3  5# happyReduction_28
happyReduction_28 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn9
		 (Comp ">=" happy_var_1 happy_var_3
	)}}

happyReduce_29 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_29 = happySpecReduce_3  5# happyReduction_29
happyReduction_29 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn9
		 (Comp "<" happy_var_1 happy_var_3
	)}}

happyReduce_30 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_30 = happySpecReduce_3  5# happyReduction_30
happyReduction_30 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	case happyOut8 happy_x_3 of { (HappyWrap8 happy_var_3) -> 
	happyIn9
		 (Comp "<=" happy_var_1 happy_var_3
	)}}

happyReduce_31 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_31 = happySpecReduce_1  5# happyReduction_31
happyReduction_31 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenBool happy_var_1)) -> 
	happyIn9
		 (Boolean happy_var_1
	)}

happyReduce_32 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_32 = happySpecReduce_1  5# happyReduction_32
happyReduction_32 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn9
		 (BoolVar happy_var_1
	)}

happyReduce_33 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_33 = happySpecReduce_2  6# happyReduction_33
happyReduction_33 happy_x_2
	happy_x_1
	 =  case happyOut11 happy_x_1 of { (HappyWrap11 happy_var_1) -> 
	happyIn10
		 (happy_var_1
	)}

happyReduce_34 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_34 = happySpecReduce_1  6# happyReduction_34
happyReduction_34 happy_x_1
	 =  case happyOut13 happy_x_1 of { (HappyWrap13 happy_var_1) -> 
	happyIn10
		 ([happy_var_1]
	)}

happyReduce_35 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_35 = happySpecReduce_3  7# happyReduction_35
happyReduction_35 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_2 of { (HappyWrap12 happy_var_2) -> 
	happyIn11
		 (happy_var_2
	)}

happyReduce_36 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_36 = happySpecReduce_0  8# happyReduction_36
happyReduction_36  =  happyIn12
		 ([]
	)

happyReduce_37 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_37 = happySpecReduce_2  8# happyReduction_37
happyReduction_37 happy_x_2
	happy_x_1
	 =  case happyOut13 happy_x_1 of { (HappyWrap13 happy_var_1) -> 
	case happyOut12 happy_x_2 of { (HappyWrap12 happy_var_2) -> 
	happyIn12
		 (happy_var_1:happy_var_2
	)}}

happyReduce_38 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_38 = happyReduce 4# 9# happyReduction_38
happyReduction_38 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut17 happy_x_3 of { (HappyWrap17 happy_var_3) -> 
	happyIn13
		 (Assign happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_39 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_39 = happyReduce 5# 9# happyReduction_39
happyReduction_39 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut16 happy_x_3 of { (HappyWrap16 happy_var_3) -> 
	happyIn13
		 (ProcCall happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_40 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_40 = happyReduce 7# 9# happyReduction_40
happyReduction_40 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOutTok happy_x_3 of { (Token _ (TokenID happy_var_3)) -> 
	case happyOut16 happy_x_5 of { (HappyWrap16 happy_var_5) -> 
	happyIn13
		 (FuncCall happy_var_1 happy_var_3 happy_var_5
	) `HappyStk` happyRest}}}

happyReduce_41 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_41 = happyReduce 5# 9# happyReduction_41
happyReduction_41 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn13
		 (Writeln happy_var_3
	) `HappyStk` happyRest}

happyReduce_42 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_42 = happySpecReduce_0  10# happyReduction_42
happyReduction_42  =  happyIn14
		 ([]
	)

happyReduce_43 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_43 = happySpecReduce_1  10# happyReduction_43
happyReduction_43 happy_x_1
	 =  case happyOut15 happy_x_1 of { (HappyWrap15 happy_var_1) -> 
	happyIn14
		 ([happy_var_1]
	)}

happyReduce_44 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_44 = happySpecReduce_1  10# happyReduction_44
happyReduction_44 happy_x_1
	 =  case happyOut14 happy_x_1 of { (HappyWrap14 happy_var_1) -> 
	happyIn14
		 (happy_var_1
	)}

happyReduce_45 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_45 = happySpecReduce_3  10# happyReduction_45
happyReduction_45 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut15 happy_x_1 of { (HappyWrap15 happy_var_1) -> 
	case happyOut14 happy_x_3 of { (HappyWrap14 happy_var_3) -> 
	happyIn14
		 (happy_var_1:happy_var_3
	)}}

happyReduce_46 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_46 = happySpecReduce_1  11# happyReduction_46
happyReduction_46 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn15
		 (ValueID happy_var_1
	)}

happyReduce_47 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_47 = happySpecReduce_1  11# happyReduction_47
happyReduction_47 happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	happyIn15
		 (DataExp (FloatExp happy_var_1)
	)}

happyReduce_48 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_48 = happySpecReduce_1  11# happyReduction_48
happyReduction_48 happy_x_1
	 =  case happyOut9 happy_x_1 of { (HappyWrap9 happy_var_1) -> 
	happyIn15
		 (DataExp (BoolExp happy_var_1)
	)}

happyReduce_49 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_49 = happySpecReduce_1  11# happyReduction_49
happyReduction_49 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenStr happy_var_1)) -> 
	happyIn15
		 (ValueStr happy_var_1
	)}

happyReduce_50 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_50 = happySpecReduce_0  12# happyReduction_50
happyReduction_50  =  happyIn16
		 ([]
	)

happyReduce_51 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_51 = happySpecReduce_1  12# happyReduction_51
happyReduction_51 happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	happyIn16
		 ([happy_var_1]
	)}

happyReduce_52 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_52 = happySpecReduce_1  12# happyReduction_52
happyReduction_52 happy_x_1
	 =  case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	happyIn16
		 (happy_var_1
	)}

happyReduce_53 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_53 = happySpecReduce_3  12# happyReduction_53
happyReduction_53 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut17 happy_x_1 of { (HappyWrap17 happy_var_1) -> 
	case happyOut16 happy_x_3 of { (HappyWrap16 happy_var_3) -> 
	happyIn16
		 (happy_var_1:happy_var_3
	)}}

happyReduce_54 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_54 = happySpecReduce_1  13# happyReduction_54
happyReduction_54 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn17
		 ((ValueID happy_var_1)
	)}

happyReduce_55 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_55 = happySpecReduce_1  13# happyReduction_55
happyReduction_55 happy_x_1
	 =  case happyOut8 happy_x_1 of { (HappyWrap8 happy_var_1) -> 
	happyIn17
		 (DataExp (FloatExp happy_var_1)
	)}

happyReduce_56 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_56 = happySpecReduce_1  13# happyReduction_56
happyReduction_56 happy_x_1
	 =  case happyOut9 happy_x_1 of { (HappyWrap9 happy_var_1) -> 
	happyIn17
		 (DataExp (BoolExp happy_var_1)
	)}

happyReduce_57 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_57 = happySpecReduce_0  14# happyReduction_57
happyReduction_57  =  happyIn18
		 ([]
	)

happyReduce_58 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_58 = happySpecReduce_2  14# happyReduction_58
happyReduction_58 happy_x_2
	happy_x_1
	 =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
	case happyOut18 happy_x_2 of { (HappyWrap18 happy_var_2) -> 
	happyIn18
		 (happy_var_1:happy_var_2
	)}}

happyReduce_59 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_59 = happyReduce 11# 15# happyReduction_59
happyReduction_59 (happy_x_11 `HappyStk`
	happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOut20 happy_x_4 of { (HappyWrap20 happy_var_4) -> 
	case happyOut5 happy_x_9 of { (HappyWrap5 happy_var_9) -> 
	case happyOut11 happy_x_10 of { (HappyWrap11 happy_var_10) -> 
	happyIn19
		 ((happy_var_2, (ReturnReal happy_var_4 happy_var_9 happy_var_10))
	) `HappyStk` happyRest}}}}

happyReduce_60 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_60 = happyReduce 11# 15# happyReduction_60
happyReduction_60 (happy_x_11 `HappyStk`
	happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOut20 happy_x_4 of { (HappyWrap20 happy_var_4) -> 
	case happyOut5 happy_x_9 of { (HappyWrap5 happy_var_9) -> 
	case happyOut11 happy_x_10 of { (HappyWrap11 happy_var_10) -> 
	happyIn19
		 ((happy_var_2, (ReturnBool happy_var_4 happy_var_9 happy_var_10))
	) `HappyStk` happyRest}}}}

happyReduce_61 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_61 = happyReduce 9# 15# happyReduction_61
happyReduction_61 (happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Token _ (TokenID happy_var_2)) -> 
	case happyOut20 happy_x_4 of { (HappyWrap20 happy_var_4) -> 
	case happyOut5 happy_x_7 of { (HappyWrap5 happy_var_7) -> 
	case happyOut11 happy_x_8 of { (HappyWrap11 happy_var_8) -> 
	happyIn19
		 ((happy_var_2, (ReturnNone happy_var_4 happy_var_7 happy_var_8))
	) `HappyStk` happyRest}}}}

happyReduce_62 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_62 = happySpecReduce_0  16# happyReduction_62
happyReduction_62  =  happyIn20
		 ([]
	)

happyReduce_63 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_63 = happySpecReduce_1  16# happyReduction_63
happyReduction_63 happy_x_1
	 =  case happyOut21 happy_x_1 of { (HappyWrap21 happy_var_1) -> 
	happyIn20
		 (happy_var_1
	)}

happyReduce_64 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_64 = happySpecReduce_1  16# happyReduction_64
happyReduction_64 happy_x_1
	 =  case happyOut20 happy_x_1 of { (HappyWrap20 happy_var_1) -> 
	happyIn20
		 (happy_var_1
	)}

happyReduce_65 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_65 = happySpecReduce_3  16# happyReduction_65
happyReduction_65 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut21 happy_x_1 of { (HappyWrap21 happy_var_1) -> 
	case happyOut20 happy_x_3 of { (HappyWrap20 happy_var_3) -> 
	happyIn20
		 (happy_var_1 ++ happy_var_3
	)}}

happyReduce_66 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_66 = happySpecReduce_3  17# happyReduction_66
happyReduction_66 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut22 happy_x_1 of { (HappyWrap22 happy_var_1) -> 
	happyIn21
		 (happy_var_1
	)}

happyReduce_67 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_67 = happySpecReduce_3  17# happyReduction_67
happyReduction_67 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut22 happy_x_1 of { (HappyWrap22 happy_var_1) -> 
	happyIn21
		 (happy_var_1
	)}

happyReduce_68 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_68 = happySpecReduce_1  18# happyReduction_68
happyReduction_68 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	happyIn22
		 ([happy_var_1]
	)}

happyReduce_69 :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )
happyReduce_69 = happySpecReduce_3  18# happyReduction_69
happyReduction_69 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (Token _ (TokenID happy_var_1)) -> 
	case happyOut22 happy_x_3 of { (HappyWrap22 happy_var_3) -> 
	happyIn22
		 (happy_var_1:happy_var_3
	)}}

happyNewToken action sts stk
	= lexer(\tk -> 
	let cont i = happyDoAction i tk action sts stk in
	case tk of {
	Token _ TokenEOF -> happyDoAction 53# tk action sts stk;
	Token _ (TokenReal happy_dollar_dollar) -> cont 1#;
	Token _ (TokenBool happy_dollar_dollar) -> cont 2#;
	Token _ (TokenStr happy_dollar_dollar) -> cont 3#;
	Token _ (TokenID happy_dollar_dollar) -> cont 4#;
	Token _ (TokenOp "+") -> cont 5#;
	Token _ (TokenOp "-") -> cont 6#;
	Token _ (TokenOp "*") -> cont 7#;
	Token _ (TokenOp "/") -> cont 8#;
	Token _ (TokenOp "=") -> cont 9#;
	Token _ (TokenK  "(") -> cont 10#;
	Token _ (TokenK  ")") -> cont 11#;
	Token _ (TokenOp ":=") -> cont 12#;
	Token _ (TokenK ",") -> cont 13#;
	Token _ (TokenK ";") -> cont 14#;
	Token _ (TokenK ":") -> cont 15#;
	Token _ (TokenK ".") -> cont 16#;
	Token _ (TokenOp "<>") -> cont 17#;
	Token _ (TokenOp ">") -> cont 18#;
	Token _ (TokenOp "<") -> cont 19#;
	Token _ (TokenOp "<=") -> cont 20#;
	Token _ (TokenOp ">=") -> cont 21#;
	Token _ (TokenOp "sqrt") -> cont 22#;
	Token _ (TokenOp "ln") -> cont 23#;
	Token _ (TokenOp "exp") -> cont 24#;
	Token _ (TokenOp "sin") -> cont 25#;
	Token _ (TokenOp "cos") -> cont 26#;
	Token _ (TokenK "program") -> cont 27#;
	Token _ (TokenK "var") -> cont 28#;
	Token _ (TokenK "procedure") -> cont 29#;
	Token _ (TokenK "function") -> cont 30#;
	Token _ (TokenK "real") -> cont 31#;
	Token _ (TokenK "boolean") -> cont 32#;
	Token _ (TokenK "begin") -> cont 33#;
	Token _ (TokenK "end") -> cont 34#;
	Token _ (TokenK "true") -> cont 35#;
	Token _ (TokenK "false") -> cont 36#;
	Token _ (TokenOp "and") -> cont 37#;
	Token _ (TokenOp "not") -> cont 38#;
	Token _ (TokenOp "or") -> cont 39#;
	Token _ (TokenK "for") -> cont 40#;
	Token _ (TokenK "while") -> cont 41#;
	Token _ (TokenK "case") -> cont 42#;
	Token _ (TokenK "writeln") -> cont 43#;
	Token _ (TokenK "readln") -> cont 44#;
	Token _ (TokenK "break") -> cont 45#;
	Token _ (TokenK "continue") -> cont 46#;
	Token _ (TokenK "if") -> cont 47#;
	Token _ (TokenK "else") -> cont 48#;
	Token _ (TokenK "then") -> cont 49#;
	Token _ (TokenK "of") -> cont 50#;
	Token _ (TokenK "to") -> cont 51#;
	Token _ (TokenK "of") -> cont 52#;
	_ -> happyError' (tk, [])
	})

happyError_ explist 53# tk = happyError' (tk, explist)
happyError_ explist _ tk = happyError' (tk, explist)

happyThen :: () => Parser a -> (a -> Parser b) -> Parser b
happyThen = (thenP)
happyReturn :: () => a -> Parser a
happyReturn = (returnP)
happyParse :: () => Happy_GHC_Exts.Int# -> Parser (HappyAbsSyn )

happyNewToken :: () => Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )

happyDoAction :: () => Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn )

happyReduceArr :: () => Happy_Data_Array.Array Int (Happy_GHC_Exts.Int# -> Token -> Happy_GHC_Exts.Int# -> Happy_IntList -> HappyStk (HappyAbsSyn ) -> Parser (HappyAbsSyn ))

happyThen1 :: () => Parser a -> (a -> Parser b) -> Parser b
happyThen1 = happyThen
happyReturn1 :: () => a -> Parser a
happyReturn1 = happyReturn
happyError' :: () => ((Token), [String]) -> Parser a
happyError' tk = (\(tokens, explist) -> happyError) tk
happyParser = happySomeParser where
 happySomeParser = happyThen (happyParse 0#) (\x -> happyReturn (let {(HappyWrap4 x') = happyOut4 x} in x'))

happySeq = happyDontSeq



{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif



















data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}
          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}
                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}
                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+# i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else False
         action
          | check     = indexShortOffAddr happyTable off_i
          | otherwise = indexShortOffAddr happyDefActions st




indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)













-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+# nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+# nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ((Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
