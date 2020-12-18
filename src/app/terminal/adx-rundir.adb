with Ada.Text_IO;
With Adx.Lib.Vectortype;
with Adx.Lib.Dircheck;
with Adx.Lib.Regcheck;
with Adx.App.Format.Dictionary;
with Adx.App.Format.Make;
with Adx.App.AddHeader.Make;
with Adx.App.RmHeader.Make;
with Adx.App.Custom.Make;


use Ada.Text_IO;
use Adx.Lib.Vectortype;


package body adx.rundir is

   procedure ParseDirectory(Dir_Path:String; Dic_Name:String) is
      
      Dictionary_String:String_Vector_Type;
      Checker:Boolean:=False;
      
   begin
      
      if Dic_Name = "adxlib" then
         Dictionary_String:=Adx.App.Format.Dictionary.GetAdxLib;
      elsif
        Dic_Name = "adxformat" then
        Dictionary_String:=Adx.App.Format.Dictionary.GetAdxFormat;
      end if;
      
      
      --check if dir exists;
      if Adx.Lib.Dircheck.Dircheck(Dir_Path) then

         --to avoid anny danger we just add here allowed directorys
         if Adx.Lib.Regcheck.Regcheck(Dir_Path, "^/home/mcxbain/git") then
            Checker:=True;
         end if;

         if Adx.Lib.Regcheck.Regcheck(Dir_Path, "^/home/mcxbain/ada/parse09/src/lib") then
            Checker:=True;
         end if;

         if Adx.Lib.Regcheck.Regcheck(Dir_Path, "^/home/mcxbain/workspace") then
            Checker:=True;
         end if;
         
         if Adx.Lib.Regcheck.Regcheck(Dir_Path, "^/home/mcxbain/ada/parse09/src/app/modul") then
            Checker:=True;
         end if;
         
         if Adx.Lib.Regcheck.Regcheck(Dir_Path, "^/home/mcxbain/ada/adxlib") then
            Checker:=True;
         end if;

         if Checker = True then

            Adx.App.RmHeader.Make.MakeAll(Dir_Path);
            Adx.App.AddHeader.Make.MakeAll(Dir_Path);
            Adx.App.Format.Make.MakeAll(Dir_Path, Dictionary_String);
            Adx.App.Custom.Make.MakeAll(Dir_Path);

         else
            Put_Line("Directory not allowed..");
         end if;

      else

         Put_Line("Directory dosent exist..");

      end if;
  
   end ParseDirectory;

end adx.rundir;