with Ada.Text_IO;
With Ada.Strings.Unbounded;
with Adx.Lib.Filecheck;
With Adx.Lib.Readdir;
with Ada.Directories;
With Adx.App.RmHeader.Parse;
With Adx.App.AddHeader.Parse;
with Adx.App.Format.Parse;
with Adx.App.Custom.Parse;
with Adx.App.Format.Dictionary;
with Adx.Lib.Writefile;
with Adx.Lib.Deletefile;
With Adx.Lib.Vectortype;


use Ada.Text_IO;
use Ada.Strings.Unbounded;
use Adx.Lib.Readdir;
Use Adx.Lib.Vectortype;

package body adx.runfile is
   
   function GetFileType(File_Name:String) return String is
   
      My_String:String:=Ada.Directories.Extension(File_Name);
      
   begin 
      
      return My_String;
      
   end GetFileType;
   
   
   
   procedure MakeDictionary(Dictionary_String:String_Vector_Type) is
      
      File_Name:Unbounded_String;
   begin 
      
      Adx.App.Format.Dictionary.InitCurrentDirectory;
      File_Name:=To_Unbounded_String(Adx.App.Format.Dictionary.GetDictionaryFileName);
      
      --put_line("Create dictionary file "&To_String(File_Name));
      Adx.Lib.Writefile.Writefile(To_String(File_Name), Dictionary_String);
      
   end MakeDictionary;
   
   
   procedure DeleteDictionary is
      
       File_Name:String:=Adx.App.Format.Dictionary.GetDictionaryFileName;
   begin 
      
      --put_line("Delete dictionary file " &File_Name);
      Adx.Lib.Deletefile.Deletefile(File_Name);
      
   end DeleteDictionary;
     

   
   procedure ParseFile(File_Path:String) is
      
      File_Name:String:=Ada.Directories.Simple_Name(File_Path);
      File_Type:String:=GetFileType(File_Name);
      My_Record:Directory_Record_Type:=(To_Unbounded_String(File_Name), To_Unbounded_String(File_Path));
      Dictionary_String:String_Vector_Type:=Adx.App.format.dictionary.GetAdxLib;
      
   begin 
      
      --check if File exists;
      if Adx.Lib.Filecheck.Filecheck(File_Path) then
      
         --make dic file
         MakeDictionary(Dictionary_String);
         
         if File_Type = "ads" then 
            
            put_line("File is ADS ..");
            Adx.App.RmHeader.Parse.ParseRecordAds(My_Record);
            Adx.App.AddHeader.Parse.ParseRecordAds(My_Record);
            Adx.App.format.Parse.ParseRecord(My_Record);
            Adx.App.Custom.Parse.ParseRecord(My_Record);
            
         elsif File_Type = "adb" then 
            
            put_line("File is ADB ..");
            Adx.App.RmHeader.Parse.ParseRecordAdb(My_Record);
            Adx.App.AddHeader.Parse.ParseRecordAdb(My_Record);
            Adx.App.Format.Parse.ParseRecord(My_Record);
            Adx.App.Custom.Parse.ParseRecord(My_Record);
            
         end if;
         
         --delete dic file
         DeleteDictionary;

        

      else

         Put_Line("File dosent exist..");

      end if;
      
   end ParseFile;

end adx.runfile;
