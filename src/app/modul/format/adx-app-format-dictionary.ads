------------------------------------------------------------------------------
--                                                                          --
--                        ADX.APP.FORMAT.DICTIONARY                         --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
With Adx.Lib.Vectortype;
Use Adx.Lib.Vectortype;

package Adx.app.format.dictionary is

   Procedure InitCurrentDirectory;
   function GetDictionaryFileName return String;
   function GetAdxLib return String_Vector_Type;
   function GetAdxTools return String_Vector_Type;

end Adx.app.format.dictionary;
