------------------------------------------------------------------------------
--                                                                          --
--                              ADX.RUN.UCOUNT                              --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.App.Ucount.Make;

package body Adx.Run.Ucount is

procedure Main(Dir_Path:String) is

begin

   Adx.App.Ucount.Make.MakeAll(Dir_Path);

end Main;

end Adx.Run.Ucount;
