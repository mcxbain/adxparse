------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.REGMATCH                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with GNAT.Regpat;
use GNAT.Regpat;

package body Adx.Lib.Regmatch is

------------------------------------------------------------------------------
-- Regmatch
------------------------------------------------------------------------------
function Regmatch(Content:in String; Pattern:in String; Result:out Unbounded_String) return Boolean is

   Function_Status:Boolean:=True;
   Regexp:constant GNAT.Regpat.Pattern_Matcher:=GNAT.Regpat.Compile(Pattern);
   Match_Array:GNAT.Regpat.Match_Array(0 .. 2);
   Pos_Begin:Integer;
   Pos_End:Integer;

begin

   GNAT.Regpat.Match(Regexp, Content, Match_Array);

   if Match_Array(0) = No_Match then

      Function_Status:=False;

   else

      Pos_Begin:=Match_Array(1).First;
      Pos_End:=Match_Array(1).Last;

      Result:=To_Unbounded_String(Content(Pos_Begin .. Pos_End));

   end if;

   return Function_Status;

end Regmatch;

end Adx.Lib.Regmatch;
