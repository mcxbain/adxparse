------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.TOKENIZE                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
package body Adx.Lib.Tokenize is

------------------------------------------------------------------------------
-- Tokenize
------------------------------------------------------------------------------
   function Tokenize(Source_String:in String; Pattern_String:in String) return String_Vector_Type is

      Buffer:String(Pattern_String'First .. Pattern_String'Last);
      Buffer_Length:constant Natural:=Pattern_String'Last;
      Last_Pos:Natural:=Pattern_String'First;
      My_Vector:String_Vector_Type;

   begin

      for K in Source_String'First .. Source_String'Last loop

         --build up the buffer
         if K >= Buffer_Length then

            Buffer(1 .. Buffer_Length):=Source_String(K - Buffer_Length + 1 .. K);

            if Buffer = Pattern_String then

               -- capture the first string only when it does not begin with delimiter:example ###Testa###Testb###Testc###Testd
               if K = Buffer_Length then
                  null;
               else
                  My_Vector.Append(Source_String(Last_Pos .. K - Buffer_Length));
               end if;

               Last_Pos:=K + 1;

            end if;

         end if;

      end loop;

      -- capture the last string only when it does not end with delimiter:example Testa###Testb###Testc###Testd###
      if Last_Pos <= Source_String'Last then
         My_Vector.Append(Source_String(Last_Pos .. Source_String'Last));
      end if;

      return My_Vector;

   end Tokenize;

end Adx.Lib.Tokenize;
