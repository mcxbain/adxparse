------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.DIRCHECK                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Directories;
use Ada.Directories;

package body Adx.Lib.Dircheck is

------------------------------------------------------------------------------
-- Dir Check
------------------------------------------------------------------------------
   function Dircheck(Dir_Path:String) return Boolean is

      Has_Dir:Boolean;

   begin

      if Exists(Dir_Path) then

         if Kind(Dir_Path) = Directory then
            Has_Dir:=True;
         else
            Has_Dir:=False;
         end if;

      else
         Has_Dir:=False;
      end if;

      return Has_Dir;

   end Dircheck;

end Adx.Lib.Dircheck;
