------------------------------------------------------------------------------
--                                                                          --
--                          ADX.APP.RMHEADER.PARSE                          --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Readdir;
use Adx.Lib.Readdir;

package Adx.App.Rmheader.Parse is

procedure ParseVectorAds(My_Vector:Directory_Vector_Type);
procedure ParseRecordAds(My_Record:Directory_Record_Type);

procedure ParseVectorAdb(My_Vector:Directory_Vector_Type);
procedure ParseRecordAdb(My_Record:Directory_Record_Type);

end Adx.App.Rmheader.Parse;
