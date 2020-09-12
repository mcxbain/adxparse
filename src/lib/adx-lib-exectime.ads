------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.EXECTIME                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Real_Time;

package Adx.Lib.Exectime is

procedure Start;
procedure Stop;
function Get_Duration return Duration;
procedure Make_Delay(Seconds:Duration);
procedure Print_Duration;

private
Start_Time:Ada.Real_Time.Time;
Stop_Time:Ada.Real_Time.Time;

end Adx.Lib.Exectime;
