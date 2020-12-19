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

begin

   if Adx.Lib.Regmatch.Regmatch(My_String, "-f\s(.*?)\s", File_Path) then

      Adx.Run.File.Main(To_String(File_Path));

   else

      Put_Line("File missing..");

   end if;

end Main;

end Adx.Terminal.File;
