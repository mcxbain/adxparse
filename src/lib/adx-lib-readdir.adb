------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.READDIR                              --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Directories;

use Ada.Text_IO;
use Ada.Directories;

package body Adx.Lib.Readdir is

------------------------------------------------------------------------------
-- Read Dir
------------------------------------------------------------------------------
   function Readdir(Dir_Path:String; File_Extension:String) return Directory_Vector_Type is

      My_Vector:Directory_Vector_Type;

   begin

      Set_Directory(Dir_Path);
      Walk(".", File_Extension, My_Vector);

      return My_Vector;

   end Readdir;

------------------------------------------------------------------------------
-- Walk
------------------------------------------------------------------------------
   procedure Walk(Name:String; Pattern:String; My_Vector:in out Directory_Vector_Type) is

      procedure Print(Item:Directory_Entry_Type) is

         My_Record:Directory_Record_Type;

      begin

         --we just want files

         if Kind(Item) = Ordinary_File then

            -- put_line("ordinary_file");
            My_Record.File_Name:=To_Unbounded_String(Simple_Name(Item));
            My_Record.File_Path:=To_Unbounded_String(Full_Name(Item));

            My_Vector.Append(My_Record);

         end if;

      end Print;

      procedure Walk(Item:Directory_Entry_Type) is
      begin
         if Simple_Name(Item) /= "." and then Simple_Name(Item) /= ".." then
            Walk(Full_Name(Item), Pattern, My_Vector);
         end if;
      exception
         when Ada.Directories.Name_Error =>
            null;
      end Walk;

   begin
      Search(Name, Pattern, (others => True), Print'Access);
      Search(Name, "", (Directory => True, others => False), Walk'Access);
   end Walk;

------------------------------------------------------------------------------
-- Print Path
------------------------------------------------------------------------------
   procedure Print_Path(My_Vector:Directory_Vector_Type) is

      My_Record:Directory_Record_Type;
   begin

      for I in My_Vector.First_Index .. My_Vector.Last_Index loop

         My_Record:=(My_Vector.Element(Index => I));
         Put_Line(To_String(My_Record.File_Path));

      end loop;

   end Print_Path;

------------------------------------------------------------------------------
-- Print Name
------------------------------------------------------------------------------
   procedure Print_Name(My_Vector:Directory_Vector_Type) is

      My_Record:Directory_Record_Type;
   begin

      for I in My_Vector.First_Index .. My_Vector.Last_Index loop

         My_Record:=(My_Vector.Element(Index => I));
         Put_Line(To_String(My_Record.File_Name));

      end loop;

   end Print_Name;

end Adx.Lib.Readdir;
