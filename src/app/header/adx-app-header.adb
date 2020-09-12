With Ada.Text_IO;
With Ada.Strings.Unbounded;
With Adx.Lib.Stringtype;
With Adx.Lib.Readdir;
With Adx.Lib.Writefile;
With Adx.Lib.Readfile;
With Adx.App.Header.Remove;
With Adx.App.Header.Add;

use Ada.Text_IO;
use Ada.Strings.Unbounded;
use Adx.Lib.Stringtype;

package Body Adx.App.Header is 

------------------------------------------------------------------------------
-- Remove Header
------------------------------------------------------------------------------
procedure RemoveHeader(My_Vector:Directory_Vector_Type) is

 My_Record : Directory_Record_Type;
begin

    for I in My_Vector.First_Index .. My_Vector.Last_Index loop

         My_Record := (My_Vector.Element (Index => I));
         RemoveHeader(My_Record);
         
    end loop;

end RemoveHeader;


------------------------------------------------------------------------------
-- Remove Header
------------------------------------------------------------------------------
procedure RemoveHeader(My_Record:Directory_Record_Type) is

   File_Path:String:=To_String(My_Record.File_Path);
   File_Vector:String_Vector_Type;
   Result_Vector:String_Vector_Type;
   
begin

      --put_line(To_String(My_Record.File_Path));
         
      File_Vector := Adx.Lib.Readfile.Readfile(File_Path);
      
      -- check if the file is empty
      if Adx.Lib.Stringtype.Get_Vector_Length(File_Vector) > 0 then
      
         Result_Vector:=Adx.App.Header.Remove.RemoveHeader(File_Vector);
         Adx.Lib.Writefile.Writefile(File_Path, Result_Vector);
       
      end if;
            

end RemoveHeader;

------------------------------------------------------------------------------
-- Add Header Ads
------------------------------------------------------------------------------ 
  procedure AddHeaderAds(My_Vector:Directory_Vector_Type) is
  
   My_Record : Directory_Record_Type;
   
  begin 
  
  
    for I in My_Vector.First_Index .. My_Vector.Last_Index loop

         My_Record := (My_Vector.Element (Index => I));
         AddHeaderAds(My_Record);
         
    end loop;
  
  end AddHeaderAds;
  
------------------------------------------------------------------------------
-- Add Header Ads
------------------------------------------------------------------------------ 
  procedure AddHeaderAds(My_Record:Directory_Record_Type) is
  
   File_Path:String:=To_String(My_Record.File_Path);
   File_Name:String:=To_String(My_Record.File_Name);
   File_Vector:String_Vector_Type;
   Result_Vector:String_Vector_Type;
   
  begin 
  

      --put_line(To_String(My_Record.File_Path));
         
      File_Vector := Adx.Lib.Readfile.Readfile(File_Path);
      
      -- check if the file is empty
      if Adx.Lib.Stringtype.Get_Vector_Length(File_Vector) > 0 then
      
         Result_Vector:=Adx.App.Header.Add.AddHeaderSpec(File_Vector, File_Name);
         Adx.Lib.Writefile.Writefile(File_Path, Result_Vector);
       
      end if;
  
  
  end AddHeaderAds;
  
------------------------------------------------------------------------------
-- Add Header Adb
------------------------------------------------------------------------------ 
  procedure AddHeaderAdb(My_Vector:Directory_Vector_Type) is
  
    My_Record : Directory_Record_Type;
    
  begin 
  
    
    for I in My_Vector.First_Index .. My_Vector.Last_Index loop

         My_Record := (My_Vector.Element (Index => I));
         AddHeaderAdb(My_Record);
         
    end loop;
  
  end AddHeaderAdb;
  
------------------------------------------------------------------------------
-- Add Header Adb
------------------------------------------------------------------------------
  procedure AddHeaderAdb(My_Record:Directory_Record_Type) is
  
   File_Path:String:=To_String(My_Record.File_Path);
   File_Name:String:=To_String(My_Record.File_Name);
   File_Vector:String_Vector_Type;
   Result_Vector:String_Vector_Type;
   
  begin 
  

      --put_line(To_String(My_Record.File_Path));
         
      File_Vector := Adx.Lib.Readfile.Readfile(File_Path);
      
      -- check if the file is empty
      if Adx.Lib.Stringtype.Get_Vector_Length(File_Vector) > 0 then
      
         Result_Vector:=Adx.App.Header.Add.AddHeaderBody(File_Vector, File_Name);
         Adx.Lib.Writefile.Writefile(File_Path, Result_Vector);
       
      end if;
  
  end AddHeaderAdb;

  

end Adx.App.Header;
