------------------------------------------------------------------------------
--                                                                          --
--                              ADX.APP.UCOUNT                              --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Vectortype;
use Adx.Lib.Vectortype;

package Adx.App.Ucount is

   procedure Run (Project_Dir : String);
   procedure Run_Extend(My_Vector:String_Vector_Type);

end Adx.App.Ucount;
