HA$PBExportHeader$pfc_n_cst_dwsrv_dropdownsearch.sru
$PBExportComments$PFC DataWindow DropDownSearch service
forward
global type pfc_n_cst_dwsrv_dropdownsearch from n_cst_dwsrv
end type
end forward

global type pfc_n_cst_dwsrv_dropdownsearch from n_cst_dwsrv
event pfc_editchanged ( ref long al_row,  ref dwobject adwo_obj,  ref string as_data )
event pfc_itemfocuschanged ( long al_row,  ref dwobject adwo_object )
end type
global pfc_n_cst_dwsrv_dropdownsearch pfc_n_cst_dwsrv_dropdownsearch

type variables
Protected:
//	7.0   Instance variable datatype changed from os_columns to n_cst_dwsrv_dropdownsearchattrib type
//	7.0   Instance variable name changed from istr_columns to inv_columns
n_cst_dwsrv_dropdownsearchattrib	inv_columns[]
integer                 	ii_currentindex
boolean		ib_performsearch=False
string		is_textprev

// 7.0	This variable is obsolete.  Left in for migration purposes.
//			DO NOT USE THIS VARIABLE
n_cst_dwsrv_dropdownsearchattrib	istr_columns[]
end variables

forward prototypes
public function integer of_removecolumn (string as_column)
public function integer of_addcolumn (string as_column)
public function integer of_getcolumn (ref string as_columns[])
protected function integer of_searchitem (string as_column)
public function integer of_register ()
public function integer of_register (string as_column)
public function integer of_addcolumn ()
public function integer of_getregistered (ref string as_columns[])
public function boolean of_isregistered (string as_column)
public function integer of_unregister (string as_column)
public function integer of_getregisterable (ref string as_allcolumns[])
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
protected function integer of_deleteitem (integer ai_index)
public function integer of_unregister ()
end prototypes

event pfc_editchanged;call super::pfc_editchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		pfc_editchanged
//
//	Arguments:
//	al_row:  	row number
//	adwo_obj:  	DataWindow object passed by reference
//	as_data:  	The current data on the column.  (The search text)
//
//	Returns:   none
//
//	Description:	This event should be mapped to the editchanged
//			   		event of a DataWindow. When is event is "fired", it will use
//						instance variables (set in the pfc_itemfocuschanged) to access
//						items in the instance attribute class.
//						The instance attribute class contains information about the dddw and 
//						ddlb columns this service uses.
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
integer		li_searchtextlen
long			ll_findrow
string		ls_dddw_displaycol
string		ls_foundtext
string		ls_findexp
string		ls_searchcolname
long			ll_dddw_rowcount
long			li_ddlb_index=0
string		ls_displaydata_value
string		ls_searchtext
boolean		lb_matchfound=False

// Check requirements.
If IsNull(adwo_obj) or Not IsValid(adwo_obj) Then Return

// Confirm that the search capabilities are valid for this column.
if ib_performsearch=False or ii_currentindex <= 0 THEN return

// Get information on the column and text.
ls_searchcolname = adwo_obj.Name
ls_searchtext = as_data
li_searchtextlen = Len (ls_searchtext)

// If the user performed a delete operation, do not perform the search.
// If the text entered is the same as the last search, do not perform another search.
If (li_searchtextlen < Len(is_textprev)) or &
	(Lower (ls_searchtext) = Lower (is_textprev)) Then
	// Store the previous text information.
	is_textprev = ''
	Return 
End If

// Store the previous text information.
is_textprev = ls_searchtext

If inv_columns[ii_currentindex].s_editstyle = 'dddw' Then
	// *** DropDownDatawindow Search ***
	// Build the find expression to search the dddw for the text 
	// entered in the parent datawindow column.
	ls_dddw_displaycol = adwo_obj.dddw.displaycolumn
	ls_findexp = "Lower (Left (" + ls_dddw_displaycol + ", " + &
		String (li_searchtextlen) + ")) = '" + Lower (ls_searchtext) + "'"

	// Perform the Search on the dddw.
	ll_dddw_rowcount = inv_columns[ii_currentindex].dwc_object.rowcount()
	ll_findrow = inv_columns[ii_currentindex].dwc_object.Find (ls_findexp, 0, ll_dddw_rowcount)

	// Determine if a match was found on the dddw.
	lb_matchfound = (ll_findrow > 0)

	// Set the found text if found on the dddw.
	if lb_matchfound then
		// Get the text found.
		ls_foundtext =	inv_columns[ii_currentindex].dwc_object.GetItemString (&
									ll_findrow, ls_dddw_displaycol)
	End If								
ElseIf inv_columns[ii_currentindex].s_editstyle = 'ddlb' Then
	// *** DropDownListBox Search ***
	// Loop around the entire Code Table until a match is found (if any).
	Do
		li_ddlb_index	++
		ls_displaydata_value = idw_requestor.GetValue(ls_searchcolname, li_ddlb_index)
		If ls_displaydata_value = '' Then 
			// No more entries on the Code Table.
			Exit
		End If
	
		// Determine if a match has been found on the ddlb.
		lb_matchfound = ( Lower(ls_searchtext) = Lower( Left(ls_displaydata_value, Len(ls_searchtext))) )
	Loop Until lb_matchfound
	
	// Check if a match was found on the ddlb.
	If lb_matchfound Then
		// Get the text found by discarding the data value (just keep the display value).
		ls_foundtext = Left (ls_displaydata_value, Pos(ls_displaydata_value,'~t') -1)			
	End If
End If

// For either dddw or ddlb, check if a match was found.
If lb_matchfound Then
	// Set the text.
	idw_requestor.SetText (ls_foundtext)

	// Determine what to highlight or where to move the cursor..
	if li_searchtextlen = len(ls_foundtext) THEN
		// Move the cursor to the end
		idw_requestor.SelectText (Len (ls_foundtext)+1, 0)
	else
		// Hightlight the portion the user has not actually typed.
		idw_requestor.SelectText (li_searchtextlen + 1, Len (ls_foundtext))
	end if
end if

end event

event pfc_itemfocuschanged(long al_row, ref dwobject adwo_object);//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		pfc_itemfocuschanged
//
//	Arguments:
//	al_row:  	row number
//	adwo_obj:  	DataWindow object passed by reference
//	
//
//	Returns:   	none 
//
//	Description:	This event is fired from the itemfocuschanged event. 
//						It will set an index based on the loacation of the current
//						column in the array.  Also, it will make sure the column is
//						of type dddw or ddlb and set a flag to indicate so.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Added argument validation.
// 7.0 	Due to an invalid test for  ls_editstyle = 'dddw' the service was unable 
//			to recover the child handle.  
//			Changed  the test from ls_editstyle <> 'dddw' to  ls_editstyle = 'dddw'
// 12.5  When used with DDLB edit style, this service was not always correctly
//       processing the user's initial keystroke. This was due to instance var
//       is_textprev not being properly initialized in this event.
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

string	ls_editstyle
string 	ls_dwcolname
string   ls_textvalue, ls_valueslist, ls_ddlb_codetableentry
string   ls_ddlb_displayvalue, ls_ddlb_datavalue
int		li_index, li_ddlb_index, li_numtabs, li_tabpos
boolean  lb_matchfound
n_cst_string   lnv_string

// Initialize values.
ib_performsearch = False
ii_currentindex = 0
is_textprev = ''

// Validate arguments.
If IsNull(adwo_object) or Not IsValid(adwo_object) Then Return
If IsNull(al_row) or al_row <= 0 Then Return

// Check the column type.
ls_editstyle = adwo_object.Edit.Style
if ls_editstyle <> "dddw" And ls_editstyle <> "ddlb" THEN Return

// Get column name.
ls_dwcolname = adwo_object.Name

// Check if column is in the search column array.
li_index = of_SearchItem(ls_dwcolname)
If li_index <= 0 Then Return

//////////////////////////////////////////////////////////////////////////////
// The current column is of type DDDW or DDLB and is found on the array.
//////////////////////////////////////////////////////////////////////////////

// Store the variable that says OK to perform search.
ib_performsearch = True

// Store the current index.
ii_currentindex = li_index

// Store the previous text information.
If ls_editstyle = 'dddw' Then
	is_textprev = idw_requestor.GetText()
Else
	// Count # of tab chars in values list. Use this to prevent endless loop.
	ls_valueslist = idw_requestor.Describe(ls_dwcolname+'.Values')
	li_numtabs = lnv_string.of_CountOccurrences(ls_valueslist, '~t', FALSE)
	
	ls_textvalue  = idw_requestor.GetText()
	lb_matchfound = False
	li_ddlb_index = 0
	// Search the ddlb's Code Table for a data value match.
	Do
		ls_ddlb_codetableentry = idw_requestor.GetValue(ls_dwcolname, li_ddlb_index)
		If ls_ddlb_codetableentry = '' Then
			// No match found.
			Exit
		End If
		// Parse the display and data value in this code table entry.
		li_tabpos = Pos(ls_ddlb_codetableentry, '~t')
		ls_ddlb_displayvalue = LeftTrim(Mid(ls_ddlb_codetableentry, 1, li_tabpos - 1))
		ls_ddlb_datavalue    = LeftTrim(Mid(ls_ddlb_codetableentry, li_tabpos + 1))
		// Increment column index.
		li_ddlb_index++
		// Is this code table's data value a match?
		If Lower(ls_textvalue) = Lower(ls_ddlb_datavalue) Then
			lb_matchfound = True
		Else
			lb_matchfound = False
		End If
	Loop Until lb_matchfound Or li_ddlb_index = li_numtabs
	// Set initial value for "previous text" if a match was found.
	If lb_matchfound Then
		is_textprev = ls_ddlb_displayvalue
	End If
End If

// If a DDDW, Validate the dddw object.  If Not Valid, get it now.
If ls_editstyle = 'dddw' Then
	If IsNull(inv_columns[li_index].dwc_object) Or &
		Not isValid(inv_columns[li_index].dwc_object) Then
		adwo_object.getchild(ls_dwcolname, inv_columns[li_index].dwc_object) 
	End If
End If

Return
end event

public function integer of_removecolumn (string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_RemoveColumn
//
//	Access:  		public
//
//	Arguments:  	
//	as_column 		Column to remove from the service.
//
//	Returns:  		Integer
//						 1 succesful operation.
//						 0 if column not found.
//						-1 if an error is encountered.
//
//	Description:  	This function is called to remove a column from the list the
//						services uses.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Marked obsolete Replaced by of_UnRegister(...).
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

// Marked obsolete Replaced by of_UnRegister(...).
Return of_UnRegister(as_column)

end function

public function integer of_addcolumn (string as_column);// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_AddColumn
//
//	Access:  		public
//
//	Arguments:
//	as_column		Column to add.
//
//	Returns:  		Integer
//						1 if the column was added.
//						0 if the column was not added.
//						-1 if an error is encountered.
//
//	Description: 	Add a dropdowndatawindow or a dropdownlistboxe column to 
//						the dropdown search services.
//
//		*Note:	For a dropdowndatawindow column to be added it most have
//					a display value type char.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Marked obsolete Replaced by of_Register().
//	12.5	Added Metaclass Service Obsolete Tag
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

// Marked obsolete Replaced by of_Register().
Return of_Register(as_column)
end function

public function integer of_getcolumn (ref string as_columns[]);// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_GetColumn
//
//	Access:  		public
//
//	Arguments:
//	as_columns[]	Columns names for which the service is providing dropdown 
//						search capabilities. (by reference)
//
//
//	Returns:  		integer
//						The number of entries in the returned array.
//
//	Description:  	This function returns the column names for which the service 
//						is providing dropdown search capabilities.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Marked obsolete Replaced by of_GetRegistered(...).
//	12.5	Added Metaclass Service Obsolete Tag
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

// 6.0 	Marked obsolete Replaced by of_GetRegistered(...).
Return of_GetRegistered(as_columns)
end function

protected function integer of_searchitem (string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SearchItem
//
//	Access:  		protected
//
//	Arguments:
//	as_column		column to search for
//
//	Returns:  		integer
//						Index of array where column was found.
//						0 if not found
//						-1 if an error is encountered.
//
//	Description: 	
//	 This function is called to search the instance attribute class that holds 
//	 column information currently used by this service
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
integer	li_count
integer	li_i

// Check arguments
If IsNull(as_column) Or Len(Trim(as_column))=0 Then Return -1

// Get the size of the array.
li_count = upperbound(inv_columns)

// Check for an empty array.
if li_count <= 0 THEN return 0

// Find column name in array.
for li_i=1 TO li_count
	if inv_columns[li_i].s_columnname = as_column THEN
		// Column name was found.
		return li_i
	end if
next

// Column name not found in array.
return 0
end function

public function integer of_register ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Register
//
//	Access: 			public
//
//	Arguments:		None
//
//	Returns: 		integer
//						The number of columns registered.
//						-1 if an error is encountered.
//
//	Description:	
//	 Register all the appropriate dropdowndatawindow and dropdownlistboxe 
//	 columns from the datawindow to have dropdown search capabilities.
//
//	 *Note: For a dropdowndatawindow column to be registered it most have
//	 a display value type char.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version - Replaces obsoleted function of_AddColumn.
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
integer		li_colcount, li_i, li_count, li_rc
string		ls_editstyle, ls_displayvaluecolumn, ls_displayvaluecoltype
string		ls_colname
datawindowchild ldwc_obj

// Get the number of columns in the datawindow object
li_colcount = integer(idw_requestor.object.datawindow.Column.Count)

// Loop around all columns looking for dddw or ddlb columns.
For li_i=1 to li_colcount
	//Get-Validate the name and edit style of the column.
	ls_editstyle = idw_requestor.Describe("#"+string(li_i)+".Edit.Style")
	ls_colname = idw_requestor.Describe("#"+string(li_i)+".Name")
	If ls_colname = '!' or ls_editstyle = '!' Then Return -1	

	If ls_editstyle = 'dddw' Then
		// Get the displayvalue column name.
		ls_displayvaluecolumn = idw_requestor.Describe(ls_colname+".dddw.displaycolumn")
		If ls_displayvaluecolumn = '!' Then Return -1

		// Get a reference to the DropDownDatawindow.
		li_rc = idw_requestor.GetChild(ls_colname, ldwc_obj)
		If li_rc<>1 Then Return -1
		
		// If displayvalue column is not of type "Char," skip it.	
		ls_displayvaluecoltype = ldwc_obj.Describe(ls_displayvaluecolumn+".coltype")
		If pos(ls_displayvaluecoltype, "char") >= 1 Then
			// Add entry into array.
			li_count = upperbound(inv_columns)+1
			inv_columns[li_count].s_editstyle	= ls_editstyle
			inv_columns[li_count].s_columnname = ls_colname
			inv_columns[li_count].dwc_object   = ldwc_obj
		End If
	ElseIf ls_editstyle = 'ddlb' Then
		// Add entry into array.
		li_count = upperbound(inv_columns)+1
		inv_columns[li_count].s_editstyle	= ls_editstyle
		inv_columns[li_count].s_columnname = ls_colname		
	End If
Next

Return upperbound(inv_columns)
end function

public function integer of_register (string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Register
//
//	Access:  		public
//
//	Arguments:
//	as_column		Column to register.
//
//	Returns:  		Integer
//	 1 if the column was registered.
//	 0 if the column was not registered.
//	-1 if an error is encountered.
//
//	Description:
//	 Register a dropdowndatawindow or a dropdownlistboxe column to the dropdown 
//	 search services.
//
//	 *Note: For a dropdowndatawindow column to be added it most have a display
//		value type char.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version - Replaces obsoleted function of_AddColumn.
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

integer 			li_count, li_rc
string			ls_editstyle
string			ls_displayvaluecolumn, ls_displayvaluecoltype
datawindowchild ldwc_obj

// Check arguments
If IsNull(as_column) Or Len(Trim(as_column))=0 Or &
	IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then Return -1

ls_editstyle = idw_requestor.Describe(as_column+".Edit.Style")
If ls_editstyle = 'dddw' Then
	// Get the displayvalue column name.
	ls_displayvaluecolumn = idw_requestor.Describe(as_column+".dddw.displaycolumn")
	If ls_displayvaluecolumn = '!' Then Return -1

	// Get a reference to the DropDownDatawindow.
	li_rc = idw_requestor.GetChild(as_column, ldwc_obj)
	If li_rc<>1 Then Return -1
	
	// If displayvalue column is not of type "Char," skip it.	
	ls_displayvaluecoltype = ldwc_obj.Describe(ls_displayvaluecolumn+".coltype")		
	If pos(ls_displayvaluecoltype, "char") >= 1 Then
		// Add the new entry.				
		li_count = upperbound(inv_columns) +1					
		inv_columns[li_count].s_editstyle	= ls_editstyle		
		inv_columns[li_count].s_columnname	= as_column
		inv_columns[li_count].dwc_object 	= ldwc_obj
		Return 1
	End If
ElseIf ls_editstyle = 'ddlb' Then
		// Add DropDownListBox entry into array.
		li_count = upperbound(inv_columns) +1
		inv_columns[li_count].s_editstyle	= ls_editstyle
		inv_columns[li_count].s_columnname = as_column	
		Return 1
End If	

// The column was not added.
Return 0
end function

public function integer of_addcolumn ();// ##Obsolete##
//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_AddColumn
//
//	Access: 			public
//
//	Arguments:		None
//
//	Returns: 		integer
//						The number of columns added.
//						-1 if an error is encountered.
//
//	Description:	Add all the appropriate dropdowndatawindow and dropdownlistboxe 
//						columns from the datawindow to have dropdown search capabilities.
//
//		*Note:	For a dropdowndatawindow column to be added it most have
//					a display value type char.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Marked obsolete Replaced by of_Register().
//	12.5	Added Metaclass Service Obsolete Tag
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

// Marked obsolete Replaced by of_Register().
Return of_Register()
end function

public function integer of_getregistered (ref string as_columns[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_GetRegistered
//
//	Access:  		public
//
//	Arguments:
//	as_columns[]	Columns names for which the service is providing dropdown 
//						search capabilities. (by reference)
//
//
//	Returns:  		integer
//						The number of entries in the returned array.
//
//	Description:  	This function returns the column names for which the service 
//						is providing dropdown search capabilities.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version - Replaces obsoleted function of_GetColumn(...).
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

integer 	li_i
integer	li_count
string	ls_empty[]

// Initialize string.
as_columns = ls_empty

// Get the number of entries on the internal array.
li_count = upperbound(inv_columns)
If li_count <=0 Then Return 0

// Loop around all entries and populate array with column names.
For li_i=1 To li_count
	as_columns[li_i] = inv_columns[li_i].s_columnname
Next

Return li_count 
end function

public function boolean of_isregistered (string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsRegistered
//
//	Access:  		public
//
//	Arguments:
//	as_column		Column to test if registered.
//
//	Returns:  		boolean
//	 True if the column is registered.
//	 False if not.
//
//	Description:
//	 Determine if the passed in column is registered.
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

integer 			li_count, li_rc
string			ls_editstyle, ls_coltype
string			ls_displayvaluecolumn, ls_displayvaluecoltype
datawindowchild ldwc_obj

// Check arguments
If IsNull(as_column) Or Len(Trim(as_column))=0 Then 
	Return False
End If

If of_SearchItem(as_column) > 0 Then
	Return True
End If

Return False
end function

public function integer of_unregister (string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_Unregister
//
//	Access:  		public
//
//	Arguments:  	
//	as_column 		Column to unregister from the service.
//
//	Returns:  		Integer
//						 1 succesful operation.
//						 0 if column not found.
//						-1 if an error is encountered.
//
//	Description:  	This function is called to unregister a column from the list the
//						services uses.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version - Replaces obsoleted function of_RemoveColumn.
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

integer	li_index
 
// Find the column in the array.
li_index = of_SearchItem(as_column)

// Check if column was found.
if not li_index >0 THEN return 0

// Delete the column from the array.
Return of_DeleteItem(li_index)

end function

public function integer of_getregisterable (ref string as_allcolumns[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetRegisterable
//
//	Access:  		public
//
//	Arguments:
//	as_allcolumns[] By Reference.  All columns belonging to the requestor which
//						could be registered.
//
//	Returns:  		Integer
//	 The column count.
//	-1 if an error is encountered.
//
//	Description:
//	 Determines all columns belonging to the requestor which could be registered.
//
//	 *Note: For a dropdowndatawindow column to be of registering it most have a 
//		display value type char.
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

integer		li_colcount, li_i, li_count, li_rc
string		ls_editstyle, ls_displayvaluecolumn, ls_displayvaluecoltype
string		ls_colname
datawindowchild ldwc_obj
string		ls_allcolumns[]

// Get the number of columns in the datawindow object
li_colcount = integer(idw_requestor.object.datawindow.Column.Count)

// Loop around all columns looking for dddw or ddlb columns.
For li_i=1 to li_colcount
	//Get-Validate the name and edit style of the column.
	ls_editstyle = idw_requestor.Describe("#"+string(li_i)+".Edit.Style")
	ls_colname = idw_requestor.Describe("#"+string(li_i)+".Name")
	If ls_colname = '!' or ls_editstyle = '!' Then Return -1	

	If ls_editstyle = 'dddw' Then
		// Get the displayvalue column name.
		ls_displayvaluecolumn = idw_requestor.Describe(ls_colname+".dddw.displaycolumn")
		If ls_displayvaluecolumn = '!' Then Return -1

		// Get a reference to the DropDownDatawindow.
		li_rc = idw_requestor.GetChild(ls_colname, ldwc_obj)
		If li_rc<>1 Then Return -1
		
		// If displayvalue column is not of type "Char," skip it.	
		ls_displayvaluecoltype = ldwc_obj.Describe(ls_displayvaluecolumn+".coltype")
		If pos(ls_displayvaluecoltype, "char") >= 1 Then
			// Add entry into array.
			li_count = upperbound(ls_allcolumns)+1
			ls_allcolumns[li_count] = ls_colname
		End If
	ElseIf ls_editstyle = 'ddlb' Then
		// Add entry into array.
		li_count = upperbound(ls_allcolumns)+1
		ls_allcolumns[li_count] = ls_colname		
	End If
Next

as_allcolumns = ls_allcolumns
Return UpperBound(as_allcolumns)

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
anv_infoattrib.is_name = 'Drop Down Search'
anv_infoattrib.is_description = &
	'Scrolls DropDownDataWindows and DropDownListBoxes automatically, filling '+&
	'in the field, as a match is found.'
	
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
anv_attrib.is_propertypage = {'u_tabpg_dwproperty_srvdropdownsearch'}
anv_attrib.ib_switchbuttons = True

Return 1
end function

protected function integer of_deleteitem (integer ai_index);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_DeleteItem
//
//	Access:			protected
//
//	Arguments:
//	ai_index			index number 
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description: 	This function is called to remove a entry from the array.
//
//		*Note: 	Function will also repack the array.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	7.0   Local variable datatype changed from os_columns to n_cst_dwsrv_dropdownsearchattrib type
//	7.0   Local variable name changed from lstr_columns to lnv_columns
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
integer		li_i, li_count
n_cst_dwsrv_dropdownsearchattrib	lnv_columns[]

// Get the size of the array.
li_count = upperbound(inv_columns)

// Validate the argument.
If IsNull(ai_index) or ai_index <=0 or ai_index > li_count Then Return -1

// Copy from the begining to the entry prior the passed value.
If ai_index >= 2 Then
	For li_i=1 To ai_index -1
		lnv_columns[li_i] = inv_columns[li_i]	
	Next
End If	

// Also copy the rest of the array skipping the passed entry value.
If li_count > ai_index Then
	For li_i = ai_index +1 To li_count
		lnv_columns[li_i -1] = inv_columns[li_i]
	Next	
End If

// Store the new array on the instance variable.
inv_columns = lnv_columns
Return 1
end function

public function integer of_unregister ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_Unregister
//
//	Access:  		public
//
//	Arguments:  	None
//
//	Returns:  		Integer
//						 1 succesful operation.
//						-1 if an error is encountered.
//
//	Description:  	
//	This function is called to unregister all the columns.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//	7.0   Local variable datatype changed from os_columns to n_cst_dwsrv_dropdownsearchattrib type
//	7.0   Local variable name changed from lstr_columns to lnv_columns
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

n_cst_dwsrv_dropdownsearchattrib	lnv_columns[]

// Unregister all information.
inv_columns = lnv_columns
Return 1
end function

on pfc_n_cst_dwsrv_dropdownsearch.destroy
call super::destroy
end on

on pfc_n_cst_dwsrv_dropdownsearch.create
call super::create
end on

