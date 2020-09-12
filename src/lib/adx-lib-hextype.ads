------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.HEXTYPE                              --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
package Adx.Lib.Hextype is

------------------------------------------------------------------------------
-- HEX TYPES
------------------------------------------------------------------------------
type Byte is range 0 .. 255;                                                    -- Byte Range
for Byte'Size use 8;                                                            -- Byte Size

subtype Hex_Character_Type is Character range '0' .. 'F';                       -- Character Range of Hex Characters
type Hex_Pair_Type is array(Positive range 1 .. 2) of Hex_Character_Type;       -- Array of Two Hex Characters
type Hex_Array_Type is array(Positive range <>) of Hex_Pair_Type;               -- Array of Hex Pairs
type Byte_Array_Type is array(Positive range <>) of Byte;                       -- Array of Bytes

------------------------------------------------------------------------------
-- HEX FUNCTIONS
------------------------------------------------------------------------------
function Hex_To_Byte(Hex_Pair:Hex_Pair_Type) return Byte;
function Character_To_String(My_Character:Character) return String;
function Integer_To_Byte(Number:Positive) return Byte;
function Byte_To_Integer(My_Byte:Byte) return Positive;
function Hex_Array_To_Byte_Array(Hex_Array:Hex_Array_Type) return Byte_Array_Type;
function Get_Random_Byte return Byte;

end Adx.Lib.Hextype;
