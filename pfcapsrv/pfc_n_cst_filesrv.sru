HA$PBExportHeader$pfc_n_cst_filesrv.sru
$PBExportComments$PFC File handler service
forward
global type pfc_n_cst_filesrv from n_base
end type
end forward

global type pfc_n_cst_filesrv from n_base
end type
global pfc_n_cst_filesrv pfc_n_cst_filesrv

type prototypes
Public:

	Function boolean MoveFile(REF String lpExistingFileName, REF String lpNewFileName) LIBRARY "KERNEL32.DLL" ALIAS FOR "MoveFileA;Ansi"
	
Private:

	FUNCTION unsignedLong GetLongPathName(REF String lpszShortPath, REF String lpszLongPath, Long cchBuffer) LIBRARY 'kernel32.dll' ALIAS FOR 'GetLongPathNameA;Ansi'
	FUNCTION unsignedLong GetShortPathName(REF String lpszLongPath, REF String lpszShortPath, Long cchBuffer) LIBRARY 'kernel32.dll' ALIAS FOR 'GetShortPathNameA;Ansi'
	Function unsignedInteger GetSystemDirectory(REF String lpBuffer, unsignedInteger uSize) LIBRARY "KERNEL32.DLL" ALIAS FOR "GetSystemDirectoryA;Ansi"
	Function unsignedInteger GetTempFileName(REF String lpPathName, REF String lpPrefixString, unsignedInteger uUnique, REF String lpTempFileName) LIBRARY "KERNEL32.DLL" ALIAS FOR "GetTempFileNameA;Ansi"
	Function unsignedLong GetTempPath(unsignedLong nBufferLength, REF String lpBuffer) LIBRARY "KERNEL32.DLL" ALIAS FOR "GetTempPathA;Ansi"
	Function unsignedInteger GetWindowsDirectory(REF String lpBuffer, unsignedInteger uSize) LIBRARY "kernel32.dll" ALIAS FOR "GetWindowsDirectoryA;Ansi"
end prototypes

type variables
Public:

	//	File Attribute Constants
	CONSTANT Long			FILE_ATTRIBUTE_READWRITE				= 0
	CONSTANT Long			FILE_ATTRIBUTE_READONLY					= 1			//	(0x1)			A file that is read-only.
																								//					Applications can read the file, but cannot write to it or delete it.
																								//					This attribute is not honored on directories.
																								//					For more information, see you cannot view or change the Read-only or the System attributes of folders in Windows Server 2003, in Windows XP, in Windows Vista or in Windows 7.
	CONSTANT Long			FILE_ATTRIBUTE_HIDDEN					= 2			//	(0x2)			The file or directory is hidden.
																								//					It is not included in an ordinary directory listing.
	CONSTANT Long			FILE_ATTRIBUTE_SYSTEM					= 4			//	(0x4)			A file or directory that the operating system uses a part of, or uses exclusively.
	CONSTANT Long			FILE_ATTRIBUTE_DIRECTORY				= 16			//	(0x10)		The handle that identifies a directory.
	CONSTANT Long			FILE_ATTRIBUTE_ARCHIVE					= 32			//	(0x20)		A file or directory that is an archive file or directory.
																								//					Applications typically use this attribute to mark files for backup or removal.
	CONSTANT Long			FILE_ATTRIBUTE_READONLY_ARCHIVE		= 33
	CONSTANT Long			FILE_ATTRIBUTE_DEVICE					= 64			//	(0x40)		This value is reserved for system use.
	CONSTANT Long			FILE_ATTRIBUTE_NORMAL					= 128			//	(0x80)		A file that does not have other attributes set.
																								//					This attribute is valid only when used alone.
	CONSTANT Long			FILE_ATTRIBUTE_TEMPORARY				= 256			//	(0x100)		A file that is being used for temporary storage.
																								//					File systems avoid writing data back to mass storage if sufficient cache memory is available, because typically, an application deletes a temporary file after the handle is closed.
																								//					In that scenario, the system can entirely avoid writing the data.
																								//					Otherwise, the data is written after the handle is closed.
	CONSTANT Long			FILE_ATTRIBUTE_SPARSE_FILE				= 512			//	(0x200)		A file that is a sparse file.
	CONSTANT Long			FILE_ATTRIBUTE_REPARSE_POINT			= 1024		//	(0x400)		A file or directory that has an associated reparse point, or a file that is a symbolic link.
	CONSTANT Long			FILE_ATTRIBUTE_COMPRESSED				= 2048		//	(0x800)		A file or directory that is compressed.
																								//					For a file, all of the data in the file is compressed.
																								//					For a directory, compression is the default for newly created files and subdirectories.
	CONSTANT Long			FILE_ATTRIBUTE_OFFLINE					= 4096		//	(0x1000)		The data of a file is not available immediately.
																								//					This attribute indicates that the file data is physically moved to offline storage.
																								//					This attribute is used by Remote Storage, which is the hierarchical storage management software.
																								//					Applications should not arbitrarily change this attribute.
	CONSTANT Long			FILE_ATTRIBUTE_NOT_CONTENT_INDEXED	= 8192		//	(0x2000)		The file or directory is not to be indexed by the content indexing service.
	CONSTANT Long			FILE_ATTRIBUTE_ENCRYPTED				= 16384		//	(0x4000)		A file or directory that is encrypted.
																								//					For a file, all data streams in the file are encrypted.
																								//					For a directory, encryption is the default for newly created files and subdirectories.
	CONSTANT Long			FILE_ATTRIBUTE_INTEGRITY_STREAM		= 32768		//	(0x8000)		The directory or user data stream is configured with integrity (only supported on ReFS volumes).
																								//					It is not included in an ordinary directory listing.
																								//					The integrity setting persists with the file if it's renamed.
																								//					If a file is copied the destination file will have integrity set if either the source file or destination directory have integrity set.
																								//					Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP.
																								//					This flag is not supported until Windows Server 2012.
	CONSTANT Long			FILE_ATTRIBUTE_VIRTUAL					= 65536		//	(0x10000)	This value is reserved for system use.
	CONSTANT Long			FILE_ATTRIBUTE_NO_SCRUB_DATA			= 131072		//	(0x20000)	The user data stream not to be read by the background data integrity scanner (AKA scrubber).
																								//					When set on a directory it only provides inheritance. This flag is only supported on Storage Spaces and ReFS volumes.
																								//					It is not included in an ordinary directory listing.
																								//					Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003, and Windows XP.
																								//					This flag is not supported until Windows 8 and Windows Server 2012.
Protected:
string	is_Separator
string	is_AllFiles
string	is_FileType
n_ds	ids_files
end variables

forward prototypes
public function string of_getseparator ()
public function string of_assemblepath (string as_drive, string as_dirpath, string as_filename, string as_ext)
public function integer of_CreateDirectory (string as_directoryname)
public function string of_GetCurrentDirectory ()
public function boolean of_DirectoryExists (string as_DirectoryName)
public function integer of_ChangeDirectory (string as_NewDirectory)
public function integer of_RemoveDirectory (string as_directoryname)
public function string of_AssemblePath (string as_Drive, string as_DirPath, string as_FileName)
public function integer of_FileCopy (string as_sourcefile, string as_targetfile, boolean ab_append)
public function long of_FileRead (string as_FileName, ref blob ablb_Data)
public function long of_fileread (string as_filename, ref string as_text[])
public function integer of_filewrite (string as_filename, string as_text, boolean ab_append)
public function integer of_FileWrite (string as_FileName, blob ablb_Data, boolean ab_Append)
public function integer of_FileWrite (string as_filename, string as_text)
public function integer of_FileWrite (string as_FileName, blob ablb_Data)
public function integer of_FileCopy (string as_SourceFile, string as_TargetFile)
public function integer of_FileRename (string as_sourcefile, string as_targetfile)
public function long of_DirList (string as_filespec, long al_filetyp, ref n_cst_dirattrib anv_dirlist[])
public function integer of_SetFileAttributes (string as_FileName, boolean ab_ReadOnly, boolean ab_Hidden, boolean ab_System, boolean ab_Archive)
public function integer of_GetFileAttributes (string as_filename, ref boolean ab_readonly, ref boolean ab_hidden, ref boolean ab_system, ref boolean ab_Subdirectory, ref boolean ab_archive)
public function integer of_SetFileReadonly (string as_filename, boolean ab_readonly)
public function integer of_SetFileHidden (string as_filename, boolean ab_hidden)
public function integer of_SetFileSystem (string as_filename, boolean ab_system)
public function integer of_SetFileArchive (string as_filename, boolean ab_archive)
public function string of_GetLongFilename (string as_AltFileName)
public function string of_GetAltFilename (string as_LongFileName)
public function double of_GetFileSize (string as_filename)
protected function unsignedlong of_calculatefileattributes (string as_filename, boolean ab_readonly, boolean ab_hidden, boolean ab_system, boolean ab_archive)
protected function boolean of_includefile (string as_filename, long al_attribmask, unsignedlong aul_fileattrib)
public function integer of_GetLastwriteDatetime (string as_filename, ref date ad_date, ref time at_time)
public function integer of_GetCreationDatetime (string as_filename, ref date ad_date, ref time at_time)
public function integer of_GetLastwriteDate (string as_FileName, ref date ad_Date)
public function integer of_GetLastwriteTime (string as_FileName, ref time at_Time)
public function integer of_GetCreationTime (string as_FileName, ref time at_Time)
public function integer of_GetCreationDate (string as_filename, ref date ad_date)
public function integer of_getlastaccessdate (string as_filename, ref date ad_date)
public function integer of_SetLastwriteDatetime (string as_filename, date ad_date, time at_time)
public function integer of_setcreationdatetime (string as_FileName, date ad_FileDate, time at_FileTime)
public function integer of_setlastaccessdate (string as_filename, date ad_date)
public function integer of_deltree (string as_directoryname)
public function integer of_parsepath (string as_path, ref string as_drive, ref string as_dirpath, ref string as_filename, ref string as_ext)
public function integer of_parsepath (string as_path, ref string as_drive, ref string as_dirpath, ref string as_filename)
public function integer of_sortdirlist (ref n_cst_dirattrib anv_dirlist[], integer ai_sorttype, boolean ab_ascending)
public function integer of_sortdirlist (ref n_cst_dirattrib anv_dirlist[], integer ai_sorttype)
public function integer of_getvolumes (ref string as_volumes[])
protected function integer of_dirattribtods (ref n_ds ads_source, n_cst_dirattrib anv_entry, string as_sortfilename, integer ai_filegroup)
protected function integer of_dstodirattrib (ref n_ds ads_source, ref n_cst_dirattrib anv_entry, long al_row)
public function integer of_getdrivetype (string as_drive)
public function integer of_getdiskspace (string as_drive, ref long al_totalspace, ref long al_freespace)
public function string of_getallfilesspecifier ()
public function integer of_getdiskspaceex (string as_drive, ref decimal adec_totalspace, ref decimal adec_freespace)
public function integer of_createdirectorytree (string as_directorytree, boolean ab_restorecurrentdirectory)
public function integer of_createdirectorytree (string as_directorytree)
public function string of_getsystemdirectory ()
public function string of_getshortpathname (string as_longpathname)
protected function long of_maxpath ()
public function string of_getwindowsdirectory ()
public function string of_getlongpathname (string as_shortpathname)
public function boolean of_movefile (string as_existingfilename, string as_newfilename)
public function string of_gettemppath ()
public function string of_gettempfilename (string vs_directory, string vs_prefix, unsignedinteger vui_unique)
public function string of_gettempfilename (string vs_prefix)
public function integer of_setfiletype (string as_filetype)
public function string of_getfiletype ()
end prototypes

public function string of_getseparator ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetSeparator
//	Arguments:		None
//	Returns:			String -	The directory separator character.
//	Description:	Returns the value of the protected instance Separator
//						which is the separator character for directories in the current
//						operating system.
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
Return is_Separator
end function

public function string of_assemblepath (string as_drive, string as_dirpath, string as_filename, string as_ext);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_AssemblePath
//	Arguments:		as_Drive					The disk drive from the path.
//						as_DirPath				The directory path.
//						as_FileName				The name of the file.
//						as_Ext					The file extension.
//	Returns:			String - The fully-qualified directory path.
//	Description:	Assemble a fully-qualified directory path from its component parts.
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
string	ls_Path

// Set the Drive and Path.
ls_Path = Trim(as_Drive) + Trim(as_DirPath)

// Make sure the separator is included.
If Right(ls_Path, 1) <> is_Separator Then	ls_Path = ls_Path + is_Separator

// Add the filename.
ls_Path = ls_Path + Trim(as_FileName)

// Add the Extension.
If Trim(as_Ext) <> "" Then	ls_Path = ls_Path + "." + Trim(as_Ext)

// Return the assembled path.
Return ls_Path
end function

public function integer of_CreateDirectory (string as_directoryname);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

public function string of_GetCurrentDirectory ();//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return ""
end function

public function boolean of_DirectoryExists (string as_DirectoryName);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return False
end function

public function integer of_ChangeDirectory (string as_NewDirectory);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

public function integer of_RemoveDirectory (string as_directoryname);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

public function string of_AssemblePath (string as_Drive, string as_DirPath, string as_FileName);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_AssemblePath
//	Arguments:		as_Drive					The disk drive from the path.
//						as_DirPath				The directory path.
//						as_FileName				The name of the file.
//	Returns:			String - The fully-qualified directory path.
//	Description:	Assemble a fully-qualified directory path from its component parts.
//						This function overrides the real of_AssemblePath to allow the file
//						extension to be optional.
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
Return of_AssemblePath(as_Drive, as_DirPath, as_FileName, "")
end function

public function integer of_FileCopy (string as_sourcefile, string as_targetfile, boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_FileCopy
//	Arguments:		as_SourceFile			The name of the source file.
//						as_TargetFile			The name of the target file.
//						ab_Append				True - append to the target file if it exists,
//													False - overwrite the target file if it exists.
//	Returns:			Integer
//						1 if successful,
//						-1 if an error occurrs reading the source file,
//						-2 if an error occurrs writting to the target file.
//	Description:	Copy a file.
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
blob		lblb_Data

// Read the source file into a blob
If of_FileRead(as_SourceFile, lblb_Data) < 0 Then Return -1

// Write to the target
If of_FileWrite(as_TargetFile, lblb_Data, ab_append) < 0 Then Return -2

Return 1
end function

public function long of_fileread (string as_filename, ref blob ablb_data);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_FileRead
//	Arguments:		as_FileName				The name of the file to read.
//						ablb_Data				The data from the file, passed by reference.
//	Returns:			Long - The size of the blob read, returns -1 if an error occurrs.
//	Description:	Open, read into a blob, and close a file.  Handles files > 32,765 bytes.
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
//2018/04/12 Changed to FileReadEx from FileRead, changed filelock from deafult LockReadWrite! to LockWrite!
integer		li_FileNo
long			ll_FileLen

li_FileNo = FileOpen(as_FileName,StreamMode!,Read!,LockWrite!)
If li_FileNo < 0 Then Return -1

// Empty the blob argument
setnull(ablb_Data)

ll_FileLen = FileReadEx(li_FileNo, ablb_Data)

FileClose(li_FileNo)

Return ll_FileLen
end function

public function long of_fileread (string as_filename, ref string as_text[]);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_FileRead
//	Arguments:		as_FileName				The name of the file to read.
//						as_Text[]				An array of strings to hold the text from the file,
//													passed by reference.
//	Returns:			Long - The number of elements in as_Text, returns -1 if an error occurrs.
//	Description:	Open, read, and close a file.  Handles files > 32,765 bytes by reading
//						it into an array of strings.
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
integer		li_FileNo, li_Cnt
long			ll_FileLen, ll_Reads

ll_FileLen = FileLength(as_FileName)

li_FileNo = FileOpen(as_FileName, StreamMode!, Read!)
If li_FileNo < 0 Then Return -1

// Determine the number of reads required to read the entire file
If ll_FileLen > 32765 Then
	If Mod(ll_FileLen, 32765) = 0 Then
		ll_Reads = ll_FileLen / 32765
	Else
		ll_Reads = (ll_FileLen / 32765) + 1
	End if
Else
	ll_Reads = 1
End if

For li_Cnt = 1 to ll_Reads
	If FileRead(li_FileNo, as_Text[li_Cnt]) = -1 Then
		Return -1
	End if
Next

FileClose(li_FileNo)

Return ll_Reads
end function

public function integer of_filewrite (string as_filename, string as_text, boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_FileWrite
//	Arguments:		as_FileName				The name of the file to write to.
//						as_Text					The text to be written to the file.
//						ab_Append				True - append to the end of the file,
//													False - overwrite the existing file.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Open, write to, and close a file.  Handles strings > 32,765 bytes.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
//						6.0.01	Rewrite to handle strings > 60k making more than 2 passes (for 32 bit platforms)
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
//2018/04/12 Changed to new FileWriteEx from obsolete FileWrite
//2018/05/10 Kim Berghall Changed to TextMode! from StreamMode!, required for string data type with FileWriteEx.
integer li_FileNo, li_rc
writemode lwm_Mode

If ab_Append Then
	lwm_Mode = Append!
Else
	lwm_Mode = Replace!
End if

li_FileNo = FileOpen(as_FileName, TextMode!, Write!, LockReadWrite!, lwm_Mode)
If li_FileNo < 0 Then Return -1

if FileWriteEx(li_FileNo, as_text) = -1 then
	li_rc = -1
else
	li_rc = 1
end if

FileClose(li_FileNo)

Return li_rc
end function
public function integer of_filewrite (string as_filename, blob ablb_data, boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_FileWrite
//	Arguments:		as_FileName				The name of the file to write to.
//						ablb_Data				The data to be written to the file.
//						ab_Append				True - append to the end of the file,
//													False - overwrite the existing file.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Open, write from a blob, and close a file.  Handles blobs > 32,765 bytes.
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
//2018/04/12 Changed to new FileWriteEx from obsolete FileWrite
integer li_FileNo, li_rc
writemode lwm_Mode

If ab_Append Then
	lwm_Mode = Append!
Else
	lwm_Mode = Replace!
End if

li_FileNo = FileOpen(as_FileName, StreamMode!, Write!, LockReadWrite!, lwm_Mode)
If li_FileNo < 0 Then Return -1

if FileWriteEx(li_FileNo, ablb_Data) = -1 then
	li_rc = -1
else
	li_rc = 1
end if

FileClose(li_FileNo)

Return li_rc
end function
public function integer of_FileWrite (string as_filename, string as_text);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_FileWrite
//	Arguments:		as_FileName				The name of the file to write to.
//						as_Text					The text to be written to the file.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Open, write to, and close a file.  Handles strings > 32,765 bytes.
//						This function overrides the real of_FileWrite to allow the Append
//						parameter to be optional (default is True).
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
Return of_FileWrite(as_FileName, as_Text, True)
end function

public function integer of_FileWrite (string as_FileName, blob ablb_Data);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_FileWrite
//	Arguments:		as_FileName				The name of the file to write to.
//						ablb_Data				The data to be written to the file.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Open, write from a blob, and close a file.  Handles blobs > 32,765 bytes.
//						This function overrides the real of_FileWrite to allow the Append
//						parameter to be optional (default is True).
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
Return of_FileWrite(as_FileName, ablb_Data, True)
end function

public function integer of_FileCopy (string as_SourceFile, string as_TargetFile);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_FileCopy
//	Arguments:		as_SourceFile			The name of the source file.
//						as_TargetFile			The name of the target file.
//	Returns:			Integer
//						1 if successful,
//						-1 if an error occurrs reading the source file,
//						-2 if an error occurrs writting to the target file.
//	Description:	Copy a file.
//						This function overrides the real of_FileCopy to allow the Append
//						parameter to be optional (the default is False).
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
Return of_FileCopy(as_SourceFile, as_TargetFile, False)
end function

public function integer of_FileRename (string as_sourcefile, string as_targetfile);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

public function long of_DirList (string as_filespec, long al_filetyp, ref n_cst_dirattrib anv_dirlist[]);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

public function integer of_SetFileAttributes (string as_FileName, boolean ab_ReadOnly, boolean ab_Hidden, boolean ab_System, boolean ab_Archive);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1

end function

public function integer of_GetFileAttributes (string as_filename, ref boolean ab_readonly, ref boolean ab_hidden, ref boolean ab_system, ref boolean ab_Subdirectory, ref boolean ab_archive);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

public function integer of_SetFileReadonly (string as_filename, boolean ab_readonly);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_SetFileReadonly
//	Arguments:		as_FileName				The name of the file whose Read-Only attribute is to be set.
//						ab_ReadOnly				The value to set the attribute to.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Set a file's Read-Only attribute.
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
boolean		lb_Null

SetNull(lb_Null)

Return of_SetFileAttributes(as_FileName, ab_ReadOnly, lb_Null, lb_Null, lb_Null)
end function

public function integer of_SetFileHidden (string as_filename, boolean ab_hidden);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_SetFileHidden
//	Arguments:		as_FileName				The name of the file whose Hidden attribute is to be set.
//						ab_Hidden				The value to set the attribute to.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Set a file's Hidden attribute.
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
boolean		lb_Null

SetNull(lb_Null)

Return of_SetFileAttributes(as_FileName, lb_Null, ab_Hidden, lb_Null, lb_Null)
end function

public function integer of_SetFileSystem (string as_filename, boolean ab_system);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_SetFileSystem
//	Arguments:		as_FileName				The name of the file whose System attribute is to be set.
//						ab_System				The value to set the attribute to.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Set a file's System attribute.
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
boolean		lb_Null

SetNull(lb_Null)

Return of_SetFileAttributes(as_FileName, lb_Null, lb_Null, ab_System, lb_Null)
end function

public function integer of_SetFileArchive (string as_filename, boolean ab_archive);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_SetFileArchive
//	Arguments:		as_FileName				The name of the file whose Archive attribute is to be set.
//						ab_Archive				The value to set the attribute to.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Set a file's Archive attribute.
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
boolean		lb_Null

SetNull(lb_Null)

Return of_SetFileAttributes(as_FileName, lb_Null, lb_Null, lb_Null, ab_Archive)
end function

public function string of_GetLongFilename (string as_AltFileName);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return ""
end function

public function string of_GetAltFilename (string as_LongFileName);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return ""
end function

public function double of_GetFileSize (string as_filename);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

protected function unsignedlong of_calculatefileattributes (string as_filename, boolean ab_readonly, boolean ab_hidden, boolean ab_system, boolean ab_archive);//////////////////////////////////////////////////////////////////////////////
//	Protected Function:  of_SetFileAttributes
//	Arguments:		as_FileName				The file whose attributes you want to set; an
//													absolute path may be specified or it will
//													be relative to the current working directory.
//						ab_ReadOnly				The new value for the Read-Only attribute.
//						ab_Hidden				The new value for the Hidden attribute.
//						ab_System				The new value for the System attribute.
//						ab_Archive				The new value for the Archive attribute.
//	Returns:			Unsigned Long - The new attribute byte
//	Description:	Calculate the new attribute byte for a file.  If null is passed 
//						for any of the attributes, it will not be changed.
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
boolean	lb_ReadOnly, lb_Hidden, lb_System, lb_Subdirectory, lb_Archive
ulong		lul_Attrib

// Get the current attribute values
If of_GetFileAttributes(as_FileName, lb_ReadOnly, lb_Hidden, &
		lb_System, lb_Subdirectory, lb_Archive) = -1 Then 
	Return -1
End If

// Preserve the Subdirectory attribute
If lb_Subdirectory Then
	lul_Attrib = 16
Else
	lul_Attrib = 0
End If

// Set Read-Only
If Not IsNull(ab_ReadOnly) Then
	If ab_ReadOnly Then lul_Attrib = lul_Attrib + 1
Else
	If lb_ReadOnly Then lul_Attrib = lul_Attrib + 1
End If

// Set Hidden
If Not IsNull(ab_Hidden) Then
	If ab_Hidden Then lul_Attrib = lul_Attrib + 2
Else
	If lb_Hidden Then lul_Attrib = lul_Attrib + 2
End If

// Set System
If Not IsNull(ab_System) Then
	If ab_System Then lul_Attrib = lul_Attrib + 4
Else
	If lb_System Then lul_Attrib = lul_Attrib + 4
End If

// Set Archive
If Not IsNull(ab_Archive) Then
	If ab_Archive Then lul_Attrib = lul_Attrib + 32
Else
	If lb_Archive Then lul_Attrib = lul_Attrib + 32
End If

Return lul_Attrib
end function

protected function boolean of_includefile (string as_filename, long al_attribmask, unsignedlong aul_fileattrib);//////////////////////////////////////////////////////////////////////////////
//	Protected Function:  of_IncludeFile
//	Arguments:		as_FileName				The name of the file.
//						al_AttribMask			The bit string that determines which files to include.
//						aul_FileAttrib			The attribute bits for the file.
//	Returns:			Boolean - True if the file should be included, False if not.
//	Description:	Determine whether a file should be included by the of_DirList function.
//						This is based on the attributes of the desired files and the file's attributes.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0			Initial version
//						5.0.2			Fixed problem with NTFS file systems using different value for FILE_ATTRIBUTE_NORMAL
//						8.0			Change to include files in compressed directories
//						12.5			Add support for non-indexed devices.  It ain't pretty,
//										but it works without breaking current functionality.
//										There is still a bug if FILE_ATTRIBUTE_VIRTUAL
//										or FILE_ATTRIBUTE_NO_SCRUB_DATA attribute(s) are
//										set for a file.
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
boolean				lb_ReadWrite
n_cst_numerical	lnv_Numeric

// Never include the "[.]" directory entry
If as_FileName = "." Then Return False

// If the mask is > 32768, then read/write files should be excluded
If al_AttribMask >=32768 Then
	al_AttribMask = al_AttribMask - 32768
	lb_ReadWrite = False
Else
	lb_ReadWrite = True
End if

// If the type is > 16384, then a list of drives should be included
If al_AttribMask >= 16384 Then al_AttribMask = al_AttribMask - 16384

// Include the file if lb_ReadWrite is true and the file is a read-write or
// read-only file (with or without the archive bit set)
// NTFS File Systems set Read/Write Files (FILE_ATTRIBUTE_NORMAL) = 128
If (lb_ReadWrite And (aul_FileAttrib = 0 Or &
							 	aul_FileAttrib = 1 Or &
								aul_FileAttrib = 32 Or &
								aul_FileAttrib = 33 Or &
								aul_FileAttrib = 128)) Then Return True

//	Look for compressed files
If (lb_ReadWrite And (aul_FileAttrib = 0 + 2048 Or &
							 	aul_FileAttrib = 1 + 2048 Or &
								aul_FileAttrib = 32 + 2048 Or &
								aul_FileAttrib = 33 + 2048 Or &
								aul_FileAttrib = 128 + 2048 )) Then Return True
								
//	Look for files on a non-indexed device
IF (lb_readWrite AND (aul_fileAttrib = 0		+ FILE_ATTRIBUTE_NOT_CONTENT_INDEXED	OR &
							 aul_fileAttrib = 1		+ FILE_ATTRIBUTE_NOT_CONTENT_INDEXED	OR &
							 aul_fileAttrib = 32 	+ FILE_ATTRIBUTE_NOT_CONTENT_INDEXED	OR &
							 aul_fileAttrib = 33 	+ FILE_ATTRIBUTE_NOT_CONTENT_INDEXED	OR &
							 aul_fileAttrib = 128	+ FILE_ATTRIBUTE_NOT_CONTENT_INDEXED)) THEN Return(TRUE)

//	Look for compressed files on a non-indexed device
IF (lb_readWrite AND (aul_fileAttrib = 0		+ FILE_ATTRIBUTE_NOT_CONTENT_INDEXED + FILE_ATTRIBUTE_COMPRESSED	OR &
							 aul_fileAttrib = 1		+ FILE_ATTRIBUTE_NOT_CONTENT_INDEXED + FILE_ATTRIBUTE_COMPRESSED	OR &
							 aul_fileAttrib = 32		+ FILE_ATTRIBUTE_NOT_CONTENT_INDEXED + FILE_ATTRIBUTE_COMPRESSED	OR &
							 aul_fileAttrib = 33		+ FILE_ATTRIBUTE_NOT_CONTENT_INDEXED + FILE_ATTRIBUTE_COMPRESSED	OR &
							 aul_fileAttrib = 128	+ FILE_ATTRIBUTE_NOT_CONTENT_INDEXED + FILE_ATTRIBUTE_COMPRESSED)) THEN Return(TRUE)

// Or include it if its attributes match the mask passed in (use bitwise AND).
If lnv_Numeric.of_BitwiseAnd(aul_FileAttrib, al_AttribMask) > 0 Then Return True

Return False
end function

public function integer of_GetLastwriteDatetime (string as_filename, ref date ad_date, ref time at_time);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

public function integer of_GetCreationDatetime (string as_filename, ref date ad_date, ref time at_time);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

public function integer of_GetLastwriteDate (string as_FileName, ref date ad_Date);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetLastWriteDate
//	Arguments:		as_FileName				The name of the file for which you want its date;
//													an absolute path may be specified or it will be
//													relative to the current working directory
//						ad_Date					The date the file was last modified, passed by reference.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Get the date a file was last modified.
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
time		lt_Time

Return of_GetLastwriteDatetime(as_FileName, ad_Date, lt_Time)
end function

public function integer of_GetLastwriteTime (string as_FileName, ref time at_Time);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetLastWriteTime
//	Arguments:		as_FileName				The name of the file for which you want its time;
//													an absolute path may be specified or it will be
//													relative to the current working directory
//						ad_Time					The time the file was last modified, passed by reference.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Get the time a file was last modified.
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
date		ld_Date

Return of_GetLastwriteDatetime(as_FileName, ld_Date, at_Time)
end function

public function integer of_GetCreationTime (string as_FileName, ref time at_Time);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetCreationTime
//	Arguments:		as_FileName				The name of the file for which you want its time;
//													an absolute path may be specified or it will be
//													relative to the current working directory
//						ad_Time					The time the file was created, passed by reference.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Get the time a file was created.  This is only valid for Win32.
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
date		ld_Date

Return of_GetCreationDatetime(as_FileName, ld_Date, at_Time)
end function

public function integer of_GetCreationDate (string as_filename, ref date ad_date);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetCreationDate
//	Arguments:		as_FileName				The name of the file for which you want its date;
//													an absolute path may be specified or it will be
//													relative to the current working directory
//						ad_Date					The date the file was created, passed by reference.
//	Returns:			Integer
//						1 if successful, -1 if an error occurrs.
//	Description:	Get the date a file was created.  This is only valid for Win32.
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
time		lt_Time

Return of_GetCreationDatetime(as_FileName, ad_Date, lt_Time)
end function

public function integer of_getlastaccessdate (string as_filename, ref date ad_date);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

public function integer of_SetLastwriteDatetime (string as_filename, date ad_date, time at_time);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

public function integer of_setcreationdatetime (string as_FileName, date ad_FileDate, time at_FileTime);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

public function integer of_setlastaccessdate (string as_filename, date ad_date);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

public function integer of_deltree (string as_directoryname);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_DelTree
//	Arguments:		as_DirectoryName	The name of the directory to be deleted; an
//												absolute path may be specified or it will
//												be relative to the current working directory
//	Returns:			Integer
//						1 if successful,
//						-1 if an error occurrs.
//	Description:	Delete a directory and all its files and subdirectories.  This 
//						function is recurrsive.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
//						7.0	Changed datatype of li_Cnt, li_Entries from int to long
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
integer				li_RC
long					ll_Entries, ll_Cnt
string				ls_Directory, ls_Subdirectory
n_cst_dirattrib	lnv_DirList[]

If Not of_DirectoryExists(as_DirectoryName) Then Return 1

If Right(as_DirectoryName, 1) <> is_Separator Then
	ls_Directory = as_DirectoryName + is_Separator
Else
	ls_Directory = as_DirectoryName
End If

ll_Entries = of_DirList(ls_Directory + is_AllFiles, 55, lnv_DirList)

For ll_Cnt = 1 To ll_Entries
	If lnv_DirList[ll_Cnt].ib_SubDirectory Then

		// Recursively call this function to erase the subdirectory
		// Skip [..]
		If lnv_DirList[ll_Cnt].is_FileName <> "[..]" Then

			// Remove [] from directory name
			ls_SubDirectory = Mid(lnv_DirList[ll_Cnt].is_FileName, 2, &
				(Len(lnv_DirList[ll_Cnt].is_FileName) - 2))

			li_RC = of_DelTree(ls_Directory + ls_SubDirectory)
			If li_RC < 0 Then
				Return li_RC
			End if
		End if

	Else
		// Delete the file
		If Not FileDelete(ls_Directory + lnv_DirList[ll_Cnt].is_FileName) Then
			Return -1
		End if
	End if
Next

Return of_RemoveDirectory(as_DirectoryName)
end function

public function integer of_parsepath (string as_path, ref string as_drive, ref string as_dirpath, ref string as_filename, ref string as_ext);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  	of_ParsePath
//	Arguments:		as_Path					The path to disassemble.
//						as_Drive					The disk drive from the path, passed by reference.
//						as_DirPath				The directory path, passed by reference.
//						as_FileName				The name of the file, passed by reference.
//						as_Ext					The file extension, passed by reference.  If null is 
//													passed in, the extension will not be parsed out of the file.
//	Returns:			integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//	Description:	Parse a fully-qualified directory path into its component parts.
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
integer			li_Pos
string			ls_File
n_cst_string 	lnv_string

If IsNull(as_path) or Len(Trim(as_path))=0 Then	Return -1

// Get the drive
li_Pos = Pos(as_Path, ":")
If li_Pos = 0 Then
	as_Drive = ""
Else
	If Mid(as_Path, (li_Pos + 1), 1) = is_Separator Then
		li_Pos ++
	End if

	as_Drive = Left(as_Path, li_Pos)
	as_Path = Right(as_Path, (Len(as_Path) - li_Pos))
End if

// Get the file name and extension
li_Pos = lnv_string.of_LastPos(as_Path, is_Separator, 0)
ls_File = Right(as_Path, (Len(as_Path) - li_Pos))
as_Path = Left(as_Path, li_Pos)

If IsNull(as_Ext) Then
	as_FileName = ls_File
	as_Ext = ""
Else
	// Get the extension
	li_Pos = lnv_string.of_LastPos(ls_File, ".")
	If li_Pos > 0 Then
		as_FileName = Left(ls_File, (li_Pos - 1))
		as_Ext = Right(ls_File, (Len(ls_File) - li_Pos))
	Else
		as_FileName = ls_File
		as_Ext = ""
	End if
End If

// Everything left is the directory path
as_DirPath = as_Path

Return 1
end function

public function integer of_parsepath (string as_path, ref string as_drive, ref string as_dirpath, ref string as_filename);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  		of_ParsePath
//	Arguments:		as_Path			The path to disassemble.
//						as_Drive			The disk drive from the path, passed by reference.
//						as_DirPath		The directory path, passed by reference.
//						as_FileName		The name of the file, passed by reference.
//	Returns:			Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//	Description:	Parse a fully-qualified directory path into its component parts.
//						This function overrides the real of_ParsePath to allow the file
//						extension to be optional.
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
string	ls_Ext

SetNull (ls_Ext)

Return of_ParsePath(as_Path, as_Drive, as_DirPath, as_FileName, ls_Ext)
end function

public function integer of_sortdirlist (ref n_cst_dirattrib anv_dirlist[], integer ai_sorttype, boolean ab_ascending);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  		of_SortDirList
//	Arguments:		anv_DirList[]	The output structure from the of_DirList function.
//						ai_SortType		Sort by:  1 - File Name, 2 - File Ext.,
//											3 - File Last Write Date/Time, 
//											4 - File Size.
//						ab_Ascending	True - sort ascending,
//											False - sort in descending order.
//	Returns:			Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//	Description:	Sort the directory list from the of_DirList function.  
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0   Initial version
//						5.0.03	Changed code to use datastore to perform sorting of directory array.
//						6.0.01	Add destroy of datastore
//						7.0		Change datatypes from int to long
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
integer				li_rc
long					ll_rowcount, ll_Limit, ll_Cnt, ll_Pos
string				ls_sort, ls_ascending, ls_sortfilename
n_cst_dirattrib	lnv_DirEntry, lnv_empty[]
n_ds					lds_files

// check arguments.
If IsNull(ai_sorttype) or IsNull(ab_ascending) Then Return -1

lds_files = Create n_ds
lds_files.DataObject = "d_dirattrib"
li_rc = lds_files.of_setbase(true)
if li_rc < 0 then 
	destroy lds_files	
	return -1
End if

// load datastore
ll_limit = upperbound(anv_dirlist)
for ll_cnt = 1 to ll_limit
	lnv_direntry = anv_dirlist[ll_cnt]
	If anv_DirList[ll_Cnt].ib_Subdirectory Then
		ls_sortfilename = Mid(lnv_direntry.is_FileName, 2, (Len(lnv_direntry.is_FileName) - 2))
		of_DirAttribToDS(lds_files, lnv_direntry, ls_sortfilename, 0)
	ElseIf anv_DirList[ll_Cnt].ib_Drive Then
		ls_sortfilename = Mid(lnv_direntry.is_FileName, 3, 1)
		of_DirAttribToDS(lds_files, lnv_direntry, ls_sortfilename, 100)
	Else
		ls_sortfilename = lnv_direntry.is_FileName
		of_DirAttribToDS(lds_files, lnv_direntry, ls_sortfilename, 1)
	End If
Next	

// sort datastores
if ab_ascending then
	ls_ascending = "A"
else
	ls_ascending = "D"
end if

// filegroup makes subdirectories appear before files and files before drives
Choose Case ai_SortType
	Case 1	//  Sort by file name
		ls_sort = "filegroup A, sortfilename " + ls_ascending
		lds_files.SetSort(ls_sort)
		lds_files.Sort()
	Case 2	// Sort by file extension
		ls_sort = "filegroup A, extension " + ls_ascending
		lds_files.SetSort(ls_sort)
		lds_files.Sort()
	Case 3	// Sort by last write date.
		ls_sort = "filegroup A, lastwritedate " + ls_ascending + ", lastwritetime " + ls_ascending
		lds_files.SetSort(ls_sort)
		lds_files.Sort()
	Case 4	// Sort by size
		ls_sort = "filegroup A, filesize " + ls_ascending
		lds_files.SetSort(ls_sort)
		lds_files.Sort()
End Choose
	
// unload datastores
anv_dirlist = lnv_empty

ll_pos = 1
ll_rowcount = lds_files.rowcount()
for ll_cnt = 1 to ll_rowcount
	of_dstodirattrib (lds_files, lnv_direntry, ll_cnt)
	anv_dirlist[ll_pos] = lnv_direntry 
	ll_pos ++
next

destroy lds_files	

Return 1
end function

public function integer of_sortdirlist (ref n_cst_dirattrib anv_dirlist[], integer ai_sorttype);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  		of_SortDirList
//	Arguments:		anv_DirList[]	The output structure from the of_DirList function.
//						ai_SortType		Sort by:  1 - File Name, 2 - File Ext.,
//											3 - File Last Write Date/Time, 
//											4 - File Size.
//	Returns:			Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//	Description:	Sort the directory list from the of_DirList function. 
//						This function overrides the real of_SortDirList to allow the last parameter
//						to be optional.
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
Return of_SortDirList(anv_DirList, ai_SortType, True)
end function

public function integer of_getvolumes (ref string as_volumes[]);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

protected function integer of_dirattribtods (ref n_ds ads_source, n_cst_dirattrib anv_entry, string as_sortfilename, integer ai_filegroup);//////////////////////////////////////////////////////////////////////////////
//	Protected Function:  of_DirAttribToDS
//	Arguments:		ads_source	
//						anv_entry
//						as_sortfilename
//						ai_filegroup
//	Returns:			Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//	Description:	
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
long	ll_row, ll_pos
string	ls_ext, ls_name
n_cst_conversion	lnv_conv

if (not isvalid(ads_source)) or isnull(ads_source) or &
	(not isvalid(anv_entry)) or isnull(anv_entry)  then
	return -1
end if

if isnull(as_sortfilename) or isnull(ai_filegroup) then
	return -1
end if

ll_Pos = Pos(as_sortfilename, ".")
If ll_Pos = 0 Or as_sortfilename = ".." Then
	ls_Name = as_sortfilename
	ls_Ext = ""
Else
	ls_Name = Left(as_sortfilename, (ll_Pos - 1))
	ls_Ext = Right(as_sortfilename, (Len(as_sortfilename) - ll_Pos))
End If

ll_row = ads_source.insertrow(0)
if ll_row < 0 then return -1

ads_source.object.filename[ll_row] = anv_entry.is_filename
ads_source.object.lastwritedate[ll_row] = anv_entry.id_lastwritedate
ads_source.object.lastwritetime[ll_row] = anv_entry.it_lastwritetime
ads_source.object.filesize[ll_row] = anv_entry.idb_filesize
ads_source.object.readonly[ll_row] = Integer(lnv_conv.of_string(anv_entry.ib_readonly, "ZEROONE"))
ads_source.object.system[ll_row] = Integer(lnv_conv.of_string(anv_entry.ib_system, "ZEROONE"))
ads_source.object.hidden[ll_row] = Integer(lnv_conv.of_string(anv_entry.ib_hidden, "ZEROONE"))
ads_source.object.subdirectory[ll_row] = Integer(lnv_conv.of_string(anv_entry.ib_subdirectory, "ZEROONE"))
ads_source.object.archive[ll_row] = Integer(lnv_conv.of_string(anv_entry.ib_archive, "ZEROONE"))
ads_source.object.drive[ll_row] = Integer(lnv_conv.of_string(anv_entry.ib_drive, "ZEROONE"))
ads_source.object.altfilename[ll_row] = anv_entry.is_altfilename
ads_source.object.creationdate[ll_row] = anv_entry.id_creationdate
ads_source.object.creationtime[ll_row] = anv_entry.it_creationtime
ads_source.object.lastaccessdate[ll_row] = anv_entry.id_lastaccessdate
ads_source.object.extension[ll_row] = ls_ext
ads_source.object.sortfilename[ll_row] = ls_name
ads_source.object.filegroup[ll_row] = ai_filegroup

return 1
end function

protected function integer of_dstodirattrib (ref n_ds ads_source, ref n_cst_dirattrib anv_entry, long al_row);//////////////////////////////////////////////////////////////////////////////
//	Protected Function:  of_DSToDirAttrib
//	Arguments:		ads_source	
//						anv_entry
//						al_row
//	Returns:			Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//	Description:	
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
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
string	ls_readonly, ls_hidden, ls_subdir, ls_archive, ls_drive, ls_system
string	ls_lastwritedate, ls_lastwritetime, ls_filesize
string	ls_creationdate, ls_creationtime, ls_lastaccessdate
string	ls_filename, ls_altfilename
n_cst_conversion	lnv_conv

if (not isvalid(ads_source)) or isnull(ads_source) or &
	(not isvalid(anv_entry)) or isnull(anv_entry)  then
	return -1
end if

if isnull(al_row) or (al_row < 1) then
	return -1
end if

if not isvalid(ads_source.inv_base) then return -1

ls_readonly = ads_source.inv_base.of_getitem(al_row, "readonly")
ls_system = ads_source.inv_base.of_getitem(al_row, "system")
ls_hidden = ads_source.inv_base.of_getitem(al_row, "hidden")
ls_subdir = ads_source.inv_base.of_getitem(al_row, "subdirectory")
ls_archive = ads_source.inv_base.of_getitem(al_row, "archive")
ls_drive = ads_source.inv_base.of_getitem(al_row, "drive")
ls_lastwritedate = ads_source.inv_base.of_getitem(al_row, "lastwritedate")
ls_lastwritetime = ads_source.inv_base.of_getitem(al_row, "lastwritetime")
ls_filesize = ads_source.inv_base.of_getitem(al_row, "filesize")
ls_creationdate = ads_source.inv_base.of_getitem(al_row, "creationdate")
ls_creationtime = ads_source.inv_base.of_getitem(al_row, "creationtime")
ls_lastaccessdate = ads_source.inv_base.of_getitem(al_row, "lastaccessdate")
ls_filename = ads_source.inv_base.of_getitem(al_row, "filename")
ls_altfilename = ads_source.inv_base.of_getitem(al_row, "altfilename")

anv_entry.is_filename = ls_filename
anv_entry.id_lastwritedate = date(ls_lastwritedate)
anv_entry.it_lastwritetime = time(ls_lastwritetime)
anv_entry.idb_filesize = double(ls_filesize)
anv_entry.ib_readonly = lnv_conv.of_boolean(ls_readonly)
anv_entry.ib_system = lnv_conv.of_boolean(ls_system) 
anv_entry.ib_hidden = lnv_conv.of_boolean(ls_hidden)
anv_entry.ib_subdirectory = lnv_conv.of_boolean(ls_subdir)
anv_entry.ib_archive = lnv_conv.of_boolean(ls_archive)
anv_entry.ib_drive = lnv_conv.of_boolean(ls_drive)
anv_entry.is_altfilename = ls_altfilename
anv_entry.id_creationdate = date(ls_creationdate)
anv_entry.it_creationtime = time(ls_creationtime)
anv_entry.id_lastaccessdate = date(ls_lastaccessdate)

return 1
end function

public function integer of_getdrivetype (string as_drive);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

public function integer of_getdiskspace (string as_drive, ref long al_totalspace, ref long al_freespace);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

public function string of_getallfilesspecifier ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:  of_GetAllFilesSpecifier
//	Arguments:		None
//	Returns:			String - The all files string value.
//	Description:	Returns the value of the protected instance Allfiles
//						which specifies the string value needed to retrieve
//						all the files in the current operating system for a directory.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
Return is_AllFiles
end function

public function integer of_getdiskspaceex (string as_drive, ref decimal adec_totalspace, ref decimal adec_freespace);//////////////////////////////////////////////////////////////////////////////
//	Function not found in descendant
//////////////////////////////////////////////////////////////////////////////
Return -1
end function

public function integer of_createdirectorytree (string as_directorytree, boolean ab_restorecurrentdirectory);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_CreateDirectoryTree
//	Arguments:		as_directoryTree					The directory tree to be created.
//						ab_restoreCurrentDirectory		Restore or not the current directory at the end.
//
//	Returns:			Integer - 1, ok or -1 when an error occurs.
//								  
//	Description:		Create all directories specified in the passed directory tree.
//						Restore intial directory afterward, if requested.
//
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						12.5	Initial version
//						12.5	CJH	2015-11-30	Issue 12295
//						12.5	CJH	2016-01-05	Issue 12320
//////////////////////////////////////////////////////////////////////////////
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
 * Libraries see http://pfc.codeplex.com/
*/
//////////////////////////////////////////////////////////////////////////////

long		ll_pos
string		ls_tmp
string		ls_initialdir

// Check parameters
// If directory tree to create is missing, return error
if isnull( as_directorytree ) or as_directorytree = "" then return -1

// Store current directory if requested to restore it at the end
if ab_restorecurrentdirectory = true then
	ls_initialdir = GetCurrentDirectory()
end if

// Change drive, if specified	
ll_pos = pos( as_directorytree, "\")
if ll_pos = 3 then
	if changedirectory( left( as_directorytree, 3 ) ) = -1 then return -1
	as_directorytree = mid( as_directorytree, 4)
ELSE
	//	Check if call specifies a basic UNC Path that at least contains a serverName and a shareName
	IF Left(as_directoryTree, 2) = "\\" THEN
		
		String				ls_serverName,	ls_shareName
		
		//	Locate end of serverName, by finding the beginning of the shareName
		ll_pos				= Pos(as_directoryTree, "\", 3)
		
		IF ll_pos = 0 THEN Return(FAILURE)							//	No shareName included
		
		ls_serverName		= Left(as_directoryTree, ll_pos - 1)

		//	Locate end of shareName
		ll_pos				= Pos(as_directoryTree, "\", ll_pos + 1)
		
		IF ll_pos = 0 THEN
			ll_pos			= Len(as_directoryTree) + 1
		END IF

		//	Parse out the shareName
		ls_shareName		= Mid(as_directoryTree, Len(ls_serverName) + 1, ll_pos - Len(ls_serverName) - 1)
		
		//	Set current directory to be the shareName
		IF changeDirectory(ls_serverName + ls_shareName) = FAILURE THEN Return(FAILURE)
		
		as_directoryTree	= Mid(as_directoryTree, ll_pos + 1)
		
	END IF
end if

// Parse subsequent directory and create non existing one
// Return error if directory creation failed
ll_pos = pos( as_directorytree, "\")
do while ll_pos > 0
	ls_tmp = trim(left( as_directorytree, ll_pos - 1))
	if len(ls_tmp) = 0 then return -1
	
	if directoryexists( ls_tmp ) = false then
		if createdirectory( ls_tmp ) = -1 then return -1
	end if
	if changedirectory( ls_tmp ) = -1 then return -1
	
	as_directorytree = mid( as_directorytree, ll_pos + 1)
	ll_pos = pos( as_directorytree, "\")
loop

// Handle last directory specified without ending separator
// Return error if directory creation failed
if len( as_directorytree ) > 0 then
	if directoryexists( as_directorytree  ) = false then
		if createdirectory( as_directorytree  ) = -1 then return -1
	end if
	if changedirectory( as_directorytree ) = -1 then return -1
end if

// Restore initial directory if requested
if ab_restorecurrentdirectory = true then
	if changedirectory( ls_initialdir ) = -1 then return -1
end if

return 1
end function

public function integer of_createdirectorytree (string as_directorytree);//////////////////////////////////////////////////////////////////////////////
//	Public Function: of_CreateDirectoryTree
//	Arguments:		as_directoryTree					The directory tree to be created.
//
//	Returns:			Integer - 1, ok or -1 when an error occurs.
//								  
//	Description:		Create all directories specified in the passed directory tree.
//
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						12.5   Initial version
//////////////////////////////////////////////////////////////////////////////
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
 * Libraries see http://pfc.codeplex.com/
*/
//////////////////////////////////////////////////////////////////////////////

return this.of_createdirectorytree( as_directorytree , FALSE )
end function

public function string of_getsystemdirectory ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_getSystemDirectory
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		String			Path to the system directory
//
//	Description: 	Gets the system directory
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
// 
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

String					ls_systemDirectory
ls_systemDirectory	= Space(of_maxPath())

IF GetSystemDirectory(ls_systemDirectory, of_maxPath()) > 0 THEN
	Return(ls_systemDirectory)
END IF

Return('')
end function

public function string of_getshortpathname (string as_longpathname);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_getShortPathName
//
//	Access:  		public
//
//	Arguments:		as_longPathName
//						Path or file to be converted to its short form
//
//	Returns:  		String			Path or file in its short form
//
//	Description: 	Converts the specified path or file to its short form
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
// 
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

String					ls_shortPathName
ls_shortPathName		= Space(of_maxPath())

IF GetShortPathName(as_longPathName, ls_shortPathName, of_maxPath()) > 0 THEN
	Return(ls_shortPathname)
END IF

Return('')
end function

protected function long of_maxpath ();Return(260)
end function

public function string of_getwindowsdirectory ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_getWindowsDirectory
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		String			Path to the windows directory
//
//	Description: 	Gets the windows directory
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
// 
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

String					ls_windowsDirectory
ls_windowsDirectory	= Space(of_maxPath())

IF GetWindowsDirectory(ls_windowsDirectory, of_maxPath()) > 0 THEN
	Return(ls_windowsDirectory)
END IF

Return('')
end function

public function string of_getlongpathname (string as_shortpathname);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_getLongPathName
//
//	Access:  		public
//
//	Arguments:		as_shortPathName
//						Path or file to be converted to its long form
//
//	Returns:  		String			Path or file in its long form
//
//	Description: 	Converts the specified path or file to its long form
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
// 
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

String					ls_longPathName
ls_longPathName		= Space(of_maxPath())

IF GetLongPathName(as_shortPathName, ls_longPathName, of_maxPath()) > 0 THEN
	Return(ls_longPathName)
END IF

Return('')
end function

public function boolean of_movefile (string as_existingfilename, string as_newfilename);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_moveFile
//
//	Access:  		public
//
//	Arguments:		as_ExistingFileName
//						The current name of the file or directory on the local
//						computer.
//
//						as_NewFileName	
//						The new name for the file or directory. The new name
//						must not already exist.  A new file may be on a different
//						file system or drive.  A new directory must be on the
//						same drive.
//
//	Returns:  		Boolean			TRUE if successful
//
//	Description: 	Renames a file or directory
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
// 
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Return(MoveFile(as_existingFileName, as_newFileName))
end function

public function string of_gettemppath ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_getTempPath
//
//	Access:  		public
//
//	Arguments:		None
//
//	Returns:  		String			Path to the file system temporary storage
//											directory
//
//	Description: 	Returns a string specifying the temporary file path. The
//						returned string ends with a backslash.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
// 
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

String					ls_tempPath
ls_tempPath				= Space(of_maxPath())

IF GetTempPath(of_maxPath(), ls_tempPath) > 0 THEN
	Return(ls_tempPath)
END IF

Return('')
end function

public function string of_gettempfilename (string vs_directory, string vs_prefix, unsignedinteger vui_unique);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_getTempFileName
//
//	Access:  		public
//
//	Arguments:		String			The directory path for the file name.
//											Applications typically specify a period(.)
//											for the current directory or the result
//											of the GetTempPath function.  The string
//											cannot be longer than MAX_PATH-14
//											characters or GetTempFileName will fail.
//											If this parameter is NULL, the function
//											fails.
//						String			The null-terminated prefix string.  The
//											function uses up to the first three
//											characters of this string as the prefix of
//											the file name.  This string must consist of
//											characters in the OEM-defined character set.
//						UnsignedInt		An unsigned integer to be used in creating
//											the temporary file name.  If this is zero,
//											the function attempts to form a unique file
//											name using the current system time.  If the
//											file already exists, the number is
//											increased by one and the functions tests
//											if this file already exists. This
//											continues until a unique filename is
//											found; the function creates a file by
//											that name and closes it.  Note that the
//											function does not attempt to verify the
//											uniqueness of the file name when this
//											argument is nonzero.
//
//	Returns:  		String			A unique file name
//
//	Description: 	Returns a name for a temporary file.  If a unique file
//						name is generated, an empty file is created and the
//						handle to it is released; otherwise, only a file name
//						is generated.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
// 
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

String					ls_tempFileName
ls_tempFileName		= Space(of_maxPath())

IF GetTempFileName(vs_directory, vs_prefix, vui_unique, ls_tempFileName) > 0 THEN
	Return(ls_tempFileName)
END IF

Return('')
end function

public function string of_gettempfilename (string vs_prefix);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_getTempFileName
//
//	Access:  		public
//
//	Arguments:		String			The null-terminated prefix string.  The
//											function uses up to the first three
//											characters of this string as the prefix of
//											the file name.  This string must consist of
//											characters in the OEM-defined character set.
//
//	Returns:  		String			A unique file name
//
//	Description: 	Returns a name for a temporary file.  If a unique file
//						name is generated, an empty file is created and the
//						handle to it is released; otherwise, only a file name
//						is generated.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
// 
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

Return(of_GetTempFileName(of_getTempPath(), vs_prefix, 0))
end function

public function integer of_setfiletype (string as_filetype);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_setfiletype
//
// Access:			Public
//
// Arguments:
// as_filetype:		The file type to set.
//
// Returns:			integer
//						 1, OK
//						-1, An error occurs.
//
// Description:	Set current File Type value.
//
// Usage:			Call this method in order to se a file type toe be used.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial Version
//////////////////////////////////////////////////////////////////////////////
//
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
//
//////////////////////////////////////////////////////////////////////////////

if isnull( as_filetype ) or len(trim(as_filetype)) = 0 then return -1

is_filetype = as_filetype

return 1
end function

public function string of_getfiletype ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_getfiletype
//
// Access:			Public
//
// Returns:			string
//						 the actual  value of the file type used.
//
// Description:	returns the actual file type used
//
// Usage:			CAll this method to know what file type is acutally used.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial Version
//
//////////////////////////////////////////////////////////////////////////////
//
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
//
//////////////////////////////////////////////////////////////////////////////

return is_filetype
end function

on pfc_n_cst_filesrv.create
call super::create
end on

on pfc_n_cst_filesrv.destroy
call super::destroy
end on

