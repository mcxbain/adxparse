With Ada.Text_IO;
With Adx.Lib.Readdir;
With Adx.App.Lib.FileList;
With Adx.App.Custom.Parse;

use Ada.Text_IO;
use Adx.Lib.Readdir;


package Body Adx.App.Custom.Make is


------------------------------------------------------------------------------
-- Make All
------------------------------------------------------------------------------ 
   procedure MakeAll(Dir_Path:String) is
   
   begin
   
      put_line("------------------------------------------------------------------------------");
      put_line("-- Modul Custom  -------------------------------------------------------------");
      put_line("------------------------------------------------------------------------------");
      
      MakeAds(Dir_Path);
      MakeAdb(Dir_Path);
      
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
   Adx.App.Custom.Parse.ParseVector(My_Vector);
   
   end MakeAds;
   
   
------------------------------------------------------------------------------
-- Make Adb
------------------------------------------------------------------------------
   procedure MakeAdb(Dir_Path:String) is
   
    My_Vector:Directory_Vector_Type;
    
   begin 
   
   My_Vector:=Adx.App.Lib.FileList.GetFileListAdb(Dir_Path); 
   Adx.App.Custom.Parse.ParseVector(My_Vector);
   
   end MakeAdb;
   
   
   end Adx.App.Custom.Make;