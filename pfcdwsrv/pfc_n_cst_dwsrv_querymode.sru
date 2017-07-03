HA$PBExportHeader$pfc_n_cst_dwsrv_querymode.sru
$PBExportComments$PFC DataWindow QueryMode service
forward
global type pfc_n_cst_dwsrv_querymode from n_cst_dwsrv
end type
end forward

global type pfc_n_cst_dwsrv_querymode from n_cst_dwsrv
event type integer pfc_values ( )
event type integer pfc_operators ( )
end type
global pfc_n_cst_dwsrv_querymode pfc_n_cst_dwsrv_querymode

type variables
Protected:
boolean	ib_resetcriteria = true
boolean	ib_retrieveondisabled = true
string	is_querycolumns[]
//	7.0   Instance variable datatype changed from os_querymodeinfo to n_cst_dwsrv_querymodeattrib type
//	7.0   Instance variable name changed from istr_querymodeinfo to inv_querymodeinfo
n_cst_dwsrv_querymodeattrib 	inv_querymodeinfo []

// 7.0	This variable is obsolete.  Left in for migration purposes.
//			DO NOT USE THIS VARIABLE
n_cst_dwsrv_querymodeattrib 	istr_querymodeinfo []
end variables

forward prototypes
public function integer of_save (string as_title, ref string as_pathname, ref string as_filename)
public function integer of_load (string as_title, ref string as_pathname, ref string as_filename)
public function boolean of_getenabled ()
public function boolean of_getresetcriteria ()
public function integer of_load (string as_title, ref string as_pathname, ref string as_filename, string as_ext)
public function integer of_load (string as_title, ref string as_pathname, ref string as_filename, string as_ext, string as_filter)
public function integer of_save (string as_title, ref string as_pathname, ref string as_filename, string as_ext)
public function integer of_save (string as_title, ref string as_pathname, ref string as_filename, string as_ext, string as_filter)
public function boolean of_getretrieveondisabled ()
public function integer of_setquerycols (string as_querycolumns[])
public function integer of_setresetcriteria (boolean ab_reset)
public function integer of_setretrieveondisabled (boolean ab_retrieve)
public function integer of_getquerycols (ref string as_querycolumns[])
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
public function integer of_setenabled (boolean ab_switch)
end prototypes

event pfc_values;call super::pfc_values;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_values
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	 0 = user cancelled from selection window
//	-1 = error
//
//	Description:
//	Allows user to select from a list of available database
//	values for the current column of idw_requestor
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
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

any		la_colvalue[]
any		la_args[]
integer	li_rc
long		ll_pos
string	ls_col
string	ls_dbname
string	ls_table
string	ls_value
string	ls_colreturn[]
string	ls_sqlsyntax
n_cst_selection	lnv_selection

SetPointer (hourglass!)

// Validate requestor
if IsNull(idw_requestor) Or not IsValid (idw_requestor) then
	return -1
end if

// Validate transaction object on requestor
if IsNull(idw_requestor.itr_object) Or &
	not IsValid (idw_requestor.itr_object) then
	return -1
else
	if not idw_requestor.itr_object.of_IsConnected() then
		return -1
	end if
end if

// Get current column
ls_col = idw_requestor.GetColumnName()
if Len (ls_col) = 0 then
	return -1
end if

// Get column DBname
ls_dbname = idw_requestor.Describe (ls_col + ".dbname")
if Len (ls_dbname) = 0 then
	return -1
end if

// Determine table for column DBname
ll_pos = Pos (ls_dbname, ".")
ls_table = Left (ls_dbname, ll_pos - 1)
if Len (ls_table) = 0 then
	return -1
end if

// Form SQL syntax
ls_sqlsyntax = "select distinct " + ls_dbname + " from " + ls_table

// Open selection window
li_rc = lnv_selection.of_Open (ls_sqlsyntax, la_colvalue[], idw_requestor.itr_object, ls_colreturn[], la_args[], "Values")
if li_rc > 0 then
	ls_value = String (la_colvalue[1])
	idw_requestor.ReplaceText (ls_value)
end if

return li_rc
end event

event pfc_operators;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_operators
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	 0 = user cancelled from selection window
//	-1 = error
//
//	Description:
//	Allows user to select from a list of querymode operators
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
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

any		la_colvalue[]
integer	li_rc
string		ls_value
string		ls_colreturn[]
n_cst_selection	lnv_selection
s_svalue		lstr_svalue[]

SetPointer (hourglass!)

// Validate requestor
if IsNull(idw_requestor) Or not IsValid (idw_requestor) then
	return -1
end if

// Populate operators
lstr_svalue[1].s_value = "and "
lstr_svalue[2].s_value = "or "
lstr_svalue[3].s_value = "< "
lstr_svalue[4].s_value = "> "
lstr_svalue[5].s_value = "<= "
lstr_svalue[6].s_value = ">= "
lstr_svalue[7].s_value = "= "

// Open selection window to allow choice of column value
ls_colreturn[1] = "value"
li_rc = lnv_selection.of_Open ("d_svalue", la_colvalue[], lstr_svalue[], ls_colreturn[], "Operators")
if li_rc > 0 then
	ls_value = la_colvalue[1]
	idw_requestor.ReplaceText (ls_value)
end if

return li_rc
end event

public function integer of_save (string as_title, ref string as_pathname, ref string as_filename);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Save
//
//	Access:  public
//
//	Arguments:
//	as_title   title of the dialog box.
//	as_pathname   string variable whose value is the default filename and
//		which will store the returned	path and filename. The default
//		filename is displayed in the File name box, but the user can specify another name. 
//	as_filename   string variable in which you want to store the returned filename
//
//	Returns:  integer
//	 1 = The save was successful
//	 0 = The user clicked the Cancel button or Windows canceled the display
//	-1 = The save was unsuccessful
//	-2 = The save was unsuccessful due to File I/O errors
//
//	Description:
//	Saves query criteria to disk (query criterias are loaded in "of_Load")
//	This function will not invoke the File Save dialog if the datawindow is not in QueryMode.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

return of_Save (as_title, as_pathname, as_filename, ".txt", "Query (*.txt),*.txt") 
end function

public function integer of_load (string as_title, ref string as_pathname, ref string as_filename);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Load
//
//	Access:  public
//
//	Arguments:
//	as_title   title of the load dialog
//	as_pathname   string variable into which you want to store the returned path and filename
//	as_filename   string variable in which you want to store the returned filename
//
//	Returns:  integer
//	 1 = The load was successful	
//	 0 = The user hit the Cancel button or Windows cancels the display
//	-1 = error
//
//	Description:
//	To load a saved query criteria from disk.
//	This function will set QueryMode to "yes" if a file is chosen in the File Open dialog
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

return of_Load (as_title, as_pathname, as_filename, ".txt", "Query (*.txt),*.txt,All files (*.*),*.*") 

end function

public function boolean of_getenabled ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetEnabled
//
//	Access:  Public
//
//	Arguments:  None
//
//	Returns:  Boolean
//	TRUE  = currently in querymode
//	FALSE = not currently in querymode
//
//	Description:
//	Returns the current state of querymode for idw_requestor
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

string ls_querymode

ls_querymode = idw_Requestor.Object.DataWindow.QueryMode

Return (Lower (ls_querymode) = 'yes')

end function

public function boolean of_getresetcriteria ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetResetCriteria
//
//	Access:  Public
//
//	Arguments:  None
//
//	Returns:  Boolean
//	The state of the Reset Criteria property
//
//	Description:
//	Returns the state of the Reset Criteria property
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

return ib_resetcriteria
end function

public function integer of_load (string as_title, ref string as_pathname, ref string as_filename, string as_ext);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Load
//
//	Access:  public
//
//	Arguments:
//	as_title   title of the load dialog
//	as_pathname   string variable into which you want to store the returned path and filename. 
//	as_filename   string variable in which you want to store the returned filename
//	as_ext   string whose value is a 1$$HEX1$$a000$$ENDHEX$$to 3 character default file extension
//
//	Returns:  integer
//	 1 = The load was successful
//	 0 = The user hit the Cancel button or Windows cancels the display
//	-1 = error
//
//	Description:
//	To load a saved query criteria from disk.
//	This function will set QueryMode to "yes" if a file is chosen in the File Open dialog. 
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

return of_Load (as_title, as_pathname, as_filename, as_ext, "Query (*.txt),*.txt,All files (*.*),*.*") 
end function

public function integer of_load (string as_title, ref string as_pathname, ref string as_filename, string as_ext, string as_filter);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Load
//
//	Access:  public
//
//	Arguments:
//	as_title   title of the load dialog
//	as_pathname   string variable into which you want to store the returned path and filename. 
//	as_filename   string variable in which you want to store the returned filename
//	as_ext   string whose value is a 1$$HEX1$$a000$$ENDHEX$$to 3 character default file extension
//   as_filter   string whose value is a text description of the files to include
//		in the listbox and the file mask that you want to use to select the displayed files
//		(for example, *.* or *.exe)
//
//	Returns:  integer
//	 1 = The load was successful
//	 0 = The user hit the Cancel button or Windows cancels the display
//	-1 = error
//
//	Description:
//	To load a saved query criteria from disk.
//	This function will set QueryMode to "yes" if a file is chosen in the File Open dialog
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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
integer 	li_value
boolean	lb_enabled

// Verify passed arguments
if IsNull (as_title) or IsNull (as_ext) or IsNull (as_filter) then return -1  

// Check the datawindow reference
if IsNull(idw_requestor) Or not IsValid (idw_requestor) then
	return -1
end if

// Prompt the user with a File Open dialog.
li_value = GetFileOpenName (as_title, as_pathname, as_filename, as_ext, as_filter) 

// If the user choses a file, then use it to load into the QueryMode datawindow
if li_value = 1 then
	idw_requestor.SetReDraw (false) 
	
	lb_enabled = of_GetEnabled()
	if not lb_enabled then
		of_SetEnabled (true)
	end if

	// Clear prior QueryMode criteria if necessary
	if ib_resetcriteria then idw_requestor.Object.DataWindow.QueryClear = "yes"

	// Load the query
 	if idw_requestor.ImportFile (as_pathname) <= 0 then
		li_value = -1
	end if
	 
	idw_requestor.SetReDraw (true) 
end if

return li_value
end function

public function integer of_save (string as_title, ref string as_pathname, ref string as_filename, string as_ext);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Save
//
//	Access:  public
//
//	Arguments:
//	as_title   title of the dialog box.
//	as_pathname   string variable whose value is the default filename and
//		which will store the returned	path and filename. The default
//		filename is displayed in the File name box, but the user can specify another name. 
//	as_filename   string variable in which you want to store the returned filename
//	as_ext   1$$HEX1$$a000$$ENDHEX$$to 3 character default file extension
//
//	Returns:  integer
//	 1 = The save was successful
//	 0 = The user clicked the Cancel button or Windows canceled the display
//	-1 = The save was unsuccessful
//	-2 = The save was unsuccessful due to File I/O errors
//
//	Description:
//	Saves query criteria to disk (query criterias are loaded in "of_Load")
//	This function will not invoke the File Save dialog if the datawindow is not in QueryMode.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

return of_Save (as_title, as_pathname, as_filename, as_ext, "Query (*.txt),*.txt")
end function

public function integer of_save (string as_title, ref string as_pathname, ref string as_filename, string as_ext, string as_filter);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Save
//
//	Access:  public
//
//	Arguments:
//	as_title   title of the dialog box.
//	as_pathname   string variable whose value is the default filename and
//		which will store the returned	path and filename. The default
//		filename is displayed in the File name box, but the user can specify another name. 
//	as_filename   string variable in which you want to store the returned filename
//	as_ext   1$$HEX1$$a000$$ENDHEX$$to 3 character default file extension
//	as_filter   text description of the files to include in the listbox
//		and the file mask that you want to use to select the
//		displayed files (for example, *.* or *.exe).
//
//	Returns:  integer
//	 1 = The save was successful
//	 0 = The user clicked the Cancel button or Windows canceled the display
//	-1 = The save was unsuccessful
//	-2 = The save was unsuccessful due to File I/O errors
//
//	Description:
//	Saves query criteria to disk (query criterias are loaded in "of_Load")
//	This function will not invoke the File Save dialog if the datawindow is not in QueryMode.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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
integer	li_value
integer	li_fileno
string		ls_data

// Verify passed arguments.
if IsNull (as_title) or IsNull (as_pathname) or IsNull (as_filename) or &
	IsNull (as_ext) or IsNull (as_filter) then return -1  

// Check the datawindow reference.
if IsNull(idw_requestor) Or not IsValid (idw_requestor) then
	return -1
end if

// If the datawindow is not in QueryMode, then return error
if Lower (idw_Requestor.Describe ( "DataWindow.QueryMode" )) <> "yes" then
	return -1
else
	if idw_requestor.AcceptText() <> 1 then return -1 

	// Prompt the user with a File Save Dialog.
	li_value = GetFileSaveName (as_title, as_pathname, as_filename, as_ext, as_filter) 

	// If the user choses a file, then write the Query criteria to the file.
	if li_value = 1 then
		li_fileno = FileOpen (as_pathname, StreamMode!, Write!, LockWrite!, Replace!)
		if li_fileno < 0 then return -2
		ls_data = idw_requestor.Describe ("dataWindow.data")
		if FileWrite (li_fileno, ls_data) < 0 then return -2
		if FileClose (li_fileno) < 0 then return -2
	end if
end if

return li_value
end function

public function boolean of_getretrieveondisabled ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetRetrieveOnDisabled
//
//	Access:  Public
//
//	Arguments:  none
//
//	Returns:  Boolean
//	TRUE (default) = datawindow will be retrieved when QueryMode is disabled.
//	FALSE = datawindow will not be retrieved when QueryMode is disabled.
//
//	Description:
//	Gets the state indicating whether the datawindow is automatically retrieved
//	when QueryMode is disabled.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

return ib_retrieveondisabled
end function

public function integer of_setquerycols (string as_querycolumns[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetQueryCols
//
//	Access:  public
//
//	Arguments:
//   as_querycolumns[]  column names that allow data to be entered in querymode
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	To identify the columns that can have query criteria entered
//	when the datawindow is in QueryMode
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Store the QueryColumns in instance variable.
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
integer	li_maxcols
integer	li_i
integer	li_j
integer	li_maxset
integer	li_rc
string		ls_collist[]

// Check the datawindow reference
if IsNull(idw_requestor) Or not IsValid (idw_requestor) then
	return -1
end if

// Get the upperbound value
li_maxcols = UpperBound (inv_querymodeinfo) 

// li_maxcols will be 0 if no columns have previously been set
if li_maxcols = 0 then
	
	// Initialize the attribute class with information of all the columns.
	// Store the original protect attribute, and initially set column
	// as not being a queryable column.
	li_rc = of_GetObjects (ls_collist, "column", "*", true) 
	li_maxcols = UpperBound (ls_collist)

	if li_maxcols = 0 then return -1

	for li_i = 1 to li_maxcols
		inv_querymodeinfo[li_i].s_col = ls_collist[li_i]
		inv_querymodeinfo[li_i].b_state = false
		inv_querymodeinfo[li_i].s_protect = idw_requestor.Describe (ls_collist[li_i] + ".protect")
	next

else

	// Reset the queryable columns flag
	for li_i = 1 to li_maxcols
		inv_querymodeinfo[li_i].b_state = false
	next

end if
	
// Find the columns being set and tag it as queryable based on passed argument.
li_maxset = UpperBound (as_querycolumns)
for li_i = 1 to li_maxset
	for li_j = 1 to li_maxcols
		if Lower (inv_querymodeinfo[li_j].s_col) = Lower (as_querycolumns[li_i]) then
			inv_querymodeinfo[li_j].b_state = true
		end if
	next
next

is_querycolumns = as_querycolumns
return 1
end function

public function integer of_setresetcriteria (boolean ab_reset);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetResetCriteria
//
//	Access:  public
//
//	Arguments:
//   ab_reset   when true, the query criteria will be reset in-between QueryMode toggles.
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets whether Query Criteria should be reset in-between QueryMode toggles.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

// Verify passed arguments
if IsNull (ab_reset) then return -1  

ib_resetcriteria = ab_reset
return 1

end function

public function integer of_setretrieveondisabled (boolean ab_retrieve);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetRetrieveOnDisabled
//
//	Access:  public
//
//	Arguments:
//	ab_retrieve   when true (default), will cause the datawindow to
//		be retrieved when QueryMode is disabled
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets the state indicating whether the datawindow is 
//	automatically retrieved when QueryMode is disabled
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

//  Verify passed arguments.
if IsNull (ab_retrieve) then return -1  

ib_retrieveondisabled = ab_retrieve
return 1
end function

public function integer of_getquerycols (ref string as_querycolumns[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetQueryCols
//
//	Access:  public
//
//	Arguments:
//   as_querycolumns[]  by reference, column names that allow data to be
//			entered in querymode
//
//	Returns:  integer
//	 The number of QueryColumns.
//
//	Description:
//	To identify the columns that can have query criteria entered
//	when the datawindow is in QueryMode.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
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

as_querycolumns = is_querycolumns
return UpperBound(as_querycolumns)
end function

public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetInfo
//
//	Access:   		Public
//
//	Arguments:		
//		anv_infoattrib	(By reference) The Information attributes.
//
//	Returns:  		Integer
//	 1 for success.
//	-1 for error.
//
//	Description:  
//	 Gets the Service Information.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0    Initial version
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

// Populate Information.
anv_infoattrib.is_name = 'QueryMode'
anv_infoattrib.is_description = 'Provide QueryMode functionality.'

Return 1
end function

public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetPropertyInfo
//
//	Access:   		Public
//
//	Arguments:		
//		anv_attrib	(By ref.) The Property Information attributes.
//
//	Returns:  		Integer
//	 1 for success.
//	-1 for error.
//
//	Description:  
//	 Gets the Service Property Information.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0    Initial version
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

n_cst_infoattrib lnv_infoattrib

// Get the first two attributes from the Main Information attributes.
of_GetInfo(lnv_infoattrib)
anv_attrib.is_name = lnv_infoattrib.is_name
anv_attrib.is_description = lnv_infoattrib.is_description

// Set the rest of the attributes.
anv_attrib.is_propertypage = {'u_tabpg_dwproperty_srvquerymode'}
anv_attrib.ib_switchbuttons = True

Return 1
end function

public function integer of_setenabled (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetEnabled
//
//	Access:  Public
//
//	Arguments: 
//   ab_switch
//	TRUE turns QueryMode on, 
//	FALSE turns QueryMode off
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Toggles querymode settings on and off based on argument
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Check that at least one QueryColumn has been requested prior to 
//			disabling/enabling columns.
// 7.0	If QueryMode is turned off, notify the dw that the row has changed
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
integer		li_numquerycols
integer		li_i
string		ls_rc
string		ls_modify
boolean		lb_querycolumn

// Verify passed arguments.
if IsNull (ab_switch) then return -1  

// Check the datawindow reference.
if IsNull(idw_requestor) Or not IsValid (idw_requestor) then
	return -1
end if

// Disable the Redraw during the operation.
idw_requestor.SetReDraw (false)

// Get the upperbound of the querymode stored information.
li_numquerycols = UpperBound (inv_querymodeinfo)

// Check that at least one QueryColumn has been requested.
lb_querycolumn = (UpperBound(is_querycolumns) > 0)

choose case ab_switch

		case true
			// Clear prior QueryMode criteria if necessary
			if ib_resetcriteria then idw_requestor.Object.DataWindow.QueryClear = "yes"

			// Put the datawindow into QueryMode state
			idw_requestor.Object.DataWindow.QueryMode = "yes"

			// Check that at least one QueryColumn has been requested prior to 
			//	disabling/enabling columns.
			If lb_querycolumn Then
				// Build Modify string to change all the appropriate properties
				for li_i = 1 to li_numquerycols
					if inv_querymodeinfo[li_i].b_state = false then
						// Add to modify string to protect for non-querymode columns
						ls_modify = ls_modify + inv_querymodeinfo[li_i].s_col + ".Protect = 1 " 
					else
						// Add to modify string to non-protect for querymode columns.
						ls_modify = ls_modify + inv_querymodeinfo[li_i].s_col + ".Protect = 0 " 
					end if
				next
			
				// Execute the Modify string changing all the appropriate properties
				ls_rc = idw_Requestor.Modify (ls_modify)
				if ls_rc <> "" then
					idw_requestor.SetRedraw (true)
					return -1
				end if
			end if

		case false
			// Turn off QueryMode
			idw_Requestor.Object.DataWindow.QueryMode = "no"

			// Build Modify string to Reset all the appropriate properties
			for li_i = 1 to li_numquerycols
				// Add to Modify string to restore the protect property
				ls_modify = ls_modify + inv_querymodeinfo[li_i].s_col + &
						".Protect = " + inv_querymodeinfo[li_i].s_protect + " " 
			next

			// Execute the Modify string
			ls_rc = idw_requestor.Modify (ls_modify)
			if ls_rc <> "" then
				idw_requestor.SetRedraw (true)
				return -1
			end if

			// Perform retrive if appropriate.
			if ib_retrieveondisabled then
				idw_requestor.event pfc_retrieve () 
			end if
			
			idw_requestor.Event pfc_rowchanged ( ) 

end choose

idw_requestor.SetReDraw (true)
return 1
end function

on pfc_n_cst_dwsrv_querymode.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_dwsrv_querymode.destroy
TriggerEvent( this, "destructor" )
end on

