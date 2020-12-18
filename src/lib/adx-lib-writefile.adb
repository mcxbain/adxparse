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
with Adx.Lib.Filecheck;

use Ada.Text_IO;

package body Adx.Lib.Writefile is

------------------------------------------------------------------------------
-- Write File
------------------------------------------------------------------------------
procedure Writefile(File_Name:String; My_Vector:String_Vector_Type) is

   My_File:File_Type;
   File_Check:Boolean;

begin

   File_Check:=Adx.Lib.Filecheck.Filecheck(File_Name);

   if File_Check then
      -- Put_Line("File Exist");
      Ada.Text_IO.Open(File => My_File, Name => File_Name, Mode => Out_File);
   else
      -- Put_Line("File dosen exist");
      Ada.Text_IO.Create(My_File, Mode => Out_File, Name => File_Name);
   end if;

   for I in My_Vector.First_Index .. My_Vector.Last_Index loop

      Put_Line(My_File, (My_Vector.Element(Index => I)));

   end loop;

   Close(My_File);

end Writefile;

end Adx.Lib.Writefile;
