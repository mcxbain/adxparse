------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.MAKEHEADER                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package body Adx.Lib.Mkheader is

------------------------------------------------------------------------------
-- Make Header Adb
------------------------------------------------------------------------------
function Make_Header_Adb(My_String:String) return String is

   Line:String:=Make_Line(My_String);
   Result:Unbounded_String;

begin

   Append(Result, "------------------------------------------------------------------------------" & ASCII.LF);
   Append(Result, "--                                                                          --" & ASCII.LF);
   Append(Result, Line & ASCII.LF);
   Append(Result, "--                                                                          --" & ASCII.LF);
   Append(Result, "--                                  A D A                                   --" & ASCII.LF);
   Append(Result, "--                                                                          --" & ASCII.LF);
   Append(Result, "--                                 B o d y                                  --" & ASCII.LF);
   Append(Result, "--                                                                          --" & ASCII.LF);
   Append(Result, "------------------------------------------------------------------------------");

   return To_String(Result);

end Make_Header_Adb;

------------------------------------------------------------------------------
-- Make Header Ads
------------------------------------------------------------------------------
function Make_Header_Ads(My_String:String) return String is

   Line:String:=Make_Line(My_String);
   Result:Unbounded_String;

begin

   Append(Result, "------------------------------------------------------------------------------" & ASCII.LF);
   Append(Result, "--                                                                          --" & ASCII.LF);
   Append(Result, Line & ASCII.LF);
   Append(Result, "--                                                                          --" & ASCII.LF);
   Append(Result, "--                                  A D A                                   --" & ASCII.LF);
   Append(Result, "--                                                                          --" & ASCII.LF);
   Append(Result, "--                                 S p e c                                  --" & ASCII.LF);
   Append(Result, "--                                                                          --" & ASCII.LF);
   Append(Result, "------------------------------------------------------------------------------");

   return To_String(Result);

end Make_Header_Ads;

------------------------------------------------------------------------------
-- Make Line
------------------------------------------------------------------------------
function Make_Line(My_String:String) return String is

   Modcalc:Integer:=My_String'Length mod 2;
   A:Integer:=74 - (My_String'Length); -- 76 because 80-4 Line lenght 80

   B:Integer:=2;
   Lencalc:Integer:=(A / B);

   Result:Unbounded_String;

begin

   Append(Result, "--");

   for I in Integer range 1 .. Lencalc loop

      Append(Result, " ");
   end loop;

   Append(Result, My_String);

   for I in Integer range 1 .. Lencalc + Modcalc loop

      Append(Result, " ");
   end loop;

   Append(Result, "--");

   return To_String(Result);

end Make_Line;

end Adx.Lib.Mkheader;
