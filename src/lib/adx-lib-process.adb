------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.PROCESS                              --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Strings.Unbounded;
with Adx.Lib.Stringtype;
with Adx.Lib.Tokenize;
with Adx.Lib.Regmatch;
with Adx.Lib.Stringmod;
with Adx.Lib.Regvector;
with Adx.Lib.Sysout;

use Ada.Strings.Unbounded;
use Adx.Lib.Stringtype;

package body Adx.Lib.Process is

------------------------------------------------------------------------------
-- Getpid Imported C Function
------------------------------------------------------------------------------
function Getpid return Integer;
pragma Import(C, Getpid);

------------------------------------------------------------------------------
-- Get Process Id
------------------------------------------------------------------------------
function Get_Process_Id return Natural is

-- PID Starts with Zero
   Process_Id:Natural:=Getpid;

begin

   return Process_Id;

end Get_Process_Id;

------------------------------------------------------------------------------
-- Get Process List
------------------------------------------------------------------------------
function Get_Process_List return String_Vector_Type is

   LF:String(1 .. 1):=(1 => ASCII.LF);
   Result:Unbounded_String;
   My_Vector:String_Vector_Type;

begin

   Result:=Sysout.Sysout("ps -ax");
   My_Vector:=Adx.Lib.Tokenize.Tokenize(To_String(Result), LF);

   return My_Vector;

end Get_Process_List;

------------------------------------------------------------------------------
-- Get Process List From Process Name
------------------------------------------------------------------------------
function Get_Process_List_From_Process_Name(Process_Name:String) return String_Vector_Type is

   My_Vector:String_Vector_Type:=Get_Process_List;
   Result_Vector:String_Vector_Type;
   Process_Name_Escape:String:=Adx.Lib.Stringmod.Escape_Regexp(Process_Name);
   Pattern:String:="(.*" & Process_Name_Escape & ")";

begin

   Result_Vector:=Adx.Lib.Regvector.Regvector(My_Vector, Pattern);

   return Result_Vector;

end Get_Process_List_From_Process_Name;

------------------------------------------------------------------------------
-- Get Process Id List From Process Name
------------------------------------------------------------------------------
function Get_Process_Id_List_From_Process_Name(Process_Name:String) return String_Vector_Type is

   My_Vector:String_Vector_Type:=Get_Process_List_From_Process_Name(Process_Name);
   Result_Vector:String_Vector_Type;
   Result_Vector2:String_Vector_Type;
   Pattern:String:="(.*) pts";

begin

   Result_Vector:=Adx.Lib.Regvector.Regvector(My_Vector, Pattern);

   for I in Result_Vector.First_Index .. Result_Vector.Last_Index loop

      -- IDs muessen noch getrimmt werden
      Result_Vector2.Append(Adx.Lib.Stringmod.Trim_Whitespace(Result_Vector.Element(Index => I)));

   end loop;

   return Result_Vector2;

end Get_Process_Id_List_From_Process_Name;

------------------------------------------------------------------------------
-- Get Process Name From Process Id
------------------------------------------------------------------------------
function Get_Process_Name_From_Process_Id(Process_Id:Natural) return String is

   Command:String:="ps -p " & Natural'Image(Process_Id) & " -o command=";
   Result:Unbounded_String;

begin

   Result:=Sysout.Sysout(Command);
   Result:=To_Unbounded_String(Adx.Lib.Stringmod.Trim_LF(To_String(Result)));

   return To_String(Result);

end Get_Process_Name_From_Process_Id;

------------------------------------------------------------------------------
-- Terminate Process
------------------------------------------------------------------------------
procedure Terminate_Process(Process_Id:Natural) is

   Process_Id_String:String:=Adx.Lib.Stringmod.Integer_To_String(Process_Id);
   Command:String:="kill -9 " & Process_Id_String;
   Result:Unbounded_String;

begin

   Result:=Sysout.Sysout(Command);

end Terminate_Process;

end Adx.Lib.Process;
