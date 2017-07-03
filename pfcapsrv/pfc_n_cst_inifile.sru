HA$PBExportHeader$pfc_n_cst_inifile.sru
$PBExportComments$PFC INIFile service
forward
global type pfc_n_cst_inifile from n_base
end type
end forward

global type pfc_n_cst_inifile from n_base autoinstantiate
end type

type variables
Protected:
string	is_lineend
end variables

forward prototypes
public function integer of_getsections (string as_file, ref string as_sections[])
public function integer of_getkeys (string as_file, string as_section, ref string as_keys[])
public function integer of_delete (string as_file, string as_section)
public function integer of_delete (string as_file, string as_section, string as_key)
public function integer of_setlineending (string as_lineending)
public function string of_getlineending ()
public function integer of_create (string as_file, string as_section)
end prototypes

public function integer of_getsections (string as_file, ref string as_sections[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetSections
//
//	Access:  		public
//
//	Arguments:	
// as_file			The .ini file.
//	as_sections[]	An array of strings passed by reference.  This will store
//						the section names retrieved from the .INI file
//
//	Returns:			Integer
//						 #	the number of sections retrieved
//						-1	error
//						-2 if .INI file does not exist or has not been specified.
//
//	Description:  	Retrieves all sections from an .INI file
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Initialize sections array to blanks at start of function
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

long			ll_length
integer		li_file
integer		li_rc
long			ll_pos
long			ll_first
long			ll_last
integer		li_section
string		ls_line
string		ls_section
string		ls_sections[]
n_cst_string lnv_string

SetPointer (Hourglass!)

// Determine if file exists
if not FileExists (as_file) then
	return -2
end if

// Open file
ll_length = FileLength (as_file)
li_file = FileOpen (as_file, LineMode!)
if li_file = -1 then	return -1

// reset the array coming in
as_sections = ls_sections
//////////////////////////////////////////////////////////////////////////////
// Retrieve all section names in the file
//////////////////////////////////////////////////////////////////////////////
do while li_rc >= 0
	li_rc = FileRead (li_file, ls_line)
	if li_rc = -1 then
		return li_rc
	elseif li_rc > 0 then
		ll_first = Pos (ls_line, "[")
		ll_last = Pos (ls_line, "]")
		if ll_first > 0 and ll_last > 0 then
			ls_line = lnv_string.of_LeftTrim (ls_line, true, true)
			if Left (ls_line, 1) = "[" then
				ll_pos = Pos (ls_line, "]")
				ls_section = Mid (ls_line, 2, ll_pos - 2)
				li_section++
				as_sections[li_section] = ls_section
			end if
		end if
	end if
loop 

// Close file and return
FileClose (li_file)
return li_section
end function

public function integer of_getkeys (string as_file, string as_section, ref string as_keys[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetKeys
//
//	Access:  		public
//
//	Arguments:	
//	as_ini			The .ini file.
//	as_section		The section name to retrieve keys from
//	as_keys[]		An array of strings passed by reference.  This will store the 
//							key names retrieved from the .INI file
//
//	Returns:			Integer
//						The number of keys retrieved
//						 0	if there are no keys that exist for section, or section does not exist
//						-1	file error
//						-2	if .INI file has not been specified or does not exist.  
//
//	Description:  	Retrieves all keys from a specified section.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Initialize keys array to blanks at start of function
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

boolean	lb_sectionfound
integer	li_file
integer	li_rc
integer	li_keys
long		ll_pos
long		ll_first
long		ll_last
long		ll_equal
long		ll_length
string	ls_line
string	ls_key
string	ls_section
string	ls_comment
string	ls_keys[]
n_cst_string lnv_string

SetPointer (Hourglass!)

// Verify that .INI file name has been specified.
if not FileExists (as_file) then
	return -2
end if

// Open file (check rc).
ll_length = FileLength (as_file)
li_file = FileOpen (as_file, LineMode!)
if li_file = -1 then return -1

// reset the array coming in
as_keys = ls_keys
//////////////////////////////////////////////////////////////////////////////
// Find the correct section name
//////////////////////////////////////////////////////////////////////////////
do while li_rc >= 0 and not lb_sectionfound
	
	// Read one line from the inifile (check rc).
	li_rc = FileRead (li_file, ls_line)
	if li_rc = -1 then
		return -1
	end if
	
	// Check if any characters were read.
	if li_rc > 0 then
		
		// Look for a section header components (the OpenBracket and CloseBracket (if any)).
		ll_first = Pos (ls_line, "[")
		ll_last = Pos (ls_line, "]")
		
		// Was section header found?		
		if ll_first > 0 and ll_last > 0 then
			// Yes, a section header has been found.
			// Get the name of the section.
			ls_line = lnv_string.of_LeftTrim (ls_line, true, true)
			if Left (ls_line, 1) = "[" then
				ll_pos = Pos (ls_line, "]")
				ls_section = Mid (ls_line, 2, ll_pos - 2)
				// Determine if this is the section being searched for.								
				if Lower(ls_section) = Lower(as_section) then
					// The search for section has been found.
					lb_sectionfound = true
				end if
			end if
		end if
	end if
loop 


//////////////////////////////////////////////////////////////////////////////
// Retrieve all keys for section
//////////////////////////////////////////////////////////////////////////////
if lb_sectionfound then
	lb_sectionfound = false
	do while li_rc >= 0 and not lb_sectionfound
		
		// Read one line from the file (validate the rc).
		li_rc = FileRead (li_file, ls_line)
		if li_rc = -1 then
			return -1
		end if
		
		// Check if any characters were read.		
		if li_rc > 0 then
			// Check for a "commented" line (skip if found).
			ls_comment = lnv_string.of_LeftTrim (ls_line, true, true)
			if Char (ls_comment) = ";" then Continue
			
			ll_equal = Pos (ls_line, "=")
			if ll_equal > 0 then
				ls_key = lnv_string.of_Trim (Left (ls_line, ll_equal - 1), true, true)
				if Len (ls_key) > 0 then
					li_keys++
					as_keys[li_keys] = ls_key
				end if
			else
				ll_first = Pos (ls_line, "[")
				ll_last = Pos (ls_line, "]")
				if ll_first > 0 and ll_last > 0 then
					ls_line = lnv_string.of_LeftTrim (ls_line, true, true)
					if Left (ls_line, 1) = "[" then
						lb_sectionfound = true
					end if
				end if
			end if
		end if
	loop 
end if


//////////////////////////////////////////////////////////////////////////////
// Close file and return
//////////////////////////////////////////////////////////////////////////////
FileClose (li_file)
return li_keys
end function

public function integer of_delete (string as_file, string as_section);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Delete
//
//	Access:  		public
//
//	Arguments:		
//	as_file			The .ini file.
//	as_section		The section name to remove from the INI file.
//						(Do not include the brackets with this argument.)
//
//	Returns:  		Integer
//						 1	success
//						 0	section does not exist in the INI file.
//						-1	error
//						-2 if .INI file does not exist or has not been specified.
//
//	Description:  	Removes the specified section and all entries for 
//						that section from the INI file.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.03	Function is now case-insensitive
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

blob			lblb_newfile
boolean		lb_skipline
boolean		lb_sectionfound
integer		li_file
integer		li_rc = 1
integer		li_filewriterc
long			ll_length
long			ll_first
long			ll_last
long			ll_pos
string		ls_line
string		ls_section
string		ls_temp
n_cst_string 	lnv_string
n_cst_filesrv 	lnv_filesrv

SetPointer (Hourglass!)

// Determine if file exists.
if not FileExists (as_file) then
	return -2
end if

// Open file for reading (check rc).
ll_length = FileLength (as_file)
li_file = FileOpen (as_file)
if li_file = -1 then	return li_file

//////////////////////////////////////////////////////////////////////////////
// Read the file and locate the desired section that should be removed.
//////////////////////////////////////////////////////////////////////////////
do while li_rc >= 0
	
	// Read one line from the file (validate the rc).
	li_rc = FileRead (li_file, ls_line)
	if li_rc = -1 then
		return -1
	end if

	// Check that at least one character was read.
	if li_rc >= 1 then
		// Look for a section header components (the OpenBracket and CloseBracket (if any)).
		ll_first = Pos (ls_line, "[")
		ll_last = Pos (ls_line, "]")
		
		// Was section header found?
		if ll_first >0 and ll_last >0 then
			// Yes, a section has been found.
			// Get the name of the section.
			ls_temp = lnv_string.of_LeftTrim (ls_line, true, true)
			if Left (ls_temp, 1) = "[" then
				ll_pos = Pos (ls_temp, "]")
				ls_section = Mid (ls_temp, 2, ll_pos - 2)
				// Determine if this is the section being searched for.				
				if Lower (ls_section) = Lower (as_section) then
					// The search for section has been found.
					lb_sectionfound = true
					// Skip ALL lines until a new section is found.
					lb_skipline = true
				else
					// Do not skip this section or just simply Stop skipping.
					lb_skipline = false
				end if
			end if
		end if
	end if

	// Add the carriage control.
	ls_line = ls_line + of_GetLineEnding()

	// Create the output file by including all lines not
	// marked to be skipped.
	if li_rc >= 0 and not lb_skipline then
		lblb_newfile = lblb_newfile + Blob (ls_line)
	end if
loop 

// Close the input file
FileClose (li_file)

//If the section was not found, return
if not lb_sectionfound then
	return 0
end if

//Replace the file with the section removed.
li_rc = f_SetFilesrv(lnv_filesrv, True)
If li_rc <> 1 Then Return -1
li_filewriterc = lnv_filesrv.of_FileWrite (as_file, lblb_newfile, False)
li_rc = f_SetFilesrv(lnv_filesrv, False)

return li_filewriterc

end function

public function integer of_delete (string as_file, string as_section, string as_key);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Delete
//
//	Access:  		public
//
//	Arguments:		
//	as_file			The .ini file.
//	as_section		The section name that the entry to be deleted is in.
//							(Do not include the brackets with this argument.)
//	as_key			The key name of the entry that should be deleted from
//							the specified section.
//							(Key name is the name to the left of the "=" sign).
//
//	Returns:			Integer
//						 1	success
//						 0	section does not exist, or key name does not exist
//							within specified section.
//						-1	file error
//						-2 if .INI file does not exist or has not been specified.
//
//	Description:  	Removes the specified entry from the specified section 
//						in the INI file.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.03	Function is now case-insensitive
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

blob			lblb_newfile
boolean		lb_skipline
boolean		lb_sectionfound
boolean		lb_entryremoved
integer		li_file
integer		li_rc = 1
integer		li_filewriterc
integer		li_keylength
long			ll_length
long			ll_first
long			ll_last
long			ll_pos
string		ls_line
string		ls_section
string		ls_temp
n_cst_string  lnv_string
n_cst_filesrv lnv_filesrv

SetPointer (Hourglass!)

// Determine if file exists
if not FileExists (as_file) then
	return -2
end if

// Open file for reading
ll_length = FileLength (as_file)
li_file = FileOpen (as_file)
if li_file = -1 then	return li_file

//////////////////////////////////////////////////////////////////////////////
// Read the file and locate the desired entry that should be removed.
//////////////////////////////////////////////////////////////////////////////
li_keylength = Len (as_key)
do while li_rc >= 0
	
	// Read one line from the input file (check the rc).
	li_rc = FileRead (li_file, ls_line)
	if li_rc = -1 then
		return -1
	end if
	
	if not lb_entryremoved then
		if li_rc > 0 then

			// Look for a section header components (the OpenBracket and CloseBracket (if any)).
			ll_first = Pos (ls_line, "[")
			ll_last = Pos (ls_line, "]")
			
			// Was section header found?
			if ll_first > 0 and ll_last > 0 then
				// Yes, a section header has been found.
				// Get the name of the section.				
				ls_temp = lnv_string.of_LeftTrim (ls_line, true, true)
				if Left (ls_temp, 1) = "[" then
					ll_pos = Pos (ls_temp, "]")
					ls_section = Mid (ls_temp, 2, ll_pos - 2)
					// Determine if this is the section being searched for.							
					if Lower (ls_section) = Lower (as_section) then
						// The section being searched for has been found.
						lb_sectionfound = true
					else
						// This is not the section being searched for.
						lb_sectionfound = false
					end if
				end if
			else
				// Is current line part of the section being searched?
				if lb_sectionfound then
					// Yes, Locate the key within the section.
					ls_temp = lnv_string.of_LeftTrim (ls_line, true, true)
					// Determine if this is the key being searched for.							
					if Lower (Left (ls_temp, li_keylength)) = Lower (as_key) then
						// Yes, the key has been found.						
						ls_temp = lnv_string.of_LeftTrim (Mid (ls_temp, li_keylength + 1), true, true)
						if Char (ls_temp) = "=" then
							// Start skipping.
							lb_skipline = true
							// The desired entry will be removed.
							lb_entryremoved = true
						end if
					end if
				end if
			end if
		end if
	else
		// Stop skipping lines.
		lb_skipline = false
	end if

	// Add the carriage control.
	ls_line = ls_line + of_GetLineEnding()

	// Create the output file by including all lines not
	// marked to be skipped.
	if li_rc >= 0 and not lb_skipline then
		lblb_newfile = lblb_newfile + Blob (ls_line)
	end if
loop 

// Close the input file.
FileClose (li_file)

// If the section or key were not found, return.
if (not lb_sectionfound) or (not lb_entryremoved) then
	return 0
end if

//Replace the file with the entry removed.
li_rc = f_SetFilesrv(lnv_filesrv, True)
If li_rc <> 1 Then Return -1
li_filewriterc = lnv_filesrv.of_FileWrite (as_file, lblb_newfile, False)
li_rc = f_SetFilesrv(lnv_filesrv, False)

return li_filewriterc

end function

public function integer of_setlineending (string as_lineending);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetLineEnding
//
//	Access:  public
//
//	Arguments:
//	as_lineending   Line ending characters to use when writing to file
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets the line ending characters that will be used when writing to INI file.
//	This depends on the platform currently being used.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0.02   Initial version
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

is_lineend = as_lineending
return 1
end function

public function string of_getlineending ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetLineEnding
//
//	Access:  public
//
//	Arguments:  none
//
//	Returns:  string   Line ending characters being used to write to INI file
//
//	Description:
//	Gets the line ending characters that will be used when writing to INI file.
//	This depends on the platform currently being used.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0.02   Initial version
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

return is_lineend
end function

public function integer of_create (string as_file, string as_section);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Create
//
//	Access:  		public
//
//	Arguments:		
//	as_file			The .ini file.
//	as_section		The initial section name to be adde in the INI file.
//						(Do not include the brackets with this argument.)
//
//	Returns:  		Integer
//						 1	success
//						-1	error
//
//	Description:  	Create the specified INI file and add the initial section specified
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	12.5   Initial version
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

integer li_rc
integer li_file

if isnull( as_file ) or len(trim(as_file)) = 0 then return failure
if isnull( as_section ) or len(trim(as_section)) = 0 then return failure

li_file = fileopen( as_file, linemode!, write! )
li_rc = filewrite( li_file, "["+as_section+"]")
li_rc = fileclose( li_file )

return li_rc 
end function

on pfc_n_cst_inifile.create
call super::create
end on

on pfc_n_cst_inifile.destroy
call super::destroy
end on

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  constructor
//
//	Description:
//	Determine line ending characters to use based on current platform
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0.02   Initial version
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

environment	lenv_obj

GetEnvironment (lenv_obj)

if IsValid (lenv_obj) then
	choose case lenv_obj.ostype
		// Unix
		case aix!, osf1!, hpux!, aix!
			of_SetLineEnding ("~n")
		
		// Mac
		case macintosh!
			of_SetLineEnding ("~r")

		// Windows
		case else
			of_SetLineEnding ("~r~n")
	end choose
else
	of_SetLineEnding ("~r~n")
end if
end event

