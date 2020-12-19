------------------------------------------------------------------------------
--                                                                          --
--                           ADX.APP.RENAME.FILE                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Replace;
with Adx.Lib.Readdir;
with Adx.Lib.Renamefile;
with Adx.Lib.Stringmod;

use Adx.Lib.Readdir;

package body Adx.App.Rename.File is

------------------------------------------------------------------------------
-- Get File Path
------------------------------------------------------------------------------
function GetFilePath(Dir_Path:String; File_Name:String; Result:out Unbounded_String) return Boolean is

   My_Vector:Directory_Vector_Type;
   My_Record:Directory_Record_Type;
   Has_Match:Boolean:=False;
   File_Error:exception;

begin

   My_Vector:=Adx.Lib.Readdir.Readdir(Dir_Path, "");

   for I in My_Vector.First_Index .. My_Vector.Last_Index loop

      My_Record:=My_Vector.Element(Index => I);

      if File_Name = To_String(My_Record.File_Name) then

         Result:=My_Record.File_Path;
         Has_Match:=True;
         exit;

      end if;

   end loop;

   if not Has_Match then

      raise File_Error with "File not found";

   end if;

   return Has_Match;

end GetFilePath;

------------------------------------------------------------------------------
-- Rename
----------------------------------------------------------------------------
procedure Rename(Dir_Path:String; Old_Name:String; New_Name:String; File_Type:String) is

   --Old_Name_Lc:String:=Adx.Lib.Stringmod.String_To_Lower_All(Old_Name);
   --New_Name_Lc:String:=Adx.Lib.Stringmod.String_To_Lower_All(New_Name);
   --Old_File_Name:String:=Adx.Lib.Replace.Replace(Old_Name_Lc, ".", "-") & File_Type;
   --New_File_Name:String:=Adx.Lib.Replace.Replace(New_Name_Lc, ".", "-") & File_Type;
   Old_File_Name:constant String:=Adx.Lib.Stringmod.String_To_Lower_All(Old_Name) & File_Type;
   New_File_Name:constant String:=Adx.Lib.Stringmod.String_To_Lower_All(New_Name) & File_Type;

   Old_File_Path:Unbounded_String;
   New_File_Path:Unbounded_String;

   Has_Match:Boolean;

begin

   Has_Match:=GetFilePath(Dir_Path, Old_File_Name, Old_File_Path);

   if Has_Match then

      New_File_Path:=To_Unbounded_String(Adx.Lib.Replace.Replace(To_String(Old_File_Path), Old_File_Name, New_File_Name));

      -- do rename
      Adx.Lib.Renamefile.Renamefile(To_String(Old_File_Path), To_String(New_File_Path));

   end if;

end Rename;

end Adx.App.Rename.File;
