------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.TIMESTAMP                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Interfaces.C;
with Ada.Calendar.Conversions;
with GNAT.Calendar.Time_IO;

package body Adx.Lib.Timestamp is

------------------------------------------------------------------------------
-- Get Unix Time
------------------------------------------------------------------------------
function Get_Unix_Time return Long_Integer is

   My_Clock:constant Ada.Calendar.Time:=Ada.Calendar.Clock;
   Unix_Time:constant Interfaces.C.long:=Ada.Calendar.Conversions.To_Unix_Time(My_Clock);
   My_String:constant String:=Interfaces.C.long'Image(Unix_Time);
   My_Long:constant Long_Integer:=Long_Integer'Value(My_String);

begin

   return My_Long;

end Get_Unix_Time;

------------------------------------------------------------------------------
-- Get Ada Time
------------------------------------------------------------------------------
function Get_Ada_Time return Long_Integer is

   -- The returned time value is the number of nanoseconds since the start of Ada time(1901-01-01 00:00:00.0 UTC). If leap seconds are enabled, the result will contain all elapsed leap seconds since the start of Ada time until now.

   My_Clock:constant Ada.Calendar.Time:=Ada.Calendar.Clock;
   My_String:constant String:=GNAT.Calendar.Time_IO.Image(My_Clock, "%s");
   My_Long:constant Long_Integer:=Long_Integer'Value(My_String);

begin

   return My_Long;

end Get_Ada_Time;

end Adx.Lib.Timestamp;
