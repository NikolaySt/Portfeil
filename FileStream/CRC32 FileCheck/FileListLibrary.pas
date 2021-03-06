// FileCheck of Directories for Controlling Magnetic Media
// efg, 2/10/1998

UNIT FileListLibrary;

INTERFACE

  USES
    Windows,      // DWORD
    Classes,      // TStringList
    SysUtils;     // TSearchRec

  TYPE
    pSearchRec        =  ^TSearchRec;
    TSequence         = (sqBegin, sqEnd);
    TDirectoryScope   = (dsSingleDirectory, dsAllDirectories);
    TProcessDirectory = PROCEDURE (CONST sequence:  TSequence;
                                   CONST directory:  STRING);
    TProcessFile      = FUNCTION  (CONST directory:  STRING;
                                   CONST node:  pSearchRec):  DWORD;

  FUNCTION FormatAttributes(CONST attr:  INTEGER):  STRING;

  PROCEDURE ScanDirectory(VAR   DirectoryList   :  TStringList;
                          CONST DirectoryScope  :  TDirectoryScope;
                          CONST ProcessDirectory:  TProcessDirectory;
                          CONST ProcessFile     :  TProcessFile;
                          CONST ListSortCompare :  TListSortCompare);

  VAR
    ContinueScan:  BOOLEAN;

IMPLEMENTATION

  FUNCTION FormatAttributes(CONST attr:  INTEGER):  STRING;
  BEGIN
    RESULT := '------';

    IF   attr AND faReadOnly  > 0
    THEN RESULT[6] := 'R';

    IF   attr AND faHidden    > 0
    THEN RESULT[5] := 'H';

    IF   attr AND faSysFile   > 0
    THEN RESULT[4] := 'S';

    IF   attr AND faVolumeID  > 0
    THEN RESULT[3] := 'V';

    IF   attr AND faDirectory > 0
    THEN RESULT[2] := 'D';

    IF   attr AND faArchive   > 0
    THEN RESULT[1] := 'A';

  END {FormatAttributes};


  // Scan directory
  //
  // On entry DirectoryList is the List of directories to scan.
  // On exit DirectoryList is an empty list.
  //
  // ProcessDirectory is called as each directory is removed from the
  // DirectoryList.
  //
  // ListSortCompare is used by by the Sort method of TList to sort
  // the List in order. Pass NIL for ListSortCompare to avoid sorting.
  //
  // ProcessFile is called for each file in the directory.  Only the
  // '.' and '..' directory entries are ignored.  All other entries
  // are processed with ProcessFile
  //
  PROCEDURE ScanDirectory(VAR   DirectoryList   :  TStringList;
                          CONST DirectoryScope  :  TDirectoryScope;
                          CONST ProcessDirectory:  TProcessDirectory;
                          CONST ProcessFile     :  TProcessFile;
                          CONST ListSortCompare :  TListSortCompare);
    VAR
      i         :  INTEGER;
      List      :  TList;
      Node      :  pSearchRec;
      Path      :  STRING;
      ReturnCode:  INTEGER;
      SearchRec :  TSearchRec;

  BEGIN
    // Can be set to FALSE externally to stop scan if callbacks permit
    // Application.ProcessMessages and set to FALSE
    ContinueScan := TRUE;

    List := TList.Create;
    TRY
      WHILE ContinueScan AND (DirectoryList.Count > 0) DO
      BEGIN
        // Get next directory in list
        Path := DirectoryList.Strings[0];

        // Delete directory from list
        DirectoryList.Delete(0);

        // Directory Callback for "Beginning"
        ProcessDirectory(sqBegin, Path);

        // Create TList of TSearchRec records
        ReturnCode := FindFirst(Path + '\*.*', faAnyFile, SearchRec);
        TRY
          WHILE ReturnCode = 0 DO
          BEGIN
            New(Node);
            Node^.Name := SearchRec.Name;
            Node^.Attr := SearchRec.Attr;
            Node^.Size := SearchRec.Size;
            Node^.Time := SearchRec.Time;
            List.Add(Node);
            ReturnCode := FindNext(SearchRec)
          END;
        FINALLY
          FindClose(SearchRec)
        END;

        // Sort the TList of TSearchRec records.  Don't try to sort
        // if no comparison function is specified.
        IF   @ListSortCompare <> NIL
        THEN List.Sort(ListSortCompare);

        // Step through sorted list
        i := 0;
        WHILE ContinueScan AND (i < List.Count) DO
        BEGIN
          Node := List.Items[i];
          IF   (Node^.Attr AND faDirectory > 0)
          THEN BEGIN
            IF(Node^.Name <> '.') AND (Node^.Name <> '..')
            THEN BEGIN
               IF   DirectoryScope = dsAllDirectories
               THEN DirectoryList.Add(Path + '\' + Node^.Name);

               // File Callback
               ProcessFile(Path, Node)
            END
          END
          ELSE ProcessFile(Path, Node);

          INC (i)
        END;

        List.Clear;

        // Directory Callback for "End"
        ProcessDirectory(sqEnd, Path);
      END
    FINALLY
      List.Free
    END
  END {ScanDirectory};

END.
