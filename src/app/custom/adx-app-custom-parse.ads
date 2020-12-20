------------------------------------------------------------------------------
--                                                                          --
--                           ADX.APP.CUSTOM.PARSE                           --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Vectortype;
with Adx.Lib.Readdir;

use Adx.Lib.Vectortype;
use Adx.Lib.Readdir;

package Adx.App.Custom.Parse is

procedure ParseVector(My_Vector:Directory_Vector_Type; Format_Option:String);
procedure ParseRecord(My_Record:Directory_Record_Type; Format_Option:String);
function ParseFile(My_Vector:String_Vector_Type; Format_Option:String) return String_Vector_Type;

end Adx.App.Custom.Parse;
