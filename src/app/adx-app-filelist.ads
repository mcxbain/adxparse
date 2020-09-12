With Adx.Lib.Readdir;
Use Adx.Lib.Readdir;

package Adx.App.FileList is
   
   function GetFileListAll(Dir_Path:String) return Directory_Vector_Type;
   function GetfileListAds(Dir_Path:String) return Directory_Vector_Type;
   function GetFileListAdb(Dir_Path:String) return Directory_Vector_Type;
   function GetFileListGpr(Dir_Path:String) return Directory_Vector_Type;
   
   procedure PrintPath(My_Vector:Directory_Vector_Type);
   procedure PrintName(My_Vector:Directory_Vector_Type);

end Adx.App.FileList;
