------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.SAVEPRINT                             --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Text_IO;

package body Adx.Lib.Saveprint is

------------------------------------------------------------------------------
-- Safe Print
------------------------------------------------------------------------------
task body Safe_Print is

   My_String:access String;

begin
   loop
      select

         accept Put(My_String:in String) do
            Safe_Print.My_String:=new String(My_String'Range);
            Safe_Print.My_String.all:=My_String;
         end Put;

         Ada.Text_IO.Put_Line(My_String.all);

      or
         terminate;
      end select;
   end loop;
end Safe_Print;

end Adx.Lib.Saveprint;
