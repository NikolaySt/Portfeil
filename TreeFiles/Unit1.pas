unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TVExt, ImgList, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    TV: TTVExt;
    ImageList1: TImageList;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure TVGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure TVGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure TVAdvancedCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; Stage: TCustomDrawStage;
      var PaintImages, DefaultDraw: Boolean);
  private
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.TVGetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  if Node.HasChildren then
    if Node.Expanded then
      Node.ImageIndex := 0
    else
      Node.ImageIndex := 0
  else
    Node.ImageIndex := 1;
end;

procedure TForm1.TVGetSelectedIndex(Sender: TObject; Node: TTreeNode);
begin
  Node.SelectedIndex := Node.ImageIndex;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Node: TTreeNode;
begin
  Node := TV.Selected;
  Caption := '$' + IntToHex(Integer(Node.Data), 8);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  TV.Selected.Data := Pointer(10);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Caption := IntToStr(TV.Items.Count);
end;

procedure TForm1.TVAdvancedCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; Stage: TCustomDrawStage;
  var PaintImages, DefaultDraw: Boolean);
begin
//  Node.Text := 'Master'
end;

end.                                 
