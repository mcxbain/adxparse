------------------------------------------------------------------------------
--                                                                          --
--                               ADX.RUNFILE                                --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.Lib.Filecheck;
with Adx.Lib.Readdir;
with Ada.Directories;
with Adx.App.Rmheader.Parse;
with Adx.App.AddHeader.Parse;
with Adx.App.Format.Parse;
with Adx.App.Custom.Parse;
with Adx.App.Format.Dictionary;
with Adx.Lib.Writefile;
with Adx.Lib.Deletefile;
with Adx.Lib.Vectortype;

use Ada.Text_IO;
use Ada.Strings.Unbounded;
use Adx.Lib.Readdir;
use Adx.Lib.Vectortype;

package body Adx.Runfile is

function Getfiletype(File_Name:String) return String is

   My_String:String:=Ada.Directories.Extension(File_Name);

begin

   return My_String;

end Getfiletype;

procedure Makedictionary(Dictionary_String:String_Vector_Type) is

   File_Name:Unbounded_String;
begin

   Adx.App.Format.Dictionary.InitCurrentDirectory;
   File_Name:=To_Unbounded_String(Adx.App.Format.Dictionary.GetDictionaryFilename);

   --put_line("Create dictionary file "&To_String(File_Name));
   Adx.Lib.Writefile.Writefile(To_String(File_Name), Dictionary_String);

end Makedictionary;

procedure Deletedictionary is

   File_Name:String:=Adx.App.Format.Dictionary.GetDictionaryFilename;
begin

   --put_line("Delete dictionary file " &File_Name);
   Adx.Lib.Deletefile.Deletefile(File_Name);

end Deletedictionary;

procedure ParseFile(File_Path:String) is

   File_Name:String:=Ada.Directories.Simple_Name(File_Path);
   File_Type:String:=Getfiletype(File_Name);
   My_Record:Directory_Record_Type:=(To_Unbounded_String(File_Name), To_Unbounded_String(File_Path));
   Dictionary_String:String_Vector_Type:=Adx.App.Format.Dictionary.GetAdxLib;

begin

   --check if File exists;
   if Adx.Lib.Filecheck.Filecheck(File_Path) then

      --make dic file
      Makedictionary(Dictionary_String);

      if File_Type = "ads" then

         Put_Line("File is ADS ..");
         Adx.App.Rmheader.Parse.ParseRecordAds(My_Record);
         Adx.App.AddHeader.Parse.ParseRecordAds(My_Record);
         Adx.App.Format.Parse.ParseRecord(My_Record);
         Adx.App.Custom.Parse.ParseRecord(My_Record);

      elsif File_Type = "adb" then

         Put_Line("File is ADB ..");
         Adx.App.Rmheader.Parse.ParseRecordAdb(My_Record);
         Adx.App.AddHeader.Parse.ParseRecordAdb(My_Record);
         Adx.App.Format.Parse.ParseRecord(My_Record);
         Adx.App.Custom.Parse.ParseRecord(My_Record);

      end if;

      --delete dic file
      Deletedictionary;

   else

      Put_Line("File dosent exist..");

   end if;

end ParseFile;

end Adx.Runfile;
