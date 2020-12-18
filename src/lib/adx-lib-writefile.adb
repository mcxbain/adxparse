------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.WRITEFILE                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.IO_Exceptions;

use Ada.Text_IO;

package body Adx.Lib.Writefile is

------------------------------------------------------------------------------
-- Write File
------------------------------------------------------------------------------
procedure Writefile(File_Name:String; My_Vector:String_Vector_Type) is

   My_File:File_Type;

begin

   begin
      Ada.Text_IO.Open(File => My_File, Name => File_Name, Mode => Out_File);
   exception
      when Ada.IO_Exceptions.Name_Error =>
         --Put_Line("File dose not exists Creating File");
         Ada.Text_IO.Create(My_File, Mode => Out_File, Name => File_Name);
   end;

   for I in My_Vector.First_Index .. My_Vector.Last_Index loop

      Put_Line(My_File, (My_Vector.Element(Index => I)));

   end loop;

   Close(My_File);

end Writefile;

end Adx.Lib.Writefile;
