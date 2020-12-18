------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.FILELIST                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------

package body Adx.Lib.Filelist is

------------------------------------------------------------------------------
-- Get File List All
------------------------------------------------------------------------------
function Get_File_List_All(Dir_Path:String) return Directory_Vector_Type is

   My_Vector:Directory_Vector_Type;

begin

   My_Vector:=Adx.Lib.Readdir.Readdir(Dir_Path, "");

   return My_Vector;

end Get_File_List_All;

------------------------------------------------------------------------------
-- Get File List Ads
------------------------------------------------------------------------------
function Get_File_List_Ads(Dir_Path:String) return Directory_Vector_Type is

   My_Vector:Directory_Vector_Type;

begin
   My_Vector:=Adx.Lib.Readdir.Readdir(Dir_Path, "*.ads");
   return My_Vector;

end Get_File_List_Ads;

------------------------------------------------------------------------------
-- Get File List Adb
------------------------------------------------------------------------------
function Get_File_List_Adb(Dir_Path:String) return Directory_Vector_Type is

   My_Vector:Directory_Vector_Type;

begin

   My_Vector:=Adx.Lib.Readdir.Readdir(Dir_Path, "*.adb");
   return My_Vector;

end Get_File_List_Adb;

------------------------------------------------------------------------------
-- Get File List Gpr
------------------------------------------------------------------------------
function Get_File_List_Gpr(Dir_Path:String) return Directory_Vector_Type is

   My_Vector:Directory_Vector_Type;
begin
   My_Vector:=Adx.Lib.Readdir.Readdir(Dir_Path, "*.gpr");
   return My_Vector;

end Get_File_List_Gpr;

end Adx.Lib.Filelist;
