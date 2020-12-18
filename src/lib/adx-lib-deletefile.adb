------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.DELETEFILE                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Directories;

package body Adx.Lib.Deletefile is

------------------------------------------------------------------------------
-- Delete File
------------------------------------------------------------------------------
procedure Deletefile(File_Name:String) is

begin

   Ada.Directories.Delete_File(File_Name);

end Deletefile;

end Adx.Lib.Deletefile;
