------------------------------------------------------------------------------
--                                                                          --
--                        ADX.APP.FORMAT.DICTIONARY                         --
--                                                                          --
--                                  A D A                                   --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
------------------------------------------------------------------------------
with Ada.Strings.Unbounded;
with Ada.Directories;

use Ada.Strings.Unbounded;

package body Adx.App.Format.Dictionary is

Cur_Directory:Unbounded_String;

procedure InitCurrentDirectory is
   Dir:constant String:=Ada.Directories.Current_Directory;
begin

   Cur_Directory:=To_Unbounded_String(Dir);

end InitCurrentDirectory;

function GetDictionaryFilename return String is

   File_Name:constant String:=To_String(Cur_Directory) & "/xxx.dic";
begin

   return File_Name;

end GetDictionaryFilename;

---------------
-- GetAdxLib --
---------------

function GetAdxLib return String_Vector_Type is

   My_Vector:String_Vector_Type;

begin

   My_Vector.Append("*CR*");
   My_Vector.Append("*LF*");

   return My_Vector;

end GetAdxLib;

function GetAdxParse return String_Vector_Type is

   My_Vector:String_Vector_Type;

begin

   --Adx Lib
   My_Vector.Append("*CR*");
   My_Vector.Append("*LF*");

   -- Add Header
   My_Vector.Append("*AddHeader*");
   My_Vector.Append("*AddHeaderSpec*");
   My_Vector.Append("*AddHeaderBody*");
   My_Vector.Append("*MakeAds*");
   My_Vector.Append("*MakeAdb*");
   My_Vector.Append("*MakeAll*");
   My_Vector.Append("*MakeRename*");
   My_Vector.Append("*MakeParse*");
   My_Vector.Append("*GetFilePath*");

   --
   My_Vector.Append("*ParseVector*");
   My_Vector.Append("*ParseRecord*");
   My_Vector.Append("*ParseFile*");

   --
   My_Vector.Append("*ParseVectorAds*");
   My_Vector.Append("*ParseRecordAds*");
   My_Vector.Append("*ParseVectorAdb*");
   My_Vector.Append("*ParseRecordAdb*");

   -- Transform
   My_Vector.Append("*TransformLineSpace*");
   My_Vector.Append("*TransformBrackets*");
   My_Vector.Append("*TransformColon*");
   My_Vector.Append("*TransformColonEqual*");

   -- dictionary ads
   My_Vector.Append("*InitCurrentDirectory*");
   My_Vector.Append("*GetDictionaryFilename*");
   My_Vector.Append("*GetAdxLib*");
   My_Vector.Append("*GetAdxParse*");
   My_Vector.Append("*GetAdxServer*");

   -- Remove Header
   My_Vector.Append("*RemoveHeader*");
   My_Vector.Append("*CheckLineBeginsWithHifen*");
   My_Vector.Append("*CheckFirstLineHasHifen*");
   My_Vector.Append("*RemoveHifen*");

   My_Vector.Append("*MakeExtend*");
   My_Vector.Append("*ParseDirectory*");

   return My_Vector;

end GetAdxParse;

function GetAdxServer return String_Vector_Type is

   My_Vector:String_Vector_Type;

begin

   My_Vector.Append("*CR*");
   My_Vector.Append("*LF*");
   My_Vector.Append("*MYSQL*");
   My_Vector.Append("*INSERT*");
   My_Vector.Append("*UPDATE*");
   My_Vector.Append("*DELETE*");
   My_Vector.Append("*CREATE*");
   My_Vector.Append("*SELECT*");
   My_Vector.Append("*PRINT_RESULT*");
   My_Vector.Append("*FREE_RESULT*");

   return My_Vector;

end GetAdxServer;

end Adx.App.Format.Dictionary;
