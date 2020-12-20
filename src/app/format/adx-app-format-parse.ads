------------------------------------------------------------------------------
--                                                                          --
--                           ADX.APP.FORMAT.PARSE                           --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Readdir;
use Adx.Lib.Readdir;

package Adx.App.Format.Parse is

procedure ParseVector(My_Vector:Directory_Vector_Type);
procedure ParseRecord(My_Record:Directory_Record_Type);

end Adx.App.Format.Parse;
