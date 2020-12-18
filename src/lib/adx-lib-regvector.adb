------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.REGVECTOR                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Strings.Unbounded;
with Adx.Lib.Regmatch;

use Ada.Strings.Unbounded;

package body Adx.Lib.Regvector is

------------------------------------------------------------------------------
-- Regvector
------------------------------------------------------------------------------
function Regvector(My_Vector:String_Vector_Type; Pattern:String) return String_Vector_Type is

   Result_Vector:String_Vector_Type;
   Has_Match:Boolean;
   Result:Unbounded_String;

begin

   for I in My_Vector.First_Index .. My_Vector.Last_Index loop

      Has_Match:=Regmatch.Regmatch(My_Vector.Element(Index => I), Pattern, Result);

      if Has_Match then

         Result_Vector.Append(To_String(Result));

      end if;

   end loop;

   return Result_Vector;

end Regvector;

end Adx.Lib.Regvector;
