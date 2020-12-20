------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.RENAMEFILE                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Directories;

package body Adx.Lib.Renamefile is

procedure Renamefile(Old_Name:String; New_Name:String) is

begin

   Ada.Directories.Rename(Old_Name, New_Name);

end Renamefile;

end Adx.Lib.Renamefile;
