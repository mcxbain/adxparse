With Ada.Text_IO;
With Ada.Strings.Unbounded;
With Adx.Lib.Vectortype;
With Adx.Lib.Readdir;
With Adx.Lib.Sysout;
With Adx.Lib.Writefile;
With Adx.Lib.Deletefile;
With Adx.App.Format.Dictionary;

Use ada.Text_IO;
Use Ada.Strings.Unbounded;
Use Adx.Lib.Readdir;


package Body Adx.App.Format.Parse is

------------------------------------------------------------------------------
-- Parse Vector
------------------------------------------------------------------------------
procedure ParseVector(My_Vector:Directory_Vector_Type) is

 My_Record : Directory_Record_Type;
 
begin

    for I in My_Vector.First_Index .. My_Vector.Last_Index loop

         My_Record := (My_Vector.Element (Index => I));
         ParseRecord(My_Record);
         
    end loop;

end ParseVector;


------------------------------------------------------------------------------
-- Parse Record
------------------------------------------------------------------------------
procedure ParseRecord(My_Record:Directory_Record_Type) is

      File_Path:String:=To_String(My_Record.File_Path);
      Dic_File:String:=Adx.App.Format.Dictionary.GetDictionaryFileName;
      Result : Unbounded_String;
      
begin


      put_Line(File_Path);
      Result := Adx.Lib.Sysout.Sysout("gnatpp -D "&Dic_File&" --use-on-new-line --RM-style-spacing -A1 -c1 -aM -nM -i3 -M256 -rnb " & File_Path);
      
      -- do not chnage comments
       --Result := Adx.Lib.Sysout.Sysout("gnatpp -D "&Dic_File&" --comments-fill --use-on-new-line --RM-style-spacing -A1 -c1 -aM -nM -i3 -M256 -rnb " & File_Path);
            

   end ParseRecord;
   
   
   


end Adx.App.Format.Parse;
