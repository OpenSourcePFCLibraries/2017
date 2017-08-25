HA$PBExportHeader$pfc_n_cst_dwsrv_sort.sru
$PBExportComments$PFC DataWindow Sort service
forward
global type pfc_n_cst_dwsrv_sort from n_cst_dwsrv
end type
end forward

global type pfc_n_cst_dwsrv_sort from n_cst_dwsrv
event type integer pfc_clicked ( integer ai_xpos,  integer ai_ypos,  long al_row,  ref dwobject adwo_obj )
event type integer pfc_sortdlg ( )
end type
global pfc_n_cst_dwsrv_sort pfc_n_cst_dwsrv_sort

type variables
Public:

// Style constants.
// Defined in ancestor - constant integer DEFAULT = 0
constant integer DRAGDROP = 1
constant integer SIMPLE = 2
constant integer DROPDOWNLISTBOX = 3

Protected:

boolean	ib_columnheadersort
boolean 	ib_visibleonly=true
boolean 	ib_displayvalues
integer 	ii_style
string 	is_excludecolumns[]
string 	is_sortcolumn
string 	is_sortorder

n_cst_DWSrv_sortDraw		invo_sortDraw
end variables

forward prototypes
public function boolean of_getusedisplay ()
public function boolean of_getvisibleonly ()
public function integer of_setsort (string as_format)
public function string of_getsort ()
public function integer of_setvisibleonly (boolean ab_visible)
public function integer of_sort ()
public function integer of_getexclude (ref string as_excludecols[])
public function integer of_setexclude (string as_excludecols[])
public function integer of_setusedisplay (boolean ab_usedisplay)
protected function boolean of_usesdisplayvalue (string as_column)
protected function integer of_buildsortattrib (ref n_cst_sortattrib anv_sortattrib)
protected function integer of_parsesortattrib (string as_originalsort, ref n_cst_sortattrib anv_sortattrib)
public function integer of_setstyle (integer ai_style)
public function integer of_getstyle ()
public function integer of_setcolumnheader (boolean ab_switch)
public function boolean of_getcolumnheader ()
public function integer of_getregisterable (ref string as_allcolumns[])
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
public subroutine of_sortindicatornone ()
public subroutine of_sortindicatordraw ()
public function string of_getsort (datawindow vdw_getsort)
private function integer of_setsort (string as_format, boolean ab_pfcclicked)
private function integer of_setsortdraw (boolean ab_switch)
end prototypes

event type integer pfc_clicked(integer ai_xpos, integer ai_ypos, long al_row, ref dwobject adwo_obj);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		pfc_clicked
//
//	Access:    		Public
//
//	Arguments:  	(passed arguments of dw Clicked event)
//  xpos (integer)  		 	The x-position of the mouse
//  ypos (integer)  			The y-position of the mouse
//  row (long) 				The row number clicked on, if any
//	 dwo (dwobject)   		The dwobject clicked on )
//	 cntl_clicked (boolean) Indicates that the user pressed Ctnl/Click
//
//	Returns:   		Integer
//   					 1 if it succeeds.
//						 0 if no action was required.
//						-1 if an error occurs.
//
//	Description:  	Causes sorting when the user clicks on the header
//					  	of a datawindow, emulating the WIN95 style.
//					  	Click causes new sort (alternately Asc/Desc if same column).
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version:			5.0		Initial version
//						12.5		Add sort order indicator capability
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

string	ls_headername
string 	ls_colname
integer	li_rc
integer	li_suffixlen
integer	li_headerlen
string	ls_sortstring

// Validate the dwo reference.
IF IsNull(adwo_obj) OR NOT IsValid(adwo_obj) THEN	 
	Return -1
END IF 

// Check if the service is set to sort on column headers.
IF NOT of_GetColumnHeader() THEN Return 0

// Only valid on header column.
If String(adwo_obj.Name) = 'datawindow' THEN Return 0

setNull(ls_headerName)

// Get column header information.
IF isValid(invo_sortDraw) THEN
	
	//	Did the user click on the sort order indicator itself, if so
	//	treat it as if the column header was clicked
	IF invo_sortDraw.of_isSortLineClicked(String(adwo_obj.Name)) THEN
		
		//	User clicked on the sort order indicator, treat the click
		//	as a toggle between ascending/descending and vice versa.
		ls_headerName	= is_sortColumn + of_getDefaultHeaderSuffix()
		
	ELSE
		IF adwo_obj.Band <> "header" THEN Return 0
	END IF
ELSE
	IF adwo_obj.Band <> "header" THEN Return 0
END IF

IF isNull(ls_headerName) THEN ls_headerName	= String(adwo_obj.Name)

li_headerlen = Len(ls_headername)
li_suffixlen = Len(is_defaultheadersuffix)

// Extract the columname from the header label 
// (by taking out the header suffix).
IF Right(ls_headername, li_suffixlen) <> is_defaultheadersuffix THEN 
	// Cannot determine the column name from the header.	
	Return -1
END IF 	
ls_colname = Left (ls_headername, li_headerlen - li_suffixlen)

// Validate the column name.
If IsNull(ls_colname) or Len(Trim(ls_colname))=0 Then 
	Return -1
End If

// Check the previous sort click.
IF is_sortcolumn = ls_colname THEN	
	// Second sort click on the same column, reverse sort order.
	IF is_sortorder = " A" THEN 	
		is_sortorder = " D"
	ELSE
		is_sortorder = " A"
	END IF 
ELSE
	// Clicked on a different column.
	is_sortcolumn = ls_colname
	is_sortorder = " A" 
END IF 

// Build the sort string.
IF of_GetUseDisplay() And of_UsesDisplayValue(ls_colname) THEN
	ls_sortstring = "LookUpDisplay(" + ls_colname + ") " + is_sortorder 
ELSE
	ls_sortstring = is_sortcolumn + is_sortorder
END IF 

// Perform the SetSort operation (check the rc).
li_rc = of_SetSort (ls_sortstring, TRUE) 
If li_rc < 0 Then Return li_rc

// Perform the actual Sort operation (check the rc).
li_rc = of_Sort()
If li_rc < 0 Then Return li_rc

//	Draw the sort order indicator
IF isValid(invo_sortDraw) THEN invo_sortDraw.of_draw(is_sortColumn)
	
Return 1

end event

event type integer pfc_sortdlg();//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_SortDlg
//
//	(Arguments: 	None)
//
//	Returns:   		Integer
//   					 1 if it succeeds.
//						 0 if operation was cancelled by the user.
//						-1 if an error occurs.
//
//	Description:  	Sorts a datawindow based on the sort constructed
//					  	by the user thru one of the PFC Sort dialogs.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.04 Set focus back on the datawindow.
//	12.5		If sort order indicator is enabled, then make sure it is not
//				visible
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

integer	li_rc
string	ls_nullformat
SetNull (ls_nullformat) 

// Check required reference.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If

// This will open a sort dialog.
li_rc = of_SetSort (ls_nullformat) 

// Set focus back on the datawindow.
idw_requestor.SetFocus()

// Check if the user cancelled the operation (li_rc =0)
// or if otherwise failed(li_rc <-1).
IF li_rc <= 0 THEN Return li_rc

//	If a sort is set in the dialog, then make sure the sort order indicator
//	is destroyed
IF isValid(invo_sortDraw) THEN invo_sortDraw.of_drawNone()

// Sort the requesting datawindow.
Return of_Sort() 
end event

public function boolean of_getusedisplay ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetUseDisplay
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Boolean
//   					TRUE:   Use display values in sort
//  					FALSE:  Do not use display values in sort 
//
//	Description:  	To determine whether to use display values in
//               	sorts.  Set by of_SetUseDisplay.
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

Return ib_displayvalues
end function

public function boolean of_getvisibleonly ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetVisibleOnly
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Boolean
//
//	Description:  	To get the state of using visible columns only, set in 
//					  	of_SetVisibleOnly
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

Return ib_visibleonly
end function

public function integer of_setsort (string as_format);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetSort
//
//	Access:    		Public
//
//	Arguments:
//   as_format:  	A string whose value is valid sort criteria for the DataWindow.
//					  	The expression includes column names or numbers. A column number
//					  	must be preceded by a pound sign (#). If format is NULL,
//				     	function prompts you to enter the sort criteria.
//
//	Returns:   		Integer
//   					 1 if it succeeds.
//						 0 User Cancelled out of a dialog window.
//						-1 if an error occurs.
//
//	Description:  Set the sort.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Use of constants within services.
//	12.5	If sort order indicator is enabled, then make sure it is not
//			visible
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

integer					li_rc
n_cst_sortattrib		lnv_sortattrib
n_cst_returnattrib	lnv_return 

// Check the datawindow reference.
If IsNull(idw_Requestor) Or Not IsValid(idw_Requestor) Then Return -1

// If the parameter is not null, then peform a regular SetSort operation.
IF Not IsNull (as_format) THEN
	li_RC					= idw_Requestor.SetSort (as_format)
	
	//	Because we don't know that "state" of the dataWindow for every case,
	//	it is best to turn off the sort order indicator for now and let the
	//	user reselect it.  The sort could be set for objects that aren't
	//	visible and therefore the sort order indicator can't be drawn
	//	properly.
	of_sortIndicatorNone()

	Return(li_RC)
END IF 

// Passed argument was Null (as_format is null),
// call the appropriate SetSort Dialog.
CHOOSE CASE ii_style

	CASE DEFAULT  
		// 0 = Powerscript default sort style dialog.
		li_rc = idw_Requestor.SetSort (as_format) 
		// Check if the dialog was close via the Cancel button.
		If li_rc = -1 Then li_rc = 0

		//	Because we don't know that "state" of the dataWindow for every
		//	case, it is best to turn off the sort order indicator for now
		//	and let the user reselect it.  The sort could be set for objects
		//	that aren't visible and therefore the sort order indicator can't
		//	be drawn properly.
		IF li_RC = 1 THEN of_sortIndicatorNone()
		
		Return li_rc

	CASE DRAGDROP, SIMPLE, DROPDOWNLISTBOX 
		// Call one of the PFC sort dialog windows.
		IF of_BuildSortAttrib(lnv_sortattrib) <> 1 THEN Return -1
		
		IF ii_style = 1 THEN
			// 1 = Drag and Drop style dialog.
			OpenWithParm (w_sortdragdrop, lnv_sortattrib)
		ELSEIF ii_style = 2 THEN
			// 2 = Simple (single column) style dialog.
			OpenWithParm (w_sortsingle, lnv_sortattrib) 
		ELSE
			// 3 = DDLB style dialog.
			OpenWithParm (w_sortmulti, lnv_sortattrib) 			
		END IF

		// Get the return PowerObject.
		lnv_return = Message.PowerObjectParm
		// Check if the dialog was close via the Cancel button.
		IF lnv_return.ii_rc <> 1 Then Return lnv_return.ii_rc

		//	Because we don't know that "state" of the dataWindow for every
		//	case, it is best to turn off the sort order indicator for now
		//	and let the user reselect it.  The sort could be set for objects
		//	that aren't visible and therefore the sort order indicator can't
		//	be drawn properly.
		of_sortIndicatorNone()

		Return idw_Requestor.SetSort (lnv_return.is_rs)

END CHOOSE

// Invalid option.
Return -1
end function

public function string of_getsort ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetSort
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		String
//						The sort expression
//
//	Description:	Get the current sort expression on the datawindow.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			5.0   Initial version
//						12.5	Method has been overLoaded, call new method
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

Return(of_getSort(idw_Requestor))
end function

public function integer of_setvisibleonly (boolean ab_visible);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetVisibleOnly
//
//	Access:    		Public
//
//	Arguments:
//   ab_visible:  When TRUE, only include visible columns in Sort dialogs.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1
//
//	Description:  	Sets the state of use visible columns only.
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

// Verify passed arguments.
IF IsNull(ab_visible) THEN Return -1 

ib_visibleonly = ab_visible
Return 1
end function

public function integer of_sort ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Sort
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  	Sorts a datawindow and fires a message to the datawindow
//					 	to indicate that the current row may have changed.
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
integer	li_rc

li_rc = idw_Requestor.Sort() 

// Tell the datawindow that the buffer has changed and that the 
// current row may have new data.
idw_Requestor.Event pfc_rowchanged() 

Return li_rc
end function

public function integer of_getexclude (ref string as_excludecols[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetExclude
//
//	Access:    		Public
//
//	Arguments:
//   as_exclude_cols		A string array, passed by reference, that will
//			   			 	hold the exclude columns returned.
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  To get the list of exclude columns set in of_SetExclude.
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

as_excludecols = is_excludecolumns
Return 1
end function

public function integer of_setexclude (string as_excludecols[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetExclude
//
//	Access:    		Public
//
//	Arguments:
//   as_excludecols:  An array of columnnames to be excluded from
//							  sort dialogs.
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  	Establishes a list of columns to be excluded from
//					  	sort dialogs.
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

is_excludecolumns = as_excludecols
Return 1
end function

public function integer of_setusedisplay (boolean ab_usedisplay);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetUseDisplay
//
//	Access:    		Public
//
//	Arguments:
//   ab_use_display: An indicator to use/not use display values in sorts.
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  	Sets an indicator to use/not use display values in sorts.
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

// Verify passed arguments.
IF IsNull(ab_usedisplay) THEN Return -1

ib_displayvalues = ab_usedisplay
Return 1
end function

protected function boolean of_usesdisplayvalue (string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UsesDisplayValue
//
//	Access:    		protected
//
// Arguments:
//   as_column:	A datawindow columnname/computename for which you want to
//					 	determine if there is a display value
//
//	Returns:  		boolean
//   					TRUE:  The column has a display value
//	  					FALSE: The column does not have a display value or does not exist
//
//	Description:  	Determine if a datawindow column has a display value.  
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

string			ls_editstyle
string			ls_codetable

// Check parameters.
If IsNull(as_column) or Len(Trim(as_column))=0 Then Return False

ls_editstyle = Lower(idw_Requestor.Describe (as_column + ".Edit.Style"))
ls_codetable = Lower(idw_Requestor.Describe (as_column + "." + ls_editstyle + ".CodeTable"))

IF ls_editstyle = 'dddw' or ls_editstyle = 'ddlb' or ls_codetable = 'yes' THEN
	Return True
END IF

Return False

end function

protected function integer of_buildsortattrib (ref n_cst_sortattrib anv_sortattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BuildSortAttrib
//
//	Access:    		Protected
//
//	Arguments:
//   anv_sortattrib:		A NVO attribute class, passed by reference, that 
//				 				will hold sort information used by the Sort dialogs.
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description: 	Prepares the sort information required by the 
//					 	Specify Sort dialogs.
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
integer			li_numcols
integer			li_i
integer			li_j
integer			li_k
integer			li_numcomputes
integer			li_exclude
string			ls_computes[]
string			ls_dbname
string			ls_sortcolumns_all[]	// Hold all sort columns prior to any exclusions.
string			ls_sortcolumns_exc[]	// Hold sort columns after excluding appropriate ones.
boolean			lb_exclude
n_cst_string	lnv_string

// Validate dw reference.
If IsNull(idw_Requestor) Or Not IsValid(idw_Requestor) Then Return -1

// Get the current sort for the datawindow.
anv_sortattrib.is_sort = of_GetSort()

// Remove space after the comma(s) (convert ', ' to ',').
anv_sortattrib.is_sort = lnv_string.of_GlobalReplace (anv_sortattrib.is_sort, ', ', ',', FALSE)

// Parse the original sort into separate elements.
of_ParseSortAttrib ( anv_sortattrib.is_sort, anv_sortattrib )

// Get all the column names on the datawindow.
li_numcols = of_GetObjects(ls_sortcolumns_all, "column", "*", ib_visibleonly) 

// Get all the computed column names on the datawindow and add them to the array.
li_numcomputes =  of_GetObjects( ls_computes, "compute", "*", ib_visibleonly)
FOR li_i = 1 to li_numcomputes
	li_numcols++
	ls_sortcolumns_all[li_numcols] = ls_computes[li_i] 
NEXT 

// See if any columns were set to be excluded from the sort display
//	and create a new list of sort columns.
li_exclude  = UpperBound(is_excludecolumns) 
FOR li_j = 1 to li_numcols
	lb_exclude = FALSE
	FOR li_i = 1 to li_exclude
		IF Lower(is_excludecolumns [li_i]) = Lower(ls_sortcolumns_all[li_j]) THEN
			lb_exclude = TRUE
			EXIT
		END IF
	NEXT
	IF Not lb_exclude THEN 
		li_k++
		ls_sortcolumns_exc[li_k] = ls_sortcolumns_all[li_j]
	END IF
NEXT 

// Copy the list of appropriate sort columns to the nvo.
anv_sortattrib.is_sortcolumns = ls_sortcolumns_exc
li_numcols = UpperBound(anv_sortattrib.is_sortcolumns)
			
// Get the column displayname.
CHOOSE CASE of_GetColumnnameSource ( )
	CASE 0			
		//  Use dw Column Names
		FOR li_i = 1 to li_numcols
			anv_sortattrib.is_colnamedisplay[li_i] = anv_sortattrib.is_sortcolumns[li_i]
		NEXT

	CASE 1			
		//  Use Database Names
		FOR li_i = 1 to li_numcols
			ls_dbname = idw_Requestor.Describe ( anv_sortattrib.is_sortcolumns[li_i] + ".DbName" )
			IF ls_dbname = "" OR ls_dbname = "!" THEN ls_dbname = anv_sortattrib.is_sortcolumns[li_i]
			anv_sortattrib.is_colnamedisplay[li_i] = ls_dbname
		NEXT
			
	CASE 2			
		//  Use Column Headers
		FOR li_i = 1 to li_numcols
			anv_sortattrib.is_colnamedisplay[li_i] = &
					of_GetHeaderName ( anv_sortattrib.is_sortcolumns[li_i] )
		NEXT
END CHOOSE

// Determine if LookUpDisplay should automatically be added when creating sort strings
// using the PFC SetSort Dialogs.
FOR li_i = 1 to li_numcols
	IF of_GetUseDisplay() THEN 
		anv_sortattrib.ib_usedisplay[li_i] = of_UsesDisplayValue(anv_sortattrib.is_sortcolumns[li_i])
	ELSE
		anv_sortattrib.ib_usedisplay[li_i] = FALSE
	END IF 
NEXT

Return 1
end function

protected function integer of_parsesortattrib (string as_originalsort, ref n_cst_sortattrib anv_sortattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_ParseSortAttrib
//
//	Access:    		Protected
//
//	Arguments:
//   as_originalsort:	A string containing the original sort statement
//   anv_sortattrib:		A NVO attribute class, passed by reference, that 
//				 				will hold sort information used by the Sort dialogs.
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  	Parses a sort statement into individual parts.
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

integer			li_num_cols
integer			li_i
string			ls_parse
n_cst_string	lnv_string

// Parse the original sort string into separate elements, 
// in order to display the original sort when the user
// opens a sort dialog.
lnv_string.of_ParseToArray ( as_originalsort, ",", anv_sortattrib.is_origcolumns )

// Loop around all array entries.
li_num_cols = UpperBound ( anv_sortattrib.is_origcolumns ) 
FOR li_i = 1 to li_num_cols
	ls_parse = anv_sortattrib.is_origcolumns[li_i]
	
	// Remove the LookUpDisplay function if it was used in the sort.
	If Pos(Lower(ls_parse), Lower("LookUpDisplay(")) > 0 Then
		ls_parse = lnv_string.of_GlobalReplace ( ls_parse, "LookUpDisplay(", "", TRUE ) 
		ls_parse = lnv_string.of_GlobalReplace ( ls_parse, ")", "", FALSE ) 
		ls_parse = Trim ( ls_parse ) 
	End If
	
	anv_sortattrib.is_origcolumns[li_i] = lnv_string.of_GetToken (ls_parse, " ") 
	anv_sortattrib.is_origorder[li_i] = ls_parse 
NEXT 

Return 1
end function

public function integer of_setstyle (integer ai_style);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetStyle
//
//	Access:    		Public
//
//	Arguments:
//   ai_sort_style (integer)   A value that determines the style
//									    of sort dialog.
//						Values are:
//							0 = PowerBuilder default sort style dialog (Default)
//							1 = Drag and Drop style dialog
//							2 = Simple (single column) style dialog
//							3 = DDLB style dialog
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1
//
//	Description:  	Sets the style of sort dialog to be used when 
//               	of_Sort is called.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Use of constants within services.
//			Default style now has dialog help.
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

// Check to see if the passed style number is valid.
IF IsNull(ai_style) THEN 
	Return -1
End If

CHOOSE CASE ai_style
	CASE DEFAULT, DRAGDROP, SIMPLE, DROPDOWNLISTBOX
		ii_style = ai_style

		if ii_style = DEFAULT then
			if isValid (idw_requestor) then
				if len (idw_requestor.dataobject) > 0 then
					idw_requestor.object.datawindow.help.command = 1
					idw_requestor.object.datawindow.help.file = "pfcdlg.hlp"
					idw_requestor.object.datawindow.help.typeid.setsort = "1200"
					idw_requestor.object.datawindow.help.typeid.setsortexpr = "800"
				end if
			end if
		end if
		
		Return 1
END CHOOSE

Return -1
end function

public function integer of_getstyle ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetStyle
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Integer
//						0 = PowerBuilder default sort style dialog (Default)
//						1 = Drag and Drop style dialog
//						2 = Simple (single column) style dialog
//						3 = DDLB style dialog
//
//	Description: 	Determine the sort dialog style that was set 
//					  	by of_SetSortStyle
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

Return ii_style
end function

public function integer of_setcolumnheader (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetColumnHeader
//
//	Access:    		Public
//
//	Arguments:
//   ab_switch  	States if the service should sort when the user clicks
//						on a column	header.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1
//
//	Description:  	States if the service should sort when the user clicks
//						on a column	header.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	12.5	The sort order indicator is tied into the existing column header
//			logic and by default is enabled at the same time.
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

// Check arguments.
IF IsNull(ab_switch) THEN Return -1

ib_columnheadersort = ab_switch

of_setSortDraw(ab_switch)

Return 1
end function

public function boolean of_getcolumnheader ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetColumnHeader
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Boolean
//						True if the service is set to sort when the user clicks
//						on a column	header.
//
//	Description: 	Determine if the service is set to sort when the user clicks
//						on a column	header.
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

Return ib_columnheadersort
end function

public function integer of_getregisterable (ref string as_allcolumns[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetRegisterable
//
//	Access:    		Public
//
//	Arguments:
//   as_allcolumns[]		Passed by reference, that will hold all the columns 
//			(including computed columns) that the service can use to perform sorts.
//
//	Returns:   		Integer
//	# of entries
// -1 if an error occurs
//
//	Description:  
//	To get the list of all the columns (including computed columns) that the service
//	can use to perform sorts.
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

integer	li_numcols
integer	li_numcomputes
integer	li_i
string	ls_sortcolumns_all[]
string	ls_computes[]

// Get all the column names on the datawindow.
li_numcols = of_GetObjects(ls_sortcolumns_all, "column", "*", ib_visibleonly) 

// Get all the computed column names on the datawindow and add them to the array.
li_numcomputes =  of_GetObjects( ls_computes, "compute", "*", ib_visibleonly)
FOR li_i = 1 to li_numcomputes
	li_numcols++
	ls_sortcolumns_all[li_numcols] = ls_computes[li_i] 
NEXT 

as_allcolumns = ls_sortcolumns_all
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
anv_infoattrib.is_name = 'Sort'
anv_infoattrib.is_description = &
	'Provides Sort dialogs to facilitate the sorting of datawindow rows.'

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
anv_attrib.is_propertypage = {'u_tabpg_dwproperty_srvsort'}
anv_attrib.ib_switchbuttons = True

Return 1
end function

public subroutine of_sortindicatornone ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_sortIndicatorNone
//
//	Access:    		Public
//
//	Arguments:		None
//
//	Returns:   		None
//
//	Description:	Grants pfc_u_dw access to of_drawNone() in the sub-service
//						n_cst_sortDraw.  It also keeps instance variable in
//						this service in sync with n_cst_sortDraw.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version:			12.5				Initial version
//
/////////////////////////////////////////////////////////////////////////
//
//	Open Source PowerBuilder Foundation Class Libraries
//
//	Copyright (c) 2004-2017, All rights reserved.
//
//	Redistribution and use in source and binary forms, with or without
//	modification, are permitted in accordance with the MIT License
//	
//
//	https://opensource.org/licenses/MIT
//
//	======================================================================
//
//	This software consists of voluntary contributions made by many
//	individuals and was originally based on software copyright (c) 
//	1996-2004 Sybase, Inc. http://www.sybase.com.  For more
//	information on the Open Source PowerBuilder Foundation Class
//	Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

IF isValid(invo_sortDraw) THEN
	
	is_sortColumn			= ''
	is_sortOrder			= ''
	
	invo_sortDraw.of_drawNone(idw_requestor)

END IF

RETURN
end subroutine

public subroutine of_sortindicatordraw ();/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_sortIndicatorDraw
//
//	Access:    		Public
//
//	Arguments:		None
//
//	Returns:   		None
//
//	Description:	Grants pfc_u_dw access to of_draw() in the sub-service
//						n_cst_sortDraw.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version:			12.5				Initial version
//
/////////////////////////////////////////////////////////////////////////
//
//	Open Source PowerBuilder Foundation Class Libraries
//
//	Copyright (c) 2004-2017, All rights reserved.
//
//	Redistribution and use in source and binary forms, with or without
//	modification, are permitted in accordance with the MIT License
//	
//
//	https://opensource.org/licenses/MIT
//
//	======================================================================
//
//	This software consists of voluntary contributions made by many
//	individuals and was originally based on software copyright (c) 
//	1996-2004 Sybase, Inc. http://www.sybase.com.  For more
//	information on the Open Source PowerBuilder Foundation Class
//	Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

IF isValid(invo_sortDraw) THEN invo_sortDraw.of_draw(idw_requestor, is_sortColumn)

RETURN
end subroutine

public function string of_getsort (datawindow vdw_getsort);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetSort
//
//	Access:    		Public
//
//	Arguments: 		dataWindow		The dataWindow for which the current sort is
//											to be retrieved.
//
//	Returns:   		String			The sort expression
//
//	Description:	Get the current sort expression on the datawindow.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version
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

// Check the datawindow reference.
If IsNull(vdw_getSort) Or Not IsValid(vdw_getSort) Then Return ''

// Return the current sort for the datawindow.
Return vdw_getSort.Describe ("DataWindow.Table.Sort")
end function

private function integer of_setsort (string as_format, boolean ab_pfcclicked);/////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetSort
//
//	Access:    		Private			Should only be called from this object's
//											pfc_clicked event.
//
//	Arguments:		String			Valid sort criteria for the DataWindow.
//											The expression includes column name(s)
//											and/or number(s).  A column number must
//											be preceded by a pound sign (#).
//						Boolean			Indicator that this was called from the
//											pfc_clicked event.  This will cause the
//											logic to preserve the sortColumn and
//											sortOrder values.
//
//	Returns:   		Integer			 1	If it succeeds.
//											 0	User cancelled.
//											-1 if an error occurs.
//
//	Description:	Set the sort from the pfc_clicked event.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version:			12.5				Initial version
//
/////////////////////////////////////////////////////////////////////////
//
//	Open Source PowerBuilder Foundation Class Libraries
//
//	Copyright (c) 2004-2017, All rights reserved.
//
//	Redistribution and use in source and binary forms, with or without
//	modification, are permitted in accordance with the MIT License
//	
//
//	https://opensource.org/licenses/MIT
//
//	======================================================================
//
//	This software consists of voluntary contributions made by many
//	individuals and was originally based on software copyright (c) 
//	1996-2004 Sybase, Inc. http://www.sybase.com.  For more
//	information on the Open Source PowerBuilder Foundation Class
//	Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

String						ls_sortColumn,	ls_sortOrder

IF ab_pfcClicked THEN
	
	ls_sortColumn			= is_sortColumn
	ls_sortOrder			= is_sortOrder
	
END IF

Integer						li_RC
li_RC							= of_setSort(as_format)

IF ab_pfcClicked THEN
	
	is_sortColumn			= ls_sortColumn
	is_sortOrder			= ls_sortOrder
	
END IF

Return(li_RC)
end function

private function integer of_setsortdraw (boolean ab_switch);/////////////////////////////////////////////////////////////////////////
//
//	Function:		of_SetSortDraw
//
//	Access:			Private
//
//	Arguments:		boolean			TRUE	- Start (create) the service
//   										FALSE	- Stop (destroy ) the service
//
//	Returns:			Integer			 1 If Successful operation
//											 0	No action taken
//											-1	If an error occured
//
//	Description:	Starts or stops the Sort Draw Service.  This service
//						provides routines to control the drawing of a sort
//						order indicator.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version:			12.5		Initial version
//
/////////////////////////////////////////////////////////////////////////
//
//	Open Source PowerBuilder Foundation Class Libraries
//
//	Copyright (c) 2004-2017, All rights reserved.
//
//	Redistribution and use in source and binary forms, with or without
//	modification, are permitted in accordance with the MIT License
//	
//
//	https://opensource.org/licenses/MIT
//
//	======================================================================
//
//	This software consists of voluntary contributions made by many
//	individuals and was originally based on software copyright (c) 
//	1996-2004 Sybase, Inc. http://www.sybase.com.  For more
//	information on the Open Source PowerBuilder Foundation Class
//	Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

// Check arguments
IF IsNull(ab_switch) THEN Return(FAILURE)

//	Must turn on column header click sorting first
IF NOT of_getColumnHeader() THEN Return(FAILURE)

IF ab_switch THEN
	IF IsNull(invo_sortDraw) OR NOT IsValid (invo_sortDraw) THEN
		
		invo_sortDraw		= CREATE n_cst_DWSrv_sortDraw
		
		IF isValid(idw_requestor) THEN
			invo_sortDraw.of_SetRequestor(idw_requestor)
		END IF
		
		Return(SUCCESS)
		
	END IF
ELSE 
	IF IsValid(invo_sortDraw) THEN
	
		//	Destroy the sort order indicator before destructor for the
		//	service
		invo_sortDraw.of_drawNone(idw_requestor)
		
		DESTROY invo_sortDraw
		
		Return(SUCCESS)
		
	END IF
END IF

Return(NO_ACTION)
end function

on pfc_n_cst_dwsrv_sort.create
call super::create
end on

on pfc_n_cst_dwsrv_sort.destroy
call super::destroy
end on

event destructor;call super::destructor;/////////////////////////////////////////////////////////////////////////
//
//	Event:	  		destructor
//
//	Access:    		Public
//
//	Arguments:		None
//
//	Returns:   		Long
//
//	Description:	Clean up to avoid memory leaks.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version:			12.5				Initial version
//
/////////////////////////////////////////////////////////////////////////
//
//	Open Source PowerBuilder Foundation Class Libraries
//
//	Copyright (c) 2004-2017, All rights reserved.
//
//	Redistribution and use in source and binary forms, with or without
//	modification, are permitted in accordance with the MIT License
//	
//
//	https://opensource.org/licenses/MIT
//
//	======================================================================
//
//	This software consists of voluntary contributions made by many
//	individuals and was originally based on software copyright (c) 
//	1996-2004 Sybase, Inc. http://www.sybase.com.  For more
//	information on the Open Source PowerBuilder Foundation Class
//	Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

of_setColumnHeader(FALSE)
end event

