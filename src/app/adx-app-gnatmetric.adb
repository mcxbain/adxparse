with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.Lib.Sysout;

use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body Adx.App.Gnatmetric is

   procedure Run (Project_File : String) is

      Result : Unbounded_String;

   begin

      Put_Line ("Run Gnatmetric");

      Result := Adx.Lib.Sysout.Sysout ("gnatmetric --complexity-all --syntax-all --lines-all -P "&Project_File);
       

      Put_Line (To_String (Result));

   end Run;

end Adx.App.Gnatmetric;
