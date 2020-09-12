with Adx.Lib.Stringtype;
use Adx.Lib.Stringtype;


package Adx.App.Header.Remove is

  function RemoveHeader(My_Vector:String_Vector_Type) return String_Vector_Type;
  function CheckLineBeginsWithHifen(My_String:String) return Boolean;
  function CheckFirstLineHasHifen(My_Vector:String_Vector_Type) return Boolean;
  function RemoveHifen(My_Vector:String_Vector_Type) return String_Vector_Type;

end Adx.App.Header.Remove;
