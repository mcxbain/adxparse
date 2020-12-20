------------------------------------------------------------------------------
--                                                                          --
--                           ADX.TERMINAL.UCOUNT                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.Lib.Regmatch;
with Adx.Run.Ucount;

use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body Adx.Terminal.Ucount is

------------------------------------------------------------------------------
-- Ucount
------------------------------------------------------------------------------
procedure Main(My_String:String) is

   Dir_Path:Unbounded_String;

begin

   if Adx.Lib.Regmatch.Regmatch(My_String, "-l\s(.*?)\s", Dir_Path) then

      Adx.Run.Ucount.Main(To_String(Dir_Path));

   else

      Put_Line("Directory missing..");

   end if;

end Main;

end Adx.Terminal.Ucount;
