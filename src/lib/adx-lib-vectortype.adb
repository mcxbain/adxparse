------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.VECTORTYPE                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
use Ada.Text_IO;

package body Adx.Lib.Vectortype is

------------------------------------------------------------------------------
-- Print Vector
------------------------------------------------------------------------------
procedure Print_Vector(My_Vector:in String_Vector_Type) is

begin

   Put_Line("------------------------------------------------------------------------------");
   Put_Line("Print Vector");
   Put_Line("------------------------------------------------------------------------------");

   for I in My_Vector.First_Index .. My_Vector.Last_Index loop

      Put("Line" & Integer'Image(I) & " => ");
      Put_Line(My_Vector.Element(Index => I));

   end loop;

   Put_Line("------------------------------------------------------------------------------");

end Print_Vector;

------------------------------------------------------------------------------
-- Get Vector Length
------------------------------------------------------------------------------
function Get_Vector_Length(My_Vector:String_Vector_Type) return Natural is

   My_Number:constant Natural:=Natural(My_Vector.Length);

begin

   return My_Number;

end Get_Vector_Length;

end Adx.Lib.Vectortype;
