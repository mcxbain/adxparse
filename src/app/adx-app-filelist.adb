with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.Lib.Readdir;

use Ada.Text_IO;
use Ada.Strings.Unbounded;
use Adx.Lib.Readdir;

package body Adx.App.FileList is

------------------------------------------------------------------------------
-- Get File List All
------------------------------------------------------------------------------  
   function GetFileListAll(Dir_Path:String) return Directory_Vector_Type is
   
    My_Vector:Directory_Vector_Type;
 
   begin 
   
    My_Vector := Adx.Lib.Readdir.Readdir (Dir_Path, "");
   
    return My_Vector;
   
   end GetFileListAll;
      
------------------------------------------------------------------------------
-- Get File List Ads
------------------------------------------------------------------------------ 
   function GetFileListAds(Dir_Path:String) return Directory_Vector_Type is
      
     My_Vector:Directory_Vector_Type;  
     
   begin 
    My_Vector := Adx.Lib.Readdir.Readdir (Dir_Path, "*.ads");
    return My_Vector;
   
   end GetFileListAds;
   
------------------------------------------------------------------------------
-- Get File List Adb
------------------------------------------------------------------------------ 
   function GetFileListAdb(Dir_Path:String) return Directory_Vector_Type is
   
   My_Vector:Directory_Vector_Type;
   
   begin 
   
   My_Vector := Adx.Lib.Readdir.Readdir (Dir_Path, "*.adb");
   return My_Vector;
   
   end GetFileListAdb;
   
------------------------------------------------------------------------------
-- Get File List Gpr
------------------------------------------------------------------------------ 
   function GetFileListGpr(Dir_Path:String) return Directory_Vector_Type is
      
     My_Vector:Directory_Vector_Type;  
   begin 
    My_Vector := Adx.Lib.Readdir.Readdir (Dir_Path, "*.gpr");
    return My_Vector;
    
   end GetFileListGpr;
   
------------------------------------------------------------------------------
-- Print Path
------------------------------------------------------------------------------  
   procedure PrintPath(My_Vector:Directory_Vector_Type) is
   
     My_Record : Directory_Record_Type;
   begin
   
    for I in My_Vector.First_Index .. My_Vector.Last_Index loop

         My_Record := (My_Vector.Element (Index => I));
         put_line(To_String(My_Record.File_Path));
         
    end loop;
   
   end PrintPath;
   
------------------------------------------------------------------------------
-- Print Name
------------------------------------------------------------------------------ 
   procedure PrintName(My_Vector:Directory_Vector_Type) is
   
   
     My_Record : Directory_Record_Type;
   begin 
   
      
    for I in My_Vector.First_Index .. My_Vector.Last_Index loop

         My_Record := (My_Vector.Element (Index => I));
         put_line(To_String(My_Record.File_Name));
         
    end loop;
    
   end PrintName;

  
end Adx.App.FileList;
