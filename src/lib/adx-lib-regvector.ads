------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.REGVECTOR                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Stringtype;
use Adx.Lib.Stringtype;

package Adx.Lib.Regvector is

function Regvector(My_Vector:String_Vector_Type; Pattern:String) return String_Vector_Type;

end Adx.Lib.Regvector;
