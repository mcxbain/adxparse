------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.IPV4TYPE                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
package Adx.Lib.Ipv4type is

------------------------------------------------------------------------------
-- IPV4 TYPES
------------------------------------------------------------------------------
subtype Octet_Type is Integer range 0 .. 255;                     -- Octet Type For Ipv4 Internet Address
type Ipv4_Type is array(Integer range 1 .. 4) of Octet_Type;      -- Ipv4 Internet Address Type

------------------------------------------------------------------------------
-- IPV4 FUNCTIONS
------------------------------------------------------------------------------
function String_To_Ipv4(My_String:String) return Ipv4_Type;       -- Convert String To Ipv4 Internet Address
function Ipv4_To_String(My_Ipv4:Ipv4_Type) return String;         -- Convert Ipv4 Internet Address To String
procedure Print_Ipv4(My_Ipv4:Ipv4_Type);                          -- Print Ipv4 Internet Address

end Adx.Lib.Ipv4type;
