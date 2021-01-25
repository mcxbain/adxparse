------------------------------------------------------------------------------
--                                                                          --
--                         ADX.APP.CUSTOM.TRANSFORM                         --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
package Adx.App.Custom.Transform is

function TransformLineSpace(My_String:String) return String;
function TransformBrackets(My_String:String) return String;
function TransformColon(My_String:String) return String;
function TransformColonEqual(My_String:String) return String;
function Transformampersand(My_String:String) return String;

end Adx.App.Custom.Transform;
