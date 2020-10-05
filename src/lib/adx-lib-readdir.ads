------------------------------------------------------------------------------
--                                                                          --
--                             ADX.LIB.READDIR                              --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Containers.Indefinite_Vectors;
with Ada.Strings.Unbounded;

use Ada.Containers;
use Ada.Strings.Unbounded;

package Adx.Lib.Readdir is

------------------------------------------------------------------------------
-- READDIR RECORD
------------------------------------------------------------------------------
type Directory_Record_Type is record
   File_Name:Unbounded_String;
   File_Path:Unbounded_String;
end record;

------------------------------------------------------------------------------
-- READDIR VECTOR
------------------------------------------------------------------------------
package Vector_Container is new Indefinite_Vectors(Index_Type => Positive, Element_Type => Directory_Record_Type);
subtype Directory_Vector_Type is Vector_Container.Vector;

function Readdir(Dir_Path:String; File_Extension:String) return Directory_Vector_Type;
procedure Walk(Name:String; Pattern:String; My_Vector:in out Directory_Vector_Type);

end Adx.Lib.Readdir;
