------------------------------------------------------------------------------
--                                                                          --
--                              ADX.RUN.RENAME                              --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Adx.App.Rename.Make;

use Ada.Text_IO;

package body Adx.Run.Rename is

procedure Main(Dir_Path:String; Old_Name:String; New_Name:String) is

begin

   Adx.App.Rename.Make.MakeAll(Dir_Path, Old_Name, New_Name);

end Main;

end Adx.Run.Rename;
