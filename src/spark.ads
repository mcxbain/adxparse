package spark with SPARK_Mode is 


     procedure my_test(My_Number:Integer);
   --  Creates a directory with name New_Directory. The Form parameter can be
   --  used to give system-dependent characteristics of the directory; the
   --  interpretation of the Form parameter is implementation-defined. A null
   --  string for Form specifies the use of the default options of the
   --  implementation of the new directory. The exception Name_Error is
   --  propagated if the string given as New_Directory does not allow the
   --  identification of a directory. The exception Use_Error is propagated if
   --  the external environment does not support the creation of a directory
   --  with the given name (in the absence of Name_Error) and form.
   --
   --  The Form parameter is ignored
   
   procedure my_run;
   --  Deletes an existing empty directory with name Directory. The exception
   --  Name_Error is propagated if the string given as Directory does not
   --  identify an existing directory. The exception Use_Error is propagated
   --  if the external environment does not support the deletion of the
   --  directory (or some portion of its contents) with the given name (in the
   --  absence of Name_Error).
   
   
   procedure Increment(X : in out Integer) with
     Global  => null,
     Depends => (X => X),
     Pre     => X < Integer'Last,
     Post    => X = X'Old + 1;
   

end spark;
