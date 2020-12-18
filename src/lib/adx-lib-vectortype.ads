------------------------------------------------------------------------------
--                                                                          --
--                            ADX.LIB.VECTORTYPE                            --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Containers.Indefinite_Vectors;
use Ada.Containers;

package Adx.Lib.Vectortype is

------------------------------------------------------------------------------
-- STRING VECTOR TYPE
------------------------------------------------------------------------------
package Vector_Container is new Indefinite_Vectors(Index_Type => Positive, Element_Type => String);
subtype String_Vector_Type is Vector_Container.Vector;

------------------------------------------------------------------------------
-- STRING VECTOR FUNCTIONS
------------------------------------------------------------------------------
procedure Print_Vector(My_Vector:in String_Vector_Type);
function Get_Vector_Length(My_Vector:String_Vector_Type) return Natural;

end Adx.Lib.Vectortype;
