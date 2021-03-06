// FileCheck of Directories for Controlling Magnetic Media (especially CD-ROMs)
// efg, July-Sep 1999

unit ScreenFileCheck;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, FileCtrl, ExtCtrls, ComCtrls, Buttons,
  DBT_H,            // TWMDeviceChange
  CRC32;            // TInteger8, CalcFileCRC32

type
  // Trick to call protected method of TDriveCombobox
  TMyDriveComboBox = CLASS(TDriveComboBox)
  END;

  // Trick to call protected method of TDirectoryListbox
  TMyDirectoryListBox = CLASS(TDirectoryListbox)
  END;

  TFormFileList = class(TForm)
    OpenDialog: TOpenDialog;
    PageControl1: TPageControl;
    TabSheetScan: TTabSheet;
    TabSheetVerify: TTabSheet;
    SaveDialog: TSaveDialog;
    GroupBoxOutputFiles: TGroupBox;
    LabelFileList: TLabel;
    EditScanFileListFile: TEdit;
    SpeedButtonScanFileList: TSpeedButton;
    LabelScanCRCVerifyFIle: TLabel;
    EditScanCRCVerifyFile: TEdit;
    SpeedButtonScanVerifyList: TSpeedButton;
    GroupBoxScanLog: TGroupBox;
    LabelDirectory: TLabel;
    LabelFilename: TLabel;
    MemoScanLog: TMemo;
    GroupBoxTarget: TGroupBox;
    LabelVolume: TLabel;
    DriveComboBox: TDriveComboBox;
    SpeedButtonRefresh: TSpeedButton;
    LabelDirHeading: TLabel;
    DirectoryListBox: TDirectoryListBox;
    LabelFileScan: TLabel;
    FileListBox: TFileListBox;
    BitBtnScanDirectory: TBitBtn;
    CheckBoxAllSubdirectories: TCheckBox;
    BitBtnScanFile: TBitBtn;
    BitBtnScanVolume: TBitBtn;
    BitBtnCancelScan: TBitBtn;
    LabelDir: TLabel;
    LabelFile: TLabel;
    LabelByte: TLabel;
    LabelCRC32: TLabel;
    CheckBoxCRC: TCheckBox;
    RadioGroupShow: TRadioGroup;
    LabelCRC32Value: TLabel;
    LabelByteCount: TLabel;
    LabelFileCount: TLabel;
    LabelDirCount: TLabel;
    LabelScanElapsedTime: TLabel;
    LabelScanElapsed: TLabel;
    AnimateScan: TAnimate;
    BitBtnPrintLog: TBitBtn;
    SpeedButtonNew: TSpeedButton;
    SpeedButtonAppend: TSpeedButton;
    LabelVerifyCRCVerifyFile: TLabel;
    EditVerifyCRCVerifyFile: TEdit;
    SpeedButtonVerifyVerifyList: TSpeedButton;
    BitBtnVerifyFile: TBitBtn;
    MemoVerifyLog: TMemo;
    BitBtn1: TBitBtn;
    BitBtnCancelVerify: TBitBtn;
    AnimateVerify: TAnimate;
    LabelVerifyFileName: TLabel;
    LabelVerifyElapsed: TLabel;
    LabelVerifyElapsedTime: TLabel;
    ProgressBar: TProgressBar;
    LabelLabURL1: TLabel;
    LabelLabURL2: TLabel;
    procedure CheckBoxCRCClick(Sender: TObject);
    procedure BitBtnScanClick(Sender: TObject);
    procedure BitBtnCancelScanClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButtonScanFileListClick(Sender: TObject);
    procedure SpeedButtonRefreshClick(Sender: TObject);
    procedure SpeedButtonScanVerifyListClick(Sender: TObject);
    procedure BitBtnPrintLogClick(Sender: TObject);
    procedure SpeedButtonVerifyVerifyListClick(Sender: TObject);
    procedure BitBtnVerifyFileClick(Sender: TObject);
    procedure BitBtnCancelVerifyClick(Sender: TObject);
    procedure RadioGroupShowClick(Sender: TObject);
    procedure LabelLabURL2Click(Sender: TObject);
  private
    AllByteCount      :  TInteger8;
    AllCRC32          :  DWORD;
    AllDirCount       :  INTEGER;
    AllFileCount      :  INTEGER;
    ContinueVerify    :  BOOLEAN;
    CRCVerifyFile     :  TextFile;
    DirByteCount      :  TInteger8;
    DirCRC32          :  DWORD;
    DirFileCount      :  INTEGER;
    ErrorCount        :  INTEGER;
    FileListFile      :  TextFile;
    StartTime         :  DWORD;       // to keep GetTickCount happy in D3/D4
    WriteFlagCRCVerify:  BOOLEAN;
    WriteFlagFileList :  BOOLEAN;

    PROCEDURE ResetScanValues;
    PROCEDURE WmDeviceChange(VAR Msg:  TWMDeviceChange);  MESSAGE WM_DeviceChange;
  public

    { Public declarations }
  end;

var
  FormFileList: TFormFileList;

implementation
{$R *.DFM}

  USES
    Printers,
    TokenLibrary,     // TTokens
    FileListLibrary,  // ScanDirectory
    ShellAPI;         // ShellExecute

  CONST
    FormatBytesString ='#############0';


// When filename has embedded space(s), put quotes around it.
// This allows tokenizer to treat filename as single token.
FUNCTION FormatFileName(CONST name:  STRING):  STRING;
BEGIN
  IF   POS(' ',name) > 0
  THEN RESULT := '"' + name + '"'
  ELSE RESULT := name
END;


// Callback routine used by List.Sort in ScanDirectory
FUNCTION OrderByFilename(Node1, Node2:  POINTER):  INTEGER;
BEGIN
  // Case insensitive comparison
  RESULT := StrIComp(pChar(TSearchRec(Node1^).Name),
                     pChar(TSearchRec(Node2^).Name));
END {CompareSearchRecs};


PROCEDURE ProcessDirectory(CONST sequence:  TSequence; CONST directory:  STRING);
  VAR
    Line      :  STRING;
    VerifyLine:  STRING;
BEGIN

  WITH FormFileList DO
  BEGIN

    CASE sequence OF
      sqBegin:
        BEGIN
          // Blank line between directories if files are shown
          IF   WriteFlagFileList AND (RadioGroupShow.ItemIndex = 1)
          THEN WRITELN(FileListFile, '');

          // Display directory
          IF   WriteFlagFileList AND (RadioGroupShow.ItemIndex >= 0)
          THEN WRITELN(FileListFile, directory);

          LabelDirectory.Caption := 'Directory:  ' + directory;

          DirFileCount := 0;
          DirByteCount := 0;
          DirCRC32     := $FFFFFFFF
        END;

      sqEnd:
        BEGIN
          AllDirCount := AllDirCount + 1;
          LabelDirCount.Caption := FormatFloat('###,##0', AllDirCount);

          Line := '                          ' +
                  '------------' + ' ';
          IF   CheckBoxCRC.Checked
          THEN Line := Line + '--------';

          IF   WriteFlagFileList
          THEN WRITELN(FileListFile, Line);

          Line := '                     ' +
                  Format('%17s', [
                  FormatFloat('##,###,###,###', DirByteCount) ]) + ' ';

          IF   CheckBoxCRC.Checked
          THEN BEGIN
            Line := Line + IntToHex(NOT DirCRC32,8) + ' ';

            VerifyLine := Format('D %14s %s %s %d',
                                [FormatFloat(FormatBytesString, DirByteCount),
                                 IntToHex(NOT DirCRC32,8),
                                 FormatFileName(directory), DirFileCount]);
            TRY
              IF   WriteFlagCRCVerify
              THEN WRITELN(CRCVerifyFile, VerifyLine);
            EXCEPT
              ON EInOutError DO
                MessageDlg('Error writing CRCVerifyFile file.', mtError, [mbOK], 0)
            END
          END;

          Line := Line + IntToStr(DirFileCount) + ' files';
          IF   WriteFlagFileList
          THEN WRITELN(FileListFile, Line)

        END
    END

  END
END {ProcessDirectory};


// Callback routine used by ScanDirectory
FUNCTION ProcessFile(CONST Path:  STRING; CONST Node:  pSearchRec):  DWORD;
  VAR
    CRCTemp    :  DWORD;
    CRCValue   :  DWORD;
    CRCValueHex:  STRING;
    Error      :  WORD;
    Line       :  STRING;
    TotalBytes :  TInteger8;
    VerifyLine :  STRING;

BEGIN
  RESULT := 0;
  // Allow "continue" to be set in FileListLibrary
  Application.ProcessMessages;

  WITH FormFileList DO
  BEGIN
    // Only look at non-directory entries
    IF   Node^.Attr AND faDirectory > 0
    THEN CRCVAlue := 0
    ELSE BEGIN
      LabelFilename.Caption := 'Filename:  ' + Node^.Name;

      DirFileCount := DirFileCount + 1;
      AllFileCount := AllFileCount + 1;
      LabelFileCount.Caption := FormatFloat('###,###,##0', AllFileCount);

      DirByteCount := DirByteCount + Node^.Size;
      AllByteCount := AllByteCount + Node^.Size;
      LabelByteCount.Caption := FormatFloat('###,###,###,##0', AllByteCount);

      IF  CheckBoxCRC.Checked
      THEN BEGIN
        CalcFileCRC32(Path + '\' + Node^.Name, CRCValue, TotalBytes, Error);
        IF   Error <> 0       // Ignore errors
        THEN BEGIN
          INC (ErrorCount);
          MemoScanLog.Lines.Add(IntToStr(ErrorCount) + '.  ' + 'Error Code ' +
                                IntToStr(Error) +
                                ' reading file ' + Path + '\' + Node^.Name);
          CRCValue := 0;   // but make CRC-32 predictable
        END;

        RESULT := CRCValue;  // return this value in case caller cares

        // Make CRC value an 8-byte string
        CRCValueHex := IntToHex(CRCvalue, 8);

        // Update Directory "CRC"
        CRCTemp := DirCRC32;
        CalcCRC32 (@CRCValueHex[1], SizeOf(CRCValueHex), CRCTemp);
        DirCRC32 := CRCTemp;

        // Update All "CRC"
        CRCTemp := AllCRC32;
        CalcCRC32 (@CRCValueHex[1], SizeOf(CRCValueHex), CRCTemp);
        AllCRC32 := CRCTemp;

        LabelCRC32Value.Caption := IntToHex(NOT AllCRC32, 8);
      END;

      LabelScanElapsedTime.Caption := Format('%.1f', [0.001*(GetTickCount-StartTime)]);

    END;

    IF   FormFileList.RadioGroupShow.ItemIndex = 1   {i.e., Files}
    THEN BEGIN
      IF   Node^.Attr AND faDirectory > 0
      THEN // Format Directory Entry
        Line := FormatDateTime('mm/dd/yyy hh:nn:ss',
                               FileDateToDateTime(Node^.Time)) + ' ' +
                   FormatAttributes(Node^.Attr) + ' ' + '           ' + ' '
      ELSE // Format File Entry
        Line := FormatDateTime('mm/dd/yyy hh:nn:ss',
                               FileDateToDateTime(Node^.Time)) + ' ' +
                   FormatAttributes(Node^.Attr) + ' ' +
                   Format('%11s', [
                      FormatFloat('###,###,##0', Node^.Size) ]) + ' ';

      IF   CheckBoxCRC.Checked
      THEN BEGIN
        IF   Node^.Attr AND faDirectory = 0
        THEN BEGIN
          Line := Line + IntToHex(CRCValue,8) + ' ' ;

          VerifyLine := Format('F %14s %s %s',
                              [FormatFloat(FormatBytesString, Node^.Size),
                               IntToHex(CRCValue,8),
                               FormatFileName(Path + '\' + Node^.Name)]);
          TRY
            IF   WriteFlagCRCVerify
            THEN WRITELN(CRCVerifyFile, VerifyLine);
          EXCEPT
            ON EInOutError DO
              MessageDlg('Error writing CRCVerifyFile file.', mtError, [mbOK], 0)
          END

        END
        ELSE Line := Line + '         ';    // Don't bother with directories
      END;

      Line := Line + Node^.Name;

      IF   WriteFlagFileList
      THEN WRITELN(FileListFile, Line)
    END;

  END
END {ProcessFile};


procedure TFormFileList.CheckBoxCRCClick(Sender: TObject);
begin
  IF   RadioGroupShow.ItemIndex = 0
  THEN CheckBoxCRC.Checked := FALSE;

  EditScanCRCVerifyFile.Visible     := CheckBoxCRC.Checked;
  LabelScanCRCVerifyFile.Visible    := CheckBoxCRC.Checked;
  SpeedButtonScanVerifyList.Visible := CheckBoxCRC.Checked;
  LabelCRC32.Visible                := CheckBoxCRC.Checked;
  LabelCRC32Value.Visible           := CheckBoxCRC.Checked
end;


FUNCTION GetVolumeInfoString(CONST DriveLetter:  CHAR):  STRING;
  VAR
    NotUsed           :  DWORD;   // Use DWORD for D3/D4 compatibility      
    VolumeFlags       :  DWORD;
    VolumeInfo        :  ARRAY[0..MAX_PATH] OF CHAR;
    VolumeSerialNumber:  DWORD;
BEGIN
  GetVolumeInformation(pChar(DriveLetter + ':\'),
                       VolumeInfo, SizeOf(VolumeInfo),
                       @VolumeSerialNumber, NotUsed, VolumeFlags, NIL, 0);
  RESULT := Format('Label = %s   VolSer = %8.8X', [VolumeInfo, VolumeSerialNumber])
END {GetVolumeInfoString};


procedure TFormFileList.BitBtnScanClick(Sender: TObject);
  VAR
    Code1         :  WORD;
    Code2         :  WORD;
    DirectoryPath :  STRING;
    DirectoryScope:  TDirectoryScope;
    FileCRC32     :  DWORD;
    ReturnCode    :  INTEGER;
    SearchRec     :  TSearchRec;
    Target        :  STRING;
    VerifyLine    :  STRING;

  // FLAG = FALSE to start Scan; TRUE when Scan finished
  PROCEDURE SetState (CONST Flag:  BOOLEAN);
  BEGIN
    AnimateScan.Active := NOT Flag;
    AnimateScan.Visible := NOT Flag;
    BitBtnCancelScan.Enabled := NOT Flag;

    BitBtnPrintLog.Enabled := Flag;
    BitBtnScanDirectory.Enabled   := Flag;
    BitBtnScanFile.Enabled := Flag;
    BitBtnScanVolume.Enabled := Flag;
    CheckBoxAllSubdirectories.Enabled := Flag;
    CheckBoxCRC.Enabled := Flag;
    DirectoryListBox.Enabled := Flag;
    DriveComboBox.Enabled := Flag;
    FileListBox.Enabled := Flag;
    GroupBoxOutputFiles.Enabled := Flag;
    RadioGroupShow.Enabled := Flag;
    SpeedButtonRefresh.Enabled := Flag;
  END {SetState};


  PROCEDURE ScanDirectoryTarget (CONST Info:  STRING);
    VAR
      DirectoryList :  TStringList;
      Line          :  STRING;
      Path          :  STRING;
      s             :  STRING;
  BEGIN
    IF   WriteFlagFileList
    THEN BEGIN
      WRITELN(FileListFile,
        'FileCheck:  ' + Target + ' ' +
        FormatDateTime('mm/dd/yyyy hh:nn', Now));
      IF   LENGTH(Info) > 0
      THEN WRITELN(FileListFile, Info);
      WRITELN(FileListFile, '')
    END;

    Line := '   Date      Time   Attrib    Bytes   ' + ' ';
    IF   CheckBoxCRC.Checked
    THEN Line := Line + ' CRC-32 ' + ' ';
    Line := Line + 'Filename';

    IF   WriteFlagFileList
    THEN WRITELN(FileListFile, Line);

    Line := '---------- -------- ------ -----------' + ' ';
    IF   CheckBoxCRC.Checked
    THEN Line := Line + '--------' + ' ';

    Line := Line + '--------';

    IF   WriteFlagFileList
    THEN WRITELN(FileListFile, Line);

    IF   LENGTH(Target) > 0
    THEN BEGIN
      DirectoryList := TStringList.Create;
      TRY
        DirectoryList.Sorted     := TRUE;
        DirectoryList.Duplicates := dupError;
        Path := Trim(Target);

        // Strip off any trailing '\'
        IF   Path[LENGTH(Path)] = '\'
        THEN SetLength(Path, LENGTH(Path)-1);

        IF   CheckBoxCRC.Checked
        THEN BEGIN
          IF   RadioGroupShow.ItemIndex = 0
          THEN BEGIN
            VerifyLine := Format('* %14s %8s %s',
                            [' ', ' ', 'Directories Only']);
            TRY
              IF   WriteFlagCRCVerify
              THEN WRITELN(CRCVerifyFile, VerifyLine);
            EXCEPT
              ON EInOutError DO
                MessageDlg('Error writing CRCVerifyFile file.', mtError, [mbOK], 0)
            END
          END;

          IF   LENGTH(Info) > 0
          THEN BEGIN
            VerifyLine := Format('V %14s %8s %s',
                            [' ', ' ', Info]);
            TRY
              IF   WriteFlagCRCVerify
              THEN WRITELN(CRCVerifyFile, VerifyLine);
            EXCEPT
              ON EInOutError DO
                MessageDlg('Error writing CRCVerifyFile file.', mtError, [mbOK], 0)
            END
          END;

          VerifyLine := Format('P %14s %8s %s',
                          [' ', ' ', Path]);
          TRY
            IF   WriteFlagCRCVerify
            THEN WRITELN(CRCVerifyFile, VerifyLine);
          EXCEPT
            ON EInOutError DO
              MessageDlg('Error writing CRCVerifyFile file.', mtError, [mbOK], 0)
          END;

        END;

        DirectoryList.Add(Path);
        StartTime := GetTickCount;
        ScanDirectory(DirectoryList,
                      DirectoryScope,
                      ProcessDirectory,
                      ProcessFile,
                      OrderByFileName)
      FINALLY
        DirectoryList.Clear;
        DirectoryList.Free
      END
    END;

    IF  CheckBoxCRC.Checked
    THEN BEGIN
      LabelCRC32Value.Caption := IntToHex(NOT AllCRC32, 8);
      LabelCRC32Value.Update
    END;

    IF   WriteFlagFileList AND FileListLibrary.ContinueScan
    THEN BEGIN
      WRITELN(FileListFile, '');
      WRITELN(FileListFile,'Summary of ' + Target);
      WRITELN(FileListFile,'  Directories = ' + Format('%15s', [LabelDirCount.Caption]));
      WRITELN(FileListFile,'  Files       = ' + Format('%15s', [LabelFileCount.Caption]));
      WRITELN(FileListFile,'  Bytes       = ' + Format('%15s', [LabelByteCount.Caption]));

      IF   CheckBoxCRC.Checked
      THEN BEGIN
        IF   WriteFlagFileList
        THEN WRITELN(FileListFile,'  Meta CRC-32 = ' + Format('%15s', [LabelCRC32Value.Caption]));

        VerifyLine := Format('S %14s %s %d %d',
                            [FormatFloat(FormatBytesString, AllBytecount),
                             IntToHex(NOT AllCRC32,8),
                             AllFileCount, AllDirCount]);
        TRY
          IF   WriteFlagCRCVerify
          THEN WRITELN(CRCVerifyFile, VerifyLine);
        EXCEPT
          ON EInOutError DO
            MessageDlg('Error writing CRCVerifyFile file.', mtError, [mbOK], 0)
        END

      END
    END;

    s := Format('%s = %s, %s = %s, %s = %s',
                [LabelDir.Caption,
                 LabelDirCount.Caption,
                 LabelFile.Caption,
                 LabelFileCount.Caption,
                 LabelByte.Caption,
                 LabelByteCount.Caption]);
    IF   CheckBoxCRC.Checked
    THEN s := s + Format(', %s = %s',
                [LabelCRC32.Caption,
                 LabelCRC32Value.Caption]);
    MemoScanLog.Lines.Add(s);
    MemoScanLog.Lines.Add('Scan time = ' + LabelScanElapsedTime.Caption +
                          ' sec  (' +
                          FormatDateTime('d mmm yyyy  h:nn:ss', Now) + ')');

  END {ScanDirectoryTarget};

begin
  ErrorCount := 0;

  Code1 := 0;  // in case files are never opened
  Code2 := 0;

  ResetScanValues;

  // The "New" button affects output files and the ErrorLog
  IF   SpeedButtonNew.Down
  THEN MemoScanLog.Lines.Clear;

  // WriteFlagFileList will be TRUE if filename is non-blank
  WriteFlagFileList := (Trim(EditScanFileListFile.Text) <> '');
  IF   WriteFlagFileList
  THEN BEGIN
    AssignFile(FileListFile, EditScanFileListFile.Text);

    {$I-}
    IF   SpeedButtonNew.Down
    THEN BEGIN
      // For "New" always rewrite new file
      Rewrite(FileListFile);
    END
    ELSE BEGIN
      // Append button must be down:  Append if file already exists,
      // otherwise rewrite new file
      IF   SysUtils.FileExists(EditScanFileListFile.Text)
      THEN Append(FileListFile)
      ELSE Rewrite(FileListFile)
    END;
    {$I+}

    Code1 := IORESULT;
    IF   Code1 <> 0
    THEN ShowMessage('Cannot open FileList File <' + EditScanFileListFile.Text + '.');
  END;

  WriteFlagCRCVerify := (Trim(EditScanCRCVerifyFile.Text) <> '');
  IF   WriteFlagCRCVerify
  THEN BEGIN
    AssignFile(CRCVerifyFile, EditScanCRCVerifyFile.Text);

    {$I-}
    IF   SpeedButtonNew.Down
    THEN BEGIN
      // For "New" always rewrite new file
      Rewrite(CRCVerifyFile);
    END
    ELSE BEGIN
      // Append button must be down:  Append if file already exists,
      // otherwise rewrite new file
      IF   SysUtils.FileExists(EditScanCRCVerifyFile.Text)
      THEN Append(CRCVerifyFile)
      ELSE Rewrite(CRCVerifyFile)
    END;
    {$I+}

    Code2 := IORESULT;
    IF   Code2 <> 0
    THEN ShowMessage('Cannot open CRC Verify File <' + EditScanCRCVerifyFile.Text + '.');
  END;

  // Continue only if there is no problem opening file(s)
  IF   (Code1 + Code2) = 0
  THEN BEGIN
    SetState (FALSE);
    TRY
      Screen.Cursor := crHourGlass;
      TRY
      
        CASE (Sender AS TBitBtn).Tag OF
          1:  BEGIN
                DirectoryScope := dsAllDirectories;
                Target := DriveComboBox.Drive + ':\';

                MemoScanLog.Lines.Add(GetVolumeInfoString(DriveComboBox.Drive));
                MemoScanLog.Lines.Add('Volume ' + Target);
                LabelCRC32.Caption := 'Meta CRC32';
                ScanDirectoryTarget (GetVolumeInfoString(DriveComboBox.Drive));
              END;

          2:  BEGIN
                IF   CheckBoxAllSubdirectories.Checked
                THEN DirectoryScope := dsAllDirectories
                ELSE DirectoryScope := dsSingleDirectory;
                Target := DirectoryListBox.Directory;
                MemoScanLog.Lines.Add('Directory ' + Target);
                LabelCRC32.Caption := 'Meta CRC32';
                ScanDirectoryTarget ('');
              END;

          3:  BEGIN
                Target := FileListBox.FileName;
                StartTime := GetTickCount;   // Reset this for files only
                MemoScanLog.Lines.Add('File ' + Target);

                // This is somewhat of a kludge just to use ProcessFile routine
                ReturnCode := FindFirst(Target, faAnyFile, SearchRec);
                TRY
                  IF   ReturnCode = 0   // should always be TRUE
                  THEN BEGIN
                    DirectoryPath := ExtractFilePath(Target);

                    // get rud if '\' at end (if present)
                    IF   DirectoryPath[LENGTH(DirectoryPath)] = '\'
                    THEN SetLength(Directorypath, LENGTH(DirectoryPath)-1);

                    FileCRC32 := ProcessFile(DirectoryPath, @SearchRec);

                    LabelCRC32.Caption := 'CRC32';

                    // The normal CRC value displayed is a "meta-CRC" in
                    // AllCRC32.  When only a single file is scanned, let's
                    // replace with actual file CRC32
                    LabelCRC32Value.Caption := IntToHex(FileCRC32, 8)
                  END
                  ELSE BEGIN
                    LabelCRC32Value.Caption := '';
                    LabelCRC32.Caption := ''
                  END
                FINALLY
                  FindClose(SearchRec)
                END

              END;

        END;

      FINALLY
        Screen.Cursor := crDefault
      END
    FINALLY
      SetState(TRUE)
    END
  END;

  IF   WriteFlagFileList
  THEN CloseFile(FileListFile);

  IF   WriteFlagCRCVerify
  THEN CloseFile(CRCVerifyFile)
end;


procedure TFormFileList.BitBtnCancelScanClick(Sender: TObject);
begin
  FileListLibrary.ContinueScan := FALSE
end;

procedure TFormFileList.FormCreate(Sender: TObject);
begin
  LabelDirectory.Caption := '';
  LabelFilename.Caption  := '';
  ResetScanValues
end;


procedure TFormFileList.SpeedButtonScanFileListClick(Sender: TObject);
begin
  SaveDialog.Filename := EditScanFileListFile.Text;
  IF   SaveDialog.Execute
  THEN EditScanFileListFile.Text := SaveDialog.Filename
end;


procedure TFormFileList.SpeedButtonScanVerifyListClick(Sender: TObject);
begin
  SaveDialog.Filename := EditScanCRCVerifyFile.Text;
  IF   SaveDialog.Execute
  THEN EditScanCRCVerifyFile.Text := SaveDialog.Filename
end;


procedure TFormFileList.SpeedButtonRefreshClick(Sender: TObject);
  VAR
    SaveDrive:  CHAR;
begin
  SaveDrive := DriveComboBox.Drive;
  TMyDriveComboBox(DriveComboBox).BuildList;
  DriveComboBox.Drive := SaveDrive;
  TMyDirectoryListBox(DirectoryListBox).BuildList;
end;


PROCEDURE TFormFileList.ResetScanValues;
BEGIN
  AllByteCount := 0;
  AllCRC32     := $FFFFFFFF;
  AllDirCount  := 0;
  AllFileCount := 0;

  LabelDirCount.Caption := FormatFloat('###,##0', AllDirCount);
  LabelFileCount.Caption := FormatFloat('###,###,##0', AllFileCount);
  LabelByteCount.Caption := FormatFloat('###,###,###,##0', AllByteCount);

  LabelCRC32Value.Caption := '';
  LabelCRC32.Caption := '';

  Application.ProcessMessages   // force update (not always needed)
END {ResetScanValue};


PROCEDURE TFormFileList.WmDeviceChange(VAR Msg:  TWMDeviceChange);
  VAR
{$IFDEF DEBUG}
    p        :  pDevBroadcastVolume;
    s        :  STRING;
{$ENDIF}
    SaveDrive:  CHAR;
BEGIN
  SaveDrive := DriveComboBox.Drive;
  TMyDriveComboBox(DriveComboBox).BuildList;
  DriveComboBox.Drive := SaveDrive;
  TMyDirectoryListBox(DirectoryListBox).BuildList;
{$IFDEF DEBUG}

  CASE Msg.Event OF
    $8000:  s := 'Device Arrival ';
    $8004:  s := 'Device Gone ';
    ELSE    s := 'Device Change (' + IntToStr(Msg.Event) + ')';
  END;

  p := Msg.dwData;
  s := s + ', size = '       + IntToStr(p^.dbcv_size);
  s := s + ', devicetype = ' + IntToStr(p^.dbcv_devicetype);
  s := s + ', reserved = '   + IntToHex(p^.dbcv_reserved,8);
  s := s + ', unitmask = '   + IntToStr(p^.dbcv_unitmask);
  s := s + ', flags = '      + IntToStr(p^.dbcv_flags);

  MemoErrorLog.Lines.Add(s);

{$ENDIF}
  Msg.Result := 1
END {WmDeviceChange};



procedure TFormFileList.BitBtnPrintLogClick(Sender: TObject);
  VAR
    i        :  INTEGER;
    iFromLeft:  INTEGER;
    jDelta   :  INTEGER;
    jFromTop :  INTEGER;
    Memo     :  TMemo;
begin
  CASE (Sender AS TBitBtn).Tag OF
    1:  Memo := MemoScanLog;
    2:  Memo := MemoVerifyLog;
    ELSE Memo := NIL;          // should never happen; avoid compiler warning
  END;

  IF   Memo.Lines.Count > 0    // avoid blank pages if nothing to print
  THEN BEGIN

    Printer.BeginDoc;
    TRY
      Printer.Canvas.Font.Name := 'Arial';
      Printer.Canvas.Font.Height :=
        MulDiv(GetDeviceCaps(Printer.Canvas.Handle, LOGPIXELSY), 8 {point}, 72);
      Printer.Canvas.Font.Style := [];

      iFromLeft := MulDiv(Printer.PageWidth, 2, 100);  //  2% from left

      jFromTop := MulDiv(Printer.PageHeight, 2, 100);  //  2% from top
      jDelta := Printer.Canvas.TextHeight('X');

      FOR i := 0 TO Memo.Lines.Count-1 DO
      BEGIN
        Printer.Canvas.TextOut(iFromLeft, jFromTop, Memo.Lines[i]);
        INC(jFromTop, jDelta)
      END;
    FINALLY
      Printer.EndDoc
    END

  END
end;

procedure TFormFileList.SpeedButtonVerifyVerifyListClick(Sender: TObject);
begin
  OpenDialog.Filename := EditVerifyCRCVerifyFile.Text;
  IF   OpenDialog.Execute
  THEN EditVerifyCRCVerifyFile.Text := OpenDialog.Filename
end;


// In general, separate, local variables are used in this method in case
// scanning and verifying is occurring at the same time.
procedure TFormFileList.BitBtnVerifyFileClick(Sender: TObject);
  TYPE
    TDirectoryMode = (dmFilesAndDirectories, dmOnlyDirectories);

  VAR
    AllByteCount   :  TInteger8;
    AllCRC32       :  DWORD;
    AllDirCount    :  INTEGER;
    AllFileCount   :  INTEGER;
    CRCTemp        :  DWORD;
    CRCValueHex    :  STRING;
    DirByteCount   :  TInteger8;
    DirCRC32       :  DWORD;
    DirFileCount   :  INTEGER;
    DirectoryMode  :  TDirectoryMode;
    Error          :  WORD;
    ErrorCount     :  INTEGER;
    FileCRCvalue   :  DWORD;
    FileBytes      :  TInteger8;
    Line           :  STRING;
    LineCount      :  INTEGER;
    MismatchCount  :  INTEGER;
    StartTime      :  DWORD;
    VerifyFile     :  TextFile;

  PROCEDURE ParseAndProcessLine;
    VAR
      Code           :  CHAR;
      DirCountString :  STRING;
      DirectoryName  :  STRING;
      FileBytesString:  STRING;
      FileCountString:  STRING;
      FileName       :  STRING;
      MetaCRCValueHex:  STRING;
      SumBytesString :  STRING;
      Tokens         :  TTokens;
  BEGIN
    IF   LENGTH(Line) > 0
    THEN BEGIN
      // Tokenize each line for convenience
      // Quotes were used to enclose any filename/directory name with
      // embedded blanks
      Tokens := TTokens.Create(Line, ' ', '"', '"', #$00, FALSE);
      TRY
        Code := Line[1];      // Should be same as Tokens.Token(1)

        CASE Code OF
          '*':  BEGIN
                  // For now, this statement sets "OnlyDirectories" mode which
                  // was used during scanning.  This means separate 'F' records
                  // will NOT exist before encountering a 'D' record.
                  DirectoryMode := dmOnlyDirectories;
                END;

          'D':  BEGIN
                  // Directory:  D  SumBytes MetaCRC DirName FileCount
                  // Token:      1      2        3      4        5

                  // Cannot use INC on COMPs in D3
                  AllByteCount := AllByteCount + DirByteCount;

                  INC (AllDirCount, 1);
                  INC (AllFileCount, DirFileCount);

                  // Use Strings instead of comparing COMPs in D3
                  SumBytesString  := FormatFloat(FormatBytesString, DirByteCount);
                  FileCountString := Format('%d', [DirFileCount]);

                  MetaCRCValueHex := IntToHex(NOT DirCRC32,8);

                  DirectoryName := Tokens.Token(4);

                  IF  (SumBytesString  <> Tokens.Token(2)) OR
                      (MetaCRCValueHex <> Tokens.Token(3)) OR
                      (FileCountString <> Tokens.Token(5))
                  THEN BEGIN
                    INC(MismatchCount);
                    MemoVerifyLog.Lines.Add('Directory ' + DirectoryName + ' does NOT match.');
                    MemoVerifyLog.Lines.Add('  OldBytes = ' + Tokens.Token(2)   +
                                            ', NewBytes = ' + SumBytesString);
                    MemoVerifyLog.Lines.Add('  OldFileCount = ' + Tokens.Token(5)   +
                                            ', NewFileCount = ' + FileCountString);
                    MemoVerifyLog.Lines.ADd('  OldMetaCRC = ' + Tokens.Token(3) +
                                            ', NewMetaCRC = ' + MetaCRCValueHex)
                  END;

                  DirByteCount := 0;
                  DirCRC32     := $FFFFFFFF;
                  DirFileCount := 0;
                END;

          'F':  BEGIN
                  // File:  F  Bytes  CRC  FileName
                  // Token  1    2     3       4

                  FileName := Tokens.Token(4);
                  LabelVerifyFileName.Caption := 'Filename:  ' + FileName;

                  CalcFileCRC32 (FileName, FileCRCvalue, FileBytes, Error);
                  IF   Error <> 0       // Ignore errors
                  THEN BEGIN
                    INC (ErrorCount);
                    MemoVerifyLog.Lines.Add(IntToStr(ErrorCount) + '.  ' + 'Error Code ' +
                                            IntToStr(Error) +
                                            ' reading file ' + FileName);
                    FileCRCValue := 0;   // but make CRC-32 predictable
                  END;

                  CRCValueHex := IntToHex(FileCRCvalue, 8);

                  // Use Strings instead of comparing COMPs in D3
                  FileBytesString := FormatFloat(FormatBytesString, FileBytes);

                  IF  (FileBytesString <> Tokens.Token(2)) OR
                      (CRCValueHex     <> Tokens.Token(3))
                  THEN BEGIN
                    INC(MismatchCount);
                    MemoVerifyLog.Lines.Add('File ' + FileName + ' does NOT match.');
                    MemoVerifyLog.Lines.Add('  OldBytes = ' + Tokens.Token(2) +
                                            ', NewBytes = ' + FileBytesString +
                                            ', OldCRC = ' + Tokens.Token(3)  +
                                            ', NewCRC = ' + CRCValueHex)
                  END;

                  // Update Directory "CRC"
                  CRCTemp := DirCRC32;
                  CalcCRC32 (@CRCValueHex[1], SizeOf(CRCValueHex), CRCTemp);
                  DirCRC32 := CRCTemp;

                  // Update All "CRC"
                  CRCTemp := AllCRC32;
                  CalcCRC32 (@CRCValueHex[1], SizeOf(CRCValueHex), CRCTemp);
                  AllCRC32 := CRCTemp;

                  DirByteCount := DirByteCount + FileBytes;
                  INC (DirFileCount);

                  // Any file resets this mode.  Should only happen if "Append"
                  // is used in a Scan with a switch between Files and Directories
                  // Scan Details.
                  DirectoryMode := dmFilesAndDirectories;
                END;

          'P':  BEGIN
                  // Path:  P PrefixPath
                  // Do nothing with the path for now
                END;

          'S':  BEGIN
                  // Summary:  S  SumBytes  MetaCRC  FileCount  DirCount
                  // Token:    1     2         3        4          5

                  // Use Strings instead of comparing COMPs in D3
                  SumBytesString  := FormatFloat(FormatBytesString, AllByteCount);
                  DirCountString  := Format('%d', [AllDirCount]);
                  FileCountString := Format('%d', [AllFileCount]);

                  MetaCRCValueHex := IntToHex(NOT AllCRC32,8);

                  IF  (SumBytesString  <> Tokens.Token(2)) OR
                      (MetaCRCValueHex <> Tokens.Token(3)) OR
                      (FileCountString <> Tokens.Token(4)) OR
                      (DirCountString  <> Tokens.Token(5))
                  THEN BEGIN
                    INC (MismatchCount);
                    MemoVerifyLog.Lines.Add('Summary does not match.');
                    MemoVerifyLog.Lines.Add('  OldBytes = ' + Tokens.Token(2)   +
                                            ', NewBytes = ' + SumBytesString);
                    MemoVerifyLog.Lines.Add('  OldFileCount = ' + Tokens.Token(4)   +
                                            ', NewFileCount = ' + FileCountString);
                    MemoVerifyLog.Lines.Add('  OldDirCount = ' + Tokens.Token(5)   +
                                            ', NewDirCount = ' + DirCountString);
                    MemoVerifyLog.Lines.Add('  OldMetaCRC = ' + Tokens.Token(3)     +
                                            ', NewMetaCRC = ' + MetaCRCValueHex);
                  END;

                  IF   MismatchCount = 0
                  THEN MemoVerifyLog.Lines.Add('Everything Matches:  Files, Directories, Summary');

                  AllByteCount := 0;
                  AllCRC32     := $FFFFFFFF;
                  AllDirCount  := 0;
                  AllFileCount := 0;
                  MismatchCount := 0;
                END;

          'V':  BEGIN
                  // Do nothing with a volume record for now
                END;


          ELSE
            // Do nothing with other records (for now)
        END

      FINALLY
        Tokens.Free
      END
    END
  END {ParseAndProcessLine};

begin
  MemoVerifyLog.Lines.Clear;

  IF   FileExists(EditVerifyCRCVerifyFile.Text)
  THEN BEGIN
    AnimateVerify.Active := TRUE;
    AnimateVerify.Visible := TRUE;
    BitBtnCancelVerify.Enabled := TRUE;
    TRY

      MemoVerifyLog.Lines.Add('Verifying CRCs in file ' + EditVerifyCRCVerifyFile.Text + ' ...');

      AssignFile(VerifyFile, EditVerifyCRCVerifyFile.Text);
      Reset(VerifyFile);

      // Count lines in file to use in progress bar
      LineCount := 0;
      ErrorCount := 0;
      WHILE NOT EOF(VerifyFile) DO
      BEGIN
        READLN(VerifyFile, Line);
        INC(LineCount);
      END;
      CloseFile(VerifyFile);

      Reset(VerifyFile);
      ContinueVerify := TRUE;

      // These initializations are here in case there is a corruption of the
      // CRC file.
      AllByteCount := 0;
      AllCRC32     := $FFFFFFFF;
      AllDirCount  := 0;
      AllFileCount := 0;

      DirByteCount := 0;
      DirCRC32     := $FFFFFFFF;
      DirFileCount := 0;

      MismatchCount := 0;
      ProgressBar.Position := 0;
      ProgressBar.Max := LineCount;
      ProgressBar.Visible := TRUE;

      LineCount := 0;

      StartTime := GetTickCount;
 
      WHILE (NOT EOF(VerifyFile)) AND ContinueVerify DO
      BEGIN
        READLN(VerifyFile, Line);
        ParseAndProcessLine;

        // Update elapsed time after every line is processed
        LabelVerifyElapsedTime.Caption := Format('%.1f', [0.001*(GetTickCount-StartTime)]);

        INC(LineCount);
        ProgressBar.Position := LineCount;

        Application.ProcessMessages;   // all cancel click to register
      END;
      CloseFile(VerifyFile);

      MemoVerifyLog.Lines.Add('Verify time = ' + LabelVerifyElapsedTime.Caption +
                              ' sec  (' +
                              FormatDateTime('d mmm yyyy  h:nn:ss', Now) + ')');

      ProgressBar.Visible := FALSE;
    FINALLY
      AnimateVerify.Active := FALSE;
      AnimateVerify.Visible := FALSE;
      BitBtnCancelVerify.Enabled := FALSE
    END

  END
  ELSE MemoVerifyLog.Lines.Add('Cannot find file ' + EditVerifyCRCVerifyFile.Text)
end;


procedure TFormFileList.BitBtnCancelVerifyClick(Sender: TObject);
begin
  ContinueVerify := FALSE
end;


procedure TFormFileList.RadioGroupShowClick(Sender: TObject);
begin
  // For now, FORCE no CRCs if Directories only selected
  IF   RadioGroupShow.ItemIndex = 0
  THEN CheckBoxCRCClick(Sender);
end;


procedure TFormFileList.LabelLabURL2Click(Sender: TObject);
begin
  ShellExecute(0, 'open', pchar('http://www.efg2.com/lab'),
               NIL, NIL, SW_NORMAL)
end;


end.
