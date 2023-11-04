unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btnStart: TButton;
    edtPort: TEdit;
    Label1: TLabel;
    procedure btnStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Horse, Horse.Jhonson, System.JSON;

procedure TForm1.btnStartClick(Sender: TObject);
var
  Users: TJSONArray;
begin
  THorse.Use(Jhonson());

  Users := TJSONArray.Create;
  try
    THorse.Get('/users',
      procedure(Req: THorseRequest; Res: THorseResponse)
      begin
        Res.Send<TJSONAncestor>(Users.Clone);
      end);

    THorse.Post('/users',
      procedure(Req: THorseRequest; Res: THorseResponse)
      var
        User: TJSONObject;
      begin
        User := TJSONObject(Req.Body<TJSONObject>.Clone);
        Users.AddElement(User);
        Res.Send<TJSONAncestor>(Users.Clone);
      end);

    THorse.Post('/ml',
      procedure(Req: THorseRequest; Res: THorseResponse)
      var
        request: String;
      begin
        request := Req.Body;
        Res.Status(THTTPStatus.OK);
      end);

    THorse.Listen(StrToInt(edtPort.Text));
  finally
    Users.Free;
  end;
end;

end.
