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
function Tokenize(My_String:in String; Delimiter:in String) return String_Vector_Type is

   Result_Vector:String_Vector_Type;
   Current_Position:Natural:=1;

begin

   for K in 1 .. My_String'Last loop

      --den ersten string
      if (My_String(K .. K) = Delimiter) then

         Result_Vector.Append(My_String(Current_Position .. K - 1));
         Current_Position:=K + 1;

      end if;

      --den letzten string
      if K = My_String'Last then

         Result_Vector.Append(My_String(Current_Position .. K));
         Current_Position:=K + 1;

      end if;

   end loop;

   return Result_Vector;

end Tokenize;

end Adx.Lib.Tokenize;
