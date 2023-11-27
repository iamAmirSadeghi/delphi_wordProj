object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'Word'
  ClientHeight = 451
  ClientWidth = 907
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  PopupMenu = PopupMenu1
  TextHeight = 15
  object board: TRichEdit
    Left = -2
    Top = 8
    Width = 913
    Height = 436
    Alignment = taRightJustify
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 0
    OnChange = boardChange
  end
  object AlignmentBox: TGroupBox
    Left = 264
    Top = 8
    Width = 185
    Height = 105
    Caption = 'Alignment'
    TabOrder = 2
    Visible = False
    object Right_Button: TButton
      Left = 136
      Top = 16
      Width = 46
      Height = 73
      Caption = '>>'
      TabOrder = 0
      OnClick = Right_ButtonClick
    end
    object Left_Button: TButton
      Left = 3
      Top = 16
      Width = 46
      Height = 73
      Caption = '<<'
      TabOrder = 1
      OnClick = Left_ButtonClick
    end
    object Center_Button: TButton
      Left = 55
      Top = 32
      Width = 75
      Height = 41
      Caption = '='
      TabOrder = 2
      OnClick = Center_ButtonClick
    end
    object BoxClose_Button: TButton
      Left = 71
      Top = 79
      Width = 42
      Height = 23
      Caption = 'Close'
      TabOrder = 3
      OnClick = BoxClose_ButtonClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 432
    Width = 907
    Height = 19
    Color = clDefault
    Panels = <>
  end
  object PopupMenu1: TPopupMenu
    Left = 56
    Top = 296
    object File2: TMenuItem
      Action = New
    end
    object Open1: TMenuItem
      Action = Open
    end
    object Open2: TMenuItem
      Action = Save
    end
    object Saveas1: TMenuItem
      Action = Save_As
    end
    object Font3: TMenuItem
      Action = Font
    end
    object Font4: TMenuItem
      Action = Alignment
    end
    object FindAndReplace2: TMenuItem
      Action = FindAndReplace
    end
    object Color1: TMenuItem
      Action = Color
    end
    object Saveas2: TMenuItem
      Action = Exit
    end
  end
  object MainMenu1: TMainMenu
    Left = 136
    Top = 288
    object File3: TMenuItem
      Caption = 'File'
      object File4: TMenuItem
        Action = New
      end
      object Open3: TMenuItem
        Action = Open
      end
      object Open4: TMenuItem
        Action = Save
      end
      object SaveAs3: TMenuItem
        Action = Save_As
      end
      object SaveAs4: TMenuItem
        Action = Exit
      end
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      object Font1: TMenuItem
        Action = Font
      end
      object Font2: TMenuItem
        Action = Color
      end
      object Edit2: TMenuItem
        Action = Alignment
      end
      object FindAndReplace1: TMenuItem
        Action = FindAndReplace
      end
    end
  end
  object ActionList1: TActionList
    Left = 208
    Top = 288
    object New: TAction
      Caption = 'New'
      OnExecute = NewExecute
    end
    object Open: TAction
      Caption = 'Open'
      OnExecute = OpenExecute
    end
    object Save: TAction
      Caption = 'Save'
      OnExecute = SaveExecute
    end
    object Save_As: TAction
      Caption = 'Save As'
      OnExecute = Save_AsExecute
    end
    object Font: TAction
      Caption = 'Font'
      OnExecute = FontExecute
    end
    object Alignment: TAction
      Caption = 'Alignment'
      OnExecute = AlignmentExecute
    end
    object FindAndReplace: TAction
      Caption = 'FindAndReplace'
      OnExecute = FindAndReplaceExecute
    end
    object Color: TAction
      Caption = 'Color'
      OnExecute = ColorExecute
    end
    object Exit: TAction
      Caption = 'Exit'
      OnExecute = ExitExecute
    end
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 688
    Top = 272
  end
  object SaveDialog1: TSaveDialog
    Left = 680
    Top = 208
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = []
    Left = 576
    Top = 296
  end
  object ColorDialog1: TColorDialog
    Left = 448
    Top = 264
  end
  object ReplaceDialog1: TReplaceDialog
    OnReplace = ReplaceDialog1Replace
    Left = 312
    Top = 304
  end
end
