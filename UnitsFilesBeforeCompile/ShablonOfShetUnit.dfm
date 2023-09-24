object ShablonOfShetaForm: TShablonOfShetaForm
  Left = 194
  Top = 116
  Width = 696
  Height = 480
  Caption = 'ShablonOfShetaForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object SchetQuickRep: TQuickRep
    Left = 0
    Top = -4
    Width = 635
    Height = 898
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = SchetADOQuery
    Description.Strings = (
      'This customer listing report shows the following basic features:'
      '- Setup of some common bands'
      '  (title, column header, detail and page footer)'
      '- Connecting a dataset'
      '- Use TQRLabel to print static text'
      '- Use TQRDBText to print table fields'
      ''
      'You can also see how to'
      '- Use TQRSysData to print current time and page number'
      '- Use different fonts, sizes and colors'
      '- How to right align text'
      '- How to center text in a band')
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    OnPreview = SchetQuickRepPreview
    Options = []
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = First
    PrintIfEmpty = False
    SnapToGrid = True
    Units = MM
    Zoom = 80
    object DetailBand1: TQRBand
      Left = 30
      Top = 356
      Width = 575
      Height = 37
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        122.369791666666700000
        1901.692708333333000000)
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 40
        Top = 3
        Width = 41
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333340000
          132.291666666666700000
          9.921875000000000000
          135.598958333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = SchetADOQuery
        DataField = 'CODE'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText2: TQRDBText
        Left = 95
        Top = 3
        Width = 163
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          99.218750000000000000
          314.192708333333400000
          9.921875000000000000
          539.088541666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = SchetADOQuery
        DataField = 'DESCR'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText3: TQRDBText
        Left = 268
        Top = 3
        Width = 85
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333340000
          886.354166666666600000
          9.921875000000000000
          281.119791666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = SchetADOQuery
        DataField = 'COUNT'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText4: TQRDBText
        Left = 358
        Top = 3
        Width = 87
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333340000
          1184.010416666667000000
          9.921875000000000000
          287.734375000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = SchetADOQuery
        DataField = 'EDINICADES'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRDBText5: TQRDBText
        Left = 450
        Top = -1
        Width = 47
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          56.223958333333340000
          1488.281250000000000000
          -3.307291666666667000
          155.442708333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = SchetADOQuery
        DataField = 'Price'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object SummaQRDBText: TQRDBText
        Left = 504
        Top = 0
        Width = 57
        Height = 15
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          49.609375000000000000
          1666.875000000000000000
          0.000000000000000000
          188.515625000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = SchetADOQuery
        DataField = 'summa'
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object RowNumQRSysData: TQRSysData
        Left = 0
        Top = 0
        Width = 33
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          56.223958333333340000
          0.000000000000000000
          0.000000000000000000
          109.140625000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        Color = clWhite
        Data = qrsDetailNo
        Transparent = False
        FontSize = 10
      end
    end
    object ColumnHeaderBand1: TQRBand
      Left = 30
      Top = 337
      Width = 575
      Height = 19
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        62.838541666666680000
        1901.692708333333000000)
      BandType = rbColumnHeader
      object QRLabel1: TQRLabel
        Left = 36
        Top = 3
        Width = 53
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333340000
          119.062500000000000000
          9.921875000000000000
          175.286458333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #1050#1086#1076
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel2: TQRLabel
        Left = 95
        Top = 3
        Width = 163
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333340000
          314.192708333333400000
          9.921875000000000000
          539.088541666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #1058#1086#1074#1072#1088
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 265
        Top = 3
        Width = 79
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333340000
          876.432291666666800000
          9.921875000000000000
          261.276041666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel4: TQRLabel
        Left = 350
        Top = 3
        Width = 87
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333340000
          1157.552083333333000000
          9.921875000000000000
          287.734375000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #1045#1076#1080#1085#1080#1094#1072
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel8: TQRLabel
        Left = 0
        Top = 3
        Width = 35
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333340000
          0.000000000000000000
          9.921875000000000000
          115.755208333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #8470
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel5: TQRLabel
        Left = 450
        Top = 3
        Width = 46
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333340000
          1488.281250000000000000
          9.921875000000000000
          152.135416666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #1062#1077#1085#1072
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
      object QRLabel7: TQRLabel
        Left = 514
        Top = 3
        Width = 46
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          46.302083333333340000
          1699.947916666667000000
          9.921875000000000000
          152.135416666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #1057#1091#1084#1084#1072
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 10
      end
    end
    object TitleBand1: TQRBand
      Left = 30
      Top = 30
      Width = 575
      Height = 107
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        353.880208333333400000
        1901.692708333333000000)
      BandType = rbTitle
      object QRLabel6: TQRLabel
        Left = 168
        Top = 75
        Width = 238
        Height = 22
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          72.760416666666680000
          555.625000000000000000
          248.046875000000000000
          787.135416666666800000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = True
        AutoStretch = False
        Caption = #1054#1073#1088#1072#1079#1077#1094' '#1079#1072#1087#1086#1083#1085#1077#1085#1080#1103' '#1087#1083#1072#1090#1077#1078#1085#1086#1075#1086' '#1087#1086#1088#1091#1095#1077#1085#1080#1103
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object AttantionQRLabel: TQRLabel
        Left = 32
        Top = 16
        Width = 521
        Height = 41
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          135.598958333333300000
          105.833333333333300000
          52.916666666666660000
          1723.098958333333000000)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 
          '"'#1042#1085#1080#1084#1072#1085#1080#1077'! '#1054#1087#1083#1072#1090#1072' '#1076#1072#1085#1085#1086#1075#1086' '#1089#1095#1077#1090#1072' '#1086#1079#1085#1072#1095#1072#1077#1090' '#1089#1086#1075#1083#1072#1089#1080#1077' '#1089' '#1091#1089#1083#1086#1074#1080#1103#1084#1080' '#1087#1086 +
          #1089#1090#1072#1074#1082#1080' '#1090#1086#1074#1072#1088#1072'. '#1059#1074#1077#1076#1086#1084#1083#1077#1085#1080#1077' '#1086#1073' '#1086#1087#1083#1072#1090#1077' '#1086#1073#1103#1079#1072#1090#1077#1083#1100#1085#1086', '#1074' '#1087#1088#1086#1090#1080#1074#1085#1086#1084' '#1089#1083 +
          #1091#1095#1072#1077' '#1085#1077' '#1075#1072#1088#1072#1085#1090#1080#1088#1091#1077#1090#1089#1103' '#1085#1072#1083#1080#1095#1080#1077' '#1090#1086#1074#1072#1088#1072' '#1085#1072' '#1089#1082#1083#1072#1076#1077'. '#1058#1086#1074#1072#1088' '#1086#1090#1087#1091#1089#1082#1072#1077#1090#1089 +
          #1103' '#1087#1086' '#1092#1072#1082#1090#1091' '#1087#1088#1080#1093#1086#1076#1072' '#1076#1077#1085#1077#1075' '#1085#1072' '#1088'/'#1089' '#1055#1086#1089#1090#1072#1074#1097#1080#1082#1072', '#1089#1072#1084#1086#1074#1099#1074#1086#1079#1086#1084', '#1087#1088#1080' '#1085#1072#1083 +
          #1080#1095#1080#1080' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080' '#1080' '#1087#1072#1089#1087#1086#1088#1090#1072'."'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object SummaryQRBand: TQRBand
      Left = 30
      Top = 393
      Width = 575
      Height = 56
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        185.208333333333300000
        1901.692708333333000000)
      BandType = rbSummary
      object SummQRExpr: TQRExpr
        Left = 432
        Top = 8
        Width = 126
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1428.750000000000000000
          26.458333333333330000
          416.718750000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        ResetAfterPrint = False
        Transparent = False
        WordWrap = True
        Expression = 'SUM(SUMMA)'
        FontSize = 10
      end
      object NadpSumQRLabel: TQRLabel
        Left = 400
        Top = 8
        Width = 30
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1322.916666666667000000
          26.458333333333330000
          99.218750000000000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #1048#1090#1086#1075#1086':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object QRChildBand1: TQRChildBand
      Left = 30
      Top = 449
      Width = 575
      Height = 48
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Width = 2
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        158.750000000000000000
        1901.692708333333000000)
      ParentBand = SummaryQRBand
      object ChiefQRLabel: TQRLabel
        Left = 208
        Top = 24
        Width = 62
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          687.916666666666800000
          79.375000000000000000
          205.052083333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '('#1048#1074#1072#1085#1086#1074' '#1048'.'#1048'.)'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object TQRLabel
        Left = 80
        Top = 24
        Width = 121
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          264.583333333333400000
          79.375000000000000000
          400.182291666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object NadpChiefQRLabel: TQRLabel
        Left = 8
        Top = 24
        Width = 75
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          26.458333333333330000
          79.375000000000000000
          248.046875000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object NadpAccountantQRLabel: TQRLabel
        Left = 336
        Top = 24
        Width = 54
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1111.250000000000000000
          79.375000000000000000
          178.593750000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #1041#1091#1093#1075#1072#1083#1090#1077#1088
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object TQRLabel
        Left = 400
        Top = 24
        Width = 121
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1322.916666666667000000
          79.375000000000000000
          400.182291666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel9: TQRLabel
        Left = 528
        Top = 24
        Width = 62
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          1746.250000000000000000
          79.375000000000000000
          205.052083333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '('#1048#1074#1085#1086#1074#1072' '#1048'.'#1048'.)'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
    object BankiQRChildBand: TQRChildBand
      Left = 30
      Top = 137
      Width = 575
      Height = 101
      Frame.Color = clBlack
      Frame.DrawTop = True
      Frame.DrawBottom = True
      Frame.DrawLeft = True
      Frame.DrawRight = True
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        334.036458333333400000
        1901.692708333333000000)
      ParentBand = TitleBand1
      object NadpBankPolQRLabel: TQRLabel
        Left = 1
        Top = 33
        Width = 287
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          46.302083333333340000
          3.307291666666667000
          109.140625000000000000
          949.192708333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #1041#1072#1085#1082' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object BankQRLabel: TQRLabel
        Left = 2
        Top = 0
        Width = 286
        Height = 33
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          109.140625000000000000
          6.614583333333332000
          0.000000000000000000
          945.885416666666600000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'BankQRLabel'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object NadpBIKQRLabel: TQRLabel
        Left = 289
        Top = 0
        Width = 63
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          76.067708333333340000
          955.807291666666800000
          0.000000000000000000
          208.359375000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #1041#1048#1050
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object NadpSchNQRLabel: TQRLabel
        Left = 289
        Top = 21
        Width = 63
        Height = 24
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          79.375000000000000000
          955.807291666666800000
          69.453125000000000000
          208.359375000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #1057#1095' '#8470
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object SchBankQRLabel: TQRLabel
        Left = 353
        Top = 23
        Width = 221
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          82.682291666666680000
          1167.473958333333000000
          76.067708333333340000
          730.911458333333500000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'SchBankQRLabel'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object BIKQRLabel: TQRLabel
        Left = 353
        Top = 0
        Width = 221
        Height = 23
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          76.067708333333340000
          1167.473958333333000000
          0.000000000000000000
          730.911458333333500000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'BIKQRLabel'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object INNBankQRLabel: TQRLabel
        Left = 1
        Top = 47
        Width = 168
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          46.302083333333340000
          3.307291666666667000
          155.442708333333300000
          555.625000000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #1048#1053#1053' 43343434'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object KPPQRLabel: TQRLabel
        Left = 169
        Top = 47
        Width = 119
        Height = 14
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = True
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          46.302083333333340000
          558.932291666666700000
          155.442708333333300000
          393.567708333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #1050#1055#1055' 433434'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object FirmaQRLabel: TQRLabel
        Left = 2
        Top = 61
        Width = 286
        Height = 28
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          92.604166666666680000
          6.614583333333332000
          201.744791666666700000
          945.885416666666600000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'FirmaQRLabel'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel12: TQRLabel
        Left = 1
        Top = 88
        Width = 287
        Height = 12
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          39.687500000000000000
          3.307291666666667000
          291.041666666666700000
          949.192708333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object NadpBankSchNQRLabel: TQRLabel
        Left = 289
        Top = 45
        Width = 63
        Height = 53
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = True
        Size.Values = (
          175.286458333333400000
          955.807291666666800000
          148.828125000000000000
          208.359375000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = #1057#1095'. '#8470
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object NomSchetaQRLabel: TQRLabel
        Left = 353
        Top = 45
        Width = 221
        Height = 54
        Frame.Color = clBlack
        Frame.DrawTop = True
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          178.593750000000000000
          1167.473958333333000000
          148.828125000000000000
          730.911458333333500000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'NomSchetaQRLabel'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
    object SchetQRChildBand: TQRChildBand
      Left = 30
      Top = 238
      Width = 575
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = True
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Frame.Width = 2
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        115.755208333333300000
        1901.692708333333000000)
      ParentBand = BankiQRChildBand
      object NadpSchetQRLabel: TQRLabel
        Left = 3
        Top = 8
        Width = 58
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          62.838541666666680000
          9.921875000000000000
          26.458333333333330000
          191.822916666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C'#1095#1077#1090' '#8470
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRLabel11: TQRLabel
        Left = 67
        Top = 8
        Width = 10
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          62.838541666666680000
          221.588541666666700000
          26.458333333333330000
          33.072916666666670000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '9'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object QRSysData3: TQRSysData
        Left = 155
        Top = 8
        Width = 44
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          62.838541666666680000
          512.630208333333400000
          26.458333333333330000
          145.520833333333300000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDate
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        FontSize = 14
      end
      object QRLabel10: TQRLabel
        Left = 131
        Top = 8
        Width = 18
        Height = 19
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          62.838541666666680000
          433.255208333333400000
          26.458333333333330000
          59.531250000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #1086#1090
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
    end
    object PostPokupQRChildBand: TQRChildBand
      Left = 30
      Top = 273
      Width = 575
      Height = 64
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        211.666666666666700000
        1901.692708333333000000)
      ParentBand = SchetQRChildBand
      object NadpSupplierQRLabel: TQRLabel
        Left = 8
        Top = 8
        Width = 58
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          26.458333333333330000
          26.458333333333330000
          191.822916666666700000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object SupplierQRLabel: TQRLabel
        Left = 70
        Top = 4
        Width = 521
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          99.218750000000000000
          231.510416666666700000
          13.229166666666670000
          1723.098958333333000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'SupplierQRLabel'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object NadpClientQRLabel: TQRLabel
        Left = 8
        Top = 38
        Width = 59
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          26.458333333333330000
          125.677083333333300000
          195.130208333333400000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #1055#1086#1082#1091#1087#1072#1090#1077#1083#1100':'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object ClientQRLabel: TQRLabel
        Left = 72
        Top = 38
        Width = 271
        Height = 13
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          42.994791666666670000
          238.125000000000000000
          125.677083333333300000
          896.276041666666600000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = #1048#1053#1053' 3232233223 '#1050#1055#1055' '#1054#1054#1054' "'#1059#1088#1072#1083#1050#1083#1080#1077#1085#1090'", '#1090'/'#1092'3435565'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
    end
  end
  object SchetADOQuery: TADOQuery
    Connection = SchetsADOConnection
    CursorType = ctStatic
    ParamCheck = False
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      ''
      'CODE, DESCR, COUNT, '
      'EDINICADES, PRICE, '
      'VALUTADESC, SUMMA'
      ''
      'FROM'
      ''
      'NewOrder;')
    Left = 536
    Top = 16
  end
  object SchetsADOConnection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Mode=ReadWrite;Ex' +
      'tended Properties="DSN=Visual FoxPro Tables;UID=;SourceDB=c:\;So' +
      'urceType=DBF;Exclusive=No;BackgroundFetch=Yes;Collate=Machine;Nu' +
      'll=Yes;Deleted=Yes;"'
    LoginPrompt = False
    Mode = cmReadWrite
    Left = 496
    Top = 16
  end
  object SchetDataSource: TDataSource
    DataSet = SchetADOQuery
    Left = 496
    Top = 56
  end
  object SchetAddFixADOCommand: TADOCommand
    Connection = SchetsADOConnection
    Parameters = <>
    ParamCheck = False
    Left = 534
    Top = 58
  end
  object SchetDeleteFixADOCommand: TADOCommand
    CommandText = 'DELETE'#13#10'FROM '#13#10'NewOrder'#13#10'WHERE descr='#39'descr'#39';'
    Connection = SchetsADOConnection
    Parameters = <>
    ParamCheck = False
    Left = 574
    Top = 58
  end
end
