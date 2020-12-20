------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.FILELIST                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Readdir;
use Adx.Lib.Readdir;

package Adx.Lib.Filelist is

   function Get_File_List_All(Dir_Path:String) return Directory_Vector_Type;
   function Get_File_List_Ads(Dir_Path:String) return Directory_Vector_Type;
   function Get_File_List_Adb(Dir_Path:String) return Directory_Vector_Type;
   function Get_File_List_Gpr(Dir_Path:String) return Directory_Vector_Type;

end Adx.Lib.Filelist;
