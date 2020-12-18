------------------------------------------------------------------------------
--                                                                          --
--                           ADX.APP.FORMAT.MAKE                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.Lib.Readdir;
with Adx.Lib.Writefile;
with Adx.Lib.Deletefile;
with Adx.Lib.Filelist;
with Adx.App.Format.Parse;
with Adx.App.Format.Dictionary;

use Ada.Text_IO;
use Ada.Strings.Unbounded;
use Adx.Lib.Readdir;

package body Adx.App.Format.Make is

------------------------------------------------------------------------------
-- Make All
------------------------------------------------------------------------------
procedure MakeAll(Dir_Path:String; Dictionary_String:String_Vector_Type) is

   File_Name:Unbounded_String;
begin

   Adx.App.Format.Dictionary.InitCurrentDirectory;
   File_Name:=To_Unbounded_String(Adx.App.Format.Dictionary.GetDictionaryFilename);

   Put_Line("------------------------------------------------------------------------------");
   Put_Line("-- Modul Format  -------------------------------------------------------------");
   Put_Line("------------------------------------------------------------------------------");

   Put_Line("Create dictionary file " & To_String(File_Name));
   Adx.Lib.Writefile.Writefile(To_String(File_Name), Dictionary_String);

   MakeAds(Dir_Path);
   MakeAdb(Dir_Path);

   Put_Line("Delete dictionary file " & To_String(File_Name));
   Adx.Lib.Deletefile.Deletefile(To_String(File_Name));

   Put_Line("------------------------------------------------------------------------------");
   New_Line;
end MakeAll;

------------------------------------------------------------------------------
-- Make Ads
------------------------------------------------------------------------------
procedure MakeAds(Dir_Path:String) is

   My_Vector:Directory_Vector_Type;

begin

   My_Vector:=Adx.Lib.Filelist.Get_File_List_Ads(Dir_Path);
   Adx.App.Format.Parse.ParseVector(My_Vector);

end MakeAds;

------------------------------------------------------------------------------
-- Make Adb
------------------------------------------------------------------------------
procedure MakeAdb(Dir_Path:String) is

   My_Vector:Directory_Vector_Type;

begin

   My_Vector:=Adx.Lib.Filelist.Get_File_List_Adb(Dir_Path);
   Adx.App.Format.Parse.ParseVector(My_Vector);

end MakeAdb;

end Adx.App.Format.Make;
