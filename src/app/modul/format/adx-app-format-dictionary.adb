With Ada.Strings.Unbounded;
With Ada.Directories;

use Ada.Strings.Unbounded;

package body Adx.app.format.dictionary is
   
   Cur_Directory:Unbounded_String;
   
   Procedure InitCurrentDirectory is
      Dir:String:=Ada.Directories.Current_Directory;
   begin 
      
      Cur_Directory:=To_Unbounded_String(Dir);
      
   end InitCurrentDirectory;
   
   
   function GetDictionaryFileName return String is
      
      File_Name:String:=To_String(Cur_Directory)&"/xxx.dic";
   begin
      
      return File_Name;
      
      end GetDictionaryFileName;

   ---------------
   -- GetAdxLib --
   ---------------

   function GetAdxLib return String_Vector_Type is

      My_Vector : String_Vector_Type;

   begin

      My_Vector.Append("*CR*");
      My_Vector.Append("*LF*");

      return My_Vector;

   end GetAdxLib;
   

end Adx.app.format.dictionary;
