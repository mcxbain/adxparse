with Ada.Text_IO;
With Adx.App.Header.Run;
With Adx.App.Custom.Run;
With Adx.App.Gnatpp;
With Adx.App.Gnatmetric;

use Ada.Text_IO;

package Body Adx.App.Run is
 
  procedure Main is 
  
      Project_File:String:="/home/mcxbain/git/adxlib/default.gpr";
      Project_Dir:String:="/home/mcxbain/git/adxlib/src/";
  begin 
  
      Put_Line ("Run Adx Code Formatter");


        Adx.App.Gnatpp.X16Format(Project_File);
        Adx.App.Header.Run.RunAll(Project_Dir);
        Adx.App.Custom.Run.RunAll(Project_Dir);
      --Adx.App.Gnatmetric.Run(Project_File);
      
      

      -- Single File
      --File_Vector := Adx.Lib.Readfile.Readfile("/home/mcxbain/ada/test01/src/lib/adx-lib-randomalpha.ads");
      --My_Vector:=Adx.Code.Custom.Make.ParseFile(File_Vector);
      --Print_Vector(My_Vector);
  
  end Main;

end Adx.App.Run;
