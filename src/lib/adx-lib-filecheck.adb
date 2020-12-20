------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.FILECHECK                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Directories;
use Ada.Directories;

package body Adx.Lib.Filecheck is

------------------------------------------------------------------------------
-- File Check
------------------------------------------------------------------------------
   function Filecheck(File_Path:String) return Boolean is

      Has_File:Boolean;

   begin

      if Exists(File_Path) then

         if Kind(File_Path) = Ordinary_File then
            Has_File:=True;
         else
            Has_File:=False;
         end if;

      else
         Has_File:=False;
      end if;

      return Has_File;

   end Filecheck;

end Adx.Lib.Filecheck;
