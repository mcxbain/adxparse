------------------------------------------------------------------------------
--                                                                          --
--                          ADX.APP.ADDHEADER.ADD                           --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Vectortype;
use Adx.Lib.Vectortype;

package Adx.App.AddHeader.Add is

function AddHeaderSpec(Content_Vector:String_Vector_Type; File_Name:String) return String_Vector_Type;
function AddHeaderBody(Content_Vector:String_Vector_Type; File_Name:String) return String_Vector_Type;

end Adx.App.AddHeader.Add;
