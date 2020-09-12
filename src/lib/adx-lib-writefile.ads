------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.WRITEFILE                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Stringtype;
use Adx.Lib.Stringtype;

package Adx.Lib.Writefile is

procedure Writefile(File_Name:String; My_Vector:String_Vector_Type);

end Adx.Lib.Writefile;
