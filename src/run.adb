with Ada.Text_IO;
With Adx.Lib.Vectortype;
With Adx.App.Format.Dictionary;
With Adx.App.Format.Make;
With Adx.App.AddHeader.Make;
With Adx.App.RmHeader.Make;
With Adx.App.Custom.Make;
With Adx.App.Gnatmetric;
With Adx.App.Ucount;

use Ada.Text_IO;
Use Adx.Lib.Vectortype;

package body run is

   procedure RunAdxLib is 
      
      Dictionary_String:String_Vector_Type:= Adx.App.Format.Dictionary.GetAdxLib;
      Project_Dir:String:="/home/mcxbain/git/adxlib/src/";

      --Dictionary_String:String_Vector_Type:= Adx.App.Format.Dictionary.GetAdxTools;
      --Project_Dir:String:="/home/mcxbain/git/adxtools/src/";
    
   begin 
      
      
      Put_Line ("Run Adx Lib Code Formatter");

      Adx.App.RmHeader.Make.MakeAll(Project_Dir);
      Adx.App.AddHeader.Make.MakeAll(Project_Dir);
      Adx.App.Format.Make.MakeAll(Project_Dir, Dictionary_String);
      Adx.App.Custom.Make.MakeAll(Project_Dir);
      Adx.App.Ucount.Run(Project_Dir);
      
   end RunAdxLib;
   
   

end run;
