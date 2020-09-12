------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.MAKEHEADER                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
package Adx.Lib.Mkheader is

function Make_Header_Adb(My_String:String) return String;
function Make_Header_Ads(My_String:String) return String;
function Make_Line(My_String:String) return String;

end Adx.Lib.Mkheader;
