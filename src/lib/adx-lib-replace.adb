------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.REPLACE                              --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package body Adx.Lib.Replace is

------------------------------------------------------------------------------
-- Replace
------------------------------------------------------------------------------
   function Replace(Source_String:String; Pattern_String:String; Replace_String:String) return String is

      Buffer_Length:constant Natural:=Pattern_String'Last;
      Buffer:String(1 .. Buffer_Length);
      Result:Unbounded_String;
      Length_Error:exception;

   begin

      -- String checks
      if Pattern_String'Length > Source_String'Length then
         -- raise Length_Error with "Length Check Failed Pattern String is longer then Source String";
         return Source_String;
      end if;

      if Source_String'Length = 0 then
         -- raise Length_Error with "Length Check Failed Source String is Zero";
         return Source_String;
      end if;

      if Pattern_String'Length = 0 then
         raise Length_Error with "Length Check Failed Pattern String is Zero";
      end if;

      -- looping trouth the whole string
      for J in Source_String'First .. Source_String'Last loop

         -- adding one character per loop
         Append(Result, Source_String(J .. J));

         -- just initialize the matcher if Pattern_String Length is min
         if J >= Buffer_Length then

            --building the buffer
            Buffer(1 .. Buffer_Length):=Source_String(J - Buffer_Length + 1 .. J);

            --look behind matcher
            if Pattern_String = Buffer then

               declare
                  Strstr:constant String:=To_String(Result);
               begin
                  Ada.Strings.Unbounded.Delete(Result, Strstr'Last - Buffer_Length + 1, Strstr'Last);
                  Append(Result, Replace_String);
               end;

            end if;

         end if;

      end loop;

      return To_String(Result);

   end Replace;

end Adx.Lib.Replace;
