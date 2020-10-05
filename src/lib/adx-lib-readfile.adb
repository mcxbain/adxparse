------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.READFILE                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
use Ada.Text_IO;

package body Adx.Lib.Readfile is

------------------------------------------------------------------------------
-- Read File
------------------------------------------------------------------------------
function Readfile(File_Name:String) return String_Vector_Type is

   My_File:File_Type;
   My_Vector:String_Vector_Type;
begin

   Open(File => My_File, Mode => In_File, Name => File_Name);

   loop

      exit when End_Of_File(My_File);

      declare
         Line:String:=Get_Line(My_File);
      begin
         -- process the contents of Line
         My_Vector.Append(Line);
      end;

   end loop;

   Close(My_File);

   return My_Vector;

end Readfile;

end Adx.Lib.Readfile;
