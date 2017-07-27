unit Utils;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  StdCtrls,
  Shellapi,
  Printers,
  cxGraphics,
  cxControls;

function GetWindowsTempPath : String;
function IsEmptyOrNull(Value: String): Boolean;
function PutLastBackSlash(Path: TFileName): TFileName;

implementation

function GetWindowsTempPath : String;
var
  Path : PChar;

begin
  GetMem(Path, MAX_PATH);
  try
    StrPCopy(Path, '');

    GetTempPath(MAX_PATH, Path);

    if IsEmptyOrNull(StrPas(Path)) or (not DirectoryExists(StrPas(Path))) then
      StrPCopy(Path, 'C:\TEMP\');

    if not DirectoryExists(StrPas(Path)) then
      ForceDirectories(StrPas(Path));

    Result := PutLastBackSlash(StrPas(Path));
  finally
    FreeMem( Path, Max_Path);
  end;
end;

function IsEmptyOrNull(Value: String): Boolean;
begin
  Result := (Trim(Value) = '') or (Value = Null);
end;

function PutLastBackSlash(Path: TFileName): TFileName;
begin
  Result := Trim(Path);
  if (Result <> '') then
    if (Copy(Result, Length( Result ), 1 ) <> '\') then
      Result := Result + '\';
end;


end.
