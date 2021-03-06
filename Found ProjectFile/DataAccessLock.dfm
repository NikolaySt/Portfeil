object DataLock: TDataLock
  OldCreateOrder = False
  OnCreate = DataLockCreate
  OnDestroy = DataLockDestroy
  Left = 263
  Top = 310
  Height = 164
  Width = 153
  object TblBIndex: TTable
    DatabaseName = 'Portfeil'
    TableName = 'BIndex'
    Left = 26
    Top = 10
  end
  object TblBLihva: TTable
    DatabaseName = 'Portfeil'
    TableName = 'BLihva'
    Left = 92
    Top = 11
  end
  object TblPazrCena: TTable
    DatabaseName = 'Portfeil'
    TableName = 'PazrCena'
    Left = 92
    Top = 69
  end
  object TblPortData: TTable
    DatabaseName = 'Portfeil'
    TableName = 'Portdata'
    Left = 25
    Top = 68
  end
end
