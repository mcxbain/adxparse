with Ada.Directories;

package Body Adx.lib.deletefile is

   procedure Deletefile(File_Name:String) is
      
   begin
      
      Ada.Directories.Delete_File(File_Name);
    
      
   end Deletefile;
   

end Adx.lib.deletefile;
