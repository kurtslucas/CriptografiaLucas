object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Criptografia - Lucas Vieira de Oliveira'
  ClientHeight = 461
  ClientWidth = 834
  Color = 10985232
  Constraints.MinHeight = 500
  Constraints.MinWidth = 850
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = pmGeral
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 420
    Width = 834
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 22
      Top = 0
      Width = 168
      Height = 41
      Cursor = crHandPoint
      Action = acCriptografar
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 17
    end
    object SpeedButton2: TSpeedButton
      Left = 222
      Top = 0
      Width = 192
      Height = 41
      Cursor = crHandPoint
      Action = acDecriptografar
      Align = alLeft
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 217
      ExplicitTop = 1
    end
    object edtChave: TEdit
      Left = 421
      Top = 5
      Width = 335
      Height = 30
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      PopupMenu = pmChave
      TabOrder = 0
      TextHint = 'Chave p'#250'blica'
      OnChange = mmTextoChange
    end
    object ckCripto: TCheckBox
      Left = 0
      Top = 0
      Width = 22
      Height = 41
      Cursor = crHandPoint
      Align = alLeft
      Alignment = taLeftJustify
      Checked = True
      Enabled = False
      State = cbChecked
      TabOrder = 1
    end
    object ckDecripto: TCheckBox
      Left = 190
      Top = 0
      Width = 32
      Height = 41
      Cursor = crHandPoint
      Align = alLeft
      Alignment = taLeftJustify
      Enabled = False
      TabOrder = 2
    end
  end
  object pnGeral: TPanel
    Left = 0
    Top = 0
    Width = 834
    Height = 420
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      834
      420)
    object Label3: TLabel
      Left = 0
      Top = 0
      Width = 834
      Height = 28
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Reverter (F12)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object pnTexto: TPanel
      Left = 0
      Top = 0
      Width = 408
      Height = 420
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        408
        420)
      object Label1: TLabel
        Left = 0
        Top = 0
        Width = 408
        Height = 28
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Texto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = -1
        ExplicitTop = -4
        ExplicitWidth = 307
      end
      object mmTexto: TMemo
        Left = 8
        Top = 30
        Width = 394
        Height = 385
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        OnChange = mmTextoChange
        OnEnter = mmResultadoEnter
      end
    end
    object pnResultado: TPanel
      Left = 408
      Top = 0
      Width = 426
      Height = 420
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        426
        420)
      object Label2: TLabel
        Left = 0
        Top = 0
        Width = 426
        Height = 28
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = 'Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitLeft = 1
        ExplicitTop = 1
        ExplicitWidth = 503
      end
      object mmResultado: TMemo
        Left = 7
        Top = 30
        Width = 411
        Height = 385
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
        OnEnter = mmResultadoEnter
      end
    end
  end
  object ActionList1: TActionList
    Left = 376
    Top = 216
    object acCriptografar: TAction
      Caption = 'Criptografar (F2)'
      ShortCut = 113
      OnExecute = acCriptografarExecute
    end
    object acDecriptografar: TAction
      Caption = 'Decriptografar (F3)'
      ShortCut = 114
      OnExecute = acDecriptografarExecute
    end
    object acSair: TAction
      Caption = 'Sair'
      ShortCut = 27
      OnExecute = acSairExecute
    end
    object acVisualizarChave: TAction
      Caption = 'Visualizar chave'
      OnExecute = acVisualizarChaveExecute
    end
    object acReverter: TAction
      Caption = 'Reverter'
      ShortCut = 123
      OnExecute = acReverterExecute
    end
  end
  object pmChave: TPopupMenu
    Left = 496
    Top = 240
    object Visualizarchave1: TMenuItem
      Action = acVisualizarChave
    end
  end
  object pmGeral: TPopupMenu
    Left = 408
    Top = 240
    object Reverter1: TMenuItem
      Action = acReverter
    end
  end
end
