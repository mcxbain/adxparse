------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.REPLACE                              --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package body Adx.Lib.Replace is

------------------------------------------------------------------------------
-- Replace
------------------------------------------------------------------------------
function Replace(My_String:String; Pattern:String; Replace:String) return String is

   Index:Natural;
   My_Buffer:Unbounded_String:=To_Unbounded_String(My_String);

begin

   loop

      Index:=Ada.Strings.Unbounded.Index(Source => My_Buffer, Pattern => Pattern);
      exit when Index = 0;
      Ada.Strings.Unbounded.Replace_Slice(Source => My_Buffer, Low => Index, High => Index + Pattern'Length - 1, By => Replace);

   end loop;

   return To_String(My_Buffer);

end Replace;

end Adx.Lib.Replace;
