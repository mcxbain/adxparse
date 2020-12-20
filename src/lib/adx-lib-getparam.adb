------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.GETPARAM                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Command_Line;
with Ada.Strings.Unbounded;

use Ada.Command_Line;
use Ada.Strings.Unbounded;

package body Adx.Lib.Getparam is

------------------------------------------------------------------------------
-- Get Parameter List
------------------------------------------------------------------------------
function Get_Parameter_List return String_Vector_Type is

   My_Vector:String_Vector_Type;

begin

   for K in 1 .. Argument_Count loop
      My_Vector.Append(Argument(K));
   end loop;

   return My_Vector;

end Get_Parameter_List;

------------------------------------------------------------------------------
-- Get Parameter String
------------------------------------------------------------------------------
function Get_Parameter_String return String is

   My_Vector:constant String_Vector_Type:=Get_Parameter_List;
   My_String:Unbounded_String;

begin

   for I in My_Vector.First_Index .. My_Vector.Last_Index loop

      Append(My_String, My_Vector.Element(Index => I));

      if I < My_Vector.Last_Index then

         Append(My_String, " ");

      else

         Append(My_String, ASCII.LF);
      end if;

   end loop;

   return To_String(My_String);

end Get_Parameter_String;

end Adx.Lib.Getparam;
