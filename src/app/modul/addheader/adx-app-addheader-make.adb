------------------------------------------------------------------------------
--                                                                          --
--                          ADX.APP.ADDHEADER.MAKE                          --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
With Ada.Text_IO;
With Adx.Lib.FileList;
With Adx.lib.Readdir;
With Adx.App.AddHeader.Parse;

use Ada.Text_IO;
use Adx.lib.Readdir;


package Body Adx.App.AddHeader.Make is


   ------------------------------------------------------------------------------
   -- Make All
   ------------------------------------------------------------------------------ 
   procedure MakeAll(Dir_Path:String) is
   
   begin
   
      put_line("------------------------------------------------------------------------------");
      put_line("-- Modul Add Header  ---------------------------------------------------------");
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
   
      My_Vector:=Adx.Lib.FileList.Get_File_List_Ads(Dir_Path);
      Adx.App.AddHeader.Parse.ParseVectorAds(My_Vector);
   
   end MakeAds;
   
   
   ------------------------------------------------------------------------------
   -- Make Adb
   ------------------------------------------------------------------------------
   procedure MakeAdb(Dir_Path:String) is
   
      My_Vector:Directory_Vector_Type;
    
   begin 
    
      My_Vector:=Adx.Lib.FileList.Get_File_List_Adb(Dir_Path);
      Adx.App.AddHeader.Parse.ParseVectorAdb(My_Vector);  
   
   end MakeAdb;
  


end Adx.App.AddHeader.Make;
