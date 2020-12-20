------------------------------------------------------------------------------
--                                                                          --
--                               ADX.LIB.SORT                               --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Vectortype;
use Adx.Lib.Vectortype;

package Adx.Lib.Sort is

function Sort(My_Vector:in String_Vector_Type) return String_Vector_Type;

end Adx.Lib.Sort;
