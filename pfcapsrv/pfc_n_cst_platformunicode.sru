HA$PBExportHeader$pfc_n_cst_platformunicode.sru
$PBExportComments$PFC Unicode Cross Platform service
forward
global type pfc_n_cst_platformunicode from n_cst_platform
end type
type os_memorystatus from structure within pfc_n_cst_platformunicode
end type
type os_size from structure within pfc_n_cst_platformunicode
end type
type os_memorystatusex from structure within pfc_n_cst_platformunicode
end type
end forward

type os_memorystatus from structure
	unsignedlong		ul_length
	unsignedlong		ul_memoryload
	unsignedlong		ul_totalphys
	unsignedlong		ul_availphys
	unsignedlong		ul_totalpagefile
	unsignedlong		ul_availpagefile
	unsignedlong		ul_totalvirtual
	unsignedlong		ul_availvirtual
end type

type os_size from structure
    long l_cx
    long l_cy
end type

type os_memorystatusex from structure
	unsignedlong		dwlength
	unsignedlong		dwmemoryload
	longlong		ulltotalphys
	longlong		ullavailphys
	longlong		ulltotalpagefile
	longlong		ullavailpagefile
	longlong		ulltotalvirtual
	longlong		ullavailvirtual
	longlong		ullavailextendedvirtual
end type

global type pfc_n_cst_platformunicode from n_cst_platform
end type
global pfc_n_cst_platformunicode pfc_n_cst_platformunicode

type prototypes
// Sound
Function boolean sndPlaySoundW (string SoundName, ulong Flags) Library "WINMM.DLL"
Function ulong waveOutGetNumDevs () Library "WINMM.DLL"

// Get free memory
Subroutine GlobalMemoryStatus (ref os_memorystatus memorystatus ) Library "KERNEL32.DLL"

// Get module handle
Function ulong GetModuleHandleW(string modname) Library "KERNEL32.DLL"

// Window functions
Function ulong GetWindowTextW(ulong handle, ref string wintext, ulong length) Library "USER32.DLL"
Function ulong FindWindowW( ref string lpClassName, ref string lpWindowName) Library "USER32.DLL"
Function ulong SHGetFolderPathW(ulong hwndOwner, integer nFolder, ulong hToken, ulong dwFlags, ref string pszPath) Library "SHELL32.DLL"

// User/computer information
function boolean GetUserNameW(ref string  lpBuffer, ref ulong nSize) library "ADVAPI32.DLL"
function boolean GetComputerNameW(ref string  lpBuffer, ref ulong nSize) library "KERNEL32.DLL"

// Get text size
Function boolean SystemParametersInfoW(uint wActon, uint wParam, REF int pvParam, uint fUpdateProfile) Library "USER32.DLL"
Function boolean GetTextExtentPoint32W(ulong hdcr, string lpString, long nCount, ref os_size size) Library "GDI32.DLL"
Function ulong SelectObject(ulong hdc, ulong hWnd) Library "GDI32.DLL"

Private:

	// Kernel32 - Memory Management
	FUNCTION Boolean GlobalMemoryStatusEx(REF os_memoryStatusEx lpBuffer ) LIBRARY "kernel32.DLL"

Public:

	//	User32 - Menu
	FUNCTION Integer GetMenuString(unsignedLong hMenu, unsignedInteger uIDItem, REF String lpString, integer nMaxCount, unsignedInteger uFlag) LIBRARY "user32.dll" ALIAS FOR "GetMenuStringW" 
	FUNCTION Boolean InsertMenu(unsignedLong hMenu, unsignedInteger uPosition, unsignedInteger uFlags, unsignedInteger uIDNewItem, REF String lpNewItem) LIBRARY "user32.dll" ALIAS FOR "InsertMenuW" 
	FUNCTION Boolean InsertMenu(unsignedLong hMenu, unsignedInteger uPosition, unsignedInteger uFlags, unsignedInteger uIDNewItem) LIBRARY "user32.dll" ALIAS FOR "InsertMenuW" 
	FUNCTION Boolean ModifyMenu(unsignedLong hMenu, unsignedInteger uPosition, unsignedInteger uFlags, unsignedInteger uIDNewItem, REF String lpNewItem) LIBRARY "user32.dll" ALIAS FOR "ModifyMenuW"
	FUNCTION Boolean ModifyMenu(unsignedLong hMenu, unsignedInteger uPosition, unsignedInteger uFlags, unsignedInteger uIDNewItem) LIBRARY "user32.dll" ALIAS FOR "ModifyMenuW"
	
	//	User32 - Window Class
	FUNCTION Long GetWindowLong(unsignedLong hWnd, Integer nIndex) LIBRARY "user32.dll" ALIAS FOR "GetWindowLongW"
	FUNCTION Long SetWindowLong(unsignedLong hWnd, Integer nIndex, unsignedLong dwNewLong) LIBRARY "user32.dll" ALIAS FOR "SetWindowLongW"
end prototypes

type variables
Public:
// Maximum length of a folder/path specification (in characters).
//
// According to information found on the MSDN web site, a file path must be
// able to accommodate an 8.3 filename (12 characters). The null character
// that terminates a string is included in the 260-character limit, so the
// practical limit for a path is 260 - 12 - 1 = 247 chaaracters.
//
// Reference: http://msdn.microsoft.com/en-us/library/aa365247.aspx
constant integer MAX_PATH_LENGTH          = 247
constant integer MAX_FILE_AND_PATH_LENGTH = 259

// HResult values returned from SHGetFolderPath API.
constant ulong   HRESULT_S_OK             = 0           // 0x00000000
constant ulong   HRESULT_E_FAIL           = 2147500037  // 0x80004005
constant ulong   HRESULT_E_FILE_NOT_FOUND = 2147942402  // 0x80070002
constant ulong   HRESULT_E_INVALIDARG     = 2147942487  // 0x80070057

// System folder codes (argument value to of_GetKnownFolderPath)
constant integer FOLDER_DESKTOP                 = 0     // <desktop>
constant integer FOLDER_INTERNETEXPLORER        = 1     // Internet Explorer (icon on desktop)
constant integer FOLDER_PROGRAMS                = 2     // Start Menu\Programs
constant integer FOLDER_CONTROLPANEL            = 3     // My Computer\Control Panel
constant integer FOLDER_PRINTERS                = 4     // My Computer\Printers
constant integer FOLDER_MYDOCUMENTS             = 5     // My Documents
constant integer FOLDER_PERSONAL                = 5     // 
constant integer FOLDER_FAVORITES               = 6     // <user name>\Favorites
constant integer FOLDER_STARTUP                 = 7     // Start Menu\Programs\Startup
constant integer FOLDER_RECENT                  = 8     // <user name>\Recent
constant integer FOLDER_SENDTO                  = 9     // <user name>\SendTo
constant integer FOLDER_RECYCLEBIN              = 10    // <desktop>\Recycle Bin
constant integer FOLDER_BITBUCKET               = 10    // 
constant integer FOLDER_STARTMENU               = 11    // <user name>\Start Menu
constant integer FOLDER_MYMUSIC                 = 13    // "My Music" folder
constant integer FOLDER_MYVIDEO                 = 14    // "My Videos" folder
constant integer FOLDER_DESKTOPDIRECTORY        = 16    // <user name>\Desktop
constant integer FOLDER_DRIVES                  = 17    // My Computer
constant integer FOLDER_NETWORK                 = 18    // Network Neighborhood (My Network Places)
constant integer FOLDER_MYNETWORKPLACES         = 18    // 
constant integer FOLDER_NETHOOD                 = 19    // <user name>\nethood
constant integer FOLDER_FONTS                   = 20    // windows\fonts
constant integer FOLDER_TEMPLATES               = 21    // <user name>\Templates
constant integer FOLDER_COMMON_STARTMENU        = 22    // All Users\Start Menu
constant integer FOLDER_COMMON_PROGRAMS         = 23    // All Users\Start Menu\Programs
constant integer FOLDER_COMMON_STARTUP          = 24    // All Users\Startup
constant integer FOLDER_COMMON_DESKTOPDIRECTORY = 25    // All Users\Desktop
constant integer FOLDER_APPDATA                 = 26    // <user name>\Application Data
constant integer FOLDER_APPLICATIONDATA         = 26    //
constant integer FOLDER_PRINTHOOD               = 27    // <user name>\PrintHood
constant integer FOLDER_LOCAL_APPDATA           = 28    // <user name>\Local Settings\Application Data (non-roaming)
constant integer FOLDER_LOCAL_APPLICATIONDATA   = 28    //
constant integer FOLDER_ALTSTARTUP              = 29    // non-localized Startup
constant integer FOLDER_COMMON_ALTSTARTUP       = 30    // non-localized common Startup
constant integer FOLDER_COMMON_FAVORITES        = 31    //
constant integer FOLDER_INTERNET_CACHE          = 32    //
constant integer FOLDER_COOKIES                 = 33    //
constant integer FOLDER_HISTORY                 = 34    //
constant integer FOLDER_COMMON_APPDATA          = 35    // All Users\Application Data
constant integer FOLDER_COMMON_APPLICATIONDATA  = 35    //
constant integer FOLDER_WINDOWS                 = 36    // GetWindowsDirectory()
constant integer FOLDER_SYSTEM                  = 37    // GetSystemDirectory()
constant integer FOLDER_PROGRAM_FILES           = 38    // C:\Program Files
constant integer FOLDER_MYPICTURES              = 39    // C:\Program Files\My Pictures
constant integer FOLDER_PROFILE                 = 40    // USERPROFILE
constant integer FOLDER_SYSTEMX86               = 41    // x86 system directory on RISC
constant integer FOLDER_PROGRAM_FILESX86        = 42    // x86 C:\Program Files on RISC
constant integer FOLDER_PROGRAM_FILES_COMMON    = 43    // C:\Program Files\Common
constant integer FOLDER_PROGRAM_FILES_COMMONX86 = 44    // x86 Program Files\Common on RISC
constant integer FOLDER_COMMON_TEMPLATES        = 45    // All Users\Templates
constant integer FOLDER_COMMON_DOCUMENTS        = 46    // All Users\Documents
constant integer FOLDER_COMMON_ADMINTOOLS       = 47    // All Users\Start Menu\Programs\Administrative Tools
constant integer FOLDER_ADMINTOOLS              = 48    // <user name>\Start Menu\Programs\Administrative Tools
constant integer FOLDER_CONNECTIONS             = 49    // Network and Dial-up Connections
constant integer FOLDER_COMMON_MUSIC            = 53    // All Users\My Music
constant integer FOLDER_COMMON_PICTURES         = 54    // All Users\My Pictures
constant integer FOLDER_COMMON_VIDEO            = 55    // All Users\My Video
constant integer FOLDER_RESOURCES               = 56    // Resources directory
constant integer FOLDER_RESOURCES_LOCALIZED     = 57    // Localized resources directory
constant integer FOLDER_COMMON_OEM_LINKS        = 58    // OEM Links
constant integer FOLDER_CDBURN_AREA             = 59    // Temporary burn directory

end variables

forward prototypes
public function unsignedinteger of_findwindow (string as_window_name)
public function integer of_GetActiveWindowBorder ()
public function string of_GetComputerName ()
public function longlong of_getfreememory ()
public function longlong of_getphysicalmemory ()
public function string of_getsystemdirectory ()
public function integer of_GetTextSize (ref window aw_obj, string as_text, string as_fontface, integer ai_fontsize, boolean ab_bold, boolean ab_italic, boolean ab_underline, ref integer ai_height, ref integer ai_width)
public function string of_GetUserID ()
public function string of_getwindowsdirectory ()
public function string of_GetWindowText (unsignedinteger ai_handle)
public function integer of_PlaySound (string as_file)
public function integer of_getknownfolderpath (integer ai_foldercode, ref string as_folderpath)
public function integer of_getknownfolderpath (integer ai_foldercode, boolean ab_currentpath, ref string as_folderpath)
public function integer of_maxpath ()
end prototypes

public function unsignedinteger of_findwindow (string as_window_name);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_FindWindow
//	Arguments: 			as_window_name - window text to search for
//	Returns:  			uint  - window handle
//	Description:  		Return the handle of the window passed in by window name (Window Title)
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//							5.0   	Initial version
//							5.0.03	Changed Uint variables to Ulong for NT4.0 compatibility
// 						7.0 		Moved the class names into an instance array.  Allow for multiple class names.
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
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
//////////////////////////////////////////////////////////////////////////////
ulong		lul_whnd
long 		ll_idx, ll_upper

ll_upper = UpperBound(is_ClassName)

FOR ll_idx = 1 TO ll_upper
	lul_whnd = FindWindowW( is_classname[ll_idx], as_window_name)
	IF lul_whnd > 0 THEN
		EXIT
	END IF
NEXT

return lul_whnd
end function

public function integer of_GetActiveWindowBorder ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_GetActiveWindowBorder
//	Arguments:			None
//	Returns:				int
//	Description:			Get the size of the active window's border
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							7.0   Initial version
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
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
//////////////////////////////////////////////////////////////////////////////
boolean lb_success
int li_border
uint SPI_GETBORDER = 5

lb_success = SystemParametersInfoW(SPI_GETBORDER, 0, li_border, 0)

if lb_success then
	return li_border
else
	return -1
end if
end function

public function string of_GetComputerName ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_GetComputerName
//	Arguments: 			none
//	Returns:  			string - computer name
//	Description:  		Return the the computer name the user is using
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							5.0   Initial version
//							5.0.03	Changed Uint size variable to Ulong for NT4.0 compatibility
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
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
//////////////////////////////////////////////////////////////////////////////
boolean	lb_rc
ulong		lul_size = 16 // MAX_COMPUTERNAME_LENGTH + 1
string 	ls_computer_name

ls_computer_name = space(lul_size)

lb_rc = GetComputerNameW( ls_computer_name, lul_size)

if not lb_rc THEN
	return ""
else
	return ls_computer_name
end if
end function

public function longlong of_getfreememory ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetFreeMemory
//	Arguments: 			none
//	Returns:  			longLong	-	bytes of memory
//	Description:  		returns the number of bytes of memory currently available 
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//							5.0   Initial version
//							8.0	Changed from lstr_memory.ul_availpagefile to
//									to lstr_memory.ul_availpagefile
//							12.5	Changed to use GlobalMemoryStatusEx and return
//									longLong dataType
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
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
//////////////////////////////////////////////////////////////////////////////
os_memoryStatusEx		lstr_memory

//	Structure size is 7 LongLongs and 2 unsignedLongs or (7 * 8) + (2 * 4) bytes
lstr_memory.dwLength	= 64

GlobalMemoryStatusEx(lstr_memory)

//	Bytes of physical memory available
Return(lstr_memory.ullAvailPhys)
end function

public function longlong of_getphysicalmemory ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetPhysicalMemory
//	Arguments: 			none
//	Returns:  			longLong	-	total memory
//	Description:  		Return the total physical memory (RAM) installed in the machine
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//							5.0   Initial version
//							12.5	Changed to use GlobalMemoryStatusEx and return
//									longLong dataType
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
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
//////////////////////////////////////////////////////////////////////////////
os_memoryStatusEx		lstr_memory

//	Structure size is 7 LongLongs and 2 unsignedLongs or (7 * 8) + (2 * 4) bytes
lstr_memory.dwLength	= 64

GlobalMemoryStatusEx(lstr_memory)

//	Bytes of virtual memory available
Return(lstr_memory.ullTotalPhys)
end function

public function string of_getsystemdirectory ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetSystemDirectory
//	Arguments: 			none
//	Returns:  			string 
//							system directory
//							"" if error			
//	Description:  		Return the window's system directory
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//							5.0   Initial version
//							5.0.03	Changed Uint variables to Ulong for NT4.0 compatibility
//							12.5		Logic has been moved to fileSrv object.  This is 
//										is here for backward compatibility.
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
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
//////////////////////////////////////////////////////////////////////////////

n_cst_fileSrv				lnvo_fileSrv

f_setFileSrv(lnvo_fileSrv, TRUE)

String						ls_systemDirectory
ls_systemDirectory		= lnvo_fileSrv.of_getSystemDirectory()

f_setFileSrv(lnvo_fileSrv, FALSE)

Return(ls_systemDirectory)
end function

public function integer of_GetTextSize (ref window aw_obj, string as_text, string as_fontface, integer ai_fontsize, boolean ab_bold, boolean ab_italic, boolean ab_underline, ref integer ai_height, ref integer ai_width);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_GetTextSize
//	Arguments:  			aw_obj:  				Window where temporary text will be created
//							as_Text:				The text to be sized.
//							as_FontFace:		The font used.
//							ai_FontSize:			The point size of the font.
//							ab_Bold:				True - Bold, False - Normal.
//							ab_Italic:			True - Yes, False - No.
//							ab_Underline:		True - Yes, False - No.
//							ai_Height:			the height of the object in pixels
//							ai_Width:			the width of the object in pixels
//	Returns:  			Integer			1 if successful, -1 if an error occurrs
//	Description:  		Calculates the size of a text object in pixels
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							5.0		Initial version
//							5.0.03	Changed Uint variables to Ulong for NT4.0 compatibility
//							8.0		Not deleting statictext object under certain conditions.
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
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
//////////////////////////////////////////////////////////////////////////////
Integer		li_Size, li_Len, li_Return, &
				li_WM_GETFONT = 49 	//  hex 0x0031
ULong			lul_Hdc, lul_Handle, lul_hFont
StaticText	lst_Temp
os_size 		lstr_Size

// Datawindow syntax specifies font point size is negative
li_Size = -1 * ai_FontSize

if IsNull(aw_obj) Or Not IsValid (aw_obj) then
	return -1
end if

// Create a dummy StaticText Object on the window
// containing text with the desired characteristics
li_Return = aw_obj.OpenUserObject(lst_Temp)
If li_Return = 1 Then
	lst_Temp.FaceName = as_FontFace
	lst_Temp.TextSize = li_Size
	If ab_Bold Then
		lst_Temp.Weight = 700
	Else
		lst_Temp.Weight = 400
	End If
	lst_Temp.Italic = ab_Italic
	lst_Temp.Underline = ab_Underline

	li_Len = Len(as_Text)

	// Get the handle of the StaticText Object and create a Device Context
	lul_Handle = Handle(lst_Temp)
	lul_Hdc = GetDC(lul_Handle)

	// Get the font in use on the Static Text
	lul_hFont = Send(lul_Handle, li_WM_GETFONT, 0, 0)

	// Select it into the device context
	SelectObject(lul_Hdc, lul_hFont)

	// Get the size of the text.
	If Not GetTextExtentpoint32W(lul_Hdc, as_Text, li_Len, lstr_Size ) Then 
		aw_obj.CloseUserObject(lst_Temp)
		Return -1
	End If
	
	ai_Height = lstr_Size.l_cy
	ai_Width = lstr_Size.l_cx

	ReleaseDC(lul_Handle, lul_Hdc)

	li_Return = aw_obj.CloseUserObject(lst_Temp)
End if

Return li_Return
end function

public function string of_GetUserID ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_GetUserID
//	Arguments: 			none
//	Returns:  			string  - user id/name
//	Description:  		Return the user id/name currently logged into a network
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							5.0   Initial version
//							5.0.03		Changed Uint size variable to Ulong for NT4.0 compatibility
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
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
//////////////////////////////////////////////////////////////////////////////
boolean	lb_rc
ulong		lul_size = 255
string 	ls_name

ls_name = space(lul_size)

lb_rc = GetUserNameW( ls_name, lul_size)

if not lb_rc THEN
	return ""
else
	return ls_name
end if
end function

public function string of_getwindowsdirectory ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetWindowsDirectory
//	Arguments: 			none
//	Returns:  			string 
//							windows directoy
//							"" if error
//	Description:  		Return the window's directory
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//							5.0   	Initial version
//							5.0.03	Changed int variables to Ulong for NT4.0 compatibility
//							12.5		Logic has been moved to fileSrv object.  This is 
//										is here for backward compatibility.
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
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
//////////////////////////////////////////////////////////////////////////////

n_cst_fileSrv				lnvo_fileSrv

f_setFileSrv(lnvo_fileSrv, TRUE)

String						ls_windowsDirectory
ls_windowsDirectory		= lnvo_fileSrv.of_getWindowsDirectory()

f_setFileSrv(lnvo_fileSrv, FALSE)

Return(ls_windowsDirectory)

end function

public function string of_GetWindowText (unsignedinteger ai_handle);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_GetWindowText
//	Arguments:			unsignedinteger	
//	Returns:  			string
//							window text
//							"" if error
//	Description:			Return the window title text
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							5.0   Initial version
//							5.0.03		Changed int variables to Ulong for NT4.0 compatibility
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
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
//////////////////////////////////////////////////////////////////////////////
ulong		lul_rc
ulong		lul_size = 255
string 	ls_wintext

ls_wintext = space (lul_size)

lul_rc = GetWindowTextW(ai_handle, ls_wintext, lul_size)

if lul_rc > 0 THEN
	return ls_wintext
else
	return ""
end if
end function

public function integer of_PlaySound (string as_file);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_PlaySound
//	Arguments:			as_file - sound file to play
//	Returns:  			integer
//	Description:  		Play a sound file
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							5.0   Initial version
//							5.0.03		Changed Uint variable to Ulong for NT4.0 compatibility
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
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
//////////////////////////////////////////////////////////////////////////////
ulong lul_numdevs

lul_numdevs = WaveOutGetNumDevs() 
If lul_numdevs > 0 Then 
	sndPlaySoundW(as_file, 1)
	return 1
Else
	return -1
End If
end function

public function integer of_getknownfolderpath (integer ai_foldercode, ref string as_folderpath);//////////////////////////////////////////////////////////////////////////////
// Public Function:  of_GetKnownFolderPath
// Arguments:        ai_foldercode          - identifies the requested folder
//                   as_folderpath (by ref) - receives the requested folder path
// Returns:          integer                - success (0)
//                                          - error   (-1) ai_foldercode is valid,
//                                            but the folder does not exist
//                                          - error   (-2) ai_foldercode is invalid
//                                          - error   (-3) unknown HResult returned
//                                            by the SHGetFolderPath API
// Description:      Obtains the path to a windows folder using the SHGetFolderPath
//                   Windows API call. The folder code contains the CLSID of the
//                   requested folder.
// Notes:            Public integer constant instance vars (their names all
//                   begin with FOLDER_xxxxxx) can be used for ai_folderpath.
//
//                   The ShGetFolderPath API is deprecated. It was superceded
//                   in Windows Vista by SHGetKnownFolderPath. When PB becomes
//                   no longer supported on versions of Windows prior to Vista,
//                   the code here can be adapted to call the newer Windows API.
//////////////////////////////////////////////////////////////////////////////
// Rev. History      Version
//                   12.5   Initial version
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
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
//////////////////////////////////////////////////////////////////////////////
Return this.of_GetKnownFolderPath( ai_foldercode, TRUE, as_folderpath)
end function

public function integer of_getknownfolderpath (integer ai_foldercode, boolean ab_currentpath, ref string as_folderpath);//////////////////////////////////////////////////////////////////////////////
// Public Function:  of_GetKnownFolderPath
// Arguments:        ai_foldercode          - identifies the requested folder
//                   ab_currentpath         - TRUE  -> Identify current path
//                                            FALSE -> Identify default path, if
//                                                     it exists
//                   as_folderpath (by ref) - receives the requested folder path
// Returns:          integer                - success (0)
//                                          - error   (-1) ai_foldercode is valid,
//                                            but the folder does not exist
//                                          - error   (-2) ai_foldercode is invalid
//                                          - error   (-3) The file cannot be found
//                                          - error   (-4) unknown HResult returned
//                                            by the SHGetFolderPath API
// Description:      Obtains the path to a windows folder using the SHGetFolderPath
//                   Windows API call. The folder code contains the CLSID of the
//                   requested folder.
// Notes:            Public integer constant instance vars (their names all
//                   begin with FOLDER_xxxxxx) can be used for ai_folderpath.
//
//                   The ShGetFolderPath API is deprecated. It was superceded
//                   in Windows Vista by SHGetKnownFolderPath. When PB becomes
//                   no longer supported on versions of Windows prior to Vista,
//                   the code here can be adapted to call the newer Windows API.
//////////////////////////////////////////////////////////////////////////////
// Rev. History      Version
//                   12.5   Initial version
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
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
//////////////////////////////////////////////////////////////////////////////
ulong   lul_rc, lul_flags
integer li_rc

If IsNull( ai_foldercode)  Then Return -4
If IsNull( ab_currentpath) Then Return -4

// Pre-allocate the folder path var to the maximum number of spaces, because
// PB has to be able to manage the memory allocated to this local variable.
as_folderpath = Space(MAX_FILE_AND_PATH_LENGTH)

// Translate boolean arg to an API argument value.
IF ab_currentpath Then
	lul_flags = 0	// Find current path
Else
	lul_flags = 1	// Find default path
End If

// ShGetFolderPath API argument values: Returns ulong (HResult)
//    ulong      hwndowner   - value should be 0
//    integer    nfolder     - ai_foldercode
//    ulong      htoken      - value should be 0
//    ulong      dwflags     - value should be 0 for current folder, 1 for default folder
//    ref string pszpath     - The string to receive the folder path (as_folderpath)
lul_rc = SHGetFolderPathW(0, ai_foldercode, 0, lul_flags, as_folderpath)

// The possible HResult values returned by this API are mapped to
// public ulong constants which are defined in this object.
Choose Case lul_rc
	Case HRESULT_S_OK
		// Success
		li_rc = 0
	Case HRESULT_E_FAIL
		// The value of ai_foldercode is valid, but the folder path does not exist.
		li_rc = -1
	Case HRESULT_E_INVALIDARG
		// The value of ai_foldercode is not valid.
		li_rc = -2
	Case HRESULT_E_FILE_NOT_FOUND
		// The file cannot be found.
	Case Else
		// An unknown or unrecognized HResult value was returned.
		li_rc = -4
End Choose

Return li_rc
end function

public function integer of_maxpath ();Return(32767)
end function

on pfc_n_cst_platformunicode.create
call super::create
end on

on pfc_n_cst_platformunicode.destroy
call super::destroy
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//	Object Name:		pfc_n_cst_platformunicode
//	Description:  		Unicode platform object
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							5.0   Initial version
// 							5.0.03	Replace Uint with Ulong in Local External Functions for full NT 4.0 compatibility
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
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
//////////////////////////////////////////////////////////////////////////////
is_separator = "\"
end event

