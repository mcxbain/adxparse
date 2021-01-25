------------------------------------------------------------------------------
--                                                                          --
--                        ADX.APP.FORMAT.DICTIONARY                         --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Vectortype;
use Adx.Lib.Vectortype;

package Adx.App.Format.Dictionary is

procedure InitCurrentDirectory;
function GetDictionaryFilename return String;
function GetAdxLib return String_Vector_Type;
function GetAdxParse return String_Vector_Type;
function GetAdxServer return String_Vector_Type;
function GetAdxSqlite return String_Vector_Type;
function GetAdxGen return String_Vector_Type;

end Adx.App.Format.Dictionary;
