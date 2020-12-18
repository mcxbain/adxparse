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
with Ada.Strings.Unbounded;
with Adx.Lib.Getparam;
with Adx.Lib.Regmatch;
with Adx.Rundir;
with Adx.Runfile;
With Adx.App.Ucount.Make;
With Adx.Runrename;
With Adx.Runmetric;

use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body Adx.Terminal is

   ------------------------------------------------------------------------------
   -- Help
   ------------------------------------------------------------------------------
   function Help return String is

      My_String:Unbounded_String;

   begin

      --Append(My_String, "Usage:parse -d [DIRECTORY] -f [OPTION]"&ASCII.LF);
      Append(My_String, "-d --directory   Parse Directory      [parse -d /home/tux/example -p]" & ASCII.LF);
      Append(My_String, "-f --file        Parse File           [parse -f /home/tux/example/myfile.ads]" & ASCII.LF);
      Append(My_String, "-c --dictionary  Use Dictionary       [parse -d /home/tux/example -p -c adxlib]" & ASCII.LF);
      Append(My_String, "-r --rename      Rename Package       [parse -d /home/tux/example -r adx-lib-sysout adx-lib-sysin]" & ASCII.LF);
      Append(My_String, "-u --package     Show Package List    [parse -d /home/tux/example -u]" & ASCII.LF);
      Append(My_String, "-m --metric      Show Metrics         [parse -g /home/tux/example.gpr -m]" & ASCII.LF);
      Append(My_String, "-v --version     Show Version         [parse -v]" & ASCII.LF);
      Append(My_String, "-h --help        Show Help            [parse -h]");

      return To_String(My_String);

   end Help;

   ------------------------------------------------------------------------------
   -- Version
   ------------------------------------------------------------------------------
   function Version return String is

      My_String:Unbounded_String;

   begin

      Append(My_String, "7.2.1");

      return To_String(My_String);

   end Version;

   ------------------------------------------------------------------------------
   -- Main
   ------------------------------------------------------------------------------
   procedure Main is

      My_String:String:=Adx.Lib.Getparam.Get_Parameter_String;
      My_Result:Unbounded_String;
      Old_Name:Unbounded_String;
      New_Name:Unbounded_String;
      Dic_Name:Unbounded_String;

   begin

      -- Find Empty switch
      if My_String = "" then
         Put_Line(Help);

         -- Find Help switch
      elsif My_String = "-h" & Ascii.Lf then
         Put_Line(Help);

         -- Find Version switch
      elsif My_String = "-v" & Ascii.Lf then
         Put_Line(Version);

         -- Find Directory switch
      elsif Adx.Lib.Regmatch.Regmatch(My_String, "-d\s(.*?)\s", My_Result) then
         --Put_Line("Directory switch found..");


         --Find -f switch
         if Adx.Lib.Regmatch.Regmatch(My_String, "-d\s(.*?)\s-p", My_Result) then
            put_line("p switch found");

            ---getting the dictionary switch
            if Adx.Lib.Regmatch.Regmatch(My_String, "-d\s.*?\s-p\s-c\s(.*?)\s", Dic_Name) then

               put_line(To_String(Dic_Name));
               Adx.Rundir.Parsedirectory(To_String(My_Result), To_String(Dic_Name));

            else
               put_line("Dictionary Name not found .. -c");
            end if;


         elsif Adx.Lib.Regmatch.Regmatch(My_String, "-d\s(.*?)\s-u", My_Result) then
            put_line("u switch found");
            Adx.App.Ucount.Make.MakeAll(to_String(My_Result));

         elsif Adx.Lib.Regmatch.Regmatch(My_String, "-d\s(.*?)\s-r", My_Result) then
            put_line("r switch found");

            --getting the rest of the params
            if Adx.Lib.Regmatch.Regmatch(My_String, "-d\s.*?\s-r\s(.*?)\s", Old_Name) then

               if Adx.Lib.Regmatch.Regmatch(My_String, "-d\s.*?\s-r\s.*?\s(.*?)\s", New_Name) then
                  Adx.Runrename.main(to_String(My_Result), to_string(Old_Name), to_string(New_Name));
               else
                  put_line("new Name not found");
               end if;

            else
               put_line("old Name not found");
            end if;


         else
            Put_Line("Invalid Directory Switch.. -p for parse");
         end if;

         --Find Metric Switch
       elsif Adx.Lib.Regmatch.Regmatch(My_String, "-g\s(.*?)\s-m", My_Result) then
         put_line("m switch found");
         Adx.runmetric.main(to_String(My_Result));

         -- Find File switch
      elsif Adx.Lib.Regmatch.Regmatch(My_String, "-f\s(.*?)\s", My_Result) then
         --Put_Line("File switch found..");
         Adx.Runfile.Parsefile(To_String(My_Result));

         -- Nothing found
      else
         Put_Line("Invalid command..");
      end if;

   end Main;

end Adx.Terminal;