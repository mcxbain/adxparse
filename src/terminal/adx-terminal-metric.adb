------------------------------------------------------------------------------
--                                                                          --
--                           ADX.TERMINAL.METRIC                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.Lib.Regmatch;
with Adx.Run.Metric;

use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body Adx.Terminal.Metric is

------------------------------------------------------------------------------
-- Metric
------------------------------------------------------------------------------
procedure Main(My_String:String) is

   File_Path:Unbounded_String;

begin

   if Adx.Lib.Regmatch.Regmatch(My_String, "-m\s(.*?)\s", File_Path) then

      Adx.Run.Metric.Main(To_String(File_Path));

   else

      Put_Line("GPR File missing..");

   end if;

end Main;

end Adx.Terminal.Metric;
