------------------------------------------------------------------------------
--                                                                          --
--                           ADX.LIB.RANDOMALPHA                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Random;

package body Adx.Lib.Randomalpha is

------------------------------------------------------------------------------
-- Random Alpha
------------------------------------------------------------------------------
function Randomalpha(Hash_Length:Positive) return String is

   -- Definition of Character Map
   type Character_Array_Type is array(Positive range <>) of Character;
   Character_Map:Character_Array_Type:=('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
 

   -- Definition of Hash String
   Hash_String:String(1 .. Hash_Length);
   Random_Number:Positive;

begin

   for I in 1 .. Hash_Length loop

      Random_Number:=Random.Random(1, Character_Map'Last);
      Hash_String(I):=Character_Map(Random_Number);

   end loop;

   return Hash_String;

end Randomalpha;

end Adx.Lib.Randomalpha;
