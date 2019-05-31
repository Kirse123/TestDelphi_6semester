unit Project1_TLB;

// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 31.05.2019 12:40:26 from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\General\Документы\GitHub\Delphi\TestDelphi\MyAppServer\Project1 (1)
// LIBID: {73A6D16F-1746-4EB8-9F59-ABE91AC95A7D}
// LCID: 0
// Helpfile:
// HelpString:
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v1.0 Midas, (E:\Embarcadero\Embarcadero\Studio\20.0\bin64\midas.dll)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, Midas, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;



// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  Project1MajorVersion = 1;
  Project1MinorVersion = 0;

  LIBID_Project1: TGUID = '{73A6D16F-1746-4EB8-9F59-ABE91AC95A7D}';

  IID_IMyServer: TGUID = '{B984B157-3A4D-49B1-8AE6-62F8F792F8B9}';
  CLASS_MyServer: TGUID = '{858FC157-C558-4B7C-B6B8-3020998C5779}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IMyServer = interface;
  IMyServerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  MyServer = IMyServer;


// *********************************************************************//
// Interface: IMyServer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B984B157-3A4D-49B1-8AE6-62F8F792F8B9}
// *********************************************************************//
  IMyServer = interface(IAppServer)
    ['{B984B157-3A4D-49B1-8AE6-62F8F792F8B9}']
  end;

// *********************************************************************//
// DispIntf:  IMyServerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B984B157-3A4D-49B1-8AE6-62F8F792F8B9}
// *********************************************************************//
  IMyServerDisp = dispinterface
    ['{B984B157-3A4D-49B1-8AE6-62F8F792F8B9}']
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: SYSINT;
                             out ErrorCount: SYSINT; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: SYSINT; out RecsOut: SYSINT;
                           Options: SYSINT; const CommandText: WideString; var Params: OleVariant;
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: SYSINT;
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString;
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoMyServer provides a Create and CreateRemote method to
// create instances of the default interface IMyServer exposed by
// the CoClass MyServer. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoMyServer = class
    class function Create: IMyServer;
    class function CreateRemote(const MachineName: string): IMyServer;
  end;

implementation

uses System.Win.ComObj;

class function CoMyServer.Create: IMyServer;
begin
  Result := CreateComObject(CLASS_MyServer) as IMyServer;
end;

class function CoMyServer.CreateRemote(const MachineName: string): IMyServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MyServer) as IMyServer;
end;

end.

