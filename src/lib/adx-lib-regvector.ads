------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.REGVECTOR                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Vectortype;
use Adx.Lib.Vectortype;

package Adx.Lib.Regvector is

function Regvector(My_Vector:String_Vector_Type; Pattern:String) return String_Vector_Type;

end Adx.Lib.Regvector;
