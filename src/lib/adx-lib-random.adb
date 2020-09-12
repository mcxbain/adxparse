------------------------------------------------------------------------------
--                                                                          --
--                              ADX.LIB.RANDOM                              --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Numerics.Discrete_Random;

package body Adx.Lib.Random is

------------------------------------------------------------------------------
-- Random
------------------------------------------------------------------------------
function Random(Range_Begin:Integer; Range_End:Integer) return Integer is
   type Randrange is new Integer range Range_Begin .. Range_End;
   package Rand_Int is new Ada.Numerics.Discrete_Random(Randrange);
   use Rand_Int;
   Gen:Generator;
   Num:Randrange;

begin

   Reset(Gen);
   Num:=Random(Gen);
   return Integer'Value(Randrange'Image(Num));

end Random;

end Adx.Lib.Random;
