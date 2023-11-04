object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 181
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 22
    Height = 15
    Caption = 'Port'
  end
  object btnStart: TButton
    Left = 8
    Top = 58
    Width = 105
    Height = 25
    Caption = 'Start Application'
    TabOrder = 0
    OnClick = btnStartClick
  end
  object edtPort: TEdit
    Left = 8
    Top = 29
    Width = 121
    Height = 23
    TabOrder = 1
    Text = '9901'
  end
end
