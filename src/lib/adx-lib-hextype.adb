------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.HEXTYPE                              --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Random;

package body Adx.Lib.Hextype is

------------------------------------------------------------------------------
-- Hex To Byte
------------------------------------------------------------------------------
function Hex_To_Byte(Hex_Pair:Hex_Pair_Type) return Byte is

   Number:Byte;
   Hex_String:constant String:=Character_To_String(Hex_Pair(1)) & Character_To_String(Hex_Pair(2));
   My_String:constant String:="16#" & Hex_String & "#";

begin

   Number:=(Byte'Value(My_String));
   return Number;

end Hex_To_Byte;

------------------------------------------------------------------------------
-- Character To String
------------------------------------------------------------------------------
function Character_To_String(My_Character:Character) return String is

   My_String:constant String:=Character'Image(My_Character);
   My_String_Strip:constant String:=My_String(My_String'First + 1 .. My_String'Last - 1);

begin

   return My_String_Strip;

end Character_To_String;

------------------------------------------------------------------------------
-- Get Random Byte
------------------------------------------------------------------------------
function Get_Random_Byte return Byte is

   Range_Begin:constant Positive:=Byte_To_Integer(Byte'First);
   Range_End:constant Positive:=Byte_To_Integer(Byte'Last);

   Random_Byte:constant Byte:=Integer_To_Byte(Adx.Lib.Random.Random(Range_Begin, Range_End));

begin

   return Random_Byte;

end Get_Random_Byte;

------------------------------------------------------------------------------
-- Integer To Byte
------------------------------------------------------------------------------
function Integer_To_Byte(Number:Positive) return Byte is

   My_Byte:Byte;

begin

   My_Byte:=Byte(Number);
   return My_Byte;

end Integer_To_Byte;

------------------------------------------------------------------------------
-- Byte To Integer
------------------------------------------------------------------------------
function Byte_To_Integer(My_Byte:Byte) return Positive is

   Number:Positive;

begin

   Number:=Positive(My_Byte);
   return Number;

end Byte_To_Integer;

------------------------------------------------------------------------------
-- Hex Array To Byte Array
------------------------------------------------------------------------------
function Hex_Array_To_Byte_Array(Hex_Array:Hex_Array_Type) return Byte_Array_Type is

   Byte_Array:Byte_Array_Type(1 .. Hex_Array'Length);

begin

   for I in Hex_Array'Range loop

      Byte_Array(I):=Hex_To_Byte(Hex_Array(I));

   end loop;

   return Byte_Array;

end Hex_Array_To_Byte_Array;

end Adx.Lib.Hextype;
