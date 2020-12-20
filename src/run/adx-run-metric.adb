------------------------------------------------------------------------------
--                                                                          --
--                              ADX.RUN.METRIC                              --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Adx.App.Metric.Make;

package body Adx.Run.Metric is

procedure Main(Project_File:String) is

begin

   Adx.App.Metric.Make.MakeAll(Project_File);

end Main;

end Adx.Run.Metric;
