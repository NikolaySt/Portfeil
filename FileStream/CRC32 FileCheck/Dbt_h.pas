// Partial translation of DBT.H
//
//  Adapted from:
//  Notification of CD-ROM insertion and removal
//  http://www.undu.com/Articles/980221b.htm
//
//  efg, August 1999

UNIT DBT_H;

INTERFACE

  USES
    Windows;  // UNIT, DWORD

  CONST
    // Events of WM_DEVICECHANGE (wParam)
    DBT_DEVICEARRIVAL           = $8000;  // system detected a new device
    DBT_DEVICEQUERYREMOVE       = $8001;  // wants to remove, may fail
    DBT_DEVICEQUERYREMOVEFAILED = $8002;  // removal aborted
    DBT_DEVICEREMOVEPENDING     = $8003;  // about to remove, still avail
    DBT_DEVICEREMOVECOMPLETE    = $8004;  // device is gone
    DBT_DEVICETYPESPECIFIC      = $8005;  // type specific event
    DBT_CONFIGCHANGED           = $0018;

    // type of device in DEV_BROADCAST_HDR
    DBT_DEVTYP_OEM              = $00000000;  // OEM- or IHV-defined
    DBT_DEVTYP_DEVNODE          = $00000001;  // Devnode number
    DBT_DEVTYP_VOLUME           = $00000002;  // Logical volume
    DBT_DEVTYP_PORT             = $00000003;  // Port (serial or parallel
    DBT_DEVTYP_NET              = $00000004;  // Network resource

    // media types in DBT_DEVTYP_VOLUME
    DBTF_MEDIA                  = $0001;      // change affects media in drive
    DBTF_NET                    = $0002;      // logical volume is network volume


  TYPE
    // Instead of TMessage, use this:
    TWMDeviceChange =
      RECORD
        Msg    :  Cardinal;
        Event  :  UINT;
        dwData :  pointer;
        Result :  LongInt;
      END;

    // In a DBT_DEVICECHANGE or DBT_DEVICEREMOVECOMPLETE event, dwData contains an
    // address of a DEV_BROADCAST_HDR structure identifying the device inserted.

      TDevBroadcastHDR =
        PACKED RECORD
          dbch_size      :  DWORD;
          dbch_devicetype:  DWORD;
          dbch_reserved  :  DWORD;
        END;
      pDevBroadcastHDR = ^TDevBroadcastHDR;

    // When the device is of type volume, then we can get some device specific
    // information, namely specific information about a logical volume.


      TDevBroadcastVolume =
      PACKED RECORD
        dbcv_size      :  DWORD;
        dbcv_devicetype:  DWORD;
        dbcv_reserved  :  DWORD;
        dbcv_unitmask  :  DWORD;
        dbcv_flags     :  WORD;
      END;
      pDevBroadcastVolume = ^TDevBroadcastVolume;

IMPLEMENTATION

END.
