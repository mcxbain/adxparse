------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.TOKENIZE                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Stringtype;
use Adx.Lib.Stringtype;

package Adx.Lib.Tokenize is

function Tokenize(My_String:in String; Delimiter:in String) return String_Vector_Type;

end Adx.Lib.Tokenize;
