------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.PRINTCHAR                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
use Ada.Text_IO;

package body Adx.Lib.Printchar is

------------------------------------------------------------------------------
-- Printchar
------------------------------------------------------------------------------
procedure Printchar(My_String:String) is

   Character_Number:Integer;

begin

   for I in My_String'First .. My_String'Last loop

      Character_Number:=Character'Pos(My_String(I));

      if Character_Number < 10 then
         Put("  ");
      end if;

      if Character_Number < 100 then
         Put(" ");
      end if;

      Put(Integer'Image(Character_Number)); -- Pos and Image

      Put(" :");
      Put(My_String(I));

      New_Line;

   end loop;

end Printchar;

end Adx.Lib.Printchar;
