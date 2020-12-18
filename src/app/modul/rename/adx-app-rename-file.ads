------------------------------------------------------------------------------
--                                                                          --
--                           ADX.APP.RENAME.FILE                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package Adx.App.Rename.File is

function GetFilePath(Dir_Path:String; File_Name:String; Result:out Unbounded_String) return Boolean;
procedure Rename(Dir_Path:String; Old_Name:String; New_Name:String; File_Type:String);

end Adx.App.Rename.File;
