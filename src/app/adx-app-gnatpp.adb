with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.Lib.Sysout;
With Adx.Lib.Writefile;
With Adx.Lib.Stringtype;

use Ada.Text_IO;
use Ada.Strings.Unbounded;
use Adx.Lib.Stringtype;

package body Adx.App.Gnatpp is

   procedure DefaultFormat (Project_File : String) is

      Result : Unbounded_String;

   begin

      Put_Line ("Default Format");
      
       -- Default
       -- Result := Adx.Linux.Sysout.Sysout ("gnatpp -A1 -c1 -aM -nM -i3 -M256 -rf -P " & Project_File);
      
       -- no backup -rnb
       --Result := Adx.Linux.Sysout.Sysout ("gnatpp -A1 -c1 -aM -nM -i3 -M256 -rnb -P " & Project_File);
       
       -- set alignment off
       --Result := Adx.Lib.Sysout.Sysout ("gnatpp --use-on-new-line -A0 -c1 -aM -nM -i3 -M256 -rnb -P " & Project_File);
       
       -- set alignment on
       Result := Adx.Lib.Sysout.Sysout ("gnatpp -D dict1 --use-on-new-line --RM-style-spacing -A1 -c1 -aM -nM -i3 -M256 -rnb -P " & Project_File);
       

      Put_Line (To_String (Result));

   end DefaultFormat;
   
   
   procedure X16Format (Project_File : String) is
   
    Result : Unbounded_String;
   begin 
   
   WriteAdxlibDicFile;
   
   Put_Line ("X16 Format");
   Result := Adx.Lib.Sysout.Sysout ("gnatpp -D adxlib.dic --use-on-new-line --RM-style-spacing -A1 -c1 -aM -nM -i3 -M256 -rnb -v -P " & Project_File);
   --Put_Line (To_String (Result));
   
   end X16Format;
   
   
   procedure WriteAdxlibDicFile is
   
   File_Name:String:="adxlib.dic";
   My_Vector : String_Vector_Type;
   
   begin 
   
   My_Vector.Append("*CR*");
   My_Vector.Append("*LF*");
   
   Adx.Lib.Writefile.Writefile(File_Name, My_Vector);
   
   end WriteAdxlibDicFile;
   
   

end Adx.App.Gnatpp;
