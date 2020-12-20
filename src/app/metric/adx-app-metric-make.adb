------------------------------------------------------------------------------
--                                                                          --
--                           ADX.APP.METRIC.MAKE                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.Lib.Sysout;

use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body Adx.App.Metric.Make is

------------------------------------------------------------------------------
-- Make All
------------------------------------------------------------------------------
   procedure MakeAll(Project_File:String) is

      Result:Unbounded_String;

   begin

      Put_Line("Run Gnatmetric");

      Result:=Adx.Lib.Sysout.Sysout("gnatmetric --complexity-all --syntax-all --lines-all -P " & Project_File);

      Put_Line(To_String(Result));

   end MakeAll;

end Adx.App.Metric.Make;
