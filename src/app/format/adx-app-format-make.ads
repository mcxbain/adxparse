------------------------------------------------------------------------------
--                                                                          --
--                           ADX.APP.FORMAT.MAKE                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Vectortype;
use Adx.Lib.Vectortype;

package Adx.App.Format.Make is

procedure MakeAll(Dir_Path:String; Dictionary_String:String_Vector_Type);
procedure MakeAds(Dir_Path:String);
procedure MakeAdb(Dir_Path:String);

end Adx.App.Format.Make;
