------------------------------------------------------------------------------
--                                                                          --
--                               ADX.LIB.HTTP                               --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Strings.Unbounded;
with Adx.Lib.Tokenize;
with Adx.Lib.Regmatch;
with Adx.Lib.Regvector;
with Adx.Lib.Stringmod;
with Adx.Lib.Date;

use Ada.Strings.Unbounded;

package body Adx.Lib.Http is

------------------------------------------------------------------------------
-- Parse Header
------------------------------------------------------------------------------
function Parse_Header(Http_Message:in String) return String is

   Buffer1:Integer;
   Buffer2:Integer;
   Buffer3:Integer;
   Buffer4:Integer;

   Result:Unbounded_String;

begin

   -- loop trouth characters
   for I in Http_Message'First .. Http_Message'Last loop

      -- fill the buffer ab 4 characters backwards
      if I > 4 then

         Buffer1:=Character'Pos(Http_Message(I - 3));
         Buffer2:=Character'Pos(Http_Message(I - 2));
         Buffer3:=Character'Pos(Http_Message(I - 1));
         Buffer4:=Character'Pos(Http_Message(I));

      end if;

      -- check if buffer has sequenz
      if Buffer1 = 13 and Buffer2 = 10 and Buffer3 = 13 and Buffer4 = 10 then

         -- put_line("marker found");
         exit;

      end if;

      Append(Result, Http_Message(I));

   end loop;

   return To_String(Result);

end Parse_Header;

------------------------------------------------------------------------------
-- Parse Body
------------------------------------------------------------------------------
function Parse_Body(Http_Message:in String) return String is

   Buffer1:Integer;
   Buffer2:Integer;
   Buffer3:Integer;
   Buffer4:Integer;

   Result:Unbounded_String;
   Start_Record:Boolean:=False;

begin

   -- loop trouth characters
   for I in Http_Message'First .. Http_Message'Last loop

      -- fill the buffer ab 4 characters backwards
      if I > 4 then

         Buffer1:=Character'Pos(Http_Message(I - 3));
         Buffer2:=Character'Pos(Http_Message(I - 2));
         Buffer3:=Character'Pos(Http_Message(I - 1));
         Buffer4:=Character'Pos(Http_Message(I));

      end if;

      -- check if buffer has sequenz
      if Buffer1 = 13 and Buffer2 = 10 and Buffer3 = 13 and Buffer4 = 10 then

         -- put_line("marker found");
         Start_Record:=True;

      end if;

      if Start_Record then
         Append(Result, Http_Message(I));
      end if;

   end loop;

   return To_String(Result);

end Parse_Body;

------------------------------------------------------------------------------
-- Parse Method
------------------------------------------------------------------------------
function Parse_Method(Http_Header:in String) return String is

   Http_Header_Vector:constant String_Vector_Type:=Tokenize_Header(Http_Header);
   First_Line:constant String:=Http_Header_Vector(1);
   My_Vector:String_Vector_Type;
   Delimiter:constant String:=" ";
   Response:Unbounded_String;

begin

   My_Vector:=Adx.Lib.Tokenize.Tokenize(First_Line, Delimiter);
   Response:=To_Unbounded_String(My_Vector(1));

   return To_String(Response);

end Parse_Method;

------------------------------------------------------------------------------
-- Parse Uri
------------------------------------------------------------------------------
function Parse_Uri(Http_Header:in String) return String is

   Http_Header_Vector:constant String_Vector_Type:=Tokenize_Header(Http_Header);
   First_Line:constant String:=Http_Header_Vector(1);
   My_Vector:String_Vector_Type;
   Delimiter:constant String:=" ";
   Response:Unbounded_String;

begin

   My_Vector:=Adx.Lib.Tokenize.Tokenize(First_Line, Delimiter);
   Response:=To_Unbounded_String(My_Vector(2));

   return To_String(Response);

end Parse_Uri;

------------------------------------------------------------------------------
-- Parse Post Parameter
------------------------------------------------------------------------------
function Parse_Post_Parameter(Http_Body:String) return String_Vector_Type is

   My_Vector:String_Vector_Type;
   Delimiter:constant String:="&";

begin

   My_Vector:=Adx.Lib.Tokenize.Tokenize(Http_Body, Delimiter);
   return My_Vector;

end Parse_Post_Parameter;

------------------------------------------------------------------------------
-- Get Post Parameter
------------------------------------------------------------------------------
function Get_Post_Parameter(My_Vector:String_Vector_Type; Key:String) return String is

   Pattern:constant String:="" & Key & "=(.*)";
   Result:Unbounded_String;
   Has_Match:Boolean:=False;

   Result_Return:Unbounded_String;

begin

   for I in My_Vector.First_Index .. My_Vector.Last_Index loop

      Has_Match:=Adx.Lib.Regmatch.Regmatch(My_Vector.Element(Index => I), Pattern, Result);

      if Has_Match then
         Result_Return:=Result;
      end if;

   end loop;

   return To_String(Result_Return);

end Get_Post_Parameter;

------------------------------------------------------------------------------
-- Parse Content Length
------------------------------------------------------------------------------
function Parse_Content_Length(Http_Header:in String) return Natural is

   Http_Header_Vector:constant String_Vector_Type:=Tokenize_Header(Http_Header);
   Result_Vector:String_Vector_Type;
   Pattern:constant String:="Content-Length:(.*)";
   My_String:Unbounded_String;
   My_Number:Integer;

begin

   Result_Vector:=Adx.Lib.Regvector.Regvector(Http_Header_Vector, Pattern);
   My_String:=To_Unbounded_String(Result_Vector(1));
   My_String:=To_Unbounded_String(Adx.Lib.Stringmod.Trim_Whitespace(To_String(My_String)));
   My_String:=To_Unbounded_String(Adx.Lib.Stringmod.Trim_CR(To_String(My_String)));
   My_String:=To_Unbounded_String(Adx.Lib.Stringmod.Trim_LF(To_String(My_String)));

   My_Number:=Adx.Lib.Stringmod.String_To_Integer(To_String(My_String));

   return My_Number;

end Parse_Content_Length;

------------------------------------------------------------------------------
-- Tokenize Header
------------------------------------------------------------------------------
function Tokenize_Header(Http_Header:String) return String_Vector_Type is

   My_Vector:String_Vector_Type;
   LF:constant String(1 .. 1):=(1 => ASCII.LF);
   Delimiter:constant String:=LF;

begin

   My_Vector:=Adx.Lib.Tokenize.Tokenize(Http_Header, Delimiter);

   return My_Vector;

end Tokenize_Header;

------------------------------------------------------------------------------
-- Make Header
------------------------------------------------------------------------------
function Make_Header(Content:String) return String is

   Content_Length:constant Integer:=(Content'Size / 8);
   Http_Date:constant String:=Adx.Lib.Date.Get_Http_Date;
   Result:Unbounded_String;

begin

   Append(Result, "HTTP/1.1 200 OK" & ASCII.CR & ASCII.LF);
   Append(Result, "Server:nginx/1.14.0 (Ubuntu)" & ASCII.CR & ASCII.LF);
   Append(Result, "Date:" & Http_Date & " GMT" & ASCII.CR & ASCII.LF);
   Append(Result, "Content-Type:text/html" & ASCII.CR & ASCII.LF);
   Append(Result, "Content-Length:" & Integer'Image(Content_Length) & ASCII.CR & ASCII.LF);
-- Append(Result, "Last-Modified:Mon, 22 Jun 2020 21:36:35 GMT" & ASCII.CR & ASCII.LF);
   Append(Result, "Last-Modified:" & Http_Date & " GMT" & ASCII.CR & ASCII.LF);
-- Append(Result, "Connection:keep-alive" & ASCII.CR & ASCII.LF); Append(Result, "ETag:""5ef12463-264""" & ASCII.CR & ASCII.LF);
   Append(Result, "Accept-Ranges:bytes" & ASCII.CR & ASCII.LF);
   Append(Result, ASCII.CR & ASCII.LF);

   return To_String(Result);

end Make_Header;

------------------------------------------------------------------------------
-- Make Redirect
------------------------------------------------------------------------------
function Make_Redirect(Location:String) return String is

   Result:Unbounded_String;

begin

   Append(Result, "HTTP/1.1 302 Found" & ASCII.CR & ASCII.LF);
   Append(Result, "location:" & Location & ASCII.CR & ASCII.LF);
   Append(Result, "Connection:close" & ASCII.CR & ASCII.LF);
   Append(Result, ASCII.CR & ASCII.LF);

   return To_String(Result);

end Make_Redirect;

------------------------------------------------------------------------------
-- Make Cookie
------------------------------------------------------------------------------
function Make_Cookie(Location:String; Session_Hash:String) return String is

   Result:Unbounded_String;

begin

   Append(Result, "HTTP/1.1 302 Found" & ASCII.CR & ASCII.LF);
   Append(Result, "location:" & Location & ASCII.CR & ASCII.LF);
   Append(Result, "Set-Cookie:ADASID=" & Session_Hash & "; expires=Tue, 1-Mar-2022 19:30:42 GMT; Max-Age=2592000; Path=/; HttpOnly" & ASCII.CR & ASCII.LF);
   Append(Result, ASCII.CR & ASCII.LF);

   return To_String(Result);

end Make_Cookie;

------------------------------------------------------------------------------
-- Make Message
------------------------------------------------------------------------------
function Make_Message(Content:String) return String is

   Result:Unbounded_String;

begin

   Append(Result, To_Unbounded_String(Make_Header(Content)));
   Append(Result, Content);

   return To_String(Result);

end Make_Message;

------------------------------------------------------------------------------
-- Parse Cookie
------------------------------------------------------------------------------
function Parse_Cookie(Http_Header:in String; Cookie_Name:in String) return String is

   My_Vector:constant String_Vector_Type:=Tokenize_Header(Http_Header);

   Match_Result:Unbounded_String;
   Has_Match:Boolean;
   Pattern:constant String:="Cookie:" & Cookie_Name & "=(.*)";

   Result:Unbounded_String;

begin

   for I in My_Vector.First_Index .. My_Vector.Last_Index loop

      Has_Match:=Adx.Lib.Regmatch.Regmatch(My_Vector.Element(Index => I), Pattern, Match_Result);

      if Has_Match then

         Match_Result:=To_Unbounded_String(Adx.Lib.Stringmod.Trim_CR(To_String(Match_Result)));

         Append(Result, Match_Result);
         exit;

      end if;

   end loop;

   return To_String(Result);

end Parse_Cookie;

end Adx.Lib.Http;
