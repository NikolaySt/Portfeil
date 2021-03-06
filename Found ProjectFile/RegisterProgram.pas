unit RegisterProgram;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, BevelNew, ExtCtrls, SecurityPrograms;

type
  TDlgRegProgram = class(TForm)
    EdtName: TEdit;
    EdtFirma: TEdit;
    EdtSer1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtSer4: TEdit;
    EdtSer3: TEdit;
    EdtSer2: TEdit;
    BevelNew2: TBevelNew;
    BtnOK: TButton;
    BtnCancel: TButton;
    Image1: TImage;
    procedure EdtSer1Change(Sender: TObject);
    procedure EdtSer2Change(Sender: TObject);
    procedure EdtSer3Change(Sender: TObject);
    procedure EdtSer1KeyPress(Sender: TObject; var Key: Char);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
  public
  end;

var
  DlgRegProgram: TDlgRegProgram;

implementation

{$R *.DFM}

Uses Registry, DlgMess, SetupReg, ConstMessage, CodePassword, DlgDiskDrive,
	MyConst;

Const
	cRoot       = HKEY_LOCAL_MACHINE;
	cKey        = '\SOFTWARE\Microsoft\Windows\CurrentVersion';
	cValueName  = 'RegisteredOwner';
	cValueFirma = 'RegisteredOrganization';

procedure TDlgRegProgram.EdtSer1Change(Sender: TObject);
begin
	If Length( (Sender As TEdit).Text ) =
  	(Sender As TEdit).MaxLength Then EdtSer2.SetFocus;
end;

procedure TDlgRegProgram.EdtSer2Change(Sender: TObject);
begin
	If Length( (Sender As TEdit).Text ) =
  	(Sender As TEdit).MaxLength Then EdtSer3.SetFocus;
end;

procedure TDlgRegProgram.EdtSer3Change(Sender: TObject);
begin
	If Length( (Sender As TEdit).Text ) =
  	(Sender As TEdit).MaxLength Then EdtSer4.SetFocus;
end;

procedure TDlgRegProgram.EdtSer1KeyPress(Sender: TObject; var Key: Char);
begin
	If Key In ['a'..'z'] Then Key := Chr(Ord(Key) - 32);
end;

procedure TDlgRegProgram.BtnOKClick(Sender: TObject);
Var
	Num: String;
  Drv: Char;
begin
	If EdtName.Text = '' Then Begin
  	MessageDlg1(C_Mess_InputName, mtInformation, [mbOK], 0);
    EdtName.SetFocus;
    Exit;
	End
  Else If EdtFirma.Text = '' Then Begin
  	MessageDlg1(C_Mess_InputFirma, mtInformation, [mbOK], 0);
    EdtFirma.SetFocus;
    Exit;
 	End;
	Num := EdtSer1.Text +'-'+ EdtSer2.Text +'-'+ EdtSer3.Text +'-'+ EdtSer4.Text;
	G_V_Serial := Num;  
	With ProgOptions.SecProgram Do begin
  	Password := Num;
		Path := ExtractFileDir(ParamStr(0));
    FileName := cFileLIb;    
  	CompareSerial(cSerialPos);
		If Result = C_NotError Then Begin
			Drv := 'A';
    	If DlgDrive.Execute(Drv) Then Begin;
      	DiskDrive := Drv;
	  		Path := DiskDrive +':';
        FileName := cSetupFile;
        CompareOriginalFloppy(cSerialPos, cInfoPos);
        If Result = C_NotError Then Begin

    			IsRegisterFile(cSerialPos, cFloppyRegister);
          If Result = C_Error_NotRegister Then Begin

						RegisterProgramToFloppy(cSerialPos, cFloppyRegister);
            If Result = C_NotError Then Begin

							Path := ExtractFileDir(ParamStr(0));
              FileName := cFileLIb;
            	RegisterProgramToHDD(cSerialPos, cHDDRegister);
              If Result = C_NotError Then Begin
                ProgOptions.SaveProgramRegister(EdtName.Text, EdtFirma.Text);
              	ModalResult := mrOK
              End
              Else Begin
								Path := DiskDrive +':';
	              FileName := cSetupFile;
                RemoveProtectionToFloppyDisk(cSerialPos, cNoRegister);
             		MessageDlg1(C_Mess_NotLicense, mtError, [mbOK], 0)
              End;

            End
            Else MessageDlg1(C_Mess_ReadOnlyDisk, mtWarning, [mbOK], 0);

          End
          Else Begin

          	If Result = C_NotError Then
            	MessageDlg1(C_Mess_ByNowInstall, mtWarning, [mbOK], 0)
            Else
            	MessageDlg1(C_Mess_OriginalDisk, mtWarning, [mbOK], 0);

          End;
				End
        Else Begin

        	If Result = C_Error_NotReadFile Then
          	MessageDlg1(C_Mess_ReadOnlyDisk, mtWarning, [mbOK], 0)
          Else
           	MessageDlg1(C_Mess_OriginalDisk, mtWarning, [mbOK], 0);
            
        End;

    	End;
  	End
    Else Begin
    	MessageDlg1(C_Mess_ErrorNumber, mtInformation, [mbOK], 0);
      EdtSer1.SetFocus;
    End;
  End;//With Prog....
end;

procedure TDlgRegProgram.FormShow(Sender: TObject);
begin
	Try
    With TRegistry.Create Do
    	Try
    		RootKey := cRoot;
    		If KeyExists(cKey) Then Begin
    			OpenKey(cKey, False);
          Try
          	EdtName.Text := ReadString(cValueName);
          	EdtFirma.Text := ReadString(cValueFirma);
          Finally
          	CloseKey;
          End;
    		End;
      Finally
      	Free
      End;
	Except
  End;
end;

end.
