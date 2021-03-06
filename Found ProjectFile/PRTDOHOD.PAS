unit PrtDohod;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls,
  ExtCtrls, CompatiblePreviewVersionQPrint,
  PrtDesignDBGrid, PrtDesignLabel, PrtDesignFigure, PrtDesignPage;

type
  TDlgPrintDohod = class(TForm)
    PrintPage1: TPrintPage;
    PrintFigure1: TPrintFigure;
    LblDrugestvo: TPrintLabel;
    LblNo: TPrintLabel;
    DtSPrintDoh: TDataSource;
    PrintFigure3: TPrintFigure;
    PrintLabel1: TPrintLabel;
    LblShifur: TPrintLabel;
    DtSPrintSpravka: TDataSource;
    DBTblSpravka: TPrintDBGrid;
    PrintPageLabel2: TPrintPageLabel;
    PrintPageLabel1: TPrintPageLabel;
    DBTbl: TPrintDBGrid;
    LblData: TPrintLabel;
    PrintLabel3: TPrintLabel;
    PrintFigure2: TPrintFigure;
    PrtTitle: TPrintLabel;
    QryPrtSpravka: TQuery;
    QryPrtSpravkaGodina: TSmallintField;
    QryPrtSpravkaSUMofProd_Cena: TFloatField;
    QryPrtSpravkaSUMofKap_Vuzv: TFloatField;
    QryPrtDohod: TQuery;
    QryPrtDohodRedNom: TSmallintField;
    QryPrtDohodData: TDateField;
    QryPrtDohodBroi: TIntegerField;
    QryPrtDohodGodina: TSmallintField;
    QryPrtDohodPrih_Div: TFloatField;
    QryPrtDohodBezpl_Akcii: TIntegerField;
    QryPrtDohodProd_Cena: TFloatField;
    QryPrtDohodKap_Vuzv: TFloatField;
    QryPrtDohodDoh_Prih: TStringField;
    PrintDesignLabel1: TPrintDesignLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DlgPrintDohod: TDlgPrintDohod;

implementation

{$R *.DFM}

end.
