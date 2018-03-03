object CRCFrm: TCRCFrm
  Left = 261
  Top = 112
  BorderStyle = bsToolWindow
  Caption = 'CRC Generator'
  ClientHeight = 211
  ClientWidth = 244
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel4: TPanel
    Left = 0
    Top = 178
    Width = 244
    Height = 33
    Align = alClient
    TabOrder = 2
    object CalcCRCBtn: TBitBtn
      Left = 4
      Top = 4
      Width = 81
      Height = 25
      Caption = 'Calculate'
      Default = True
      ModalResult = 8
      TabOrder = 0
      OnClick = CalcCRCBtnClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
    end
    object CloseBtn: TBitBtn
      Left = 160
      Top = 4
      Width = 81
      Height = 25
      Caption = '&Close'
      TabOrder = 1
      OnClick = eXit1Click
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 244
    Height = 37
    Align = alTop
    TabOrder = 0
    object MainLed: TLMDLEDLabel
      Left = 4
      Top = 4
      Width = 235
      Height = 28
      Bevel.Mode = bmCustom
      LED.DisabledDigits = False
      LED.Horzsize = 8
      LED.Vertsize = 7
      Caption = 'CRC Generator'
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 37
    Width = 244
    Height = 141
    ActivePage = TabSheet1
    Align = alTop
    HotTrack = True
    MultiLine = True
    TabIndex = 0
    TabOrder = 1
    TabPosition = tpBottom
    TabStop = False
    object TabSheet1: TTabSheet
      Caption = 'Checksum'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 236
        Height = 112
        Align = alTop
        TabOrder = 0
        object CSumLED: TLMDLEDLabel
          Left = 172
          Top = 76
          Width = 37
          Height = 28
          AutoSize = True
          Bevel.Mode = bmCustom
          LED.Horzsize = 8
          LED.Vertsize = 7
          Caption = '--'
        end
        object CSumLedLbl: TLMDLEDLabel
          Left = 4
          Top = 76
          Width = 163
          Height = 28
          AutoSize = True
          Bevel.Mode = bmCustom
          LED.ActiveColor = clRed
          LED.Horzsize = 8
          LED.InActiveColor = clMaroon
          LED.Vertsize = 7
          Caption = 'Checksum '
        end
        object Label2: TLabel
          Left = 176
          Top = 32
          Width = 53
          Height = 39
          Caption = 'Enter Hex'#13#10'as 2 Digits'#13#10'No Spaces'
        end
        object Label3: TLabel
          Left = 212
          Top = 76
          Width = 17
          Height = 13
          Caption = 'Not'
        end
        object ClearCSumBtn: TBitBtn
          Left = 172
          Top = 8
          Width = 59
          Height = 21
          Hint = 'Reset Checksum Data'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TabStop = False
          OnClick = ClearCSumBtnClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
            305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
            005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
            B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
            B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
            B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
            B0557777FF577777F7F500000E055550805577777F7555575755500000555555
            05555777775555557F5555000555555505555577755555557555}
          NumGlyphs = 2
        end
        object Memo1: TMemo
          Left = 4
          Top = 8
          Width = 165
          Height = 65
          TabOrder = 1
        end
        object NotCbx: TCheckBox
          Left = 212
          Top = 88
          Width = 17
          Height = 17
          TabOrder = 2
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'CRC'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 236
        Height = 112
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 12
          Width = 34
          Height = 13
          Caption = 'Packet'
        end
        object Label7: TLabel
          Left = 60
          Top = 36
          Width = 126
          Height = 13
          Caption = 'Hex Values (01, ab, ff, etc)'
        end
        object CRCLED: TLMDLEDLabel
          Left = 172
          Top = 76
          Width = 37
          Height = 28
          AutoSize = True
          Bevel.Mode = bmCustom
          LED.Horzsize = 8
          LED.Vertsize = 7
          Caption = '--'
        end
        object CRCLedLbl: TLMDLEDLabel
          Left = 4
          Top = 76
          Width = 163
          Height = 28
          AutoSize = True
          Bevel.Mode = bmCustom
          LED.ActiveColor = clRed
          LED.Horzsize = 8
          LED.InActiveColor = clMaroon
          LED.Vertsize = 7
          Caption = 'CRC Value'
        end
        object Edit1: TEdit
          Left = 60
          Top = 8
          Width = 25
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Fixedsys'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 0
          Text = '00'
        end
        object Edit2: TEdit
          Left = 88
          Top = 8
          Width = 25
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Fixedsys'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 1
          Text = '00'
        end
        object Edit3: TEdit
          Left = 116
          Top = 8
          Width = 25
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Fixedsys'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 2
          Text = '00'
        end
        object Edit4: TEdit
          Left = 144
          Top = 8
          Width = 25
          Height = 23
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Fixedsys'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 3
          Text = '00'
        end
        object ClearCRCBtn: TBitBtn
          Left = 172
          Top = 8
          Width = 59
          Height = 21
          Hint = 'Reset All Packet Fields'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          TabStop = False
          OnClick = ClearCRCBtnClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
            305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
            005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
            B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
            B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
            B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
            B0557777FF577777F7F500000E055550805577777F7555575755500000555555
            05555777775555557F5555000555555505555577755555557555}
          NumGlyphs = 2
        end
      end
    end
  end
  object AboutBox: TLMDAboutDlg
    Appname = 'CRCGen'
    CaptionTitle = 'CRC Generator'
    Copyright = 'Sandy Ganz'
    Description = 'CRC Generator'#13#10#13#10'Source Code NOT available, Sorry'
    Effect = deExplode
    EMail = 'motradio@pacbell.net'
    IconStyle = isStandard
    ShowHints = False
    Version = '1.02'
    Left = 68
    Top = 56
    Internal = 'LMDIML30'
  end
  object MainMenu1: TMainMenu
    Left = 12
    Top = 56
    object File1: TMenuItem
      Caption = '&File'
      object eXit1: TMenuItem
        Caption = 'E&xit'
        OnClick = eXit1Click
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object About2: TMenuItem
        Caption = '&About'
        OnClick = About2Click
      end
    end
  end
  object MB1: TLMDMessageBoxDlg
    MessageAlignment.Alignment = agTopLeft
    MessageFont.Charset = DEFAULT_CHARSET
    MessageFont.Color = clWindowText
    MessageFont.Height = -11
    MessageFont.Name = 'MS Sans Serif'
    MessageFont.Style = []
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'MS Sans Serif'
    CaptionFont.Style = []
    ButtonFont.Charset = DEFAULT_CHARSET
    ButtonFont.Color = clWindowText
    ButtonFont.Height = -11
    ButtonFont.Name = 'MS Sans Serif'
    ButtonFont.Style = []
    CustomGlyphListIndex = 0
    CustomGlyphImageIndex = 0
    DlgType = mtInformation
    Left = 96
    Top = 56
  end
  object HiTimer: TLMDHiTimer
    Interval = 300
    OnTimer = HiTimerTimer
    Left = 40
    Top = 56
  end
end
