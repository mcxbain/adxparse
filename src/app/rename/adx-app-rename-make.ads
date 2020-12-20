------------------------------------------------------------------------------
--                                                                          --
--                           ADX.APP.RENAME.MAKE                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
package Adx.App.Rename.Make is

   procedure MakeAll(Dir_Path:String; Old_Name:String; New_Name:String);
   procedure MakeRename(Dir_Path:String; Old_Name:String; New_Name:String);
   procedure MakeParse(Dir_Path:String; Old_Name:String; New_Name:String);

end Adx.App.Rename.Make;
