------------------------------------------------------------------------------
--                                                                          --
--                              ADX.LIB.SYSOUT                              --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Strings.Unbounded;
use Ada.Strings.Unbounded;

package Adx.Lib.Sysout is

function Sysout(Command:String) return Unbounded_String;

end Adx.Lib.Sysout;
