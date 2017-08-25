HA$PBExportHeader$pfc_w_filtersimple.srw
$PBExportComments$PFC Simple Filter dialog window
forward
global type pfc_w_filtersimple from w_response
end type
type cb_delete from u_cb within pfc_w_filtersimple
end type
type cb_cancel from u_cb within pfc_w_filtersimple
end type
type dw_filter from u_dw within pfc_w_filtersimple
end type
type mle_originalfilter from u_mle within pfc_w_filtersimple
end type
type gb_originalfilter from u_gb within pfc_w_filtersimple
end type
type cb_add from u_cb within pfc_w_filtersimple
end type
type gb_newfilter from u_gb within pfc_w_filtersimple
end type
type cb_ok from u_cb within pfc_w_filtersimple
end type
type cb_dlghelp from u_cb within pfc_w_filtersimple
end type
end forward

global type pfc_w_filtersimple from w_response
integer width = 2510
integer height = 1160
string title = "Filter"
long backcolor = 80263328
cb_delete cb_delete
cb_cancel cb_cancel
dw_filter dw_filter
mle_originalfilter mle_originalfilter
gb_originalfilter gb_originalfilter
cb_add cb_add
gb_newfilter gb_newfilter
cb_ok cb_ok
cb_dlghelp cb_dlghelp
end type
global pfc_w_filtersimple pfc_w_filtersimple

type variables
Protected:

string		is_prevchildcolumn
datawindowchild	idwc_cols
datawindowchild	idwc_values
n_cst_filterattrib	inv_filterattrib
n_cst_returnattrib	inv_return
end variables

forward prototypes
public subroutine of_getvalues (string as_column)
public function string of_buildfilterstring ()
end prototypes

public subroutine of_getvalues (string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetValues
//
//	Access:    		Public
//
//	Arguments:
//  as_column:  	The column to get values for
//
//	Returns:   		None
//
//	Description:  	Obtains a list of distinct values for the specified
//					  	column from the database.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Validate the required transaction object.
// 5.0.03 Clear the columnvalues via a Reset operation.
// 12.5.2 Share Filtered DW's column dddw with ColValue's dddw, if any
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
integer	li_pos1
integer	li_pos2
integer	li_num_values 
integer	li_newrow
integer	li_rc
string 	ls_dbname
string		ls_select
string		ls_owner
string		ls_table
string		ls_full_table
string		ls_full_dbname
string		ls_values[]

n_cst_string 		lnv_string
datawindowchild	ldwc

// Validate the transaction object.
If IsNull(inv_filterattrib.idw_dw.itr_object) or &
	Not IsValid(inv_filterattrib.idw_dw.itr_object) Then
	// There is no valid PFC transaction object on the original datawindow.
	Return
End If
If not inv_filterattrib.idw_dw.itr_object.of_IsConnected() Then
	// There is no connected PFC transaction object on the original datawindow.	
	Return
End if

If is_prevchildcolumn = as_column Then
	// There is no need to get the values.
	Return 
End If

// Store the last column for which the values were gotten.
is_prevchildcolumn = as_column

SetPointer ( HourGlass! )

// Clear all of the values.
li_rc = idwc_values.Reset()

// Check if a dddw is associated with the specified column of the filtered dw
if inv_filterattrib.idw_dw.getchild( as_column, ldwc ) = 1 then
	// if so, share dddw properties and contents
	dw_filter.object.colvalue.dddw.name 				= inv_filterattrib.idw_dw.describe( as_column+ ".dddw.name" )
	dw_filter.object.colvalue.dddw.displaycolumn 	= inv_filterattrib.idw_dw.describe( as_column+ ".dddw.displaycolumn" )
	dw_filter.object.colvalue.dddw.datacolumn 		= inv_filterattrib.idw_dw.describe( as_column+ ".dddw.datacolumn" )
	ldwc.sharedata( idwc_values )
else
	// Get the database name associated with the column.
	ls_dbname = inv_filterattrib.idw_dw.Describe ( as_column + ".DBName" ) 
	
	// Get the SQL Select for the requesting datawindow.
	ls_select = inv_filterattrib.idw_dw.Describe ( "DataWindow.Table.Select" )
	If ls_select = "" or ls_select = "!" or ls_select = "?" Then Return
	
	// Search the SQL Select for the owner name associated with the selected column.
	li_pos1 = Pos ( ls_select, ls_dbname, 1 ) 
	IF li_pos1 > 0 THEN 
		li_pos2 = lnv_string.of_lastpos ( ls_select, " ", li_pos1 ) 
		IF li_pos2 > 0 THEN 
			ls_owner = Trim (Mid ( ls_select, li_pos2, li_pos1 - li_pos2 )) 
		END IF
	END IF 
	
	// Create a table and columnname with owner information if available.
	ls_table = lnv_string.of_gettoken ( ls_dbname, "." ) 
	IF ls_owner <> "" THEN 
		ls_full_table = ls_owner + "." + ls_table
	ELSE
		ls_full_table = ls_table
	END IF 
	
	ls_full_dbname = ls_full_table + "." + ls_dbname 
	
	// Get the distinct values.
	inv_filterattrib.idw_dw.itr_object.of_distinctvalues ( ls_full_table, ls_full_dbname, &
																				ls_values ) 
	
	// Populate the DropDownDatawidow column with the column values.
	li_num_values = UpperBound ( ls_values ) 
	FOR li_i = 1 to li_num_values
		// Insert new row.
		li_newrow = idwc_values.InsertRow ( 0 ) 
		
		// Populate the values for the new row.	
		idwc_values.SetItem ( li_newrow, "value", ls_values[li_i] )	
	NEXT
end if

// Sort the DropDownDatawidow
idwc_values.Sort()


end subroutine

public function string of_buildfilterstring ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BuildfilterString
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		String
//						The new filter string.
//						'!' if an error is encountered.
//
//	Description:  	This function will build a valid datawindow filter string 
//               	from the values entered in the filter selection datawindow.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Corrected to check/build for all column types.
// 7.0	Added "char" datatype to case statement
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

string	ls_exp_left, ls_oper, ls_value, ls_colname, ls_filter, ls_and_or
string	ls_coltype, ls_expression
integer	li_i, li_rcount, li_foundrow
n_cst_string lnv_string

// Accept the latest changes.
If dw_filter.AcceptText() <> 1 Then Return '!'

// Get the values from the filter datawindow.
li_rcount = dw_filter.RowCount ( )
FOR li_i = 1 to li_rcount

	// Construct the left side of the expression.
	ls_exp_left = dw_filter.GetItemString ( li_i, "colname" ) 
	IF IsNull(ls_exp_left) THEN ls_exp_left = ""
	IF ls_exp_left <> ""  AND  li_i > 1 THEN
		ls_filter = ls_filter + " " + ls_and_or
	END IF  

	// Construct the operator.
	ls_oper = dw_filter.GetItemString ( li_i, "oper" ) 
	IF IsNull(ls_oper) THEN ls_oper = ""

	// Get the value.
	ls_value = dw_filter.GetItemString ( li_i, "colvalue" ) 
	IF IsNull (ls_value) THEN ls_value = ""

	// Construct the "AND" or "OR" for the expression.
	ls_and_or = dw_filter.GetItemString (li_i, "and_or" ) 
	IF IsNull(ls_and_or) THEN ls_and_or = ""
	
	// Get the column name.
	li_foundrow = idwc_cols.Find ('display_column = "' + ls_exp_left + '"', &
								1, idwc_cols.RowCount ())
	IF li_foundrow > 0 THEN 
		ls_colname = idwc_cols.GetItemString(li_foundrow, "columnname") 
	ELSE
		ls_colname = ls_exp_left
	END IF 

	// Get the column type.
	ls_coltype = Left(inv_filterattrib.idw_dw.Describe ( ls_colname + ".ColType" ), 5)
	
	// Determine the correct expression.
	Choose Case ls_coltype
		// CHARACTER DATATYPE		
		Case "char(", "char"	
			If Pos(ls_value, '~~~"') =0 And Pos(ls_value, "~~~'") =0 Then
				// No special characters found.
				If Pos(ls_value, "'") >0 Then
					// Replace single quotes with special chars single quotes.
					ls_value = lnv_string.of_GlobalReplace(ls_value, "'", "~~~'", FALSE)				
				End If
			End If
			ls_expression = "'" + ls_value + "'"			
	
		// DATE DATATYPE	
		Case "date"
			ls_expression = "Date('" + ls_value  + "')" 

		// DATETIME DATATYPE
		Case "datet"				
			ls_expression = "DateTime('" + ls_value + "')" 

		// TIME DATATYPE
		Case "time", "times"		
			ls_expression = "Time('" + ls_value + "')" 
	
		// NUMBER
		Case 	Else
			ls_expression = ls_value
	End Choose

	// Build the filter string.
	ls_filter += " " + ls_colname + " " + ls_oper + " " + ls_expression
NEXT

Return Trim(ls_filter)
end function

event open;call w_response::open;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  pfc_w_filtersimple
//
//	Description:  A Specify Filter dialog using a simple a=b metaphor
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

// Get the PowerObject.
inv_filterattrib = Message.PowerObjectParm

SetPointer ( HourGlass! )

// Allow window to close without the CloseQuery checks being performed.
ib_disableclosequery = True

// Start the base service. 
of_SetBase (true)

// Center this window.
inv_base.of_Center()
end event

on pfc_w_filtersimple.create
int iCurrent
call super::create
this.cb_delete=create cb_delete
this.cb_cancel=create cb_cancel
this.dw_filter=create dw_filter
this.mle_originalfilter=create mle_originalfilter
this.gb_originalfilter=create gb_originalfilter
this.cb_add=create cb_add
this.gb_newfilter=create gb_newfilter
this.cb_ok=create cb_ok
this.cb_dlghelp=create cb_dlghelp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_delete
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.dw_filter
this.Control[iCurrent+4]=this.mle_originalfilter
this.Control[iCurrent+5]=this.gb_originalfilter
this.Control[iCurrent+6]=this.cb_add
this.Control[iCurrent+7]=this.gb_newfilter
this.Control[iCurrent+8]=this.cb_ok
this.Control[iCurrent+9]=this.cb_dlghelp
end on

on pfc_w_filtersimple.destroy
call super::destroy
destroy(this.cb_delete)
destroy(this.cb_cancel)
destroy(this.dw_filter)
destroy(this.mle_originalfilter)
destroy(this.gb_originalfilter)
destroy(this.cb_add)
destroy(this.gb_newfilter)
destroy(this.cb_ok)
destroy(this.cb_dlghelp)
end on

event pfc_postopen;call super::pfc_postopen;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  pfc_postopen
//
//	Description:  Add the column names to the dropdownlist
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
integer 	li_newrow, li_numcols, li_i, li_rc
string	ls_filter
n_cst_string lnv_string

// Turn off re-drawing until all done.
dw_filter.SetReDraw (FALSE)

// Make the original filter visible.
ls_filter = inv_filterattrib.is_filter
If Pos(ls_filter, "~~~~'") > 0 And  Pos(ls_filter, "~~~~~~'") = 0 Then
	ls_filter = lnv_string.of_GlobalReplace(ls_filter, "~~~~'", "~~'", FALSE)	
End If
mle_originalfilter.text = ls_filter

// Insert a new row.
li_newrow = dw_filter.Event pfc_AddRow()

// Get the Column Name childdatawindow reference.
li_rc = dw_filter.GetChild ( "colname", idwc_cols ) 

// Get the Column Value childdatawindow reference.
li_rc = dw_filter.GetChild ( "colvalue", idwc_values ) 

// Populate the childdatawidow column with the column names.
li_numcols = UpperBound ( inv_filterattrib.is_columns ) 
FOR li_i = 1 to li_numcols
	// Insert new row.
	li_newrow = idwc_cols.InsertRow ( 0 ) 

	// Populate the values for the new row.
	idwc_cols.SetItem ( li_newrow, "columnname", inv_filterattrib.is_columns[li_i] )
 	idwc_cols.SetItem ( li_newrow, "display_column", inv_filterattrib.is_colnamedisplay[li_i] ) 
NEXT

// Turn off re-drawing until all done.
dw_filter.SetReDraw (TRUE)
end event

event pfc_default;call super::pfc_default;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_Default
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Construct the new filter string, test the filter,
//						and close this dialog
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

string		ls_testfilter
integer		li_rc=1
datastore	lds_test

// Get the new filter.
ls_testfilter = of_BuildfilterString()

// Determine if the Filter Test is needed.
If Len(ls_testfilter) > 0 Then
	// Create the Test-filter datastore.
	lds_test = CREATE n_ds

	// Associate the correct DataObject to the Test-filter datastore.
	lds_test.DataObject = inv_filterattrib.idw_dw.DataObject

	// Test the new filter.
	li_rc = lds_test.SetFilter(ls_testfilter)

	// Destroy the Test-filter datastore.
	Destroy lds_test

	// Check if the Test of the new filter failed.
	If li_rc <> 1 Then
		// Test of the new filter failed.  Do not allow the window to close via the OK.
		of_MessageBox('pfc_filtersimple_failedfilter',this.Title,'Invalid Filter.', &
			Information!, OK!, 1)
		Return 
	End If
End If

// A Test the filter was not needed or the Test was successful.

// Set the return code to mean succesful operation.
inv_return.ii_rc = 1

// Set the new sort string.
inv_return.is_rs = ls_testfilter

// Close the window.
CloseWithReturn ( this, inv_return )

end event

event pfc_cancel;call w_response::pfc_cancel;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_Cancel
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Set to the appropriate return code and close the dialog.
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

// Set the return code to mean the window was closed by a cancel operation.
inv_return.ii_rc = 0

// Clear the sort string.
inv_return.is_rs = ''

// Close the window.
CloseWithReturn ( this, inv_return ) 
end event

event close;call w_response::close;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Close
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Window close.
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

// If the return code matches the default value,
// then window is currently being closed as a Cancel operation.
If inv_return.ii_rc=-99 Then
	this.Event pfc_Cancel ()
End If
end event

type cb_delete from u_cb within pfc_w_filtersimple
integer x = 2034
integer y = 552
integer width = 375
integer taborder = 30
string text = "&Delete"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked!
//
//	Description:  Delete the current row in the filter dialog
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
//////////////////////////////////////////////////////////////////////////////int li_row

// Delete the current row.
dw_filter.Event pfc_DeleteRow()

// Make sure there is at least one row in the datawindow.
IF dw_filter.RowCount() =0 THEN 
	dw_filter.Event pfc_InsertRow()
End If

dw_filter.SetColumn(1)
SetFocus (dw_filter)
end event

type cb_cancel from u_cb within pfc_w_filtersimple
integer x = 1641
integer y = 936
integer width = 375
integer taborder = 50
string text = "Cancel"
boolean cancel = true
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Clicked!
//
//	Description:  	Perform the window Cancel operation.
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

Parent.Event pfc_Cancel ()

end event

type dw_filter from u_dw within pfc_w_filtersimple
integer x = 59
integer y = 388
integer width = 1952
integer height = 500
integer taborder = 10
string dataobject = "d_filtersimple"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event itemchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  ItemChanged!
//
//	Description:  Determine the column that changed and take some action
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

integer 	li_newrow

IF dwo.Name ="and_or" And row =this.RowCount() THEN
	// If the user clicks the "and_or" column on the last row, add one row.
	li_newrow = this.Event pfc_AddRow()

	If li_newrow > 0 Then
		// Change the current row to the new row.
		dw_filter.ScrollToRow(li_newrow)
		dw_filter.SetRow(li_newrow)
		
		// Change focus to the first column on the new row.
		dw_filter.SetColumn("colname")
	End If
END IF

end event

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Constructor!
//
//	Description:  Show the hand indicator on the current row.
//						Start the DropdownSearch service.
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

//Show the hand indicator on the current row.
this.SetRowFocusIndicator (Hand! )

//Start the DropdownSearch service.
of_SetDropdownSearch(True)

//Set all the DropDown columns to have Type Ahead features.
inv_dropdownsearch.of_AddColumn()
end event

event editchanged;call u_dw::editchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  editchanged
//
//	(Arguments: None )
//
//	(Returns:   None )
//
//	Description:  Provide Type Ahead capabilities.
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

If IsValid(inv_dropdownsearch) Then
	inv_dropdownsearch.event pfc_editchanged(row, dwo, data)
End If
end event

event itemfocuschanged;call super::itemfocuschanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		itemfocuschanged
//
//	(Arguments: None )
//
//	(Returns:   None )
//
//	Description:  Provide Type Ahead capabilities.
//					  Populate the DropDownDatawindow with column values.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Clear the columnvalues via a Reset operation.
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

// Provide Type Ahead capabilities.
If IsValid(inv_dropdownsearch) Then
	inv_dropdownsearch.event pfc_itemfocuschanged(row, dwo)
End If

// Populate the DropDownDatawindow with column values.
integer 	li_foundrow
string	ls_findexp
string	ls_colname
string	ls_currentcolumn

IF this.GetColumnName ( ) = "colvalue" THEN
	SetPointer ( HourGlass! )
	
	// Get the column name for which column values are needed.
	ls_currentcolumn = this.GetItemString ( this.GetRow(), "colname")
	
	ls_findexp = 'Lower(display_column) = "' + Lower(ls_currentcolumn) + '"'
	li_foundrow = idwc_cols.Find(ls_findexp, 1, idwc_cols.RowCount())
	IF li_foundrow > 0 THEN 
		// Populate the list with column values.
		ls_colname = idwc_cols.GetItemString ( li_foundrow, "columnname" )
		of_GetValues(ls_colname)  
	Else
		// Clear all of the values.
		idwc_values.Reset()
	END IF 
END IF 

end event

event pfc_prermbmenu;call super::pfc_prermbmenu;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_prermbmenu
//
//	Arguments:
//	am_dw
//
//	Returns:
//	none
//
//	Description:
//	Hide add, insert, delete options
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0.03   Initial version
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

am_dw.m_table.m_dash11.visible = false
am_dw.m_table.m_insert.enabled = false
am_dw.m_table.m_insert.visible = false
am_dw.m_table.m_addrow.enabled = false
am_dw.m_table.m_addrow.visible = false
am_dw.m_table.m_delete.visible = false
am_dw.m_table.m_delete.enabled = false
end event

type mle_originalfilter from u_mle within pfc_w_filtersimple
integer x = 59
integer y = 64
integer width = 2350
integer height = 180
integer taborder = 0
long backcolor = 80263581
boolean border = false
boolean vscrollbar = true
boolean displayonly = true
borderstyle borderstyle = stylebox!
end type

type gb_originalfilter from u_gb within pfc_w_filtersimple
integer x = 14
integer y = 4
integer width = 2432
integer height = 276
integer taborder = 0
long textcolor = 33554687
long backcolor = 82889382
string text = "Original Filter Criteria"
end type

type cb_add from u_cb within pfc_w_filtersimple
integer x = 2034
integer y = 452
integer width = 375
integer taborder = 20
string text = "&Add"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Clicked!
//
//	Description:  	Add a new row on the datawindow.
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

Integer	li_row

li_row = dw_filter.Event pfc_AddRow()
If li_row > 0 Then
	dw_filter.SetRow (li_row)
	dw_filter.ScrollToRow (li_row)
	dw_filter.SetColumn(1)
End If
SetFocus (dw_filter)
end event

type gb_newfilter from u_gb within pfc_w_filtersimple
integer x = 14
integer y = 340
integer width = 2432
integer height = 568
integer taborder = 0
long textcolor = 33554687
long backcolor = 82889382
string text = "New Filter Criteria"
end type

type cb_ok from u_cb within pfc_w_filtersimple
integer x = 1248
integer y = 936
integer width = 375
integer taborder = 40
string text = "OK"
boolean default = true
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Clicked!
//
//	Description:  	Perform the OK window process.
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

Parent.Event pfc_default()

end event

type cb_dlghelp from u_cb within pfc_w_filtersimple
integer x = 2034
integer y = 936
integer width = 375
integer taborder = 60
string text = "&Help"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Display PFC dialog help
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

showHelp ("pfcdlg.hlp", topic!, 200)
end event

