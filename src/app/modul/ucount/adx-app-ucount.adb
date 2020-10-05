with Ada.Text_IO;
with Ada.Strings.Unbounded;
With Adx.Lib.Vectortype;
With Adx.App.Lib.FileList;
With Adx.Lib.Readdir;
With Adx.Lib.Sort;
With Adx.Lib.Replace;
--With Sockets.Stream_IO;

With Gnat.Sockets;

use Ada.Text_IO;
use Ada.Strings.Unbounded;
use Adx.Lib.Vectortype;
Use Adx.Lib.Readdir;

package body Adx.App.Ucount is

   procedure Run (Project_Dir : String) is

      My_Vector:Directory_Vector_Type;
      My_Record : Directory_Record_Type; 
      Result_Vector:String_Vector_Type;
      
   begin
      
      My_Vector:=Adx.App.Lib.FileList.GetfileListAds(Project_Dir);
   
      
      for I in My_Vector.First_Index .. My_Vector.Last_Index loop

         My_Record:= (My_Vector.Element (Index => I));
         Result_Vector.Append(To_String(My_Record.File_Name));
         
      end loop;
      
      Result_Vector:=Adx.Lib.Sort.Sort(Result_Vector);
      
      Run_Extend(Result_Vector);
    

   end Run;
   
   
   procedure Run_Extend(My_Vector:String_Vector_Type) is
      
      My_String:Unbounded_String;
   begin
      
      Print_Vector(My_Vector);
      --put_line("test");
      
      for I in My_Vector.First_Index .. My_Vector.Last_Index loop

         My_String:= to_unbounded_string((My_Vector.Element (Index => I)));
         My_String:=To_Unbounded_String(Adx.Lib.Replace.Replace(to_string(My_String), ".ads", ""));
         My_String:=To_Unbounded_String(Adx.Lib.Replace.Replace(to_string(My_String), "-", "."));
         
         put("with ");
          put(to_string(My_String));
         put(";");
           new_line;
      end loop;
      
   end Run_Extend;

end Adx.App.Ucount;
