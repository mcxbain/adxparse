------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.STRINGMOD                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
package Adx.Lib.Stringmod is

function Trim_CR(My_String:String) return String;
function Trim_LF(My_String:String) return String;
function Trim_Whitespace(My_String:String) return String;
function Escape_Regexp(My_String:String) return String;
function Escape_Quote(My_String:String) return String;
function Replace_Tab(My_String:String) return String;
function String_To_Integer(My_String:String) return Integer;
function Integer_To_String(My_Number:Integer) return String;
function String_Is_Empty(My_String:String) return Boolean;
function String_To_Upper_All(My_String:String) return String;
function String_To_Upper_First(My_String:String) return String;

end Adx.Lib.Stringmod;
