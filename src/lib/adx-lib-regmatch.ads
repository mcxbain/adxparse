------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.REGMATCH                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package Adx.Lib.Regmatch is

   function Regmatch(Content:in String; Pattern:in String; Result:out Unbounded_String) return Boolean;

end Adx.Lib.Regmatch;
