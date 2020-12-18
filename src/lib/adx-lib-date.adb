------------------------------------------------------------------------------
--                                                                          --
--                               ADX.LIB.DATE                               --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Calendar;
with GNAT.Calendar.Time_IO;

package body Adx.Lib.Date is

------------------------------------------------------------------------------
-- Get Http Date
-- RFC7231 Date Format:Fri, 03 Jul 2020 19:39:03 GMT
------------------------------------------------------------------------------
function Get_Http_Date return String is

   My_Clock:constant Ada.Calendar.Time:=Ada.Calendar.Clock;
   Picture_String:constant GNAT.Calendar.Time_IO.Picture_String:="%a, %m %b %Y %H:%M:%S";
   My_String:constant String:=GNAT.Calendar.Time_IO.Image(My_Clock, Picture_String);

begin

   return My_String;

end Get_Http_Date;

end Adx.Lib.Date;