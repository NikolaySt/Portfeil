unit Prtprod;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, DBTables, DB, PrtDesignDBGrid,
  CompatiblePreviewVersionQPrint, PrtDesignLabel, PrtDesignFigure,
  PrtDesignPage;

type
  TDlgPrintProdagbi = class(TForm)
    DtSPrintProd: TDataSource;
    PrintDesignPage1: TPrintDesignPage;
    PrintFigure1: TPrintFigure;
    LblDrugestvo: TPrintLabel;
    LblNo: TPrintLabel;
    PrintFigure3: TPrintFigure;
    PrintLabel2: TPrintLabel;
    PrintLabel3: TPrintLabel;
    LblData: TPrintLabel;
    LblBroi: TPrintLabel;
    PrintLabel14: TPrintLabel;
    LblObtcho: TPrintLabel;
    PrintLabel1: TPrintLabel;
    LblShifur: TPrintLabel;
    PrintFigure2: TPrintFigure;
    PrintLabel6: TPrintLabel;
    LblSumaBroi: TPrintLabel;
    PrintLabel9: TPrintLabel;
    LblSumaPrihod: TPrintLabel;
    PrintPageLabel1: TPrintPageLabel;
    PrintPageLabel2: TPrintPageLabel;
    PrintDesignDBGrid1: TPrintDesignDBGrid;
    QryPrintProd: TQuery;
    QryPrintProdRedNom: TSmallintField;
    QryPrintProdData: TDateField;
    QryPrintProdBroi: TIntegerField;
    QryPrintProdProd_Cena: TFloatField;
    QryPrintProdPrih_Div: TFloatField;
    QryPrintProdRazhodi: TFloatField;
    QryPrintProdKap_Pechalba: TFloatField;
    QryPrintProdKap_Vuzv: TFloatField;
    QryPrintProdDoh_Prih: TStringField;
    PrintLabel4: TPrintLabel;
    LblCena: TPrintLabel;
    PrintDesignLabel1: TPrintDesignLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DlgPrintProdagbi: TDlgPrintProdagbi;

implementation

{$R *.DFM}

end.
