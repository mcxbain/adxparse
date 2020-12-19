------------------------------------------------------------------------------
--                                                                          --
--                           ADX.APP.FORMAT.PARSE                           --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.Lib.Sysout;
with Adx.App.Format.Dictionary;

use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body Adx.App.Format.Parse is

------------------------------------------------------------------------------
-- Parse Vector
------------------------------------------------------------------------------
procedure ParseVector(My_Vector:Directory_Vector_Type) is

   My_Record:Directory_Record_Type;

begin

   for I in My_Vector.First_Index .. My_Vector.Last_Index loop

      My_Record:=(My_Vector.Element(Index => I));
      ParseRecord(My_Record);

   end loop;

end ParseVector;

------------------------------------------------------------------------------
-- Parse Record
------------------------------------------------------------------------------
procedure ParseRecord(My_Record:Directory_Record_Type) is

   File_Path:constant String:=To_String(My_Record.File_Path);
   Dic_File:constant String:=Adx.App.Format.Dictionary.GetDictionaryFilename;
   Result:Unbounded_String;

   --  This suppresses warnings about the entities being unreferenced
   pragma Unreferenced(Result);

begin

   Put_Line(File_Path);
   Result:=Adx.Lib.Sysout.Sysout("gnatpp -D " & Dic_File & " --use-on-new-line --RM-style-spacing -A1 -c1 -aM -nM -i3 -M256 -rnb " & File_Path);

   -- do not chnage comments
   --Result:=Adx.Lib.Sysout.Sysout("gnatpp -D "&Dic_File&" --comments-fill --use-on-new-line --RM-style-spacing -A1 -c1 -aM -nM -i3 -M256 -rnb " & File_Path);

   -- no dic
   --Result:=Adx.Lib.Sysout.Sysout("gnatpp --use-on-new-line --RM-style-spacing -A1 -c1 -aM -nM -i3 -M256 -rnb " & File_Path);

end ParseRecord;

end Adx.App.Format.Parse;
