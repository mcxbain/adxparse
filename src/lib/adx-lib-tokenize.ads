------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.TOKENIZE                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Vectortype;
use Adx.Lib.Vectortype;

package Adx.Lib.Tokenize is

function Tokenize(Source_String:in String; Pattern_String:in String) return String_Vector_Type;

end Adx.Lib.Tokenize;
