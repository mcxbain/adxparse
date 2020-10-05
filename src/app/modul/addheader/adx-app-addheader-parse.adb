With Ada.Text_IO;
With Ada.Strings.Unbounded;
With Adx.Lib.Vectortype;
With Adx.Lib.Readdir;
With Adx.Lib.Writefile;
With Adx.Lib.Readfile;
With Adx.App.AddHeader.Add;

use Ada.Text_IO;
use Ada.Strings.Unbounded;
use Adx.Lib.Vectortype;

package Body Adx.App.AddHeader.Parse is 



   ------------------------------------------------------------------------------
   -- Parse Vector Ads
   ------------------------------------------------------------------------------ 
   procedure ParseVectorAds(My_Vector:Directory_Vector_Type) is
  
      My_Record : Directory_Record_Type;
   
   begin 
  
  
      for I in My_Vector.First_Index .. My_Vector.Last_Index loop

         My_Record := (My_Vector.Element (Index => I));
         ParseRecordAds(My_Record);
         
      end loop;
  
   end ParseVectorAds;
  
   
   ------------------------------------------------------------------------------
   -- Parse Record Ads
   ------------------------------------------------------------------------------ 
   procedure ParseRecordAds(My_Record:Directory_Record_Type) is
  
      File_Path:String:=To_String(My_Record.File_Path);
      File_Name:String:=To_String(My_Record.File_Name);
      File_Vector:String_Vector_Type;
      Result_Vector:String_Vector_Type;
   
   begin 
  

      --put_line(To_String(My_Record.File_Path));
         
      File_Vector := Adx.Lib.Readfile.Readfile(File_Path);
      
      -- check if the file is empty
      if Get_Vector_Length(File_Vector) > 0 then
      
         put_line(File_Path);
         Result_Vector:=Adx.App.addHeader.Add.AddHeaderSpec(File_Vector, File_Name);
         Adx.Lib.Writefile.Writefile(File_Path, Result_Vector);
       
      end if;
  
   end ParseRecordAds;
   
  
   ------------------------------------------------------------------------------
   -- Parse Vector Adb
   ------------------------------------------------------------------------------ 
   procedure ParseVectorAdb(My_Vector:Directory_Vector_Type) is
  
      My_Record : Directory_Record_Type;
    
   begin 
  
    
      for I in My_Vector.First_Index .. My_Vector.Last_Index loop

         My_Record := (My_Vector.Element (Index => I));
         ParseRecordAdb(My_Record);
         
      end loop;
  
   end ParseVectorAdb;
  
   ------------------------------------------------------------------------------
   -- Parse Record Adb
   ------------------------------------------------------------------------------
   procedure ParseRecordAdb(My_Record:Directory_Record_Type) is
  
      File_Path:String:=To_String(My_Record.File_Path);
      File_Name:String:=To_String(My_Record.File_Name);
      File_Vector:String_Vector_Type;
      Result_Vector:String_Vector_Type;
   
   begin 
  

      --put_line(To_String(My_Record.File_Path));
         
      File_Vector := Adx.Lib.Readfile.Readfile(File_Path);
      
      -- check if the file is empty
      if Get_Vector_Length(File_Vector) > 0 then
      
         put_line(File_Path);
         Result_Vector:=Adx.App.addHeader.Add.AddHeaderBody(File_Vector, File_Name);
         Adx.Lib.Writefile.Writefile(File_Path, Result_Vector);
       
      end if;
  
   end ParseRecordAdb;

  

end Adx.App.AddHeader.Parse;
