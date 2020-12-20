------------------------------------------------------------------------------
--                                                                          --
--                            ADX.TERMINAL.HELP                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;

use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body Adx.Terminal.Help is

------------------------------------------------------------------------------
-- Help
------------------------------------------------------------------------------
   procedure Main is

      My_String:Unbounded_String;

   begin

      Append(My_String, "-d --directory   Parse Directory      parse -d /home/tux/mydir/ -c adxlib -o removespace" & ASCII.LF);
      Append(My_String, "-f --file        Parse File           parse -f /home/tux/myfile.ads -c adxlib -o removespace" & ASCII.LF);
      Append(My_String, "-r --rename      Rename Package       parse -r /home/tux/mydir/ -r adx-lib-sysout adx-lib-sysin" & ASCII.LF);
      Append(My_String, "-l --list        Show Package List    parse -l /home/tux/mydir/" & ASCII.LF);
      Append(My_String, "-m --metric      Show Metrics         parse -m /home/tux/myfile.gpr" & ASCII.LF);
      Append(My_String, "-v --version     Show Version         parse -v" & ASCII.LF);
      Append(My_String, "-h --help        Show Help            parse -h");

      Put_Line(To_String(My_String));

   end Main;

end Adx.Terminal.Help;
