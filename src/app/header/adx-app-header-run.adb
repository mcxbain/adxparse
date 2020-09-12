With Ada.Text_IO;
With Adx.App.FileList;
With Adx.lib.Readdir;

use Ada.Text_IO;
use Adx.lib.Readdir;


package Body Adx.App.Header.Run is


------------------------------------------------------------------------------
-- Run All
------------------------------------------------------------------------------ 
   procedure RunAll(Dir_Path:String) is
   
   begin
   
   runAds(Dir_Path);
   runAdb(Dir_Path);
  
   end RunAll;
 
------------------------------------------------------------------------------
-- Run Ads
------------------------------------------------------------------------------
   procedure RunAds(Dir_Path:String) is
   
    My_Vector:Directory_Vector_Type;
    
   begin 
   
   put_line("----------Run Ads---------------");
   
   My_Vector:=Adx.App.FileList.GetFileListAds(Dir_Path);
   Adx.App.Header.RemoveHeader(My_Vector);
   Adx.App.Header.AddHeaderAds(My_Vector);
   
   end RunAds;
   
   
------------------------------------------------------------------------------
-- Run Adb
------------------------------------------------------------------------------
   procedure RunAdb(Dir_Path:String) is
   
    My_Vector:Directory_Vector_Type;
    
   begin 
   
   put_line("----------Run Adb---------------");
    
   My_Vector:=Adx.App.FileList.GetFileListAdb(Dir_Path);
   Adx.App.Header.RemoveHeader(My_Vector);
   Adx.App.Header.AddHeaderAdb(My_Vector);   
   
   end RunAdb;
  


end Adx.App.Header.Run;
