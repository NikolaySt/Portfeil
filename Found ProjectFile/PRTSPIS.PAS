unit Prtspis;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls,
  DB, DBTables, CompatiblePreviewVersionQPrint,
  PrtDesignDBGrid, PrtDesignLabel, PrtDesignFigure, PrtDesignPage,
  PrtDesignMemo;

type
  TDlgPrintSpisuk = class(TForm)
    PrintPage1: TPrintPage;
    DtSSpisuk: TDataSource;
    QrySpisuk: TQuery;
    PrintFigure3: TPrintFigure;
    PrintFigure5: TPrintFigure;
    PrintFigure4: TPrintFigure;
    PrintFigure1: TPrintFigure;
    PrintLabel2: TPrintLabel;
    PrintLabel3: TPrintLabel;
    LblData: TPrintLabel;
    LblBroi: TPrintLabel;
    PrintLabel10: TPrintLabel;
    PrintLabel11: TPrintLabel;
    LblCenaNaBroi: TPrintLabel;
    LblStoi: TPrintLabel;
    PrintLabel18: TPrintLabel;
    LblRazhod: TPrintLabel;
    PrintLabel14: TPrintLabel;
    LblObtcho: TPrintLabel;
    LblLongName: TPrintLabel;
    LblNo: TPrintLabel;
    LblDrugestvo: TPrintLabel;
    PrintLabel4: TPrintLabel;
    LblDataPadeg: TPrintLabel;
    LblPravo: TPrintLabel;
    PrintLabel7: TPrintLabel;
    PrintLabel8: TPrintLabel;
    LblLihva: TPrintLabel;
    PrintFigure7: TPrintFigure;
    PrintFigure2: TPrintFigure;
    PrintLabel1: TPrintLabel;
    PrintFigure6: TPrintFigure;
    PrintPage2: TPrintPage;
    QrySpisukID_Inv: TSmallintField;
    QrySpisukChifur: TStringField;
    QrySpisukDrugestvo: TStringField;
    QrySpisukData_Inv: TDateField;
    QrySpisukPurvo_Cena: TFloatField;
    QrySpisukPurvo_Razhod: TFloatField;
    QrySpisukPurvo_Stoi: TFloatField;
    QrySpisukPurvo_Stoi_NoRazhod: TFloatField;
    PrintDBGrid2: TPrintDBGrid;
    LblSpisTitle: TPrintLabel;
    PrintPageLabel1: TPrintPageLabel;
    PrintPageLabel2: TPrintPageLabel;
    PrintLabel5: TPrintLabel;
    PrintFigure8: TPrintFigure;
    LblObtchaStoi: TPrintLabel;
    QrySpisukPurvo_Broi: TIntegerField;
    PrintFigure9: TPrintFigure;
    Belegki: TPrintDesignMemo;
    PrintDesignLabel1: TPrintDesignLabel;
    PrintDesignFigure1: TPrintDesignFigure;
    PrintDesignFigure2: TPrintDesignFigure;
    LblBroiInv: TPrintDesignLabel;
    LblSort: TPrintDesignLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DlgPrintSpisuk: TDlgPrintSpisuk;

implementation

{$R *.DFM}

end.
