------------------------------------------------------------------------------
--                                                                          --
--                           ADX.APP.UCOUNT.MAKE                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Vectortype;
use Adx.Lib.Vectortype;

package Adx.App.Ucount.Make is

   procedure MakeAll(Dir_Path:String);
   procedure MakeExtend(My_Vector:String_Vector_Type);

end Adx.App.Ucount.Make;
