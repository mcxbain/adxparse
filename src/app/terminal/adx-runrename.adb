With Ada.Text_IO;
With Adx.Lib.Printchar;
With Adx.App.Rename.Make;

use Ada.Text_IO;

package body adx.runrename is

   procedure main(Dir_Path:String; Old_Name:String; New_Name:String) is
      
   begin 

      Adx.App.Rename.Make.MakeAll(Dir_Path, Old_Name, New_Name);
      
   end main;
   

end adx.runrename;
