------------------------------------------------------------------------------
--                                                                          --
--                              ADX.LIB.SYSOUT                              --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Strings.Unbounded;
with System;
with Interfaces.C;
with Interfaces.C_Streams;

use Ada.Strings.Unbounded;
use System;

package body Adx.Lib.Sysout is

------------------------------------------------------------------------------
-- Exceptions
------------------------------------------------------------------------------
Default_Error : exception;

------------------------------------------------------------------------------
-- popen Imported C function
------------------------------------------------------------------------------
function Popen(Command:Interfaces.C.char_array; Mode:Interfaces.C.char_array) return Interfaces.C_Streams.FILEs;
pragma Import(C, Popen);

------------------------------------------------------------------------------
-- pclose Imported C function
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
   
   Buffer_Size:constant Integer:=1000000;
   Buffer_Content:Unbounded_String;

begin

   File_Stream:=Popen(Interfaces.C.To_C(Command), Interfaces.C.To_C("r"));

   if (File_Stream = System.Null_Address) then
   
      Raise Default_Error With "Failed to open Popen Process";
      
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
         Raise Default_Error With "No EOF Found Buffer Size too small";
      end if;

      -- check if popen process can be closed
      Close_Status:=Pclose(File_Stream);
      
      if (Close_Status /= 0) then
         Raise Default_Error With "Failed to close Popen Process";
      end if;
      

   end if;

   return Buffer_Content;

end Sysout;

end Adx.Lib.Sysout;
