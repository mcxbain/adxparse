------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.GETPARAM                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Vectortype;
use Adx.Lib.Vectortype;

package Adx.Lib.Getparam is

   function Get_Parameter_List return String_Vector_Type;
   function Get_Parameter_String return String;

end Adx.Lib.Getparam;
