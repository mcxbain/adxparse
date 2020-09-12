------------------------------------------------------------------------------
--                                                                          --
--                              ADX.LIB.TYPES                               --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 S p e c                                  --
--                                                                          --
------------------------------------------------------------------------------
package Adx.Lib.Types is

subtype Long_Natural is Long_Integer range 0 .. Long_Integer'Last;
subtype Long_Positive is Long_Integer range 1 .. Long_Integer'Last;

--subtype ROW_ID_TYPE is Long_Integer range 1 .. Long_Integer'Last;
--subtype ROW_TIME_TYPE is Long_Integer range 1 .. Long_Integer'Last;

end Adx.Lib.Types;
