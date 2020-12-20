------------------------------------------------------------------------------
--                                                                          --
--                           ADX.APP.UCOUNT.MAKE                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
with Ada.Strings.Unbounded;
with Adx.Lib.Filelist;
with Adx.Lib.Readdir;
with Adx.Lib.Sort;
with Adx.Lib.Replace;
with Adx.Lib.Stringmod;

use Ada.Text_IO;
use Ada.Strings.Unbounded;
use Adx.Lib.Readdir;

package body Adx.App.Ucount.Make is

------------------------------------------------------------------------------
-- Make All
------------------------------------------------------------------------------
   procedure MakeAll(Dir_Path:String) is

      My_Vector:Directory_Vector_Type;
      My_Record:Directory_Record_Type;
      Result_Vector:String_Vector_Type;

   begin

      My_Vector:=Adx.Lib.Filelist.Get_File_List_Ads(Dir_Path);

      for I in My_Vector.First_Index .. My_Vector.Last_Index loop

         My_Record:=(My_Vector.Element(Index => I));
         Result_Vector.Append(To_String(My_Record.File_Name));

      end loop;

      Result_Vector:=Adx.Lib.Sort.Sort(Result_Vector);

      MakeExtend(Result_Vector);

   end MakeAll;

   procedure MakeExtend(My_Vector:String_Vector_Type) is

      My_String:Unbounded_String;
   begin

      --Print_Vector(My_Vector);
      --put_line("test");

      for I in My_Vector.First_Index .. My_Vector.Last_Index loop

         My_String:=To_Unbounded_String((My_Vector.Element(Index => I)));
         My_String:=To_Unbounded_String(Adx.Lib.Replace.Replace(To_String(My_String), ".ads", ""));
         My_String:=To_Unbounded_String(Adx.Lib.Replace.Replace(To_String(My_String), "-", "."));
         My_String:=To_Unbounded_String(Adx.Lib.Stringmod.String_To_Upper_First_Sep(To_String(My_String), "."));

         Put("with ");
         Put(To_String(My_String));
         Put(";");
         New_Line;
      end loop;

   end MakeExtend;

end Adx.App.Ucount.Make;
