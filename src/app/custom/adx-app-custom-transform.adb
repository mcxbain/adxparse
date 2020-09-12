With Ada.Strings.Unbounded;
With Adx.Lib.Replace;

use Ada.Strings.Unbounded;


package Body Adx.App.Custom.Transform is

------------------------------------------------------------------------------
-- Transform Line Space
------------------------------------------------------------------------------
   function TransformLineSpace(My_String:String) return String is
   
    Result:Unbounded_String:=To_Unbounded_String(My_String);
    
   begin
   
   if My_String'Length > 3 then
   
         declare
            substr:String:=My_String(My_String'First .. My_String'First+2);
    
         begin
   
            if substr = "   " then
   
               -- put_line("has line space");
               Result:=To_Unbounded_String(My_String(My_String'First+3 .. My_String'Last));
   
            end if;
         
         end;
   
   end if;
   
      return To_String(Result);
   
   end TransformLineSpace;

------------------------------------------------------------------------------
-- Transform Brackets
------------------------------------------------------------------------------
   function TransformBrackets(My_String:String) return String is
   
    Result:Unbounded_String;
    
   begin 
   
      Result:=To_Unbounded_String(Adx.Lib.Replace.Replace(My_String, " (", "("));
      return To_String(Result);
   
   end TransformBrackets;
   
------------------------------------------------------------------------------
-- Transform Colon
------------------------------------------------------------------------------  
   function TransformColon(My_String:String) return String is
   
    Result:Unbounded_String;
    
   begin 
    
      Result:=To_Unbounded_String(Adx.Lib.Replace.Replace(My_String, ": ", ":"));
      return To_String(Result);
   
   end TransformColon;
   
   
------------------------------------------------------------------------------
-- Transform Colon Equal
------------------------------------------------------------------------------  
   function TransformColonEqual(My_String:String) return String is
   
       Result:Unbounded_String;
       
   begin 
    
      Result:=To_Unbounded_String(Adx.Lib.Replace.Replace(My_String, " := ", ":="));
      return To_String(Result);
   
   end TransformColonEqual;
   

end Adx.App.Custom.Transform;
