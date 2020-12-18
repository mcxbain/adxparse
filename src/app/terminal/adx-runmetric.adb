with Adx.App.Metric.Make;

package body adx.runmetric is

   procedure main(Project_File:String) is
      
   begin
      Adx.App.Metric.Make.MakeAll(Project_File);
   end main;

end adx.runmetric;
