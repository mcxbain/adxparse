------------------------------------------------------------------------------
--                                                                          --
--                              ADX.LIB.DEBUG                               --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.Lib.Saveprint;

use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body Adx.Lib.Debug is

------------------------------------------------------------------------------
-- Print
------------------------------------------------------------------------------
procedure Print(Name:String; Status:String; Info:String) is

   Total_Length:constant Natural:=10;
   Name_Length:constant Natural:=Name'Last;
   Diff_Length:constant Natural:=Total_Length - Name_Length;
   My_String:Unbounded_String;

begin

   Append(My_String, Name);

   for I in Natural range 1 .. Diff_Length loop
      Append(My_String, " ");
   end loop;

   Append(My_String, Status);
   if (Status = "ERROR") then
      Append(My_String, "  ");
   end if;

   if (Status = "OK") then
      Append(My_String, "     ");
   end if;

   Append(My_String, Info);

   -- Print String task safe to Terminal screen
   Adx.Lib.Saveprint.Safe_Print.Put(To_String(My_String));

end Print;

end Adx.Lib.Debug;
