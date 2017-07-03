HA$PBExportHeader$pfc_n_cst_filesrvunicode.sru
$PBExportComments$PFC Unicode File handler service
forward
global type pfc_n_cst_filesrvunicode from n_cst_filesrv
end type
type os_filedatetime from structure within pfc_n_cst_filesrvunicode
end type
type os_systemtime from structure within pfc_n_cst_filesrvunicode
end type
type os_securityattributes from structure within pfc_n_cst_filesrvunicode
end type
type os_finddata from structure within pfc_n_cst_filesrvunicode
end type
type os_fileopeninfo from structure within pfc_n_cst_filesrvunicode
end type
end forward

type os_filedatetime from structure
	unsignedlong		ul_lowdatetime
	unsignedlong		ul_highdatetime
end type

type os_systemtime from structure
	unsignedinteger		ui_wyear
	unsignedinteger		ui_wmonth
	unsignedinteger		ui_wdayofweek
	unsignedinteger		ui_wday
	unsignedinteger		ui_whour
	unsignedinteger		ui_wminute
	unsignedinteger		ui_wsecond
	unsignedinteger		ui_wmilliseconds
end type

type os_securityattributes from structure
	unsignedlong		ul_length
	string		ch_description
	boolean		b_inherit
end type

type os_finddata from structure
	unsignedlong		ul_fileattributes
	os_filedatetime		str_creationtime
	os_filedatetime		str_lastaccesstime
	os_filedatetime		str_lastwritetime
	unsignedlong		ul_filesizehigh
	unsignedlong		ul_filesizelow
	unsignedlong		ul_reserved0
	unsignedlong		ul_reserved1
	character		ch_filename[260]
	character		ch_alternatefilename[14]
end type

type os_fileopeninfo from structure
	character		c_length
	character		c_fixed_disk
	unsignedinteger		ui_dos_error
	unsignedinteger		ui_na1
	unsignedinteger		ui_na2
	character		c_pathname[128]
end type

global type pfc_n_cst_filesrvunicode from n_cst_filesrv
end type
global pfc_n_cst_filesrvunicode pfc_n_cst_filesrvunicode

type prototypes
// Win 32 calls
Function ulong GetDriveTypeW (string drive) library "KERNEL32.DLL"
Function boolean CreateDirectoryW (ref string directoryname, ref os_securityattributes secattr) library "KERNEL32.DLL"
Function boolean RemoveDirectoryW (ref string directoryname) library "KERNEL32.DLL"
Function ulong GetCurrentDirectoryW (ulong textlen, ref string dirtext) library "KERNEL32.DLL"
Function boolean SetCurrentDirectoryW (ref string directoryname ) library "KERNEL32.DLL"
Function ulong GetFileAttributesW (ref string filename) library "KERNEL32.DLL"
Function boolean SetFileAttributesW (ref string filename, ulong attrib) library "KERNEL32.DLL"
Function boolean MoveFileW (ref string oldfile, ref string newfile) library "KERNEL32.DLL"
Function long FindFirstFileW (ref string filename, ref os_finddata findfiledata) library "KERNEL32.DLL"
Function boolean FindNextFileW (long handle, ref os_finddata findfiledata) library "KERNEL32.DLL"
Function boolean FindClose (long handle) library "KERNEL32.DLL"
Function boolean GetDiskFreeSpaceW (string drive, ref long sectpercluster, ref long bytespersect, ref long freeclusters, ref long totalclusters) library "KERNEL32.DLL"
Function long GetLastError() library "KERNEL32.DLL"

// Win32 calls for file date and time
Function long OpenFile (ref string filename, ref os_fileopeninfo of_struct, ulong action) LIBRARY "KERNEL32.DLL"
Function boolean CloseHandle (long file_hand) LIBRARY "KERNEL32.DLL"
Function boolean GetFileTime(long hFile, ref os_filedatetime  lpCreationTime, ref os_filedatetime  lpLastAccessTime, ref os_filedatetime  lpLastWriteTime  )  library "KERNEL32.DLL"
Function boolean FileTimeToSystemTime(ref os_filedatetime lpFileTime, ref os_systemtime lpSystemTime) library "KERNEL32.DLL"
Function boolean FileTimeToLocalFileTime(ref os_filedatetime lpFileTime, ref os_filedatetime lpLocalFileTime) library "KERNEL32.DLL"
Function boolean SetFileTime(long hFile, os_filedatetime  lpCreationTime, os_filedatetime  lpLastAccessTime, os_filedatetime  lpLastWriteTime  )  library "KERNEL32.DLL"
Function boolean SystemTimeToFileTime(os_systemtime lpSystemTime, ref os_filedatetime lpFileTime) library "KERNEL32.DLL"
Function boolean LocalFileTimeToFileTime(ref os_filedatetime lpLocalFileTime, ref os_filedatetime lpFileTime) library "KERNEL32.DLL"

Public:

	Function boolean MoveFile(REF String lpExistingFileName, REF String lpNewFileName) LIBRARY "KERNEL32.DLL" ALIAS FOR "MoveFileW"
	
Private:

	FUNCTION unsignedLong GetLongPathName(REF String lpszShortPath, REF String lpszLongPath, Long cchBuffer) LIBRARY 'kernel32.dll' ALIAS FOR 'GetLongPathNameW'
	FUNCTION unsignedLong GetShortPathName(REF String lpszLongPath, REF String lpszShortPath, Long cchBuffer) LIBRARY 'kernel32.dll' ALIAS FOR 'GetShortPathNameW'
	Function unsignedInteger GetSystemDirectory(REF String lpBuffer, unsignedInteger uSize) LIBRARY "KERNEL32.DLL" ALIAS FOR "GetSystemDirectoryW"
	Function unsignedInteger GetTempFileName(REF String lpPathName, REF String lpPrefixString, unsignedInteger uUnique, REF String lpTempFileName) LIBRARY "KERNEL32.DLL" ALIAS FOR "GetTempFileNameW"
	Function unsignedLong GetTempPath(unsignedLong nBufferLength, REF String lpBuffer) LIBRARY "KERNEL32.DLL" ALIAS FOR "GetTempPathW"
	Function unsignedInteger GetWindowsDirectory(REF String lpBuffer, unsignedInteger uSize) LIBRARY "kernel32.dll" ALIAS FOR "GetWindowsDirectoryW"
end prototypes

type variables

end variables

forward prototypes
public function string of_getcurrentdirectory ()
public function integer of_createdirectory (string as_directoryname)
public function boolean of_DirectoryExists (string as_directoryname)
public function integer of_changedirectory (string as_newdirectory)
public function integer of_RemoveDirectory (string as_directoryname)
public function integer of_FileRename (string as_sourcefile, string as_targetfile)
public function long of_dirlist (string as_filespec, long al_filetype, ref n_cst_dirattrib anv_dirlist[])
public function integer of_getfileattributes (string as_filename, ref boolean ab_readonly, ref boolean ab_hidden, ref boolean ab_system, ref boolean ab_subdirectory, ref boolean ab_archive)
public function integer of_setfileattributes (string as_filename, boolean ab_readonly, boolean ab_hidden, boolean ab_system, boolean ab_archive)
public function integer of_getlastwritedatetime (string as_filename, ref date ad_date, ref time at_time)
public function integer of_getcreationdatetime (string as_filename, ref date ad_date, ref time at_time)
protected function integer of_convertfiledatetimetopb (os_filedatetime astr_filetime, ref date ad_filedate, ref time at_filetime)
protected function integer of_convertpbdatetimetofile (date ad_filedate, time at_filetime, ref os_filedatetime astr_filetime)
public function string of_getlongfilename (string as_altfilename)
public function string of_getaltfilename (string as_longfilename)
public function double of_getfilesize (string as_filename)
public function integer of_setlastwritedatetime (string as_filename, date ad_date, time at_time)
public function integer of_getlastaccessdate (string as_filename, ref date ad_date)
public function integer of_setcreationdatetime (string as_filename, date ad_date, time at_time)
public function integer of_setlastaccessdate (string as_filename, date ad_date)
public function integer of_getdrivetype (string as_drive)
public function integer of_getdiskspace (string as_drive, ref long al_totalspace, ref long al_freespace)
public function integer of_getdiskspaceex (string as_drive, ref decimal adec_totalspace, ref decimal adec_freespace)
protected function long of_maxpath ()
end prototypes

public function string of_getcurrentdirectory ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetCurrentDirectory
//	Arguments: 		None
//	Returns:  		string 		The current working directory, "" if error			
//	Description:  	Return the current working directory
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
//						5.0.03	Changed Uint variables to Ulong for NT4.0 compatibility
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
Ulong		lul_size = 260 	// MAX_PATH
Ulong		lul_Rc
String	ls_CurrentDir

ls_CurrentDir = Space (lul_size)

lul_rc = GetCurrentDirectoryW(lul_size, ls_CurrentDir)

if lul_rc > 0 THEN
	return ls_CurrentDir
else
	return ""
end if
end function

public function integer of_createdirectory (string as_directoryname);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_CreateDirectory
//	Arguments:		as_DirectoryName		The name of the directory to be created; an
//													absolute path may be specified or it will
//													be relative to the current working directory
//	Returns:			Integer
//						1 if successful,
//						-1 if an error occurrs.
//	Description:	Create a new directory.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
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
os_securityattributes	lstr_Security

lstr_Security.ul_Length = 7
SetNull(lstr_Security.ch_description)	//use default security
lstr_Security.b_Inherit = False

If CreateDirectoryW(as_DirectoryName, lstr_Security) Then
	Return 1
Else
	Return -1
End If
end function

public function boolean of_DirectoryExists (string as_directoryname);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_DirectoryExists
//	Arguments:		as_DirectoryName		The name of the directory to be checked; an
//													absolute path may be specified or it will
//													be relative to the current working directory
//	Returns:			Boolean
//						True if the directory exists, False if it does not.
//	Description:	Check if the specified directory exists.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
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
ULong	lul_RC

lul_RC = GetFileAttributesW(as_DirectoryName)

// Check if 5th bit is set, if so this is a directory
If Mod(Integer(lul_RC / 16), 2) > 0 Then 
	Return True
Else
	Return False
End If
end function

public function integer of_changedirectory (string as_newdirectory);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_ChangeDirectory
//	Arguments:		as_NewDirectory			The name of the new working directory; an
//														absolute path may be specified or it will
//														be relative to the current working directory
//	Returns:			Integer
//						1 if successful,
//						-1 if an error occurrs.
//	Description:	Change the current working directory.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
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
If Trim(as_NewDirectory) = "" Then Return -1

If SetCurrentDirectoryW(as_NewDirectory) Then
	Return 1
Else
	Return -1
End If
end function

public function integer of_RemoveDirectory (string as_directoryname);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_RemoveDirectory
//	Arguments:		as_DirectoryName		The name of the directory to be deleted; an
//													absolute path may be specified or it will
//													be relative to the current working directory
//	Returns:			Integer
//						1 if successful,
//						-1 if an error occurrs.
//	Description:	Deleate a directory.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
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
If Not of_DirectoryExists(as_DirectoryName) Then Return 1

If RemoveDirectoryW(as_DirectoryName) Then
	Return 1
Else
	Return -1
End If
end function

public function integer of_FileRename (string as_sourcefile, string as_targetfile);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_FileRename
//	Arguments:		as_SourceFile			The file to rename.
//						as_TargetFile			The new file name.
//	Returns:			Integer
//						1 if successful,
//						-1 if an error occurrs.
//	Description:	Rename or move a file or directory.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
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
If MoveFileW(as_SourceFile, as_TargetFile) Then
	Return 1
Else
	Return -1
End If
end function

public function long of_dirlist (string as_filespec, long al_filetype, ref n_cst_dirattrib anv_dirlist[]);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_DirList
//	Arguments:		as_FileSpec				The file spec. to list (including wildcards); an
//													absolute path may be specified or it will
//													be relative to the current working directory
//						al_FileType				A number representing one or more types of files
//													to include in the list, see PowerBuilder Help on
//													the DirList listbox function for an explanation.
//						anv_DirList[]			An array of n_cst_dirattrib structure whichl will contain
//													the results, passed by reference.
//	Returns:			Long
//						The number of elements in anv_DirList if successful, -1 if an error occurrs.
//	Description:	List the contents of a directory (Name, Date, Time, and Size).
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
//						5.0.03	Changed long variables to Ulong for NT4.0 compatibility
//						7.0		Changed return datatype from int to long
//								Changed li_Cnt, li_Entries from int to long
//						8.0 	Changed datatype of lul_handle to long ll_handle
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
Boolean					lb_Found
Char						lc_Drive
long						ll_Cnt, ll_Entries
Long						ll_handle
Time						lt_Time
os_finddata				lstr_FindData
n_cst_dirattrib		lnv_Empty[]
n_cst_numerical		lnv_Numeric

// Empty the result array
anv_DirList = lnv_Empty

// List the entries in the directory
ll_handle = FindFirstFileW(as_FileSpec, lstr_FindData)
If ll_handle <= 0 Then Return -1
Do
	// Determine if this file should be included.
	If of_IncludeFile(String(lstr_FindData.ch_filename), al_FileType, lstr_FindData.ul_FileAttributes) Then
		
		// Add it to the array
		ll_Entries ++
		anv_DirList[ll_Entries].is_FileName = lstr_FindData.ch_filename
		anv_DirList[ll_Entries].is_AltFileName = lstr_FindData.ch_alternatefilename
		If Trim(anv_DirList[ll_Entries].is_AltFileName) = "" Then
			anv_DirList[ll_Entries].is_AltFileName = anv_DirList[ll_Entries].is_FileName
		End If
	
		// Set date and time
		of_ConvertFileDatetimeToPB(lstr_FindData.str_CreationTime, anv_DirList[ll_Entries].id_CreationDate, &
													anv_DirList[ll_Entries].it_CreationTime)
		of_ConvertFileDatetimeToPB(lstr_FindData.str_LastAccessTime, anv_DirList[ll_Entries].id_LastAccessDate, lt_Time)
		of_ConvertFileDatetimeToPB(lstr_FindData.str_LastWriteTime, anv_DirList[ll_Entries].id_LastWriteDate, &
													anv_DirList[ll_Entries].it_LastWriteTime)

		// Calculate file size
		anv_DirList[ll_Entries].idb_FileSize = (lstr_FindData.ul_FileSizeHigh * (2.0 ^ 32))  + lstr_FindData.ul_FileSizeLow
		
		// Set file attributes
		anv_DirList[ll_Entries].ib_ReadOnly = lnv_Numeric.of_getbit(lstr_FindData.ul_FileAttributes, 1)
		anv_DirList[ll_Entries].ib_Hidden = lnv_Numeric.of_getbit(lstr_FindData.ul_FileAttributes, 2)
		anv_DirList[ll_Entries].ib_System = lnv_Numeric.of_getbit(lstr_FindData.ul_FileAttributes, 3)
		anv_DirList[ll_Entries].ib_SubDirectory = lnv_Numeric.of_getbit(lstr_FindData.ul_FileAttributes, 5)
		anv_DirList[ll_Entries].ib_Archive = lnv_Numeric.of_getbit(lstr_FindData.ul_FileAttributes, 6)
		anv_DirList[ll_Entries].ib_Drive = False
		
		// Put brackets around subdirectories
		If anv_DirList[ll_Entries].ib_SubDirectory Then
			anv_DirList[ll_Entries].is_FileName = "[" + anv_DirList[ll_Entries].is_FileName + "]"
			anv_DirList[ll_Entries].is_AltFileName = "[" + anv_DirList[ll_Entries].is_AltFileName + "]"
		End If
	End If
	
	lb_Found = FindNextFileW(ll_handle, lstr_FindData)
Loop Until Not lb_Found

FindClose(ll_handle)

// Add the drives if desired.
// If the type is > 32768 this was to prevent read-write files from being included.
If al_FileType >=32768 Then al_FileType = al_FileType - 32768

// If the type is > 16384, then a list of drives should be included
If al_FileType >= 16384 Then
	For ll_Cnt = 0 To 25
		lc_Drive = Char(ll_Cnt + 97)
		If of_GetDriveType(lc_Drive) > 1 Then
			ll_Entries ++
			anv_DirList[ll_Entries].is_FileName = "[-" + lc_Drive + "-]"
			anv_DirList[ll_Entries].is_AltFileName = anv_DirList[ll_Entries].is_FileName
			anv_DirList[ll_Entries].ib_ReadOnly = False
			anv_DirList[ll_Entries].ib_Hidden = False
			anv_DirList[ll_Entries].ib_System = False
			anv_DirList[ll_Entries].ib_SubDirectory = False
			anv_DirList[ll_Entries].ib_Archive = False
			anv_DirList[ll_Entries].ib_Drive = True
		End if
	Next
End if

Return ll_Entries

end function

public function integer of_getfileattributes (string as_filename, ref boolean ab_readonly, ref boolean ab_hidden, ref boolean ab_system, ref boolean ab_subdirectory, ref boolean ab_archive);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetFileAttributes
//	Arguments:		as_FileName				The file for which you want the attributes; an
//													absolute path may be specified or it will
//													be relative to the current working directory.
//						ab_ReadOnly				The Read-Only attribute, passed by reference.
//						ab_Hidden				The Hidden attribute, passed by reference.
//						ab_System				The System attribute, passed by reference.
//						ab_Subdirectory		The Subdirectory attribute, passed by reference.
//						ab_Archive				The Archive attribute, passed by reference.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Get the attributes for a file.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
//						5.0.03	Changed long variables to Ulong for NT4.0 compatibility
//						8.0 	Changed datatype of lul_handle to long ll_handle
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
long						ll_handle
os_finddata		lstr_FindData
n_cst_numerical		lnv_Numeric

// Find the file
ll_handle = FindFirstFileW(as_FileName, lstr_FindData)
If ll_handle <= 0 Then Return -1
FindClose(ll_handle)

// Set file attributes
ab_ReadOnly = lnv_Numeric.of_getbit(lstr_FindData.ul_FileAttributes, 1)
ab_Hidden = lnv_Numeric.of_getbit(lstr_FindData.ul_FileAttributes, 2)
ab_System = lnv_Numeric.of_getbit(lstr_FindData.ul_FileAttributes, 3)
ab_SubDirectory = lnv_Numeric.of_getbit(lstr_FindData.ul_FileAttributes, 5)
ab_Archive = lnv_Numeric.of_getbit(lstr_FindData.ul_FileAttributes, 6)

Return 1
end function

public function integer of_setfileattributes (string as_filename, boolean ab_readonly, boolean ab_hidden, boolean ab_system, boolean ab_archive);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_SetFileAttributes
//	Arguments:		as_FileName				The file whose attributes you want to set; an
//													absolute path may be specified or it will
//													be relative to the current working directory.
//						ab_ReadOnly				The new value for the Read-Only attribute.
//						ab_Hidden				The new value for the Hidden attribute.
//						ab_System				The new value for the System attribute.
//						ab_Archive				The new value for the Archive attribute.
//	Returns:			Integer
//						1 if successful,
//						-1 if an error occurrs.
//	Description:	Set the attributes of a file.  If null is passed for any of the attributes,
//						it will not be changed.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
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
ULong		lul_Attrib

// Calculate the new attribute byte for the file
lul_Attrib = of_CalculateFileAttributes(as_FileName, ab_ReadOnly, ab_Hidden, ab_System, ab_Archive)
If lul_Attrib = -1 Then Return -1

If SetFileAttributesW(as_FileName, lul_Attrib) Then
	Return 1
Else
	Return 0
End If
end function

public function integer of_getlastwritedatetime (string as_filename, ref date ad_date, ref time at_time);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetLastWriteDatetime
//	Arguments:		as_FileName			The name of the file for which you want its date
//												and time; an absolute path may be specified or it
//												will be relative to the current working directory
//						ad_Date				The date the file was last modified, passed by reference.
//						at_Time				The time the file was last modified, passed by reference.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Get the date and time a file was last modified.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
//						5.0.03	Changed long variables to Ulong for NT4.0 compatibility
//						8.0 	Changed datatype of lul_handle to long ll_handle
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
Long			ll_handle
os_finddata	lstr_FindData

// Get the file information
ll_handle = FindFirstFileW(as_FileName, lstr_FindData)
If ll_handle <= 0 Then Return -1
FindClose(ll_handle)

// Convert the date and time
Return of_ConvertFileDatetimeToPB(lstr_FindData.str_LastWriteTime, ad_Date, at_Time)
end function

public function integer of_getcreationdatetime (string as_filename, ref date ad_date, ref time at_time);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetCreationDatetime
//	Arguments:		as_FileName				The name of the file for which you want its date
//													and time; an absolute path may be specified or it
//													will be relative to the current working directory
//						ad_Date					The date the file was created, passed by reference.
//						at_Time					The time the file was created, passed by reference.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Get the date and time a file was created.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
//						5.0.03	Changed Long variables to Ulong for NT4.0 compatibility
//						8.0 	Changed datatype of lul_handle to long ll_handle
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
Long			ll_handle
os_finddata	lstr_FindData

// Get the file information
ll_handle = FindFirstFileW(as_FileName, lstr_FindData)
If ll_handle <= 0 Then Return -1
FindClose(ll_handle)

// Convert the date and time
Return of_ConvertFileDatetimeToPB(lstr_FindData.str_CreationTime, ad_Date, at_Time)
end function

protected function integer of_convertfiledatetimetopb (os_filedatetime astr_filetime, ref date ad_filedate, ref time at_filetime);//////////////////////////////////////////////////////////////////////////////
//	Protected Function:  of_ConvertFileDatetimeToPB
//	Arguments:		astr_FileTime		The os_filedatetime structure containing the system date/time for the file.
//						ad_FileDate			The file date in PowerBuilder Date format	passed by reference.
//						at_FileTime			The file time in PowerBuilder Time format	passed by reference.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Convert a sytem file type to PowerBuilder Date and Time.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
//						5.0.03	Fixed - function would fail under some international date formats
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
String				ls_Time
os_filedatetime	lstr_LocalTime
os_systemtime		lstr_SystemTime

If Not FileTimeToLocalFileTime(astr_FileTime, lstr_LocalTime) Then Return -1

If Not FileTimeToSystemTime(lstr_LocalTime, lstr_SystemTime) Then Return -1

// works with all date formats
ad_FileDate = Date(lstr_SystemTime.ui_wyear, lstr_SystemTime.ui_WMonth, lstr_SystemTime.ui_WDay)

ls_Time = String(lstr_SystemTime.ui_wHour) + ":" + &
				String(lstr_SystemTime.ui_wMinute) + ":" + &
				String(lstr_SystemTime.ui_wSecond) + ":" + &
				String(lstr_SystemTime.ui_wMilliseconds)
at_FileTime = Time(ls_Time)

Return 1
end function

protected function integer of_convertpbdatetimetofile (date ad_filedate, time at_filetime, ref os_filedatetime astr_filetime);//////////////////////////////////////////////////////////////////////////////
//	Protected Function:  of_ConvertPBDatetimeToFile
//	Arguments:		ad_FileDate			The file date in PowerBuilder Date format.
//						at_FileTime			The file time in PowerBuilder Time format.
//						astr_FileTime		The os_filedatetime structure to contain the
//												system date/time for the file, passed by reference.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Convert PowerBuilder Date and Time to the sytem file type.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
//						5.0.03	Fix problem with century not being on the year passed in
//						6.0.01	Fix millisecond overflow.  Change size of string to 3 digits from 6 
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
String				ls_Time
unsignedinteger	lui_year, lui_test
os_filedatetime	lstr_LocalTime
os_systemtime	lstr_SystemTime

// fix problem when year without century passed in
lui_year = integer(string(ad_FileDate,'yyyy'))
lui_test = year(ad_filedate)
if lui_year < 50 then
	lui_year = lui_year + 2000
elseif lui_year < 100 then
	lui_year = lui_year + 1900
end if 

// make sure year with century is passed in
lstr_SystemTime.ui_wyear = lui_year
lstr_SystemTime.ui_WMonth = month(ad_FileDate)
lstr_SystemTime.ui_WDay = day(ad_FileDate)

ls_Time = String(at_FileTime, "hh:mm:ss:fff")
lstr_SystemTime.ui_wHour = Long(Left(ls_Time, 2))
lstr_SystemTime.ui_wMinute = Long(Mid(ls_Time, 4, 2))
lstr_SystemTime.ui_wSecond = Long(Mid(ls_Time, 7, 2))
lstr_SystemTime.ui_wMilliseconds = Long(Right(ls_Time, 3))

If Not SystemTimeToFileTime(lstr_SystemTime, lstr_LocalTime) Then Return -1

If Not LocalFileTimeToFileTime(lstr_LocalTime, astr_FileTime) Then Return -1

Return 1
end function

public function string of_getlongfilename (string as_altfilename);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetLongFilename
//	Arguments:		as_AltFileName			The alternate (short) file name for which the long file
//													name is desired; an absolute path may be specified
//													or it will be relative to the current working directory.
//	Returns:			String
//						The long file name (without the path), returns an empty string if an error occurrs.
//	Description:	Get the Win32 long file name for an alternate file name.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
//						5.0.03	Changed long variables to Ulong for NT4.0 compatibility
//						8.0 	Changed datatype of lul_handle to long ll_handle
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
Long						ll_handle
os_finddata	lstr_FindData

// Find the alternate file
ll_handle = FindFirstFileW(as_AltFileName, lstr_FindData)
If ll_handle <= 0 Then Return ""
FindClose(ll_handle)

Return lstr_FindData.ch_filename
end function

public function string of_getaltfilename (string as_longfilename);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetAltFilename
//	Arguments:		as_LongFileName		The long file name for which the alternate (short) file
//													name is desired; an absolute path may be specified
//													or it will be relative to the current working directory.
//	Returns:			String
//						The alternate file name (without the path), returns an empty string if an error occurrs.
//	Description:	Get the alternate file name name for a Win32 long file.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
//						5.0.03	Changed long variables to Ulong for NT4.0 compatibility
//						8.0 	Changed datatype of lul_handle to long ll_handle
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
Long						ll_handle
os_finddata	lstr_FindData

// Find the long file name
ll_handle = FindFirstFileW(as_LongFileName, lstr_FindData)
If ll_handle <= 0 Then Return ""
FindClose(ll_handle)

Return lstr_FindData.ch_alternatefilename
end function

public function double of_getfilesize (string as_filename);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetFileSize
//	Arguments:		as_FileName				The name of the file whose size is desired; an
//													absolute path may be specified or it will
//													be relative to the current working directory
//	Returns:			Double
//						The size of the file if successful, -1 if an error occurrs.
//	Description:	Get the size (in bytes) of a file.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
//						5.0.03	Changed long variables to Ulong for NT4.0 compatibility
//						8.0 	Changed datatype of lul_handle to long ll_handle
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
Double					ldb_Size
Long						ll_handle
os_finddata	lstr_FindData

// Get the file
ll_handle = FindFirstFileW(as_FileName, lstr_FindData)
If ll_handle <= 0 Then Return -1
FindClose(ll_handle)

// Calculate file size
ldb_Size = (lstr_FindData.ul_FileSizeHigh * (2.0 ^ 32))  + lstr_FindData.ul_FileSizeLow

Return ldb_Size
end function

public function integer of_setlastwritedatetime (string as_filename, date ad_date, time at_time);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_SetLastWriteDatetime
//	Arguments:		as_FileName				The name of the file to be updated.
//						ad_FileDate				The date to be set.
//						at_FileTime				The time to be set.
//	Returns:			Integer
//						1 if successful,
//						-1 if an error occurrs.
//	Description:	Set the Date/Time stamp on a file.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
//						5.0.03	Changed long variables to Ulong for NT4.0 compatibility
//						8.0 	Changed datatype of lul_handle to long ll_handle
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
Boolean						lb_Ret
Long							ll_handle
os_filedatetime			lstr_FileTime, lstr_Empty
os_finddata				lstr_FindData
os_fileopeninfo			lstr_FileInfo

// Get the file information.
// This is required to keep the Last Access date from changing.
// It will be changed by the OpenFile function.
ll_handle = FindFirstFileW(as_FileName, lstr_FindData)
If ll_handle <= 0 Then Return -1
FindClose(ll_handle)

// Convert the date and time
If of_ConvertPBDatetimeToFile(ad_Date, at_Time, lstr_FileTime) < 0 Then Return -1

// Set the file structure information
lstr_FileInfo.c_fixed_disk = "~000"
lstr_FileInfo.c_pathname = as_FileName
lstr_FileInfo.c_length = "~142"

// Open the file
ll_handle = OpenFile ( as_filename, lstr_FileInfo, 2 ) 
If ll_handle < 1 Then Return -1
 
lb_Ret = SetFileTime(ll_handle, lstr_Empty, lstr_FindData.str_LastAccessTime, lstr_FileTime)

CloseHandle(ll_handle)

If lb_Ret Then
	Return 1
Else
	Return -1
End If
end function

public function integer of_getlastaccessdate (string as_filename, ref date ad_date);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetLastAccessDate
//	Arguments:		as_FileName				The name of the file for which you want its date;
//													an absolute path may be specified or it will be
//													relative to the current working directory
//						ad_Date					The date the file was last accessed, passed by reference.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Get the date a file was last accessed (opened).  Note:  This function
//						only returns the Date because Last Access Time is not stored by
//						the operating system.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
//						5.0.03	Changed long variables to Ulong for NT4.0 compatibility
//						8.0 	Changed datatype of lul_handle to long ll_handle
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
Long					ll_handle
Time					lt_Time
os_finddata			lstr_FindData

// Get the file information
ll_handle = FindFirstFileW(as_FileName, lstr_FindData)
If ll_handle <= 0 Then Return -1
FindClose(ll_handle)

// Convert the date and time
Return of_ConvertFileDatetimeToPB(lstr_FindData.str_LastAccessTime, ad_Date, lt_Time)
end function

public function integer of_setcreationdatetime (string as_filename, date ad_date, time at_time);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_SetCreationDatetime
//	Arguments:		as_FileName				The name of the file to be updated.
//						ad_FileDate				The date to be set.
//						at_FileTime				The time to be set.
//	Returns:			Integer
//						1 if successful,
//						-1 if an error occurrs.
//	Description:	Set the Creation Date/Time stamp on a file.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
//						5.0.03	Changed long variables to Ulong for NT4.0 compatibility
//						8.0 	Changed datatype of lul_handle to long ll_handle
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
Boolean						lb_Ret
Long							ll_handle
os_filedatetime			lstr_FileTime, lstr_Empty
os_finddata				lstr_FindData
os_fileopeninfo			lstr_FileInfo

// Get the file information.
// This is required to keep the Last Access date from changing.
// It will be changed by the OpenFile function.
ll_handle = FindFirstFileW(as_FileName, lstr_FindData)
If ll_handle <= 0 Then Return -1
FindClose(ll_handle)

// Convert the date and time
If of_ConvertPBDatetimeToFile(ad_Date, at_Time, lstr_FileTime) < 0 Then Return -1

// Set the file structure information
lstr_FileInfo.c_fixed_disk = "~000"
lstr_FileInfo.c_pathname = as_FileName
lstr_FileInfo.c_length = "~142"

// Open the file
ll_handle = OpenFile ( as_filename, lstr_FileInfo, 2 ) 
If ll_handle < 1 Then Return -1
 
lb_Ret = SetFileTime(ll_handle, lstr_FileTime, lstr_FindData.str_LastAccessTime, lstr_Empty)

CloseHandle(ll_handle)

If lb_Ret Then
	Return 1
Else
	Return -1
End If
end function

public function integer of_setlastaccessdate (string as_filename, date ad_date);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_SetLastAccessDate
//	Arguments:		as_FileName				The name of the file to be updated.
//						ad_FileDate				The date to be set.
//	Returns:			Integer
//						1 if successful,
//						-1 if an error occurrs.
//	Description:	Set the Last Access Date on a file.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0		Initial version
//						5.0.03	Changed long variables to Ulong for NT4.0 compatibility
//						8.0 	Changed datatype of lul_handle to long ll_handle
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
Boolean						lb_Ret
Long							ll_handle
Time							lt_Time
os_filedatetime			lstr_FileTime, lstr_Empty
os_fileopeninfo			lstr_FileInfo

// Convert the date and time
If of_ConvertPBDatetimeToFile(ad_Date, lt_Time, lstr_FileTime) < 0 Then Return -1

// Set the file structure information
lstr_FileInfo.c_fixed_disk = "~000"
lstr_FileInfo.c_pathname = as_FileName
lstr_FileInfo.c_length = "~142"

// Open the file
ll_handle = OpenFile ( as_filename, lstr_FileInfo, 2 ) 
If ll_handle < 1 Then Return -1
 
lb_Ret = SetFileTime(ll_handle, lstr_Empty, lstr_FileTime, lstr_Empty)

CloseHandle(ll_handle)

If lb_Ret Then
	Return 1
Else
	Return -1
End If
end function

public function integer of_getdrivetype (string as_drive);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetDriveType
//	Arguments:		as_Drive					The letter of the drive to be checked.
//	Returns:			Integer
//						The type of the drive:
//						2 - floppy drive,
//						3 - hard drive,
//						4 - network drive,
//						5 - cdrom drive,
//						6 - ramdisk,
//						any other value is the result of an error.
//	Description:	Determine the type of a drive.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
//						5.0.03	Changed Uint variables to Ulong for NT4.0 compatibility
// 					5.0.03	Changed argument datatype to string from char to fix polymorphism problem
//									with literals passed in.
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
Ulong		lul_drivetype
String	ls_drive

ls_drive = upper(left(as_drive,1)) + ":\"

lul_drivetype = GetDriveTypeW(ls_drive)

return lul_drivetype
end function

public function integer of_getdiskspace (string as_drive, ref long al_totalspace, ref long al_freespace);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetDiskSpace
//	Arguments:		as_Drive					The letter of the drive to be checked.
//						al_TotalSpace			The total number of bytes on the drive, passed by reference.
//						al_FreeSpace			The number of bytes free, passed by reference.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Get space information about a drive.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   	Initial version
// 					5.0.03	Changed argument datatype to string from char to fix polymorphism problem
//								with literals passed in.
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
Long		ll_SectPerCluster, ll_BytesPerSect, ll_FreeClusters, ll_TotalClusters, ll_ClusterBytes
string	ls_string

ls_string = Upper(left(as_drive,1)) + ":\"

If Not GetDiskFreeSpaceW(ls_string, ll_SectPerCluster, ll_BytesPerSect, &
									ll_FreeClusters, ll_TotalClusters) Then Return -1

ll_ClusterBytes = ll_SectPerCluster * ll_BytesPerSect
al_TotalSpace = ll_ClusterBytes * ll_TotalClusters
al_FreeSpace = ll_ClusterBytes * ll_FreeClusters

Return 1
end function

public function integer of_getdiskspaceex (string as_drive, ref decimal adec_totalspace, ref decimal adec_freespace);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetDiskSpaceEX
//	Arguments:		as_Drive					The letter of the drive to be checked.
//						adec_TotalSpace			The total number of bytes on the drive, passed by reference.
//						adec_FreeSpace			The number of bytes free, passed by reference.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Get space information of more than 2G bytes about a drive.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   	Initial version
// 					5.0.03	Changed argument datatype to string from char to fix polymorphism problem
//								with literals passed in.
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
Long		ll_SectPerCluster, ll_BytesPerSect, ll_FreeClusters, ll_TotalClusters, ll_ClusterBytes
string	ls_string

ls_string = Upper(left(as_drive,1)) + ":\"

If Not GetDiskFreeSpaceW(ls_string, ll_SectPerCluster, ll_BytesPerSect, &
									ll_FreeClusters, ll_TotalClusters) Then Return -1

ll_ClusterBytes = ll_SectPerCluster * ll_BytesPerSect

adec_TotalSpace = ll_TotalClusters
adec_TotalSpace *= ll_ClusterBytes

adec_FreeSpace = ll_FreeClusters
adec_FreeSpace *= ll_ClusterBytes

Return 1
end function

protected function long of_maxpath ();Return(32767)
end function

on pfc_n_cst_filesrvunicode.create
call super::create
end on

on pfc_n_cst_filesrvunicode.destroy
call super::destroy
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//	Event:  Constructor
//	Description:	Set the instance variables for the directory separator
//						and wildcard for all files for this OS.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
// 					5.0.03	Replace Uint with Ulong in Local External Functions for full NT 4.0
//									32 bit compatibility (handle type variables).
//						5.0.03	Changed object structure os_securityattributes datatype from char to string
//									to fix NT 4.0 directory creation inconsistency
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
is_Separator = "\"
is_AllFiles = "*.*"
end event

