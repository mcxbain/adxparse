------------------------------------------------------------------------------
--                                                                          --
--                           ADX.APP.FORMAT.PARSE                           --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------

With Adx.Lib.Readdir;
Use Adx.Lib.Readdir;


package Adx.App.Format.Parse is

  
  procedure ParseVector(My_Vector:Directory_Vector_Type);
  procedure ParseRecord(My_Record:Directory_Record_Type);

end Adx.App.Format.Parse;
