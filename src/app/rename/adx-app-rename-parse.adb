------------------------------------------------------------------------------
--                                                                          --
--                           ADX.APP.RENAME.PARSE                           --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.Lib.Readdir;
with Adx.Lib.Readfile;
with Adx.Lib.Vectortype;
with Adx.Lib.Replace;
with Adx.Lib.Writefile;
with Adx.Lib.Stringmod;

use Ada.Text_IO;
use Ada.Strings.Unbounded;
use Adx.Lib.Readdir;
use Adx.Lib.Vectortype;

package body Adx.App.Rename.Parse is

------------------------------------------------------------------------------
-- Parse File
------------------------------------------------------------------------------
procedure ParseFile(File_Path:String; Old_Name:String; New_Name:String) is

   My_Vector:String_Vector_Type;
   My_Line:Unbounded_String;
   My_Replace:Unbounded_String;
   My_Buffer:String_Vector_Type;
begin

   My_Vector:=Adx.Lib.Readfile.Readfile(File_Path);

   for I in My_Vector.First_Index .. My_Vector.Last_Index loop

      My_Line:=To_Unbounded_String(My_Vector.Element(Index => I));

      My_Replace:=To_Unbounded_String(Adx.Lib.Replace.Replace(To_String(My_Line), Old_Name, New_Name));
      -- The Replace function dosent support mixed cased in order to run this we run the ada formatter first after done we also rerun the new header formatter

      My_Buffer.Append(To_String(My_Replace));
      --put_line(to_string(My_Replace));

   end loop;

   --Print_Vector(My_Buffer);
   Adx.Lib.Writefile.Writefile(File_Path, My_Buffer);

end ParseFile;

------------------------------------------------------------------------------
-- Rename
------------------------------------------------------------------------------
procedure Rename(Dir_Path:String; Old_Name:String; New_Name:String; File_Type:String) is

   My_Vector:Directory_Vector_Type;
   My_Record:Directory_Record_Type;

   Old_Name_Mod:constant String:=Adx.Lib.Stringmod.String_To_Upper_First_Sep(Adx.Lib.Replace.Replace(Old_Name, "-", "."), ".");
   New_Name_Mod:constant String:=Adx.Lib.Stringmod.String_To_Upper_First_Sep(Adx.Lib.Replace.Replace(New_Name, "-", "."), ".");

begin

   My_Vector:=Adx.Lib.Readdir.Readdir(Dir_Path, File_Type);

   for I in My_Vector.First_Index .. My_Vector.Last_Index loop

      My_Record:=My_Vector.Element(Index => I);
      Put_Line(To_String(My_Record.File_Path));
      ParseFile(To_String(My_Record.File_Path), Old_Name_Mod, New_Name_Mod);

   end loop;

end Rename;

end Adx.App.Rename.Parse;
