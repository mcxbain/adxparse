------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.READFILE                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Vectortype;
use Adx.Lib.Vectortype;

package Adx.Lib.Readfile is

function Readfile(File_Name:String) return String_Vector_Type;

end Adx.Lib.Readfile;
