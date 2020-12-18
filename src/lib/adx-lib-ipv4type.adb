------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.IPV4TYPE                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded;
with Adx.Lib.Vectortype;
with Adx.Lib.Tokenize;

use Ada.Text_IO;
use Ada.Strings.Fixed;
use Ada.Strings.Unbounded;
use Adx.Lib.Vectortype;

package body Adx.Lib.Ipv4type is

------------------------------------------------------------------------------
-- String To Ipv4
------------------------------------------------------------------------------
function String_To_Ipv4(My_String:String) return Ipv4_Type is

   My_Vector:String_Vector_Type;
   My_Ipv4:Ipv4_Type;

begin

   My_Vector:=Adx.Lib.Tokenize.Tokenize(My_String, ".");

   for I in My_Vector.First_Index .. My_Vector.Last_Index loop

      My_Ipv4(I):=Integer'Value(My_Vector.Element(Index => I));

   end loop;

   return My_Ipv4;

end String_To_Ipv4;

------------------------------------------------------------------------------
-- Ipv4 To String
------------------------------------------------------------------------------
function Ipv4_To_String(My_Ipv4:Ipv4_Type) return String is

   Result:Unbounded_String;

begin

   Append(Result, (Trim(Octet_Type'Image(My_Ipv4(1)), Ada.Strings.Left)));
   Append(Result, ".");
   Append(Result, (Trim(Octet_Type'Image(My_Ipv4(2)), Ada.Strings.Left)));
   Append(Result, ".");
   Append(Result, (Trim(Octet_Type'Image(My_Ipv4(3)), Ada.Strings.Left)));
   Append(Result, ".");
   Append(Result, (Trim(Octet_Type'Image(My_Ipv4(4)), Ada.Strings.Left)));

   return To_String(Result);

end Ipv4_To_String;

------------------------------------------------------------------------------
-- Print Ipv4
------------------------------------------------------------------------------
procedure Print_Ipv4(My_Ipv4:Ipv4_Type) is

begin

   Put(Trim(Octet_Type'Image(My_Ipv4(1)), Ada.Strings.Left));
   Put(".");
   Put(Trim(Octet_Type'Image(My_Ipv4(2)), Ada.Strings.Left));
   Put(".");
   Put(Trim(Octet_Type'Image(My_Ipv4(3)), Ada.Strings.Left));
   Put(".");
   Put(Trim(Octet_Type'Image(My_Ipv4(4)), Ada.Strings.Left));

end Print_Ipv4;

end Adx.Lib.Ipv4type;
