------------------------------------------------------------------------------
--                                                                          --
--                            ADX.TERMINAL_COPY                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.Lib.Getparam;
with Adx.Lib.Regcheck;
with Adx.Lib.Regmatch;

with Adx.Terminal.File;
with Adx.Terminal.Help;
with Adx.Terminal.Metric;
with Adx.Terminal.Parse;
with Adx.Terminal.Rename;
with Adx.Terminal.Ucount;
with Adx.Terminal.Version;

use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body Adx.Terminal is

procedure Renameswitch(My_String:String) is

   My_Result:Unbounded_String;
   Old_Name:Unbounded_String;
   New_Name:Unbounded_String;

begin

   --getting the rest of the params
   if Adx.Lib.Regmatch.Regmatch(My_String, "-d\s.*?\s-r\s(.*?)\s", Old_Name) then

      if Adx.Lib.Regmatch.Regmatch(My_String, "-d\s.*?\s-r\s.*?\s(.*?)\s", New_Name) then
         Adx.Run.Rename.Main(To_String(My_Result), To_String(Old_Name), To_String(New_Name));
      else
         Put_Line("new Name not found");
      end if;

   else
      Put_Line("old Name not found");
   end if;

   --else
   --   Put_Line("Invalid Directory Switch.. -p for parse");
   --end if;

end Renameswitch;

------------------------------------------------------------------------------
-- Main
------------------------------------------------------------------------------
procedure Main is

   My_String:String:=Adx.Lib.Getparam.Get_Parameter_String;
   My_Result:Unbounded_String;

begin

   -----------------------------------------------------------------------------
   -- Empty Switch
   -----------------------------------------------------------------------------
   if My_String = "" then
      Adx.Terminal.Help.Main;

      -----------------------------------------------------------------------------
      -- Help Switch
      -----------------------------------------------------------------------------
   elsif Adx.Lib.Regcheck.Regcheck(My_String, "-h.*") then
      Put_Line("Help switch found..");
      Adx.Terminal.Help.Main;

      -----------------------------------------------------------------------------
      -- Version Switch
      -----------------------------------------------------------------------------
   elsif Adx.Lib.Regcheck.Regcheck(My_String, "-v.*") then
      Put_Line("Version switch found..");
      Adx.Terminal.Version.Main;

      -----------------------------------------------------------------------------
      -- Parse Switch
      -----------------------------------------------------------------------------
   elsif Adx.Lib.Regcheck.Regcheck(My_String, "-d.*") then
      Put_Line("Parse switch found..");
      Adx.Terminal.Parse.Main(My_String);

      ------------------------------------------------------------------------------
      -- Ucount Switch
      ------------------------------------------------------------------------------
   elsif Adx.Lib.Regmatch.Regmatch(My_String, "-d\s(.*?)\s-u", My_Result) then
      Put_Line("List switch found..");
      Adx.Terminal.Ucount.Main(To_String(My_Result));

      ------------------------------------------------------------------------------
      -- Rename Switch
      ------------------------------------------------------------------------------
   elsif Adx.Lib.Regmatch.Regmatch(My_String, "-d\s(.*?)\s-r", My_Result) then
      Put_Line("Rename switch found..");
      Renameswitch(My_String);

      ------------------------------------------------------------------------------
      -- Metric Switch
      ------------------------------------------------------------------------------
   elsif Adx.Lib.Regmatch.Regmatch(My_String, "-g\s(.*?)\s-m", My_Result) then
      Put_Line("Metric switch found..");
      Adx.Terminal.Metric.Main(To_String(My_Result));

      ------------------------------------------------------------------------------
      -- File switch
      ------------------------------------------------------------------------------
   elsif Adx.Lib.Regmatch.Regmatch(My_String, "-f\s(.*?)\s", My_Result) then
      Put_Line("File switch found..");
      Adx.Terminal.File.Main(To_String(My_Result));

      ------------------------------------------------------------------------------
      -- Nothing found
      ------------------------------------------------------------------------------
   else
      Put_Line("Invalid command..");
   end if;

end Main;

end Adx.Terminal;
