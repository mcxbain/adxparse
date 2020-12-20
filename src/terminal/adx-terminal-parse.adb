------------------------------------------------------------------------------
--                                                                          --
--                            ADX.TERMINAL.PARSE                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.Lib.Regmatch;
with Adx.Run.Parse;

use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body Adx.Terminal.Parse is

------------------------------------------------------------------------------
-- Parse
------------------------------------------------------------------------------
   procedure Main(My_String:String) is

      Dir_Path:Unbounded_String;
      Dic_Name:Unbounded_String;
      Format_Option:Unbounded_String;

   begin

      if Adx.Lib.Regmatch.Regmatch(My_String, "-d\s(.*?)\s", Dir_Path) then

         -- Find Dictionary
         if Adx.Lib.Regmatch.Regmatch(My_String, "-d\s.*?\s-c\s(.*?)\s", Dic_Name) then

            -- Find Option
            if Adx.Lib.Regmatch.Regmatch(My_String, "-d\s.*?\s-c\s.*?\s-o\s(.*?)\s", Format_Option) then

               --OK ..removespace
               Put_Line(To_String(Format_Option));
               Adx.Run.Parse.Main(To_String(Dir_Path), To_String(Dic_Name), To_String(Format_Option));

            else

               Put_Line("Format Option missing..");

            end if;

         else

            Put_Line("Dictionary Name missing..");

         end if;

      else

         Put_Line("Directory missing..");

      end if;

   end Main;

end Adx.Terminal.Parse;
