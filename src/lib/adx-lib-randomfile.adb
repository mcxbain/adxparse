------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.RANDOMFILE                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Sequential_IO;
with Adx.Lib.Random;

package body Adx.Lib.Randomfile is

------------------------------------------------------------------------------
-- Random File
------------------------------------------------------------------------------
procedure Randomfile(File_Name:String; File_Size:Positive) is

   type Byte is range 0 .. 255;  -- Byte Range
   for Byte'Size use 8;          -- Byte Size

   package Bin_Io is new Ada.Sequential_IO(Byte);

   My_File:Bin_Io.File_Type;
   My_Byte:Byte;

begin

   Bin_Io.Create(File => My_File, Name => File_Name);

   for I in Integer range Positive'First .. File_Size loop

      My_Byte:=Byte(Adx.Lib.Random.Random(Integer(Byte'First), Integer(Byte'Last)));
      Bin_Io.Write(File => My_File, Item => My_Byte);

   end loop;

   Bin_Io.Close(File => My_File);

end Randomfile;

end Adx.Lib.Randomfile;
