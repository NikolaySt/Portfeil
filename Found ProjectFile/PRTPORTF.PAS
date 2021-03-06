unit Prtportf;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, DB, DBTables,
  PrtDesignDBGrid, PrtDesignFigure, PrtDesignLabel, PrtDesignPage,
  CompatiblePreviewVersionQPrint;

type
  TDlgPrintPortfeil = class(TForm)
    DtSPortfeil: TDataSource;
    PrintPage1: TPrintPage;
    LblTitle: TPrintLabel;
    PrintFigure1: TPrintFigure;
    PrintLabel2: TPrintLabel;
    PrintLabel3: TPrintLabel;
    LblOtInvest: TPrintLabel;
    LblAlternativa: TPrintLabel;
    PrintLabel6: TPrintLabel;
    PrintLabel7: TPrintLabel;
    LblInvestVuzv: TPrintLabel;
    LblLihva: TPrintLabel;
    PrintFigure2: TPrintFigure;
    PrintLabel10: TPrintLabel;
    PrintLabel11: TPrintLabel;
    LblInvestStoi: TPrintLabel;
    LblPazarStoi: TPrintLabel;
    PrintLabel18: TPrintLabel;
    LblPortfeilVuzv: TPrintLabel;
    PrintFigure3: TPrintFigure;
    PrintLabel14: TPrintLabel;
    PrintLabel15: TPrintLabel;
    LblOLP: TPrintLabel;
    LblIndex: TPrintLabel;
    PrintPageLabel1: TPrintPageLabel;
    PrintDBGrid1: TPrintDBGrid;
    PrintPageLabel2: TPrintPageLabel;
    QryPrnPortfeil: TQuery;
    QryPrnPortfeilID_Inv: TSmallintField;
    QryPrnPortfeilData_Inv: TDateField;
    QryPrnPortfeilChifur: TStringField;
    QryPrnPortfeilBroi: TIntegerField;
    QryPrnPortfeilEdin_Cena: TFloatField;
    QryPrnPortfeilStoinost: TFloatField;
    QryPrnPortfeilOtn_dial: TFloatField;
    QryPrnPortfeilDrugestvo: TStringField;
    QryPrnPortfeilPazar_Cena: TFloatField;
    QryPrnPortfeilPazar_Stoin: TFloatField;
    QryPrnPortfeilPeriod: TIntegerField;
    PrintFigure4: TPrintFigure;
    PrintDesignFigure1: TPrintDesignFigure;
    LblInfoSort: TPrintDesignLabel;
    PrintDesignFigure2: TPrintDesignFigure;
    LblBroiInv: TPrintDesignLabel;
    PrintDesignLabel1: TPrintDesignLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DlgPrintPortfeil: TDlgPrintPortfeil;

implementation

{$R *.DFM}

end.
