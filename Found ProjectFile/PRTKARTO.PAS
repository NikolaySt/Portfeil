unit PrtKarto;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ExtCtrls, StdCtrls, DBCtrls, CustomGoldChart3,
  PrtDesignGoldChart, CompatiblePreviewVersionQPrint, PrtDesignLabel,
  PrtDesignFigure, PrtDesignPage;

type
  TDlgPrintKartoteka = class(TForm)
    PrintPage1: TPrintPage;
    PrintFigure3: TPrintFigure;
    LblTitle: TPrintLabel;
    LblDrugestvo: TPrintLabel;
    PrintFigure2: TPrintFigure;
    LblNo: TPrintLabel;
    PrintFigure1: TPrintFigure;
    PrintLabel2: TPrintLabel;
    PrintLabel3: TPrintLabel;
    LblOtInvest: TPrintLabel;
    LblAlternativa: TPrintLabel;
    PrintLabel6: TPrintLabel;
    PrintLabel7: TPrintLabel;
    LblInvestVuzv: TPrintLabel;
    LblLihva: TPrintLabel;
    PrintFigure4: TPrintFigure;
    LblDohod1: TPrintLabel;
    LblDohod2: TPrintLabel;
    LblDohod11: TPrintLabel;
    LblDohod22: TPrintLabel;
    LblDohod3: TPrintLabel;
    LblDohod33: TPrintLabel;
    PrintFigure5: TPrintFigure;
    PrintLabel14: TPrintLabel;
    PrintLabel15: TPrintLabel;
    LblRazhodPokupka: TPrintLabel;
    LblRazhodProdag: TPrintLabel;
    LblDohod44: TPrintLabel;
    LblDohod4: TPrintLabel;
    PrintLabel5: TPrintLabel;
    LblRazhodObtcho: TPrintLabel;
    PrtChartIndex: TPrintChartsGold;
    PrtChartCeni: TPrintChartsGold;
    PrintFigure6: TPrintFigure;
    PrintLabel9: TPrintLabel;
    PrintLabel12: TPrintLabel;
    LblShifur: TPrintLabel;
    LblBroi: TPrintLabel;
    PrintLabel17: TPrintLabel;
    LblCenaNaBroi: TPrintLabel;
    LblStoi: TPrintLabel;
    PrintLabel22: TPrintLabel;
    PrintLabel23: TPrintLabel;
    LblPeriod: TPrintLabel;
    PrintLabel28: TPrintLabel;
    LblDial: TPrintLabel;
    PrintFigure8: TPrintFigure;
    PrintLabel30: TPrintLabel;
    PrintLabel31: TPrintLabel;
    LblBData: TPrintLabel;
    LblBBroi: TPrintLabel;
    PrintLabel32: TPrintLabel;
    PrintLabel33: TPrintLabel;
    LblBCenaNaBroi: TPrintLabel;
    LblBStoi: TPrintLabel;
    PrintLabel34: TPrintLabel;
    LblBRazhod: TPrintLabel;
    PrintLabel35: TPrintLabel;
    LblBObtcho: TPrintLabel;
    PrintLabel20: TPrintLabel;
    LblBeginShifur: TPrintLabel;
    PrintLabel26: TPrintLabel;
    PrintLabel27: TPrintLabel;
    PrintPage2: TPrintPage;
    PrtChartCenaSingle: TPrintChartsGold;
    PrintLabel1: TPrintLabel;
    PrtChartIndexSingle: TPrintChartsGold;
    PrintLabel4: TPrintLabel;
    PrintFigure7: TPrintFigure;
    PrintLabel8: TPrintLabel;
    PrintLabel10: TPrintLabel;
    PrintLabel11: TPrintLabel;
    PrintLabel13: TPrintLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DlgPrintKartoteka: TDlgPrintKartoteka;

implementation

{$R *.DFM}

end.
