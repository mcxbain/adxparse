------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.PROCESS                              --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.Lib.Vectortype;
use Adx.Lib.Vectortype;

package Adx.Lib.Process is

------------------------------------------------------------------------------
-- Linux Process Functions
-- First PID Starts With Zero to 32768 cat /proc/sys/kernel/pid_max Type PID_TYPE is new Natural range 0 .. 32768 pid_max Seems to be system dependend
------------------------------------------------------------------------------

function Get_Process_Id return Natural;
function Get_Process_List return String_Vector_Type;
function Get_Process_Name_From_Process_Id(Process_Id:Natural) return String;
function Get_Process_List_From_Process_Name(Process_Name:String) return String_Vector_Type;
function Get_Process_Id_List_From_Process_Name(Process_Name:String) return String_Vector_Type;
procedure Terminate_Process(Process_Id:Natural);

end Adx.Lib.Process;
