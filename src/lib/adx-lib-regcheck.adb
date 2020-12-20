------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.REGCHECK                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with GNAT.Regpat;
use GNAT.Regpat;

package body Adx.Lib.Regcheck is

------------------------------------------------------------------------------
-- Regcheck
------------------------------------------------------------------------------
function Regcheck(Content:in String; Pattern:in String) return Boolean is

   Has_Match:Boolean:=True;
   Regexp:constant GNAT.Regpat.Pattern_Matcher:=GNAT.Regpat.Compile(Pattern);
   Match_Array:GNAT.Regpat.Match_Array(0 .. 2);

begin

   GNAT.Regpat.Match(Regexp, Content, Match_Array);

   if Match_Array(0) = No_Match then
      Has_Match:=False;
   else
      Has_Match:=True;
   end if;

   return Has_Match;

end Regcheck;

end Adx.Lib.Regcheck;
