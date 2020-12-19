------------------------------------------------------------------------------
--                                                                          --
--                           ADX.TERMINAL.RENAME                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.Lib.Regmatch;
with Adx.Run.Rename;

use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body Adx.Terminal.Rename is

------------------------------------------------------------------------------
-- Rename
------------------------------------------------------------------------------
procedure Main(My_String:String) is

   Dir_Path:Unbounded_String;
   Old_Name:Unbounded_String;
   New_Name:Unbounded_String;

begin

   if Adx.Lib.Regmatch.Regmatch(My_String, "-r\s(.*?)\s", Dir_Path) then

      -- Getting the names
      if Adx.Lib.Regmatch.Regmatch(My_String, "-r\s.*?\s-r\s(.*?)\s", Old_Name) then

         if Adx.Lib.Regmatch.Regmatch(My_String, "-r\s.*?\s-r\s.*?\s(.*?)\s", New_Name) then

            -- OK
            Adx.Run.Rename.Main(To_String(Dir_Path), To_String(Old_Name), To_String(New_Name));

         else
            Put_Line("New Name missing..");
         end if;

      else
         Put_Line("Old Name missing..");
      end if;

   else

      Put_Line("Directory missing..");

   end if;

end Main;

end Adx.Terminal.Rename;
