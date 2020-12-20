------------------------------------------------------------------------------
--                                                                          --
--                              ADX.LIB.SYSOUT                              --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with System;
with Interfaces.C;
with Interfaces.C_Streams;

use System;

package body Adx.Lib.Sysout is

------------------------------------------------------------------------------
-- Exceptions
------------------------------------------------------------------------------
Open_Error:exception;
Close_Error:exception;
Buffer_Error:exception;

------------------------------------------------------------------------------
-- Popen Imported C function
------------------------------------------------------------------------------
function Popen(Command:Interfaces.C.char_array; Mode:Interfaces.C.char_array) return Interfaces.C_Streams.FILEs;
pragma Import(C, Popen);

------------------------------------------------------------------------------
-- Pclose Imported C function
------------------------------------------------------------------------------
function Pclose(Filestream:Interfaces.C_Streams.FILEs) return Interfaces.C_Streams.int;
pragma Import(C, Pclose);

------------------------------------------------------------------------------
-- Sysout
------------------------------------------------------------------------------
function Sysout(Command:String) return Unbounded_String is

   File_Stream:Interfaces.C_Streams.FILEs;
   Char_Buffer:Interfaces.C_Streams.int;
   Char_Value:Character;
   Eof_Found:Boolean:=False;
   Close_Status:Interfaces.C_Streams.int;

   Buffer_Size:constant Integer:=1_048_576;
   -- cat /proc/sys/fs/pipe-max-size

   Buffer_Content:Unbounded_String;

begin

   File_Stream:=Popen(Interfaces.C.To_C(Command), Interfaces.C.To_C("r"));

   if (File_Stream = System.Null_Address) then

      raise Open_Error with "Failed to open Popen Process";

   else

      -- run for loop with max buffer size
      for I in Integer range 1 .. Buffer_Size loop

         Char_Buffer:=Interfaces.C_Streams.fgetc(File_Stream);

         if Char_Buffer = Interfaces.C_Streams.EOF then
            Eof_Found:=True;
            exit;
         end if;

         Char_Value:=Character'Val(Char_Buffer);
         Buffer_Content:=Buffer_Content & Char_Value;

      end loop;

      -- check if the Buffer exeeds the result_size
      if not Eof_Found then
         raise Buffer_Error with "No EOF Found Buffer Size" & Integer'Image(Buffer_Size) & " too small";
      end if;

      -- check if popen process can be closed
      Close_Status:=Pclose(File_Stream);

      if (Close_Status /= 0) then
         raise Close_Error with "Failed to close Popen Process";
      end if;

   end if;

   return Buffer_Content;

end Sysout;

end Adx.Lib.Sysout;
