------------------------------------------------------------------------------
--                                                                          --
--                               ADX.LIB.SORT                               --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Containers.Indefinite_Vectors;

package body Adx.Lib.Sort is

function Sort(My_Vector:in String_Vector_Type) return String_Vector_Type is

   My_Result:String_Vector_Type:=My_Vector;
   package My_Sorter is new Adx.Lib.Vectortype.Vector_Container.Generic_Sorting;

begin

   My_Sorter.Sort(Container => My_Result);
   return My_Result;

end Sort;

end Adx.Lib.Sort;
