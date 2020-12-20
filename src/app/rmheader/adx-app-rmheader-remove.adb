------------------------------------------------------------------------------
--                                                                          --
--                         ADX.APP.RMHEADER.REMOVE                          --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;
use Ada.Text_IO;

package body Adx.App.Rmheader.Remove is

   function RemoveHeader(My_Vector:String_Vector_Type) return String_Vector_Type is

      Has_Hifen:Boolean:=False;
      Result_Vector:String_Vector_Type;

   begin

      Has_Hifen:=CheckFirstLineHasHifen(My_Vector);

      if Has_Hifen then

         Put_Line("First Line Has Hifen Removing");
         Result_Vector:=RemoveHifen(My_Vector);

      else

         Result_Vector:=My_Vector;

      end if;

      return Result_Vector;

   end RemoveHeader;

   function CheckLineBeginsWithHifen(My_String:String) return Boolean is

      Has_Hifen:Boolean;

   begin

      if My_String'Length > 1 then

         declare
            First_String:constant String:=My_String(My_String'First .. My_String'First + 1);
         begin

            if First_String = "--" then
               Has_Hifen:=True;
            else
               Has_Hifen:=False;

            end if;

         end;

      else

         Has_Hifen:=False;

      end if;

      return Has_Hifen;

   end CheckLineBeginsWithHifen;

   function CheckFirstLineHasHifen(My_Vector:String_Vector_Type) return Boolean is

      Has_Hifen:Boolean:=False;

   begin

      Has_Hifen:=CheckLineBeginsWithHifen(My_Vector.Element(Index => 1));

      if Has_Hifen then
         return True;
      else
         return False;
      end if;

   end CheckFirstLineHasHifen;

   function RemoveHifen(My_Vector:String_Vector_Type) return String_Vector_Type is

      Has_Hifen:Boolean;
      Result_Vector:String_Vector_Type:=My_Vector;

   begin

      -- interate over the vector
      for I in My_Vector.First_Index .. My_Vector.Last_Index loop

         Has_Hifen:=CheckLineBeginsWithHifen(My_Vector.Element(Index => I));

         if Has_Hifen then
            -- delete the first element
            Result_Vector.Delete_First;
         else
            --exit by first occurence of no hifen
            exit;
         end if;

      end loop;

      return Result_Vector;

   end RemoveHifen;

end Adx.App.Rmheader.Remove;
