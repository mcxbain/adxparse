------------------------------------------------------------------------------
--                                                                          --
--                          ADX.APP.ADDHEADER.ADD                           --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Strings.Unbounded;
with Adx.Lib.Replace;
with Adx.Lib.Tokenize;
with Adx.Lib.Vectortype;
with Adx.Lib.Stringmod;
with Adx.Lib.Mkheader;

use Ada.Strings.Unbounded;
use Adx.Lib.Vectortype;

package body Adx.App.AddHeader.Add is

function AddHeaderSpec(Content_Vector:String_Vector_Type; File_Name:String) return String_Vector_Type is

   My_String:Unbounded_String;
   Header_Vector:String_Vector_Type;
   Result_Vector:String_Vector_Type;
   Delimiter:String:=(1 => ASCII.LF);

begin

   --put_line("AddHeaderSpec");

   My_String:=To_Unbounded_String(Adx.Lib.Replace.Replace(File_Name, ".ads", ""));
   My_String:=To_Unbounded_String(Adx.Lib.Replace.Replace(To_String(My_String), "-", "."));

   My_String:=To_Unbounded_String(Adx.Lib.Stringmod.String_To_Upper_All(To_String(My_String)));
   My_String:=To_Unbounded_String(Adx.Lib.Mkheader.Make_Header_Ads(To_String(My_String)));

   Header_Vector:=Adx.Lib.Tokenize.Tokenize(To_String(My_String), Delimiter);

   for I in Header_Vector.First_Index .. Header_Vector.Last_Index loop

      Result_Vector.Append(Header_Vector(I));

   end loop;

   for I in Content_Vector.First_Index .. Content_Vector.Last_Index loop

      Result_Vector.Append(Content_Vector(I));

   end loop;

   return Result_Vector;

end AddHeaderSpec;

function AddHeaderBody(Content_Vector:String_Vector_Type; File_Name:String) return String_Vector_Type is

   My_String:Unbounded_String;
   Header_Vector:String_Vector_Type;
   Result_Vector:String_Vector_Type;
   Delimiter:String:=(1 => ASCII.LF);

begin

   My_String:=To_Unbounded_String(Adx.Lib.Replace.Replace(File_Name, ".adb", ""));
   My_String:=To_Unbounded_String(Adx.Lib.Replace.Replace(To_String(My_String), "-", "."));

   My_String:=To_Unbounded_String(Adx.Lib.Stringmod.String_To_Upper_All(To_String(My_String)));
   My_String:=To_Unbounded_String(Adx.Lib.Mkheader.Make_Header_Adb(To_String(My_String)));

   Header_Vector:=Adx.Lib.Tokenize.Tokenize(To_String(My_String), Delimiter);

   for I in Header_Vector.First_Index .. Header_Vector.Last_Index loop

      Result_Vector.Append(Header_Vector(I));

   end loop;

   for I in Content_Vector.First_Index .. Content_Vector.Last_Index loop

      Result_Vector.Append(Content_Vector(I));

   end loop;

   return Result_Vector;

end AddHeaderBody;

end Adx.App.AddHeader.Add;
