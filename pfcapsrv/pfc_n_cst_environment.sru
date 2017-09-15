HA$PBExportHeader$pfc_n_cst_environment.sru
$PBExportComments$PFC Environment Service class
forward
global type pfc_n_cst_environment from n_base
end type
type system_info from structure within pfc_n_cst_environment
end type
type osversioninfoex from structure within pfc_n_cst_environment
end type
end forward

type system_info from structure
	unsignedinteger		ui_wprocessorarchitecture
	unsignedinteger		ui_wreserved
	unsignedlong		ul_dwpagesize
	unsignedlong		ul_lpminimumapplicationaddress
	unsignedlong		ul_lpmaximumapplicationaddress
	unsignedlong		ul_dwactiveprocessormask
	unsignedlong		ul_dwnumberofprocessors
	unsignedlong		ul_dwprocessortype
	unsignedlong		ul_dwallocationgranularity
	unsignedinteger		ui_wprocessorlevel
	unsignedinteger		ui_wprocessorrevision
end type

type osversioninfoex from structure
	unsignedlong		ul_dwosversioninfosize
	unsignedlong		ul_dwmajorversion
	unsignedlong		ul_dwminorversion
	unsignedlong		ul_dwbuildnumber
	unsignedlong		ul_dwplatformid
	character		c_szcsdversion[128]
	unsignedinteger		ui_wservicepackmajor
	unsignedinteger		ui_wservicepackminor
	unsignedinteger		ui_wsuitemask
	unsignedinteger		ui_wproducttype
end type

global type pfc_n_cst_environment from n_base autoinstantiate
event pfc_osversioninfodecode ( osversioninfoex astr_ovix )
event type string pfc_osversiondesc ( string as_versiondesc )
event type string pfc_oseditiondesc ( string as_editiondesc )
event type integer pfc_osproductinfodecode ( )
end type

type prototypes
// The following API's require Windows 2000 and above.
SUBROUTINE			GetSystemInfo( REF system_info lpSystemInfo) &
                                 LIBRARY "kernel32.dll" ALIAS FOR "GetSystemInfo"
FUNCTION ULong    GetComputerName( REF String lpBuffer, REF ULong lpnSize) &
                                 LIBRARY "kernel32.dll" ALIAS FOR "GetComputerNameW"
FUNCTION Boolean  GetVersionEx( REF osversioninfoex lpOSVersionInfoEx) &
                                 LIBRARY "kernel32.dll" ALIAS FOR "GetVersionExW"
FUNCTION Integer  GetSystemMetrics( Integer nIndex) LIBRARY "user32.dll"

// The following API's require Windows XP and above or Windows Server 2003 and above.
SUBROUTINE			GetNativeSystemInfo( REF system_info lpSystemInfo) &
                                 LIBRARY "kernel32.dll" ALIAS FOR "GetNativeSystemInfo"
FUNCTION ULong		GetCurrentProcess() LIBRARY "kernel32.dll"

// The following API's require Windows XP SP2 and above or Windows Server 2003 SP1 and above.
FUNCTION Boolean	IsWow64Process( ULong hProcess, REF Boolean Wow64Process) &
                                 LIBRARY "kernel32.dll"
FUNCTION Boolean  GetProductInfo( ULong dwOSMajorVersion, ULong dwOSMinorVersion, &
                                 ULong dwSPMajorVersion, ULong dwSPMinorVersion, &
                                 REF ULong pdwReturnedProductType) &
                                 LIBRARY "kernel32.dll"
end prototypes

type variables
Protected:
// Constants used as Windows API argument values or used to decode
// information supplied by Windows in response to an API call.
Constant ULong PROCESSOR_ARCHITECTURE_INTEL = 0
Constant ULong PROCESSOR_ARCHITECTURE_IA64  = 6
Constant ULong PROCESSOR_ARCHITECTURE_AMD64 = 9
Constant ULong OSVERSIONINFOEX_STRUCTURE_SIZE_UNICODE = 284

Constant UInt VER_NT_WORKSTATION       = 1
Constant UInt VER_NT_SERVER            = 3
Constant UInt VER_UNDOCUMENTED_VM_MASK = 7680

Constant UInt SM_CXSCREEN              = 0
Constant UInt SM_CYSCREEN              = 1
Constant UInt SM_XVIRTUALSCREEN        = 76
Constant UInt SM_YVIRTUALSCREEN        = 77
Constant UInt SM_CXVIRTUALSCREEN       = 78
Constant UInt SM_CYVIRTUALSCREEN       = 79
Constant UInt SM_CMONITORS             = 80
Constant UInt SM_TABLETPC              = 86
Constant UInt SM_MEDIACENTER           = 87
Constant UInt SM_STARTER               = 88
Constant UInt SM_SERVERR2              = 89
Constant UInt SM_REMOTESESSION         = 4096
Constant UInt SM_REMOTECONTROL         = 8193

Constant UInt VER_SUITE_SMALLBUSINESS  = 1
Constant UInt VER_SUITE_ENTERPRISE     = 2
Constant UInt VER_SUITE_TERMINAL       = 16
Constant UInt VER_SUITE_EMBEDDEDNT     = 64
Constant UInt VER_SUITE_DATACENTER     = 128
Constant UInt VER_SUITE_SINGLEUSERRTS  = 256
Constant UInt VER_SUITE_PERSONAL       = 512
Constant UInt VER_SUITE_BLADE          = 1024
Constant UInt VER_SUITE_STORAGE_SERVER = 8192
Constant UInt VER_SUITE_WH_SERVER      = 32768

Boolean     ib_HaveEnvironmentValues = FALSE    // TRUE after of_GetEnvironment is successful.

Public:
// A copy of PB Environment object properties (provided in this object for convenience).
Boolean     MachineCode
Boolean     Win16
Charset     Charset
CPUTypes    CPUType
Integer     OSFixesRevision
Integer     OSMajorRevision
Integer     OSMinorRevision
Integer     PBBuildNumber
Integer     PBFixesRevision
Integer     PBMajorRevision
Integer     PBMinorRevision
LanguageID  Language
Long        ScreenHeight
Long        ScreenWidth
LongLong    NumberOfColors
OSTypes     OSType
PBTypes     PBType

// Windows OS properties obtained from the OSVersionInfoEx structure.
ULong       iul_OSMajorVersion
ULong       iul_OSMinorVersion
ULong       iul_OSBuildNumber
ULong       iul_OSPlatformID
UInt        iui_OSMajorServicePack
UInt        iui_OSMinorServicePack
UInt        iui_OSSuiteMask
UInt        iui_OSProductType
ULong       iul_OSProductTypeAlt    // Alternate value from GetProductInfo API call.

// System (hardware) properties obtained from the SYSTEM_INFO structure.
UInt        iui_ProcessorArchitecture
UInt        iui_Reserved
ULong       iul_PageSize
ULong       iul_lpMinAppAddress
ULong       iul_lpMaxAppAddress
ULong       iul_ActiveProcessorMask
ULong       iul_NumberOfProcessors
ULong       iul_ProcessorType
ULong       iul_AllocationGranularity
UInt        iui_ProcessorLevel
UInt        iui_ProcessorRevision

// Additional properties whose values are determined and set by the pfc_OSVersionInfoDecode event.
Boolean     ib_CanWow64BeChecked     = FALSE    // TRUE when the OS supports the IsWow64Process API
Boolean     ib_IsWow64Process        = FALSE    // TRUE when process running in Wow64 mode
Integer     ii_OSBitness             = 32       // Can be either 32 or 64

Boolean     ib_IsRDLimitedTo1Session = FALSE    // TRUE when OS supports Remote Desktop, but only one session max.
Boolean     ib_IsRTSAvail            = FALSE    // TRUE when Remote Terminal Services functionality is available
Boolean     ib_IsRTSSession          = FALSE    // TRUE when desktop is remotely connected (e.g., via Citrix)
Boolean     ib_IsRemotelyControlled  = FALSE    // TRUE when desktop is being remotely controlled

Integer     ii_NumMonitors = 1
Long        il_VirtualScreenX       // in pixels
Long        il_VirtualScreenY       // in pixels
Long        il_VirtualScreenHeight  // in pixels
Long        il_VirtualScreenWidth   // in pixels
UInt        iui_NumColorsPowerOf2   // NumberOfColors = ( 2 ^ this_value ) - 1

String      is_ComputerName      // The NetBIOS name of the computer running this application.

String      is_OSVersionDesc     // e.g., "Windows XP", "Windows 7", "Windows Server 2003 R2"
String      is_OSEditionDesc     // e.g., "Professional", "Home Premium"
String      is_OSServicePackDesc // Describes service pack level, e.g., "Service Pack 2"
String      is_OSSummaryDesc     // e.g., "Windows 7 Professional, Service Pack 1 (64-bit)"
end variables
forward prototypes
public function integer of_refresh ()
protected function integer of_getenvironment ()
protected function integer of_getosinfo ()
public function integer of_listproperties (ref string as_name[], ref string as_value[])
public function unsignedinteger of_highestordernonzerobit (longlong all_value)
end prototypes

event pfc_osversioninfodecode(osversioninfoex astr_ovix);//////////////////////////////////////////////////////////////////////////////
//
//	Event: 			pfc_OSVersionInfoDecode
//
//	Arguments:		osversioninfoex (internal object structure)
//
//	Returns:  		(none)
//
//	Description:	Decodes the Windows Operating System version information.
//
// Notes:         This logic has been coded in an ancestor event to allow
//                additional or alternative logic to be executed in a descendant.
//
//                This event is triggered by the [Protected] of_GetOSInfo
//                function.
//
//                The logic in this event script is based on free sample PB code
//                written and made publicly available by Roland Smith
//                (www.topwizprogramming.com).
//
//                It has been adapted for use in the PFC with his consent.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	12.5  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2013, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Boolean lb_SystemInfoIsOK
Boolean lb_EditionDescExpected
Integer li_RC
UInt    lui_OSProductType
ULong   lul_ProcessHandle
String  ls_Version
String  ls_Edition
n_cst_numerical lnv_num
system_info     lstr_si		// internal object structure

// Are multiple monitors in use on this PC? If so, obtain the
// width and height of the overall VIRTUAL desktop (in pixels).
ii_NumMonitors = 1
il_VirtualScreenWidth  = This.ScreenWidth
il_VirtualScreenHeight = This.ScreenHeight
ii_NumMonitors = GetSystemMetrics( SM_CMONITORS)
If ii_NumMonitors > 1 Then
	il_VirtualScreenX      = GetSystemMetrics( SM_XVIRTUALSCREEN)
	il_VirtualScreenY      = GetSystemMetrics( SM_YVIRTUALSCREEN)
	il_VirtualScreenWidth  = GetSystemMetrics( SM_CXVIRTUALSCREEN)
	il_VirtualScreenHeight = GetSystemMetrics( SM_CYVIRTUALSCREEN)
End If

// Determine how many bits are used to display the range of color values
// that are supported by the monitor.
iui_NumColorsPowerOf2 = This.of_HighestOrderNonZeroBit(NumberOfColors)

// Note: Some of the following properties are also available in the PB environment object.
iul_OSMajorVersion     = astr_ovix.ul_dwMajorVersion
iul_OSMinorVersion     = astr_ovix.ul_dwMinorVersion
iul_OSBuildNumber      = astr_ovix.ul_dwBuildNumber
iul_OSPlatformID       = astr_ovix.ul_dwPlatformID
iui_OSMajorServicePack = astr_ovix.ui_wServicePackMajor
iui_OSMinorServicePack = astr_ovix.ui_wServicePackMinor
iui_OSSuiteMask        = astr_ovix.ui_wSuiteMask
iui_OSProductType      = astr_ovix.ui_wProductType
iul_OSProductTypeAlt   = 0  // May be able to use GetProductInfo API call for this value.
is_OSServicePackDesc   = Trim(String(astr_ovix.c_szCSDVersion))

// Translate the major/minor Windows OS version numbers into an OS version name.
// In some cases, it is also possible to determine the OS edition description.
is_OSVersionDesc = ''
is_OSEditionDesc = ''

lb_EditionDescExpected = True

Choose Case iul_OSMajorVersion
		
	Case 3
		is_OSVersionDesc = 'Windows NT 3.51'
		lb_EditionDescExpected = False
	
	Case 4
		is_OSVersionDesc = 'Windows NT 4'
		Choose Case iui_OSProductType
			Case 1
				is_OSEditionDesc = 'Workstation'
			Case 3
				If iui_OSSuiteMask = 2 Then
					is_OSEditionDesc = 'Server Enterprise'
				Else
					is_OSEditionDesc = 'Server Standard'
				End If
		End Choose
	
	Case 5
		Choose Case iul_OSMinorVersion
			Case 0   // v5.0
				is_OSVersionDesc = 'Windows 2000'
			Case 1   // v5.1
				is_OSVersionDesc = 'Windows XP'
				If iui_OSSuiteMask = 0 &
				   Or lnv_num.of_BitwiseAnd(iui_OSSuiteMask, VER_SUITE_TERMINAL + VER_SUITE_SINGLEUSERRTS) <> 0 Then
					is_OSEditionDesc = 'Professional'
				ElseIf lnv_num.of_BitwiseAnd(iui_OSSuiteMask, VER_SUITE_EMBEDDEDNT) <> 0 Then
					is_OSEditionDesc = 'Embedded'
				ElseIf lnv_num.of_BitwiseAnd(iui_OSSuiteMask, VER_SUITE_PERSONAL) <> 0 Then
					is_OSEditionDesc = 'Home Edition'
				ElseIf GetSystemMetrics(SM_MEDIACENTER) > 0 Then
					is_OSEditionDesc = 'Media Center Edition'
				ElseIf GetSystemMetrics(SM_STARTER) > 0 Then
					is_OSEditionDesc = 'Starter Edition'
				ElseIf GetSystemMetrics(SM_TABLETPC) > 0 Then
					is_OSEditionDesc = 'Tablet PC Edition'
				Else
					// Continue - A default edition description may be assigned later.
				End If
				// For Windows XP, the API call to determine if Wow64 support
				// is available only in Service Pack 2 or higher.
				If iui_OSMajorServicePack > 1 Then
					ib_CanWow64BeChecked = True
				End If
			Case 2   // v5.2
				If GetSystemMetrics(SM_SERVERR2) > 0 Then
					is_OSVersionDesc = 'Windows Server 2003 R2'
					ib_CanWow64BeChecked = True
				ElseIf lnv_num.of_BitwiseAnd(iui_OSSuiteMask, VER_SUITE_STORAGE_SERVER) <> 0 Then
					is_OSVersionDesc = 'Windows Storage Server 2003'
				ElseIf lnv_num.of_BitwiseAnd(iui_OSSuiteMask, VER_SUITE_WH_SERVER) <> 0 Then
					is_OSVersionDesc = 'Windows Home Server'
				ElseIf iui_OSProductType = VER_NT_WORKSTATION And iui_ProcessorArchitecture = PROCESSOR_ARCHITECTURE_IA64 Then
					is_OSVersionDesc = 'Windows XP'
					is_OSEditionDesc = 'Professional X64 Edition'
					ib_CanWow64BeChecked = True
				Else
					is_OSVersionDesc = 'Windows Server 2003'
					// For Windows Server 2003, the API call to determine if Wow64
					// support is available only in Service Pack 1 or higher.
					If iui_OSMajorServicePack > 0 Then
						ib_CanWow64BeChecked = True
					End If
				End If
            
				// Decode the Suite Mask value if the OS edition description has not already been determined,
				If is_OSEditionDesc = '' Then
					If lnv_num.of_BitwiseAnd(iui_OSSuiteMask, VER_SUITE_ENTERPRISE) <> 0 Then
						is_OSEditionDesc = 'Enterprise'
					ElseIf lnv_num.of_BitwiseAnd(iui_OSSuiteMask, VER_SUITE_DATACENTER) <> 0 Then
						is_OSEditionDesc = 'Datacenter Edition'
					ElseIf lnv_num.of_BitwiseAnd(iui_OSSuiteMask, VER_SUITE_BLADE) <> 0 Then
						is_OSEditionDesc = 'Web Edition'
					Else
						// Continue - A default edition description may be assigned later.
					End If
				End If
			Case Else
				// Continue - Default version & edition descriptions may be assigned later.
		End Choose

	Case 6
		// Windows v6 supports the API that tells whether or not Wow64 support is available.
		ib_CanWow64BeChecked = True
		
		// Use an API newly-available in Windows v6 to determine the edition description
		// of the OS from an alternative product information code. The possible return value
		// FAILURE (-1) will not occur because the minimum required OS version is v6.
		li_RC = This.EVENT pfc_OSProductInfoDecode()
		IF li_RC = NO_ACTION Then
			is_OSEditionDesc = '(Edition: 0x' + Right('00000000' + lnv_num.of_Hex(iul_OSProductTypeAlt), 8) + ')'
		End If
		
		// Critical "feature" *NOT* documented in MSDN:
		// --------------------------------------------
		//
		// In certain instances of virtual Windows systems, the hi-order byte of the OS Product
		// Type will contain the value 0x1E, which messes up normal decoding logic.
		//
		// If 0x1E is found in the hi-order byte, use ONLY the lo-order byte.
		If lnv_num.of_BitwiseAnd(iui_OSProductType, VER_UNDOCUMENTED_VM_MASK) = VER_UNDOCUMENTED_VM_MASK Then
			lui_OSProductType = Mod(iui_OSProductType, 256)
		Else
			lui_OSProductType = iui_OSProductType
		End If
		
		// What flavor of Windows v6 is this?
		Choose Case iul_OSMinorVersion
				
			Case 0	// v6.0
				Choose Case lui_OSProductType
					Case VER_NT_WORKSTATION
						is_OSVersionDesc = 'Windows Vista'
					Case Else
						is_OSVersionDesc = 'Windows Server 2008'
				End Choose
			
			Case 1	// v6.1
				Choose Case lui_OSProductType
					Case VER_NT_WORKSTATION
						is_OSVersionDesc = 'Windows 7'
					Case Else
						is_OSVersionDesc = 'Windows Server 2008'
				End Choose
			
			Case 2	// v6.2
				Choose Case lui_OSProductType
					Case VER_NT_WORKSTATION
						is_OSVersionDesc = 'Windows 8'
					Case Else
						is_OSVersionDesc = 'Windows Server 2012'
				End Choose
				
			Case Else
				// Continue - Default version & edition descriptions may be assigned shortly.
				
		End Choose
	
	Case Else
		// Continue - Default version & edition descriptions may be assigned shortly.
		
End Choose

// Regardless of whether or not descriptions for the OS version and edition
// have been set, trigger an event where the value can be set or replaced.
ls_Version = This.EVENT pfc_OSVersionDesc(is_OSVersionDesc)
If is_OSVersionDesc = '' Then
	// A version description is needed. Assign a default description if no value is available.
	If IsNull(ls_Version) Or ls_Version = '' Then
		is_OSVersionDesc = 'Windows version ' + String(iul_OSMajorVersion) + '.' + String(iul_OSMinorVersion)
	Else
		is_OSVersionDesc = ls_Version
	End If
Else
	// Use the value returned by the event, if possible (it may not have changed).
	If IsNull(ls_Version) Or ls_Version = '' Then
		// Use the pre-event value.
	Else
		is_OSVersionDesc = ls_Version
	End If
End If

// Do the same with the OS edition description.
ls_Edition = This.EVENT pfc_OSEditionDesc(is_OSEditionDesc)
If is_OSEditionDesc = '' Then
	// An edition description may be needed. If so, assign a default if no value is available.
	If IsNull(ls_Edition) Or ls_Edition = '' Then
		If lb_EditionDescExpected Then
			is_OSEditionDesc = '(Suite Mask: 0x' + Right('0000' + lnv_num.of_Hex(iui_OSSuiteMask), 4) + ')'
		End If
	Else
		is_OSEditionDesc = ls_Edition
	End If
Else
	// Use the value returned by the event, if possible (it may not have changed).
	If IsNull(ls_Edition) Or ls_Edition = '' Then
		// Use the pre-event value.
	Else
		is_OSEditionDesc = ls_Edition
	End If
End If

// Determine availability and/or the current use of Remote Terminal Session functionality.
If GetSystemMetrics(SM_REMOTESESSION) > 0 Then
	ib_IsRTSSession = True
	ib_IsRTSAvail   = True
ElseIf lnv_num.of_BitwiseAnd(iui_OSSuiteMask, VER_SUITE_TERMINAL) <> 0 Then
	ib_IsRTSAvail = True
End If

// Is this session currently under remote control?
If GetSystemMetrics(SM_REMOTECONTROL) > 0 Then
	ib_IsRemotelyControlled = True
	ib_IsRTSAvail           = True
End If

// Is this Windows installation limited to a single remote terminal session?
IF lnv_num.of_BitwiseAnd(iui_OSSuiteMask, VER_SUITE_SINGLEUSERRTS) <> 0 Then
	ib_IsRDLimitedTo1Session = True
	ib_IsRTSAvail            = True
End If

// Is the API call that can determine the bitness of the OS available?
ii_OSBitness = 32

If ib_CanWow64BeChecked Then
	// Determine if code is running as a "Wow64" process.
	lul_ProcessHandle = GetCurrentProcess()
	IsWow64Process(lul_ProcessHandle, ib_IsWow64Process)
	
	// The particular API used to obtain system info depends on whether
	// or not this system is running 32-bit or 64-bit Windows.
	If ib_IsWow64Process Then
		GetNativeSystemInfo(lstr_si)
	Else
		GetSystemInfo(lstr_si)
	End If
	
	// Unload the system info structure members into public instance variables.
	iui_ProcessorArchitecture = lstr_si.ui_wProcessorArchitecture
	iui_Reserved              = lstr_si.ui_wReserved
	iul_PageSize              = lstr_si.ul_dwPageSize
	iul_lpMinAppAddress       = lstr_si.ul_lpMinimumApplicationAddress
	iul_lpMaxAppAddress       = lstr_si.ul_lpMaximumApplicationAddress
	iul_ActiveProcessorMask   = lstr_si.ul_dwActiveProcessorMask
	iul_NumberOfProcessors    = lstr_si.ul_dwNumberOfProcessors
	iul_ProcessorType         = lstr_si.ul_dwProcessorType
	iul_AllocationGranularity = lstr_si.ul_dwAllocationGranularity
	iui_ProcessorLevel        = lstr_si.ui_wProcessorLevel
	iui_ProcessorRevision     = lstr_si.ui_wProcessorRevision
	
	// The bitness of the OS is inferred by the processor architecture value.
	If lstr_si.ui_wProcessorArchitecture = PROCESSOR_ARCHITECTURE_AMD64 &
		Or lstr_si.ui_wProcessorArchitecture = PROCESSOR_ARCHITECTURE_IA64 Then
		ii_OSBitness = 64
	Else
		If lstr_si.ui_wProcessorArchitecture = PROCESSOR_ARCHITECTURE_INTEL Then
			ii_OSBitness = 32
		Else
			// The processor architecture value is either undefined or reserved,
			// so assume it is 32-bit.
			ii_OSBitness = 32
		End If
	End If
End If

Return
end event

event type string pfc_osversiondesc(string as_versiondesc);//////////////////////////////////////////////////////////////////////////////
//
//	Event: 			pfc_OSVersionDesc
//
//	Arguments:
// as_VersionDesc String   The current version description (might be empty).
//                         Examples: "Windows Advanced Server 2008", "Windows 7".
//
//	Returns:  		String   A replacement description of the Windows operating
//                         system version. Return as_VersionDesc if the value
//                         is not to be replaced.
//
//	Description:	Specifies a description for the Windows operating system
//                version.
//
//                If an empty version description argument is passed in and a
//                null or empty string is returned, a default value will be
//                assigned to the is_OSVersionDesc instance variable by the
//                pfc_OSVersionInfoDecode event script.
//
// Notes:         This event is triggered by the pfc_OSVersionInfoDecode event.
//
//                This ancestor event script returns the input argument. The
//                descendant event can determine a new or replacement value.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	12.5  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2013, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Return as_versiondesc
end event

event type string pfc_oseditiondesc(string as_editiondesc);//////////////////////////////////////////////////////////////////////////////
//
//	Event: 			pfc_OSEditionDesc
//
//	Arguments:
// as_EditionDesc String   The current edition description (might be empty).
//                         Examples: "Professional", "Enterprise".
//
//	Returns:  		String   A replacement description of the Windows operating
//                         system edition. Return as_EditionDesc if the value
//                         is not to be replaced.
//
//	Description:	Specifies a description for the Windows operating system
//                edition.
//
//                If an empty edition description argument is passed in and a
//                null or empty string is returned, a default value will be
//                assigned to the is_OSEditionDesc instance variable by the
//                pfc_OSVersionInfoDecode event script.
//
// Notes:         This event is triggered by the pfc_OSVersionInfoDecode event.
//
//                This ancestor event script returns the input argument. The
//                descendant event can determine a new or replacement value.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	12.5  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2013, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Return as_editiondesc
end event

event type integer pfc_osproductinfodecode();//////////////////////////////////////////////////////////////////////////////
//
//	Event: 			pfc_OSProductInfoDecode
//
//	Arguments:		(none)
//
//	Returns:  		Integer  -1 (FAILURE)   Unable to obtain alternate product type
//                                        value because the required API is not
//                                        available in the version of Windows
//                                        that is being used.
//                         0  (NO_ACTION) Unable to decode the alternate product
//                                        type value obtained from Windows.
//                         1  (SUCCESS)   A description of the OS edition has
//                                        been assigned to the is_OSEditionDesc
//                                        instance variable.
//
//	Description:	Decodes the Windows Operating System product information.
//
// Notes:         This logic has been coded in an ancestor event to allow
//                additional or alternative logic to be executed in a descendant.
//
//                This event is triggered by the pfc_osVersionInfoDecode event.
//
//                The GetProductInfo API used by this event script is only
//                available when the OS version is Windows Vista and above or
//                Windows Advanced Server 2008 and above. A return value of
//                NO_ACTION (0) indicates that the minimum Windows version is
//                not available.
//
//                The logic in this event script is based on free sample PB code
//                written and made publicly available by Roland Smith
//                (www.topwizprogramming.com).
//
//                It has been adapted for use in the PFC with his consent.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	12.5  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2013, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

ULong   lul_servicepackmajor, lul_servicepackminor
Boolean lb_return
String  ls_desc

// Must be running either Windows Vista and above or Windows Server 2008
// and above in order to be able to execute the GetProductInfo API.
If iul_OSMajorVersion < 6 Then Return FAILURE

// The API utilizes unsigned long argument values.
lul_servicepackmajor = iui_OSMajorServicePack
lul_servicepackminor = iui_OSMinorServicePack

lb_return = GetProductInfo( iul_OSMajorVersion, iul_OSMinorVersion, &
               lul_servicepackmajor, lul_servicepackminor, iul_OSProductTypeAlt)

// Note: Historically, there are a LOT of editions of the Windows OS.
//       Place the ones most likely to occur near the top.
Choose Case iul_OSProductTypeAlt
	Case 48    // 0x00000030
		ls_desc = 'Professional'
	Case 1     // 0x00000001
		ls_desc = 'Ultimate'
	Case 6     // 0x00000006
		ls_desc = 'Business'
	Case 101   // 0x00000065 Windows 8
		ls_desc = ''           
	Case 2     // 0x00000002
		ls_desc = 'Home Basic'
	Case 3     // 0x00000003
		ls_desc = 'Home Premium'
	Case 4     // 0x00000004
		ls_desc = 'Enterprise'
	Case 103   // 0x00000067
		ls_desc = 'Professional with Media Center'
	Case 34    // 0x00000022
		ls_desc = 'Home Server 2011'
	Case 11    // 0x0000000B
		ls_desc = 'Starter'
	Case 49    // 0x00000031
		ls_desc = 'Professional N'
	Case 28    // 0x0000001C
		ls_desc = 'Ultimate N'
	Case 5     // 0x00000005
		ls_desc = 'Home Basic N'
	Case 26    // 0x0000001A
		ls_desc = 'Home Premium N'
	Case 84    // 0x00000054
		ls_desc = 'Enterprise N (evaluation installation)'
	Case 27    // 0x0000001B
		ls_desc = 'Enterprise N'
	Case 47    // 0x0000002F
		ls_desc = 'Starter N'
	Case 18    // 0x00000012
		ls_desc = 'HPC Edition'
	Case 64    // 0x00000040
		ls_desc = 'Server Hyper Core V'
	Case 98    // 0x00000062 Windows 8 N
		ls_desc = 'N'
	Case 99    // 0x00000063 Windows 8 China
		ls_desc = 'China'
	Case 100   // 0x00000064 Windows 8 Single Language
		ls_desc = 'Single Language'
	Case 80    // 0x00000050
		ls_desc = 'Server Datacenter (evaluation installation)'
	Case 8     // 0x00000008
		ls_desc = 'Server Datacenter (full installation)'
	Case 12    // 0x0000000C
		ls_desc = 'Server Datacenter (core installation)'
	Case 39    // 0x00000027
		ls_desc = 'Server Datacenter w/o Hyper-V (core installation)'
	Case 37    // 0x00000025
		ls_desc = 'Server Datacenter w/o Hyper-V (full installation)'
	Case 10    // 0x0000000A
		ls_desc = 'Server Enterprise (full installation)'
	Case 14    // 0x0000000E
		ls_desc = 'Server Enterprise (core installation)'
	Case 41    // 0x00000029
		ls_desc = 'Server Enterprise w/o Hyper-V (core installation)'
	Case 15    // 0x0000000F
		ls_desc = 'Server Enterprise for Itanium-based Systems'
	Case 38    // 0x00000026
		ls_desc = 'Server Enterprise w/o Hyper-V (full installation)'
	Case 59    // 0x0000003B
		ls_desc = 'Essential Server Solution Mgmt.'
	Case 60    // 0x0000003C
		ls_desc = 'Essential Server Solution Additional'
	Case 61    // 0x0000003D
		ls_desc = 'Essential Server Solution Mgmt. SVC'
	Case 62    // 0x0000003E
		ls_desc = 'Essential Server Solution Addition SVC'
	Case 19    // 0x00000013
		ls_desc = 'Storage Server 2008 R2 Essentials'
	Case 42    // 0x0000002A
		ls_desc = 'Microsoft Hyper-V Server'
	Case 30    // 0x0000001E
		ls_desc = 'Essential Business Server Mgmt. Server'
	Case 32    // 0x00000020
		ls_desc = 'Essential Business Server Messaging Server'
	Case 31    // 0x0000001F
		ls_desc = 'Essential Business Server Security Server'
	Case 76    // 0x0000004C
		ls_desc = 'MultiPoint Server Standard (full installation)'
	Case 77    // 0x0000004D
		ls_desc = 'MultiPoint Server Premium (full installation)'
	Case 54    // 0x00000036
		ls_desc = 'Server for SB Solutions EM'
	Case 51    // 0x00000033
		ls_desc = 'Server for SB Solutions'
	Case 55    // 0x00000037
		ls_desc = 'Server for SB Solutions EM'
	Case 24    // 0x00000018
		ls_desc = 'Server 2008 for Windows Essential Server Solutions'
	Case 35    // 0x00000023
		ls_desc = 'Server 2008 w/o Hyper-V for Windows Essential Server Solutions'
	Case 33    // 0x00000021
		ls_desc = 'Server Foundation'
	Case 50    // 0x00000032
		ls_desc = 'Small Business Server 2011 Essentials'
	Case 9     // 0x00000009
		ls_desc = 'Small Business Server'
	Case 25    // 0x00000019
		ls_desc = 'Small Business Server Premium'
	Case 63    // 0x0000003F
		ls_desc = 'Small Business Server Premium (core installation)'
	Case 56    // 0x00000038
		ls_desc = 'MultiPoint Server'
	Case 79    // 0x0000004F
		ls_desc = 'Server Standard (evaluation installation)'
	Case 7     // 0x00000007
		ls_desc = 'Server Standard'
	Case 13    // 0x0000000D
		ls_desc = 'Server Standard (core installation)'
	Case 36    // 0x00000024
		ls_desc = 'Server Standard w/o Hyper-V'
	Case 40    // 0x00000028
		ls_desc = 'Server Standard w/o Hyper-V (core installation)'
	Case 52    // 0x00000034
		ls_desc = 'Server Solutions Premium'
	Case 53    // 0x00000035
		ls_desc = 'Server Solutions Premium (core installation)'
	Case 23    // 0x00000017
		ls_desc = 'Storage Server Enterprise'
	Case 46    // 0x0000002E
		ls_desc = 'Storage Server Enterprise (core installation)'
	Case 20    // 0x00000014
		ls_desc = 'Storage Server Express'
	Case 43    // 0x0000002B
		ls_desc = 'Storage Server Express (core installation)'
	Case 96    // 0x00000060
		ls_desc = 'Storage Server Standard (evaluation installation)'
	Case 21    // 0x00000015
		ls_desc = 'Storage Server Standard'
	Case 44    // 0x0000002C
		ls_desc = 'Storage Server Standard (core installation)'
	Case 95    // 0x0000005F
		ls_desc = 'Storage Server Workgroup (evaluation installation)'
	Case 22    // 0x00000016
		ls_desc = 'Storage Server Workgroup'
	Case 45    // 0x0000002D
		ls_desc = 'Storage Server Workgroup (core installation)'
	Case 17    // 0x00000011
		ls_desc = 'Web Server (full installation)'
	Case 29    // 0x0000001D
		ls_desc = 'Web Server (core installation)'
	Case Else
		Return NO_ACTION
End Choose

is_OSEditionDesc = ls_desc
Return SUCCESS
end event

public function integer of_refresh ();//////////////////////////////////////////////////////////////////////////////
//
// Function:      of_Refresh
//
//	Access: 			public
//
//	Arguments:     (none)
//
//	Returns: 		Integer   1 (SUCCESS) - The values of the instance variables
//                                        in this object have successfully been
//                                        refreshed.
//                         -1 (FAILURE) - The values were not refreshed.
//
//	Description:   Refreshes the values of the instance variables in this object.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2013, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

ULong lul_bufferlength, lul_rc

is_OSSummaryDesc = ''

// Start with obtaining a copy of PB Environment object properties.
If of_GetEnvironment() <> SUCCESS Then Return FAILURE

// Obtain the computer's NetBIOS name.
lul_bufferlength = 128
is_ComputerName = Space(lul_bufferlength)
lul_rc = GetComputerName(is_ComputerName, lul_bufferlength)

// Obtain and decode information about the Windows operating system.
If of_GetOSInfo() <> SUCCESS Then Return FAILURE

// Construct a summary description of the OS from other values.
is_OSSummaryDesc = Trim(is_OSVersionDesc + ' ' + is_OSEditionDesc)

If Trim(is_OSServicePackDesc) <> '' Then
	is_OSSummaryDesc += ', ' + Trim(is_OSServicePackDesc)
End If

is_OSSummaryDesc += ' (' + String(ii_OSBitness) + '-bit)'
Return SUCCESS
end function

protected function integer of_getenvironment ();//////////////////////////////////////////////////////////////////////////////
//
// Function:      of_GetEnvironment
//
//	Access: 			protected
//
//	Arguments:     (none)
//
//	Returns: 		Integer   1 (SUCCESS) - PB environment object property values
//                                        have been copied into instance variables.
//                         -1 (FAILURE) - Unable to obtain PB environment object.
//
//	Description:   Obtains a copy of the PB environment object's properties.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2013, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Environment lnv_env

If GetEnvironment(lnv_env) <> 1 Then Return FAILURE

This.MachineCode     = lnv_env.MachineCode
This.Win16           = lnv_env.Win16
This.Charset         = lnv_env.Charset
This.CPUType         = lnv_env.CPUType
This.OSFixesRevision = lnv_env.OSFixesRevision
This.OSMajorRevision = lnv_env.OSMajorRevision
This.OSMinorRevision = lnv_env.OSMinorRevision
This.PBBuildNumber   = lnv_env.PBBuildNumber
This.PBFixesRevision = lnv_env.PBFixesRevision
This.PBMajorRevision = lnv_env.PBMajorRevision
This.PBMinorRevision = lnv_env.PBMinorRevision
This.Language        = lnv_env.Language
This.ScreenHeight    = lnv_env.ScreenHeight
This.ScreenWidth     = lnv_env.ScreenWidth
This.NumberOfColors  = lnv_env.NumberOfColors
This.OSType          = lnv_env.OSType
This.PBType          = lnv_env.PBType

ib_HaveEnvironmentValues = True
Return SUCCESS
end function

protected function integer of_getosinfo ();//////////////////////////////////////////////////////////////////////////////
//
// Function:      of_GetOSInfo
//
//	Access: 			protected
//
//	Arguments:     (none)
//
//	Returns: 		Integer   1 (SUCCESS)
//                         -1 (FAILURE)
//
//	Description:   Obtains and decodes information about the Windows operating
//                system this application is executing under.
//
// Notes:         This method is based on free sample PB code made written and
//                made publicly available by Roland Smith (topwizprogramming.com),
//                and has adapted for use in the PFC with his consent.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2013, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Boolean lb_SystemInfoIsOK
UInt    lui_OSProductType
ULong   lul_ProcessHandle
n_cst_numerical lnv_num
osversioninfoex lstr_ovix	// internal object structure
system_info     lstr_si		// internal object structure

// Initialization.
is_OSVersionDesc = ''
is_OSEditionDesc = ''
is_OSServicePackDesc = ''

// The following booleans will be used to determine what OS interrogation techniques
// are available, since some API's are not available in every version of Windows.
ib_CanWow64BeChecked = False
ib_IsWow64Process    = False
ii_OSBitness = 32

// Reset other misc. booleans that describe OS features.
ib_IsRDLimitedTo1Session = False
ib_IsRTSAvail            = False
ib_IsRTSSession          = False
ib_IsRemotelyControlled  = False

// Start with the standard PB environment object's properties.
If Not ib_HaveEnvironmentValues Then
	This.of_GetEnvironment()
	If Not ib_HaveEnvironmentValues Then Return FAILURE
End If

// Obtain information about the OS via a Windows API call.
lstr_ovix.ul_dwOSVersionInfoSize = OSVERSIONINFOEX_STRUCTURE_SIZE_UNICODE
lb_SystemInfoIsOK = GetVersionEx(lstr_ovix)	// RC=0 if GetVersionEx fails.
If Not lb_SystemInfoIsOK Then Return FAILURE

// Decode the OS version information.
//
// This is done in an ancestor event to allow the logic to be extended
// or replaced in the descendant.
This.EVENT pfc_OSVersionInfoDecode(lstr_ovix)
Return SUCCESS
end function

public function integer of_listproperties (ref string as_name[], ref string as_value[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:      of_ListProperties
//
//	Access: 			public
//
//	Arguments:
// as_Name[]      Unbounded String array (passed by reference)
// as_Value[]     Unbounded String array (passed by reference)
//
//	Returns: 		Integer  The upper bound of both string arrays after they
//                         have been populated with property names and values.
//
//	Description:   Lists the public properties of this object by their
//                descriptive names and values.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2013, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Integer li_ndx
UInt    lui_value
String  ls_temp, ls_empty[]
n_cst_numerical lnv_num

// Reset both argument string arrays.
as_name  = ls_empty
as_value = ls_empty
li_ndx = 0

If Not ib_HaveEnvironmentValues Then Return 0

li_ndx++
as_name[li_ndx]  = 'OS Version Description'
as_value[li_ndx] = is_OSVersionDesc

li_ndx++
as_name[li_ndx]  = 'OS Edition Description'
as_value[li_ndx] = is_OSEditionDesc

li_ndx++
as_name[li_ndx]  = 'OS Service Pack Description'
as_value[li_ndx] = is_OSServicePackDesc

li_ndx++
as_name[li_ndx]  = 'OS Description Summary'
as_value[li_ndx] = is_OSSummaryDesc

li_ndx++
as_name[li_ndx]  = 'Can Support for Wow64 be checked?'
as_value[li_ndx] = Wordcap(String(ib_CanWow64BeChecked))

li_ndx++
as_name[li_ndx]  = 'Is this a Wow64 (32-bit app on 64-bit OS) process?'
as_value[li_ndx] = Wordcap(String(ib_IsWow64Process))

li_ndx++
as_name[li_ndx]  = 'OS Bitness'
as_value[li_ndx] = String(ii_OSBitness)

li_ndx++
as_name[li_ndx]  = 'OS Major Version Number'
as_value[li_ndx] = String(iul_OSMajorVersion)

li_ndx++
as_name[li_ndx]  = 'OS Minor Version Number'
as_value[li_ndx] = String(iul_OSMinorVersion)

li_ndx++
as_name[li_ndx]  = 'OS Build Number'
as_value[li_ndx] = String(iul_OSBuildNumber)

li_ndx++
as_name[li_ndx]  = 'Platform ID'
as_value[li_ndx] = String(iul_OSPlatformID)

li_ndx++
as_name[li_ndx]  = 'Major Service Pack Number'
as_value[li_ndx] = String(iui_OSMajorServicePack)

li_ndx++
as_name[li_ndx]  = 'Minor Service Pack Number'
as_value[li_ndx] = String(iui_OSMinorServicePack)

li_ndx++
as_name[li_ndx]  = 'Suite Mask'
as_value[li_ndx] = '0x' + Right('0000' + lnv_num.of_Hex(iui_OSSuiteMask), 4) + &
							' (' + String(iui_OSSuiteMask) + ')'

li_ndx++
as_name[li_ndx]  = 'Product Type'
as_value[li_ndx] = '0x' + Right('0000' + lnv_num.of_Hex(iui_OSProductType), 4) + &
							 ' (' + String(iui_OSProductType) + ')'
If lnv_num.of_BitwiseAnd(iui_OSProductType, VER_UNDOCUMENTED_VM_MASK) = VER_UNDOCUMENTED_VM_MASK Then
	lui_value = Mod(iui_OSProductType, 256)
	as_value[li_ndx] += ' [virtual OS; using value 0x' + Right('0000' + lnv_num.of_Hex(lui_value), 4) + &
								 ' (' + String(lui_value) + ')]'
End If

li_ndx++
as_name[li_ndx]  = 'Product Type (Alternate)'
as_value[li_ndx] = '0x' + Right('0000' + lnv_num.of_Hex(iul_OSProductTypeAlt), 4) + &
							' (' + String(iul_OSProductTypeAlt) + ')'

li_ndx++
as_name[li_ndx]  = 'Processor Architecture'
as_value[li_ndx] = '0x' + Right('0000' + lnv_num.of_Hex(iui_ProcessorArchitecture), 4) + &
							 ' (' + String(iui_ProcessorArchitecture) + ')'

li_ndx++
as_name[li_ndx]  = 'Reserved System_Info Value'
as_value[li_ndx] = '0x' + Right('0000' + lnv_num.of_Hex(iui_Reserved), 4)

li_ndx++
as_name[li_ndx]  = 'Page Size'
as_value[li_ndx] = '0x' + Right('00000000' + lnv_num.of_Hex(iul_PageSize), 8) + &
							' (' + String(iul_PageSize / 1024) + 'K)'

li_ndx++
as_name[li_ndx]  = 'Minimum Application Address'
as_value[li_ndx] = '0x' + Right('00000000' + lnv_num.of_Hex(iul_lpMinAppAddress), 8)

li_ndx++
as_name[li_ndx]  = 'Maximum Application Address'
as_value[li_ndx] = '0x' + Right('00000000' + lnv_num.of_Hex(iul_lpMaxAppAddress), 8)

li_ndx++
as_name[li_ndx]  = 'Active Processor Mask'
as_value[li_ndx] = '0x' + Right('00000000' + lnv_num.of_Hex(iul_ActiveProcessorMask), 8)

li_ndx++
as_name[li_ndx]  = 'Number of Processors'
as_value[li_ndx] = '0x' + Right('00000000' + lnv_num.of_Hex(iul_NumberOfProcessors), 8) + &
							' (' + String(iul_NumberOfProcessors) + ')'

li_ndx++
as_name[li_ndx]  = 'Processor Type'
as_value[li_ndx] = '0x' + Right('00000000' + lnv_num.of_Hex(iul_ProcessorType), 8) + &
							' (' + String(iul_ProcessorType) + ')'

li_ndx++
as_name[li_ndx]  = 'Allocation Granularity'
as_value[li_ndx] = '0x' + Right('00000000' + lnv_num.of_Hex(iul_AllocationGranularity), 8) + &
							' (' + String(iul_AllocationGranularity / 1024) + 'K)'

li_ndx++
as_name[li_ndx]  = 'Processor Level'
as_value[li_ndx] = '0x' + Right('0000' + lnv_num.of_Hex(iui_ProcessorLevel), 4)

li_ndx++
as_name[li_ndx]  = 'Processor Revision'
as_value[li_ndx] = '0x' + Right('0000' + lnv_num.of_Hex(iui_ProcessorRevision), 4)

li_ndx++
as_name[li_ndx]  = 'Computer Name'
as_value[li_ndx] = is_ComputerName

li_ndx++
as_name[li_ndx]  = 'System is limited to a single-user Remote Desktop?'
as_value[li_ndx] = Wordcap(String(ib_IsRDLimitedTo1Session))

li_ndx++
as_name[li_ndx]  = 'Remote Terminal Services functionality available?'
as_value[li_ndx] = Wordcap(String(ib_IsRTSAvail))

li_ndx++
as_name[li_ndx]  = 'This is a remote terminal services (RTS) session?'
as_value[li_ndx] = Wordcap(String(ib_IsRTSSession))

li_ndx++
as_name[li_ndx]  = 'This is a remotely controlled RTS session?'
as_value[li_ndx] = Wordcap(String(ib_IsRemotelyControlled))

li_ndx++
as_name[li_ndx]  = 'Number of Monitors'
as_value[li_ndx] = String(ii_NumMonitors)

li_ndx++
If ii_NumMonitors = 1 Then
	as_name[li_ndx]  = 'Monitor resoluion (pixels, W x H)'
	as_value[li_ndx] = String(ScreenWidth) + ' x ' + String(ScreenHeight)
Else
	as_name[li_ndx]  = 'Primary monitor resolution (pixels, W x H)'
	as_value[li_ndx] = String(ScreenWidth) + ' x ' + String(ScreenHeight)
	li_ndx++
	as_name[li_ndx]  = 'Virtual monitor resolution (pixels, W x H)'
	as_value[li_ndx] = String(il_VirtualScreenWidth) + ' x ' + String(il_VirtualScreenHeight)
	li_ndx++
	as_name[li_ndx]  = 'Virtual monitor origin (pixels, X, Y)'
	as_value[li_ndx] = String(il_VirtualScreenX) + ', ' + String(il_VirtualScreenY)
End If

li_ndx++
as_name[li_ndx]  = '[PB] Executing Machine Code?'
as_value[li_ndx] = Wordcap(String(MachineCode))

li_ndx++
as_name[li_ndx]  = '[PB] Win16? (Obsolete Property)'
as_value[li_ndx] = Wordcap(String(Win16))

li_ndx++
as_name[li_ndx]  = '[PB] Character Set'
Choose Case Charset
	Case CharsetAnsi!
		ls_temp = 'CharsetAnsi!'
	Case CharsetUnicode!
		ls_temp = 'CharsetUnicode!'
	Case CharsetDBCS!
		ls_temp = 'CharsetDBCS!'
	Case CharsetDBCSJapanese!
		ls_temp = 'CharsetDBCSJapanese!'
	Case CharsetAnsiArabic!
		ls_temp = 'CharsetAnsiArabic!'
	Case CharsetAnsiHebrew!
		ls_temp = 'CharsetAnsiHebrew!'
	Case Else
		ls_temp = '(unknown)'
End Choose
as_value[li_ndx] = ls_temp

li_ndx++
as_name[li_ndx]  = '[PB] CPU Type'
Choose Case CPUType
	Case ia64!
		ls_temp = 'IA64!'
	Case i486!
		ls_temp = 'i486!'
	Case alpha!
		ls_temp = 'Alpha!'
	Case arm!
		ls_temp = 'ARM!'
	Case hppa!
		ls_temp = 'HPPA!'
	Case i286!
		ls_temp = 'i286'
	Case i386!
		ls_temp = 'i386!'
	Case m68000!
		ls_temp = 'm68000!'
	Case m68020!
		ls_temp = 'm68020!'
	Case m68030!
		ls_temp = 'm68030!'
	Case m68040!
		ls_temp = 'm68040!'
	Case mips!
		ls_temp = 'MIPS!'
	Case pentium!
		ls_temp = 'Pentium!'
	Case powerpc!
		ls_temp = 'PowerPC!'
	Case powerrs!
		ls_temp = 'PowerRS!'
	Case ppc601!
		ls_temp = 'PPC601!'
	Case ppc603!
		ls_temp = 'PPC603!'
	Case ppc604!
		ls_temp = 'PPC604!'
	Case sparc!
		ls_temp = 'Sparc!'
	Case ultrasparc!
		ls_temp = 'UltraSparc!'
	Case Else
		ls_temp = '(unknown)'
End Choose
as_value[li_ndx] = ls_temp

li_ndx++
as_name[li_ndx]  = '[PB] OS Fixes Revision Number'
as_value[li_ndx] = String(OSFixesRevision)

li_ndx++
as_name[li_ndx]  = '[PB] OS Major Version Number'
as_value[li_ndx] = String(OSMajorRevision)

li_ndx++
as_name[li_ndx]  = '[PB] OS Minor Version Number'
as_value[li_ndx] = String(OSMinorRevision)

li_ndx++
as_name[li_ndx]  = '[PB] PowerBuilder Build Number'
as_value[li_ndx] = String(PBBuildNumber)

li_ndx++
as_name[li_ndx]  = '[PB] PowerBuilder Fixes Number'
as_value[li_ndx] = String(PBFixesRevision)

li_ndx++
as_name[li_ndx]  = '[PB] PowerBuilder Major Version Number'
as_value[li_ndx] = String(PBMajorRevision)

li_ndx++
as_name[li_ndx]  = '[PB] PowerBuilder Minor Version Number'
as_value[li_ndx] = String(PBMinorRevision)

li_ndx++
as_name[li_ndx]  = '[PB] Language'
Choose Case Language
	// Place the most commonly-used languages near the top.
	Case languageenglish!
		ls_temp = 'LanguageEnglish!'
	Case languageenglishus!
		ls_temp = 'LanguageEnglishUS!'
	Case languagechinese!
		ls_temp = 'LanguageChinese!'
	Case languagespanish!
		ls_temp = 'LanguageSpanish!'
	Case languagejapanese!
		ls_temp = 'LanguageJapanese!'
	Case languagegerman!
		ls_temp = 'LanguageGerman!'
	Case languagefrench!
		ls_temp = 'LanguageFrench!'
	Case languageenglishuk!
		ls_temp = 'LanguageEnglishUK!'
	// The remainder are in alphabetical order.
	Case languageafrikaans!
		ls_temp = 'LanguageAfrikaans!'
	Case languagealbanian!
		ls_temp = 'LanguageAlbanian!'
	Case languagearabicalgeria!
		ls_temp = 'LanguageArabicAlgeria!'
	Case languagearabicbahrain!
		ls_temp = 'LanguageArabicBahrain!'
	Case languagearabicegypt!
		ls_temp = 'LanguageArabicEgypt!'
	Case languagearabiciraq!
		ls_temp = 'LanguageArabicIraq!'
	Case languagearabicjordan!
		ls_temp = 'LanguageArabicJordan!'
	Case languagearabickuwait!
		ls_temp = 'LanguageArabicKuwait!'
	Case languagearabiclebanon!
		ls_temp = 'LanguageArabicLebanon!'
	Case languagearabiclibya!
		ls_temp = 'LanguageArabicLibya!'
	Case languagearabicmorocco!
		ls_temp = 'LanguageArabicMorocco!'
	Case languagearabicoman!
		ls_temp = 'LanguageArabicOman!'
	Case languagearabicqatar!
		ls_temp = 'LanguageArabicQatar!'
	Case languagearabicsaudiarabia!
		ls_temp = 'LanguageArabicSaudiArabia!'
	Case languagearabicsyria!
		ls_temp = 'LanguageArabicSyria!'
	Case languagearabictunisia!
		ls_temp = 'LanguageArabicTunisia!'
	Case languagearabicuae!
		ls_temp = 'LanguageArabicUAE!'
	Case languagearabicyemen!
		ls_temp = 'LanguageArabicYemen!'
	Case languagebasque!
		ls_temp = 'LanguageBasque!'
	Case languagebulgarian!
		ls_temp = 'LanguageBulgarian!'
	Case languagebyelorussian!
		ls_temp = 'LanguageByelorussian!'
	Case languagecatalan!
		ls_temp = 'LanguageCatalan!'
	Case languagechinesehongkong!
		ls_temp = 'LanguageChineseHongKong!'
	Case languagechinesesimplified!
		ls_temp = 'LanguageChineseSimplified!'
	Case languagechinesesingapore!
		ls_temp = 'LanguageChineseSingapore!'
	Case languagechinesetraditional!
		ls_temp = 'LanguageChineseTraditional!'
	Case languagecroatian!
		ls_temp = 'LanguageCroatian!'
	Case languageczech!
		ls_temp = 'LanguageCzech!'
	Case languagedanish!
		ls_temp = 'LanguageDanish!'
	Case languagedutch!
		ls_temp = 'LanguageDutch!'
	Case languagedutchbelgian!
		ls_temp = 'LanguageDutchBelgian!'
	Case languagedutchneutral!
		ls_temp = 'LanguageDutchNeutral!'
	Case languageenglishaustralian!
		ls_temp = 'LanguageEnglishAustralian!'
	Case languageenglishcanadian!
		ls_temp = 'LanguageEnglishCanadian!'
	Case languageenglishirish!
		ls_temp = 'LanguageEnglishIrish!'
	Case languageenglishnewzealand!
		ls_temp = 'LanguageEnglishNewZealand!'
	Case languageenglishsouthafrica!
		ls_temp = 'LanguageEnglishSouthAfrica!'
	Case languageestonian!
		ls_temp = 'LanguageEstonian!'
	Case languagefaeroese!
		ls_temp = 'LanguageFaeroese!'
	Case languagefarsi!
		ls_temp = 'LanguageFarsi!'
	Case languagefinnish!
		ls_temp = 'LanguageFinnish!'
	Case languagefrenchbelgian!
		ls_temp = 'LanguageFrenchBelgian!'
	Case languagefrenchcanadian!
		ls_temp = 'LanguageFrenchCanadian!'
	Case languagefrenchluxembourg!
		ls_temp = 'LanguageFrenchLuxembourg!'
	Case languagefrenchneutral!
		ls_temp = 'LanguageFrenchNeutral!'
	Case languagefrenchswiss!
		ls_temp = 'LanguageFrenchSwiss!'
	Case languagegermanaustrian!
		ls_temp = 'LanguageGermanAustrian!'
	Case languagegermanliechtenstein!
		ls_temp = 'LanguageGermanLiechtenstein!'
	Case languagegermanluxembourg!
		ls_temp = 'LanguageGermanLuxembourg!'
	Case languagegermanneutral!
		ls_temp = 'LanguageGermanNeutral!'
	Case languagegermanswiss!
		ls_temp = 'LanguageGermanSwiss!'
	Case languagegreek!
		ls_temp = 'LanguageGreek!'
	Case languagehebrew!
		ls_temp = 'LanguageHebrew!'
	Case languagehindi!
		ls_temp = 'LanguageHindi!'
	Case languagehungarian!
		ls_temp = 'LanguageHungarian!'
	Case languageicelandic!
		ls_temp = 'LanguageIcelandic!'
	Case languageindonesian!
		ls_temp = 'LanguageIndonesian!'
	Case languageitalian!
		ls_temp = 'LanguageItalian!'
	Case languageitalianneutral!
		ls_temp = 'LanguageItalianNeutral!'
	Case languageitalianswiss!
		ls_temp = 'LanguageItalianSwiss!'
	Case languagekorean!
		ls_temp = 'LanguageKorean!'
	Case languagekoreanjohab!
		ls_temp = 'LanguageKoreanJohab!'
	Case languagelatvian!
		ls_temp = 'LanguageLatvian!'
	Case languagelithuanian!
		ls_temp = 'LanguageLithuanian!'
	Case languagemacedonian!
		ls_temp = 'LanguageMacedonian!'
	Case languagemaltese!
		ls_temp = 'LanguageMaltese!'
	Case languageneutral!
		ls_temp = 'LanguageNeutral!'
	Case languagenorwegian!
		ls_temp = 'LanguageNorwegian!'
	Case languagenorwegianbokmal!
		ls_temp = 'LanguageNorwegianBokmal!'
	Case languagenorwegiannynorsk!
		ls_temp = 'LanguageNorwegianNynorsk!'
	Case languagepolish!
		ls_temp = 'LanguagePolish!'
	Case languageportuguese!
		ls_temp = 'LanguagePortuguese!'
	Case languageportuguese_brazilian!
		ls_temp = 'LanguagePortuguese_Brazilian!'
	Case languageportugueseneutral!
		ls_temp = 'LanguagePortugueseNeutral!'
	Case languagerhaetoromanic!
		ls_temp = 'LanguageRhaetoromanic!'
	Case languageromanian!
		ls_temp = 'LanguageRomanian!'
	Case languageromanianmoldavia!
		ls_temp = 'LanguageRomanianMoldavia!'
	Case languagerussian!
		ls_temp = 'LanguageRussian!'
	Case languagerussianmoldavia!
		ls_temp = 'LanguageRussianMoldavia!'
	Case languagesami!
		ls_temp = 'LanguageSami!'
	Case languageserbian!
		ls_temp = 'LanguageSerbian!'
	Case languageslovak!
		ls_temp = 'LanguageSlovak!'
	Case languageslovenian!
		ls_temp = 'LanguageSlovenian!'
	Case languagesorbian!
		ls_temp = 'LanguageSorbian!'
	Case languagespanishcastilian!
		ls_temp = 'LanguageSpanishCastilian!'
	Case languagespanishmexican!
		ls_temp = 'LanguageSpanishMexican!'
	Case languagespanishmodern!
		ls_temp = 'LanguageSpanishModern!'
	Case languagesutu!
		ls_temp = 'LanguageSutu!'
	Case languageswedish!
		ls_temp = 'LanguageSwedish!'
	Case languagesystemdefault!
		ls_temp = 'LanguageSystemDefault!'
	Case languagethai!
		ls_temp = 'LanguageThai!'
	Case languagetsonga!
		ls_temp = 'LanguageTsonga!'
	Case languagetswana!
		ls_temp = 'LanguageTswana!'
	Case languageturkish!
		ls_temp = 'LanguageTurkish!'
	Case languageukrainian!
		ls_temp = 'LanguageUkrainian!'
	Case languageurdu!
		ls_temp = 'LanguageUrdu!'
	Case languageuserdefault!
		ls_temp = 'LanguageUserDefault!'
	Case languagevenda!
		ls_temp = 'LanguageVenda!'
	Case languagexhosa!
		ls_temp = 'LanguageXhosa!'
	Case languagezulu!
		ls_temp = 'LanguageZulu!'
	Case Else
		ls_temp = '(unknown)'
End Choose
as_value[li_ndx] = ls_temp

li_ndx++
as_name[li_ndx]  = '[PB] Screen Height (pixels)'
as_value[li_ndx] = String(ScreenHeight)

li_ndx++
as_name[li_ndx]  = '[PB] Screen Width (pixels)'
as_value[li_ndx] = String(ScreenWidth)

li_ndx++
as_name[li_ndx]  = '[PB] Number of Colors'
as_value[li_ndx] = String(NumberOfColors) + ' (' + String(iui_NumColorsPowerOf2 - 1) + '-bit)'

li_ndx++
as_name[li_ndx]  = '[PB] OSType'
Choose Case OSType
	Case windows!
		ls_temp = 'Windows!'
	Case windowsce!
		ls_temp = 'WindowsCE!'
	Case windowsnt!
		ls_temp = 'WindowsNT!'
	Case aix!
		ls_temp = 'AIX!'
	Case hpux!
		ls_temp = 'HPUX'
	Case macintosh!
		ls_temp = 'Macintosh!'
	Case osf1!
		ls_temp = 'OSF1!'
	Case sol2!
		ls_temp = 'Sol2!'
	Case Else
		ls_temp = '(unknown)'
End Choose
as_value[li_ndx] = ls_temp

li_ndx++
as_name[li_ndx]  = '[PB] PBType'
Choose Case PBType
	Case enterprise!
		ls_temp = 'Enterprise!'
	Case desktop!
		ls_temp = 'Desktop!'
	Case Else
		ls_temp = '(unknown)'
End Choose
as_value[li_ndx] = ls_temp

Return UpperBound(as_name)
end function

public function unsignedinteger of_highestordernonzerobit (longlong all_value);//////////////////////////////////////////////////////////////////////////////
//
// Function:      of_HighestOrderNonZeroBit
//
//	Access: 			protected
//
//	Arguments:     (none)
//
//	Returns: 		Integer  The bit position of the highest-order non-zero bit
//                         in the longlong argument data value.
//
//	Description:   Determines the bit position of the highest-order non-zero
//                bit in a longlong value.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2013, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

UInt  lui_power
ULong lul_hi, lul_lo
n_cst_numerical lnv_num

// Validate the argument.
SetNull(lui_power)
If IsNull(all_value) Then Return lui_power

If all_value = 0 Then Return 0

// First check the hi-order 32-bits of the 8-byte longlong value.
lul_hi = lnv_num.of_GetHiWord(all_value)
If lul_hi <> 0 Then
	// The highest-order non-zero bit is in the hi-order word.
	For lui_power = 32 To 1 Step -1
		If lnv_num.of_GetBit(lul_hi, lui_power) Then Return 32 + lui_power
	Next
Else
	// The highest-order non_zero bit is in the lo-order word.
	lul_lo = lnv_num.of_GetLoWord(all_value)
	For lui_power = 32 To 1 Step -1
		If lnv_num.of_GetBit(lul_lo, lui_power) Then Return lui_power
	Next
End If

Return 0
end function

on pfc_n_cst_environment.create
call super::create
end on

on pfc_n_cst_environment.destroy
call super::destroy
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event: 			constructor
//
//	Arguments:		(none)
//
//	Returns:  		Long - The value zero (0) is always returned by this event.
//
//	Description:	Initializes the PFC Environment object.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	12.5  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2013, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

This.of_Refresh()
Return 0
end event

