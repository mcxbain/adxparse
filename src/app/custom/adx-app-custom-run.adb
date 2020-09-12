With Ada.Text_IO;
With Adx.lib.Readdir;
With Adx.App.FileList;
With Adx.App.Custom.Parse;

use Ada.Text_IO;
use Adx.lib.Readdir;


package Body Adx.App.Custom.Run is


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

   put_line("-------------- Run Custom Ads --------------");
   
   My_Vector:=Adx.App.FileList.GetFileListAds(Dir_Path);
   Adx.App.FileList.PrintName(My_Vector);
   
   Adx.App.Custom.Parse.ParseVector(My_Vector);
   
   end RunAds;
   
   
------------------------------------------------------------------------------
-- Run Adb
------------------------------------------------------------------------------
   procedure RunAdb(Dir_Path:String) is
   
    My_Vector:Directory_Vector_Type;
    
   begin 
   
   put_line("-------------- Run Custom Adb --------------");
    
   My_Vector:=Adx.App.FileList.GetFileListAdb(Dir_Path); 
   Adx.App.FileList.PrintName(My_Vector);
   
   Adx.App.Custom.Parse.ParseVector(My_Vector);
   
   end RunAdb;
   
   
   end Adx.App.Custom.Run;
