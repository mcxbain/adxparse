------------------------------------------------------------------------------
--                                                                          --
--                           ADX.APP.FORMAT.MAKE                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
With Ada.Text_IO;
With Ada.Strings.Unbounded;
With Adx.Lib.Readdir;
With Adx.Lib.Writefile;
With Adx.Lib.Deletefile;
With Adx.App.Lib.FileList;
With Adx.App.Format.Parse;
With Adx.App.Format.Dictionary;


use Ada.Text_IO;
use Ada.Strings.Unbounded;
use Adx.Lib.Readdir;


package Body Adx.App.Format.Make is


   ------------------------------------------------------------------------------
   -- Make All
   ------------------------------------------------------------------------------ 
   procedure MakeAll(Dir_Path:String; Dictionary_String:String_Vector_Type) is
   
      File_Name:Unbounded_String;
   begin
      
      Adx.App.Format.Dictionary.InitCurrentDirectory;
      File_Name:=To_Unbounded_String(Adx.App.Format.Dictionary.GetDictionaryFileName);
   
      put_line("------------------------------------------------------------------------------");
      put_line("-- Modul Format  -------------------------------------------------------------");
      put_line("------------------------------------------------------------------------------");
      
      put_line("Create dictionary file "&To_String(File_Name));
      Adx.Lib.Writefile.Writefile(To_String(File_Name), Dictionary_String);
      
      MakeAds(Dir_Path);
      MakeAdb(Dir_Path);
      
      put_line("Delete dictionary file " &To_String(File_Name));
      Adx.Lib.Deletefile.Deletefile(To_String(File_Name));

      put_line("------------------------------------------------------------------------------");
      new_line;
   end MakeAll;
   
   
   ------------------------------------------------------------------------------
   -- Make Ads
   ------------------------------------------------------------------------------
   procedure MakeAds(Dir_Path:String) is
   
      My_Vector:Directory_Vector_Type;
    
   begin 
      
      My_Vector:=Adx.App.Lib.FileList.GetFileListAds(Dir_Path);
      Adx.App.Format.Parse.ParseVector(My_Vector);
   
   end MakeAds;
   
   
   ------------------------------------------------------------------------------
   -- Make Adb
   ------------------------------------------------------------------------------
   procedure MakeAdb(Dir_Path:String) is
   
      My_Vector:Directory_Vector_Type;
    
   begin 
   
      My_Vector:=Adx.App.Lib.FileList.GetFileListAdb(Dir_Path);
      Adx.App.Format.Parse.ParseVector(My_Vector);
   
   end MakeAdb;
   
   
end Adx.App.Format.Make;
