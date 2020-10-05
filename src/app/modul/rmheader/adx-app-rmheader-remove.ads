------------------------------------------------------------------------------
--                                                                          --
--                         ADX.APP.RMHEADER.REMOVE                          --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Vectortype;
use Adx.Lib.Vectortype;


package Adx.App.RmHeader.Remove is

  function RemoveHeader(My_Vector:String_Vector_Type) return String_Vector_Type;
  function CheckLineBeginsWithHifen(My_String:String) return Boolean;
  function CheckFirstLineHasHifen(My_Vector:String_Vector_Type) return Boolean;
  function RemoveHifen(My_Vector:String_Vector_Type) return String_Vector_Type;

end Adx.App.RmHeader.Remove;
