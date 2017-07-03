HA$PBExportHeader$pfcscanner_n_cst_filesrv.sru
$PBExportComments$PFC File handler service
forward
global type pfcscanner_n_cst_filesrv from nonvisualobject
end type
end forward

global type pfcscanner_n_cst_filesrv from nonvisualobject
end type
global pfcscanner_n_cst_filesrv pfcscanner_n_cst_filesrv

type variables
string	is_Separator
string	is_AllFiles
string is_FileType
end variables

forward prototypes
public function string of_assemblepath (string as_drive, string as_dirpath, string as_filename, string as_ext)
public function string of_AssemblePath (string as_Drive, string as_DirPath, string as_FileName)
public function integer of_parsepath (string as_path, ref string as_drive, ref string as_dirpath, ref string as_filename, ref string as_ext)
public function integer of_parsepath (string as_path, ref string as_drive, ref string as_dirpath, ref string as_filename)
end prototypes

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
 *
 * http://www.gnu.org/copyleft/lesser.html
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
 *
 * http://www.gnu.org/copyleft/lesser.html
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
 *
 * http://www.gnu.org/copyleft/lesser.html
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
pfcscanner_n_cst_string 	lnv_string

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
 *
 * http://www.gnu.org/copyleft/lesser.html
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

on pfcscanner_n_cst_filesrv.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfcscanner_n_cst_filesrv.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

