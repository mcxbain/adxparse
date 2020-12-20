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

   function Remove_CR(My_String:String) return String;
   function Remove_LF(My_String:String) return String;
   function Trim_Whitespace(My_String:String) return String;
   function Escape_Regexp(My_String:String) return String;
   function Escape_Quote(My_String:String) return String;
   function Replace_Tab(My_String:String) return String;
   function String_To_Integer(My_String:String) return Integer;
   function Integer_To_String(My_Number:Integer) return String;
   function Long_Integer_To_String(My_Number:Long_Integer) return String;
   function String_Is_Empty(My_String:String) return Boolean;
   function String_To_Upper_All(My_String:String) return String;
   function String_To_Upper_First(My_String:String) return String;
   function String_To_Upper_First_Sep(My_String:String; My_Sep:String) return String;
   function String_To_Lower_All(My_String:String) return String;
   function String_To_Character(My_String:String) return Character;
   function Character_To_String(My_Character:Character) return String;
   function Integer_To_Character(My_Number:Integer) return Character;
   function Character_To_Integer(My_Character:Character) return Integer;

end Adx.Lib.Stringmod;
