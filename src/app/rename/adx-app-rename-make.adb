------------------------------------------------------------------------------
--                                                                          --
--                           ADX.APP.RENAME.MAKE                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.App.Rename.File;
with Adx.App.Rename.Parse;

use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body Adx.App.Rename.Make is

------------------------------------------------------------------------------
-- Make All
------------------------------------------------------------------------------
procedure MakeAll(Dir_Path:String; Old_Name:String; New_Name:String) is

begin

   Put_Line("------------------------------------------------------------------------------");
   Put_Line("-- Modul Rename  -------------------------------------------------------------");
   Put_Line("------------------------------------------------------------------------------");

   MakeRename(Dir_Path, Old_Name, New_Name);
   MakeParse(Dir_Path, Old_Name, New_Name);

   Put_Line("------------------------------------------------------------------------------");
   New_Line;
end MakeAll;

------------------------------------------------------------------------------
-- Make Rename
------------------------------------------------------------------------------
procedure MakeRename(Dir_Path:String; Old_Name:String; New_Name:String) is

   Has_Adb:Boolean;
   Result:Unbounded_String;
   pragma Unreferenced(Result);

begin

   Adx.App.Rename.File.Rename(Dir_Path, Old_Name, New_Name, ".ads");

   --check if adb exists
   Has_Adb:=Adx.App.Rename.File.GetFilePath(Dir_Path, Old_Name & ".adb", Result);

   if Has_Adb then
      Adx.App.Rename.File.Rename(Dir_Path, Old_Name, New_Name, ".adb");
   end if;

end MakeRename;

------------------------------------------------------------------------------
-- Make Parse
------------------------------------------------------------------------------
procedure MakeParse(Dir_Path:String; Old_Name:String; New_Name:String) is

begin

   Adx.App.Rename.Parse.Rename(Dir_Path, Old_Name, New_Name, "*.ads");
   Adx.App.Rename.Parse.Rename(Dir_Path, Old_Name, New_Name, "*.adb");

end MakeParse;

end Adx.App.Rename.Make;
