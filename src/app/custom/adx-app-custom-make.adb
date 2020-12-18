------------------------------------------------------------------------------
--                                                                          --
--                           ADX.APP.CUSTOM.MAKE                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Adx.Lib.Readdir;
with Adx.Lib.Filelist;
with Adx.App.Custom.Parse;

use Ada.Text_IO;
use Adx.Lib.Readdir;

package body Adx.App.Custom.Make is

------------------------------------------------------------------------------
-- Make All
------------------------------------------------------------------------------
procedure MakeAll(Dir_Path:String) is

begin

   Put_Line("------------------------------------------------------------------------------");
   Put_Line("-- Modul Custom  -------------------------------------------------------------");
   Put_Line("------------------------------------------------------------------------------");

   MakeAds(Dir_Path);
   MakeAdb(Dir_Path);

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
   Adx.App.Custom.Parse.ParseVector(My_Vector);

end MakeAds;

------------------------------------------------------------------------------
-- Make Adb
------------------------------------------------------------------------------
procedure MakeAdb(Dir_Path:String) is

   My_Vector:Directory_Vector_Type;

begin

   My_Vector:=Adx.Lib.Filelist.Get_File_List_Adb(Dir_Path);
   Adx.App.Custom.Parse.ParseVector(My_Vector);

end MakeAdb;

end Adx.App.Custom.Make;
