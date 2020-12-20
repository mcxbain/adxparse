------------------------------------------------------------------------------
--                                                                          --
--                           ADX.APP.CUSTOM.PARSE                           --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.Lib.Readfile;
with Adx.Lib.Writefile;
with Adx.App.Custom.Transform;

use Ada.Text_IO;
use Ada.Strings.Unbounded;

package body Adx.App.Custom.Parse is

------------------------------------------------------------------------------
-- Parse Vector
------------------------------------------------------------------------------
procedure ParseVector(My_Vector:Directory_Vector_Type; Format_Option:String) is

   My_Record:Directory_Record_Type;

begin

   for I in My_Vector.First_Index .. My_Vector.Last_Index loop

      My_Record:=(My_Vector.Element(Index => I));
      ParseRecord(My_Record, Format_Option);

   end loop;

end ParseVector;

------------------------------------------------------------------------------
-- Parse Record
------------------------------------------------------------------------------
procedure ParseRecord(My_Record:Directory_Record_Type; Format_Option:String) is

   File_Path:constant String:=To_String(My_Record.File_Path);
   File_Vector:String_Vector_Type;
   Result_Vector:String_Vector_Type;

begin

   --put_line(To_String(My_Record.File_Path));

   File_Vector:=Adx.Lib.Readfile.Readfile(File_Path);
   --Print_Vector(File_Vector);

   -- check if the file is empty
   if Get_Vector_Length(File_Vector) > 0 then

      Put_Line(File_Path);
      Result_Vector:=ParseFile(File_Vector, Format_Option);
      Adx.Lib.Writefile.Writefile(File_Path, Result_Vector);

   end if;

end ParseRecord;

------------------------------------------------------------------------------
-- Parse File
------------------------------------------------------------------------------
function ParseFile(My_Vector:String_Vector_Type; Format_Option:String) return String_Vector_Type is

   Result_Vector:String_Vector_Type;
   My_String:Unbounded_String;

begin

   for I in My_Vector.First_Index .. My_Vector.Last_Index loop

      My_String:=To_Unbounded_String(My_Vector.Element(Index => I));

      if Format_Option = "removespace" then
         My_String:=To_Unbounded_String(Adx.App.Custom.Transform.TransformLineSpace(To_String(My_String)));
      end if;

      -- My_String:=To_Unbounded_string(Adx.App.Custom.Transform.TransformBrackets(To_String(My_String)));
      My_String:=To_Unbounded_String(Adx.App.Custom.Transform.TransformColon(To_String(My_String)));
      My_String:=To_Unbounded_String(Adx.App.Custom.Transform.TransformColonEqual(To_String(My_String)));

      Result_Vector.Append(To_String(My_String));

   end loop;

   return Result_Vector;

end ParseFile;

end Adx.App.Custom.Parse;
