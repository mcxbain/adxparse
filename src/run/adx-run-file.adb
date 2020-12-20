------------------------------------------------------------------------------
--                                                                          --
--                               ADX.RUN.FILE                               --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Ada.Directories;
with Adx.Lib.Filecheck;
with Adx.Lib.Readdir;
with Adx.Lib.Writefile;
with Adx.Lib.Deletefile;
with Adx.Lib.Vectortype;
with Adx.App.Rmheader.Parse;
with Adx.App.AddHeader.Parse;
with Adx.App.Format.Parse;
with Adx.App.Custom.Parse;
with Adx.App.Format.Dictionary;

use Ada.Text_IO;
use Ada.Strings.Unbounded;
use Adx.Lib.Readdir;
use Adx.Lib.Vectortype;

package body Adx.Run.File is

function Getfiletype(File_Name:String) return String is

   My_String:constant String:=Ada.Directories.Extension(File_Name);

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

   File_Name:constant String:=Adx.App.Format.Dictionary.GetDictionaryFilename;
begin

   --put_line("Delete dictionary file " &File_Name);
   Adx.Lib.Deletefile.Deletefile(File_Name);

end Deletedictionary;

procedure Main(File_Path:String; Dic_Name:String; Format_Option:String) is

   File_Name:constant String:=Ada.Directories.Simple_Name(File_Path);
   File_Type:constant String:=Getfiletype(File_Name);
   My_Record:constant Directory_Record_Type:=(To_Unbounded_String(File_Name), To_Unbounded_String(File_Path));
   Dictionary_String:String_Vector_Type;

begin

   if Dic_Name = "adxlib" then
      Dictionary_String:=Adx.App.Format.Dictionary.GetAdxLib;
   elsif Dic_Name = "adxparse" then
      Dictionary_String:=Adx.App.Format.Dictionary.GetAdxParse;
   end if;

   --check if File exists;
   if Adx.Lib.Filecheck.Filecheck(File_Path) then

      --make dic file
      Makedictionary(Dictionary_String);

      if File_Type = "ads" then

         Put_Line("File is ADS ..");
         Adx.App.Rmheader.Parse.ParseRecordAds(My_Record);
         Adx.App.AddHeader.Parse.ParseRecordAds(My_Record);
         Adx.App.Format.Parse.ParseRecord(My_Record);
         Adx.App.Custom.Parse.ParseRecord(My_Record, Format_Option);

      elsif File_Type = "adb" then

         Put_Line("File is ADB ..");
         Adx.App.Rmheader.Parse.ParseRecordAdb(My_Record);
         Adx.App.AddHeader.Parse.ParseRecordAdb(My_Record);
         Adx.App.Format.Parse.ParseRecord(My_Record);
         Adx.App.Custom.Parse.ParseRecord(My_Record, Format_Option);

      end if;

      --delete dic file
      Deletedictionary;

   else

      Put_Line("File dosent exist..");

   end if;

end Main;

end Adx.Run.File;
