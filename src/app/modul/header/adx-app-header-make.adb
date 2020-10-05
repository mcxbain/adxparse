With Ada.Text_IO;
With Adx.App.Lib.FileList;
With Adx.lib.Readdir;
With Adx.App.Header.Parse;

use Ada.Text_IO;
use Adx.lib.Readdir;


package Body Adx.App.Header.Make is


   ------------------------------------------------------------------------------
   -- Make All
   ------------------------------------------------------------------------------ 
   procedure MakeAll(Dir_Path:String) is
   
   begin
   
      put_line("------------------------------------------------------------------------------");
      put_line("-- Modul Header  -------------------------------------------------------------");
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
      Adx.App.Header.Parse.RemoveHeader(My_Vector);
      Adx.App.Header.Parse.AddHeaderAds(My_Vector);
   
   end MakeAds;
   
   
   ------------------------------------------------------------------------------
   -- Make Adb
   ------------------------------------------------------------------------------
   procedure MakeAdb(Dir_Path:String) is
   
      My_Vector:Directory_Vector_Type;
    
   begin 
    
      My_Vector:=Adx.App.Lib.FileList.GetFileListAdb(Dir_Path);
      Adx.App.Header.Parse.RemoveHeader(My_Vector);
      Adx.App.Header.Parse.AddHeaderAdb(My_Vector);   
   
   end MakeAdb;
  


end Adx.App.Header.Make;
