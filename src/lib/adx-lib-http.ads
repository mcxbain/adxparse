------------------------------------------------------------------------------
--                                                                          --
--                               ADX.LIB.HTTP                               --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Vectortype;
use Adx.Lib.Vectortype;

package Adx.Lib.Http is

------------------------------------------------------------------------------
-- Http Parse Functions
------------------------------------------------------------------------------
function Parse_Header(Http_Message:in String) return String;
function Parse_Body(Http_Message:in String) return String;
function Parse_Method(Http_Header:in String) return String;
function Parse_Uri(Http_Header:in String) return String;
function Parse_Cookie(Http_Header:in String; Cookie_Name:in String) return String;
function Parse_Post_Parameter(Http_Body:String) return String_Vector_Type;
function Parse_Content_Length(Http_Header:in String) return Natural;

------------------------------------------------------------------------------
-- Http Make functions
------------------------------------------------------------------------------
function Make_Header(Content:String) return String;
function Make_Redirect(Location:String) return String;
function Make_Cookie(Location:String; Session_Hash:String) return String;
function Make_Message(Content:String) return String;

------------------------------------------------------------------------------
-- Http Extra Functions
------------------------------------------------------------------------------
function Get_Post_Parameter(My_Vector:String_Vector_Type; Key:String) return String;
function Tokenize_Header(Http_Header:String) return String_Vector_Type;

end Adx.Lib.Http;
