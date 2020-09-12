with Ada.Text_IO;
use Ada.Text_IO;

--pragma SPARK_Mode(on);


package Body Loophole is


procedure Add(Number: in out Integer) is

--pragma Suppress (All_Checks);  -- eliminate check overhead
--pragma Suppress (Range_Check);
--pragma Suppress (Overflow_Check);


begin 

Number:=Number+5;



end Add;



procedure Run is

-- Loophole Feature
-- https://www.adacore.com/gems/gem-63
-- https://en.wikibooks.org/wiki/Ada_Programming/Pragmas/Suppress
-- https://www.adaic.org/resources/add_content/standards/05rm/html/RM-11-5.html

MY_Number:Integer:=4;
begin 

Add(MY_Number);

put_line(Integer'Image(My_Number));


end Run;



end Loophole;
