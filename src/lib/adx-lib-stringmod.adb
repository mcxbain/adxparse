------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.STRINGMOD                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded;
with Ada.Characters.Handling;
with Adx.Lib.Vectortype;
with Adx.Lib.Tokenize;

use Ada.Strings.Unbounded;
use Ada.Strings.Fixed;
use Adx.Lib.Vectortype;

package body Adx.Lib.Stringmod is

------------------------------------------------------------------------------
-- Trim CR
------------------------------------------------------------------------------
function Trim_CR(My_String:String) return String is

   Return_String:Unbounded_String;
   Character_Number:Integer;

begin

   for I in My_String'Range loop

      Character_Number:=Character'Pos(My_String(I));

      --The ASCII character code 13 is called a Carriage Return or CR
      if Character_Number /= 13 then
         Append(Return_String, My_String(I));
      end if;

   end loop;

   return To_String(Return_String);

end Trim_CR;

------------------------------------------------------------------------------
-- Trim LF
------------------------------------------------------------------------------
function Trim_LF(My_String:String) return String is

   Return_String:Unbounded_String;
   Character_Number:Integer;

begin

   for I in My_String'Range loop

      Character_Number:=Character'Pos(My_String(I));

      if Character_Number /= 10 then
         Append(Return_String, My_String(I));
      end if;

   end loop;

   return To_String(Return_String);

end Trim_LF;

------------------------------------------------------------------------------
-- Trim Whitespace
------------------------------------------------------------------------------
function Trim_Whitespace(My_String:String) return String is

   Return_String:Unbounded_String;

begin

   Return_String:=Trim(To_Unbounded_String(My_String), Ada.Strings.Both);
   return To_String(Return_String);

end Trim_Whitespace;

------------------------------------------------------------------------------
-- Escape Regexp
------------------------------------------------------------------------------
function Escape_Regexp(My_String:String) return String is

   S:String(1 .. My_String'Length * 2);
   Last:Natural:=0;

begin
   for J in My_String'Range loop

      case My_String(J) is
         when '^' | '$' | '|' | '*' | '+' | '?' | '{' | '/' | '}' | '[' | ']' | '(' | ')' | '\' | '.' =>

            S(Last + 1):='\';
            S(Last + 2):=My_String(J);
            Last:=Last + 2;

         when others =>
            S(Last + 1):=My_String(J);
            Last:=Last + 1;
      end case;

   end loop;

   return S(1 .. Last);

end Escape_Regexp;

------------------------------------------------------------------------------
-- Integer To String
------------------------------------------------------------------------------
function Integer_To_String(My_Number:Integer) return String is

   My_String:constant String:=Trim(Integer'Image(My_Number), Ada.Strings.Left);

begin

   return My_String;

end Integer_To_String;

------------------------------------------------------------------------------
-- String To Integer
------------------------------------------------------------------------------
function String_To_Integer(My_String:String) return Integer is

   My_Integer:constant Integer:=Integer'Value(My_String);

begin

   return My_Integer;

end String_To_Integer;

------------------------------------------------------------------------------
-- Escape Quote
-- This function Replaces double Quote with Two double Quote
------------------------------------------------------------------------------
function Escape_Quote(My_String:String) return String is

   Result:Unbounded_String;

begin

   for I in My_String'First .. My_String'Last loop

      Append(Result, My_String(I));

      if Character'Pos(My_String(I)) = 34 then
         Append(Result, """");
      end if;

   end loop;

   return To_String(Result);

end Escape_Quote;

------------------------------------------------------------------------------
-- Replace Tab
-- This function replaces Tab with 6 whitespace
------------------------------------------------------------------------------
function Replace_Tab(My_String:String) return String is

   Result:Unbounded_String;

begin

   for I in My_String'First .. My_String'Last loop

      if Character'Pos(My_String(I)) = 9 then
         Append(Result, "      ");

      else
         Append(Result, My_String(I));
      end if;

   end loop;

   return To_String(Result);

end Replace_Tab;

------------------------------------------------------------------------------
-- String Is Empty
------------------------------------------------------------------------------
function String_Is_Empty(My_String:String) return Boolean is

begin

   if My_String = "" then
      return True;
   else
      return False;
   end if;

end String_Is_Empty;

------------------------------------------------------------------------------
-- String To Upper All
------------------------------------------------------------------------------
function String_To_Upper_All(My_String:String) return String is

   Return_String:constant String:=Ada.Characters.Handling.To_Upper(My_String);

begin

   return Return_String;

end String_To_Upper_All;

------------------------------------------------------------------------------
-- String To Upper First
------------------------------------------------------------------------------
function String_To_Upper_First(My_String:String) return String is

   Return_String:constant String:=Ada.Characters.Handling.To_Upper(My_String(My_String'First .. My_String'First)) & My_String(My_String'First + 1 .. My_String'Last);

begin

   return Return_String;

end String_To_Upper_First;

------------------------------------------------------------------------------
-- String To Upper First Sep
------------------------------------------------------------------------------
function String_To_Upper_First_Sep(My_String:String; My_Sep:String) return String is

   My_Vector:String_Vector_Type;
   My_Result:Unbounded_String;
   My_Element:Unbounded_String;

begin

   My_Vector:=Adx.Lib.Tokenize.Tokenize(My_String, My_Sep);

   for I in My_Vector.First_Index .. My_Vector.Last_Index loop

      My_Element:=To_Unbounded_String(My_Vector.Element(Index => I));

      Append(My_Result, Adx.Lib.Stringmod.String_To_Upper_First(To_String(My_Element)));

      if I < My_Vector.Last_Index then
         Append(My_Result, My_Sep);
      end if;

   end loop;

   return To_String(My_Result);

end String_To_Upper_First_Sep;

------------------------------------------------------------------------------
-- String To Lower All
------------------------------------------------------------------------------
function String_To_Lower_All(My_String:String) return String is

   Return_String:String:=Ada.Characters.Handling.To_Lower(My_String);

begin

   return Return_String;

end String_To_Lower_All;

end Adx.Lib.Stringmod;
