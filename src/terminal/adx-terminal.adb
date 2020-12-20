------------------------------------------------------------------------------
--                                                                          --
--                               ADX.TERMINAL                               --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Adx.Lib.Getparam;
with Adx.Lib.Regcheck;
with Adx.Terminal.File;
with Adx.Terminal.Help;
with Adx.Terminal.Metric;
with Adx.Terminal.Parse;
with Adx.Terminal.Rename;
with Adx.Terminal.Ucount;
with Adx.Terminal.Version;

use Ada.Text_IO;

package body Adx.Terminal is

   ------------------------------------------------------------------------------
   -- Main
   ------------------------------------------------------------------------------
   procedure Main is

      My_String:constant String:=Adx.Lib.Getparam.Get_Parameter_String;

   begin

      -----------------------------------------------------------------------------
      -- Empty Switch
      -----------------------------------------------------------------------------
      if My_String = "" then
         Adx.Terminal.Help.Main;

         -----------------------------------------------------------------------------
         -- Help Switch
         -----------------------------------------------------------------------------
      elsif Adx.Lib.Regcheck.Regcheck(My_String, "^-h.*") then
         Put_Line("Help switch found..");
         Adx.Terminal.Help.Main;

         -----------------------------------------------------------------------------
         -- Version Switch
         -----------------------------------------------------------------------------
      elsif Adx.Lib.Regcheck.Regcheck(My_String, "^-v.*") then
         Put_Line("Version switch found..");
         Adx.Terminal.Version.Main;

         -----------------------------------------------------------------------------
         -- Parse Switch
         -----------------------------------------------------------------------------
      elsif Adx.Lib.Regcheck.Regcheck(My_String, "^-d.*") then
         Put_Line("Parse switch found..");
         Adx.Terminal.Parse.Main(My_String);

         ------------------------------------------------------------------------------
         -- Ucount Switch
         ------------------------------------------------------------------------------
      elsif Adx.Lib.Regcheck.Regcheck(My_String, "^-l.*") then
         Put_Line("List switch found..");
         Adx.Terminal.Ucount.Main(My_String);

         ------------------------------------------------------------------------------
         -- Rename Switch
         ------------------------------------------------------------------------------
      elsif Adx.Lib.Regcheck.Regcheck(My_String, "^-r.*") then
         Put_Line("Rename switch found..");
         Adx.Terminal.Rename.Main(My_String);

         ------------------------------------------------------------------------------
         -- Metric Switch
         ------------------------------------------------------------------------------
      elsif Adx.Lib.Regcheck.Regcheck(My_String, "^-m.*") then
         Put_Line("Metric switch found..");
         Adx.Terminal.Metric.Main(My_String);

         ------------------------------------------------------------------------------
         -- File switch
         ------------------------------------------------------------------------------
      elsif Adx.Lib.Regcheck.Regcheck(My_String, "^-f.*") then
         Put_Line("File switch found..");
         Adx.Terminal.File.Main(My_String);

         ------------------------------------------------------------------------------
         -- Nothing found
         ------------------------------------------------------------------------------
      else
         Put_Line("Invalid command..");
      end if;

   end Main;

end Adx.Terminal;
