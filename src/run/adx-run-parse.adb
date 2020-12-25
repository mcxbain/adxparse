------------------------------------------------------------------------------
--                                                                          --
--                              ADX.RUN.PARSE                               --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Adx.Lib.Vectortype;
with Adx.Lib.Dircheck;
with Adx.Lib.Regcheck;
with Adx.App.Format.Dictionary;
with Adx.App.Format.Make;
with Adx.App.AddHeader.Make;
with Adx.App.Rmheader.Make;
with Adx.App.Custom.Make;

use Ada.Text_IO;
use Adx.Lib.Vectortype;

package body Adx.Run.Parse is

procedure Main(Dir_Path:String; Dic_Name:String; Format_Option:String) is

   Dictionary_String:String_Vector_Type;
   Checker:Boolean:=False;

begin

   if Dic_Name = "adxlib" then
      Dictionary_String:=Adx.App.Format.Dictionary.GetAdxLib;
   elsif Dic_Name = "adxparse" then
      Dictionary_String:=Adx.App.Format.Dictionary.GetAdxParse;
   elsif Dic_Name = "adxserver" then
      Dictionary_String:=Adx.App.Format.Dictionary.GetAdxServer;
   end if;

   --check if dir exists;
   if Adx.Lib.Dircheck.Dircheck(Dir_Path) then

      --to avoid anny danger we just add here allowed directorys
      if Adx.Lib.Regcheck.Regcheck(Dir_Path, "^/home/mcxbain/workspace/adxlib") then
         Checker:=True;
      end if;

      if Adx.Lib.Regcheck.Regcheck(Dir_Path, "^/home/mcxbain/workspace/adxparse") then
         Checker:=True;
      end if;

      if Adx.Lib.Regcheck.Regcheck(Dir_Path, "^/home/mcxbain/workspace/adxserver") then
         Checker:=True;
      end if;

      if Adx.Lib.Regcheck.Regcheck(Dir_Path, "^/home/mcxbain/workspace/adxsqlite") then
         Checker:=True;
      end if;

      if Adx.Lib.Regcheck.Regcheck(Dir_Path, "^/home/mcxbain/workspace/server.*") then
         Checker:=True;
      end if;

      if Adx.Lib.Regcheck.Regcheck(Dir_Path, "^/home/mcxbain/workspace/sqlite.*") then
         Checker:=True;
      end if;

      if Checker then

         Adx.App.Rmheader.Make.MakeAll(Dir_Path);
         Adx.App.AddHeader.Make.MakeAll(Dir_Path);
         Adx.App.Format.Make.MakeAll(Dir_Path, Dictionary_String);
         Adx.App.Custom.Make.MakeAll(Dir_Path, Format_Option);

      else
         Put_Line("Directory not allowed..");
      end if;

   else

      Put_Line("Directory dosent exist..");

   end if;

end Main;

end Adx.Run.Parse;
