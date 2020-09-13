pragma Ada_2012;

With Ada.Text_IO;
Use Ada.Text_IO;


package body spark with SPARK_Mode is


   -------------
   -- my_test --
   -------------

   procedure my_test(My_Number: in Integer) is

   begin
      put_line(Integer'Image(My_Number));
      put_line( "my_test");
   end my_test;



   ------------
   -- my_run --
   ------------

   procedure my_run is
   begin
      put_line( "my_run");
      my_test(12);
   end my_run;
   
   
   procedure Increment(X : in out Integer)
   is
   begin
    
      X := X + 1;
    
      
   end Increment;

end spark;
