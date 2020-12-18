------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.EXECTIME                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Real_Time;

use Ada.Text_IO;
use Ada.Real_Time;

package body Adx.Lib.Exectime is

------------------------------------------------------------------------------
-- Start
------------------------------------------------------------------------------
procedure Start is

   Start_Time_A:constant Ada.Real_Time.Time:=Ada.Real_Time.Clock;

begin

   Start_Time:=Start_Time_A;

end Start;

------------------------------------------------------------------------------
-- Stop
------------------------------------------------------------------------------
procedure Stop is

   Stop_Time_A:constant Ada.Real_Time.Time:=Ada.Real_Time.Clock;

begin

   Stop_Time:=Stop_Time_A;

end Stop;

------------------------------------------------------------------------------
-- Get Duration
------------------------------------------------------------------------------
function Get_Duration return Duration is

   Exec_Time_Span:Ada.Real_Time.Time_Span;
   Exec_Duration:Duration;

begin

   Exec_Time_Span:=Stop_Time - Start_Time;
   Exec_Duration:=Ada.Real_Time.To_Duration(Exec_Time_Span);

   return Exec_Duration;

end Get_Duration;

------------------------------------------------------------------------------
-- Print Duration
------------------------------------------------------------------------------
procedure Print_Duration is

   Exec_Duration:constant Duration:=Get_Duration;

begin

   Put_Line("Execution Time:" & Duration'Image(Exec_Duration));

end Print_Duration;

------------------------------------------------------------------------------
-- Make Delay
------------------------------------------------------------------------------
procedure Make_Delay(Seconds:Duration) is

   package Real_Time renames Ada.Real_Time;
   use type Real_Time.Time_Span;
   use type Real_Time.Time;

   Start_Time:Real_Time.Time;
   Target_Time:Real_Time.Time;

begin

   Start_Time:=Real_Time.Clock;
   Target_Time:=Start_Time + Ada.Real_Time.To_Time_Span(Seconds);
   delay until Target_Time;

end Make_Delay;

end Adx.Lib.Exectime;
