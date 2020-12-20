------------------------------------------------------------------------------
--                                                                          --
--                            ADX.TERMINAL.FILE                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.Lib.Regmatch;
with Adx.Run.File;

use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body Adx.Terminal.File is

------------------------------------------------------------------------------
-- File
------------------------------------------------------------------------------
   procedure Main(My_String:String) is

      File_Path:Unbounded_String;
      Dic_Name:Unbounded_String;
      Format_Option:Unbounded_String;

   begin

      -- Find Path
      if Adx.Lib.Regmatch.Regmatch(My_String, "-f\s(.*?)\s", File_Path) then

         -- Find Dictionary
         if Adx.Lib.Regmatch.Regmatch(My_String, "-f\s.*?\s-c\s(.*?)\s", Dic_Name) then

            -- Find Option
            if Adx.Lib.Regmatch.Regmatch(My_String, "-f\s.*?\s-c\s.*?\s-o\s(.*?)\s", Format_Option) then

               --OK RUN
               Adx.Run.File.Main(To_String(File_Path), To_String(Dic_Name), To_String(Format_Option));

            else

               Put_Line("Format Option missing..");

            end if;

         else

            Put_Line("Dictionary Name missing..");

         end if;

      else

         Put_Line("File missing..");

      end if;

   end Main;

end Adx.Terminal.File;
