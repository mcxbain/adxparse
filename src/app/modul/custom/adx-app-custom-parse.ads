With Adx.Lib.Vectortype;
With Adx.Lib.Readdir;

Use Adx.Lib.Vectortype;
Use Adx.Lib.Readdir;

package Adx.App.Custom.Parse is

  
  procedure ParseVector(My_Vector:Directory_Vector_Type);
  procedure ParseRecord(My_Record:Directory_Record_Type);
  function ParseFile(My_Vector:String_Vector_Type) return String_Vector_Type;


end Adx.App.Custom.Parse;
