HA$PBExportHeader$pfc_w_sortsingle.srw
$PBExportComments$PFC Simple Sort dialog window
forward
global type pfc_w_sortsingle from w_response
end type
type cbx_asc from u_cbx within pfc_w_sortsingle
end type
type cb_cancel from u_cb within pfc_w_sortsingle
end type
type cb_ok from u_cb within pfc_w_sortsingle
end type
type ddlb_sort from u_ddlb within pfc_w_sortsingle
end type
type gb_sort from u_gb within pfc_w_sortsingle
end type
type cb_dlghelp from u_cb within pfc_w_sortsingle
end type
end forward

global type pfc_w_sortsingle from w_response
integer x = 1307
integer y = 1016
integer width = 1797
integer height = 532
string title = "Sort"
long backcolor = 80263328
cbx_asc cbx_asc
cb_cancel cb_cancel
cb_ok cb_ok
ddlb_sort ddlb_sort
gb_sort gb_sort
cb_dlghelp cb_dlghelp
end type
global pfc_w_sortsingle pfc_w_sortsingle

type variables
Protected:

constant string	NONE='[None]'
constant string	ics_none='[None]'  // Obsoleted in 6.0
long		il_clickedrow
n_cst_sortattrib	inv_sortattrib
n_cst_returnattrib 	inv_return 
end variables

forward prototypes
public function string of_buildsortstring ()
end prototypes

public function string of_buildsortstring ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BuildSortString
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		String
//   					The new sort string
//
//	Description:  	This function will construct a new sort string based on
//					  	the criteria entered.
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
string 	ls_sortstring
string	ls_listboxsortcolum
string	ls_column
Integer	li_numcols_sort
Integer	li_i

// Get the new column to sort (if any)
ls_listboxsortcolum = ddlb_sort.text

IF ls_listboxsortcolum = NONE THEN
	// None was picked.
	ls_sortstring = ""
ELSE 
	// An actual column was picked.
	li_numcols_sort = UpperBound ( inv_sortattrib.is_sortcolumns )
	FOR li_i = 1 to li_numcols_sort
		If ls_listboxsortcolum = inv_sortattrib.is_colnamedisplay[li_i] Then
			// Get the actual column name.
			ls_column = inv_sortattrib.is_sortcolumns[li_i]
			// Display value or not?
			If inv_sortattrib.ib_usedisplay[li_i] Then
				ls_sortstring = "LookUpDisplay(" + ls_column + ") "		
			ELSE
				ls_sortstring = ls_column + " " 
			END IF 		
			// Ascending or Descending?
	 		IF cbx_asc.checked = TRUE THEN 
				ls_sortstring = ls_sortstring + "A"
			ELSE 
				ls_sortstring = ls_sortstring + "D"
			END IF 			
			Exit
		End If
	NEXT 
End If

Return ls_sortstring
end function

event open;call w_response::open;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  pfc_w_sortsingle
//
//	Description:  A Specify Sort dialog in a simple single-column style
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
inv_sortattrib = Message.PowerObjectParm 

// Start the base service.
of_SetBase (true)

// Center the window.
inv_base.of_center()

// Allow window to close without the CloseQuery checks being performed.
ib_disableclosequery = True
end event

on pfc_w_sortsingle.create
int iCurrent
call super::create
this.cbx_asc=create cbx_asc
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.ddlb_sort=create ddlb_sort
this.gb_sort=create gb_sort
this.cb_dlghelp=create cb_dlghelp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_asc
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.cb_ok
this.Control[iCurrent+4]=this.ddlb_sort
this.Control[iCurrent+5]=this.gb_sort
this.Control[iCurrent+6]=this.cb_dlghelp
end on

on pfc_w_sortsingle.destroy
call super::destroy
destroy(this.cbx_asc)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.ddlb_sort)
destroy(this.gb_sort)
destroy(this.cb_dlghelp)
end on

event pfc_postopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event Name:  pfc_postopen
//
//	Description:  Populate the columns list and add the previous sort
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
long		ll_found
integer	li_numcolssort, li_i
string	ls_currsortcol, ls_currsortdisplayname='[none]'

ddlb_sort.SetReDraw (FALSE)

// Get the first column of the Current Sort.
If UpperBound (inv_sortattrib.is_origcolumns) > 0 Then
	ls_currsortcol = inv_sortattrib.is_origcolumns[1]
End If

// Add the [None] option first.
ddlb_sort.AddItem (NONE)

// Populate the listbox with the column names.
// Convert the first column of the Current Sort to its display name.
li_numcolssort = UpperBound ( inv_sortattrib.is_sortcolumns )
FOR li_i = 1 to li_numcolssort
	// Populate the listbox with the column names.	
	ddlb_sort.AddItem (inv_sortattrib.is_colnamedisplay[li_i])
	
	// Convert the first column of the Current Sort to its display name.
	If ls_currsortcol = inv_sortattrib.is_sortcolumns[li_i] Then
		ls_currsortdisplayname = inv_sortattrib.is_colnamedisplay[li_i]
	End If
NEXT 

// Find the original sort column.
ll_found = ddlb_sort.FindItem(ls_currsortdisplayname, 0)
If IsNull(ll_found) or ll_found <= 0 Then
	// If no match is found then select the [None].
	ll_found = 1
End If

// Set the original sort column.
ddlb_sort.SelectItem(ll_found)
IF inv_sortattrib.is_origorder[1] = "A" THEN 
	cbx_asc.checked = TRUE
ELSE 
	cbx_asc.checked = FALSE
END IF 

ddlb_sort.SetReDraw (TRUE)
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

event pfc_default;call super::pfc_default;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_Default
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Construct the new sort string and close this dialog
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

// Set the return code to mean succesful operation.
inv_return.ii_rc = 1

// Set the new sort string.
inv_return.is_rs = of_BuildSortString ( ) 

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

type cbx_asc from u_cbx within pfc_w_sortsingle
integer x = 1038
integer y = 112
integer width = 617
integer height = 68
integer taborder = 20
string text = "Ascending"
boolean checked = true
end type

type cb_cancel from u_cb within pfc_w_sortsingle
integer x = 951
integer y = 300
integer width = 375
integer taborder = 40
string text = "Cancel"
boolean cancel = true
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Clicked!
//
//	Description:  	Perform the Cancel process.
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

Parent.Event pfc_cancel()
end event

type cb_ok from u_cb within pfc_w_sortsingle
integer x = 558
integer y = 300
integer width = 375
integer taborder = 30
boolean bringtotop = true
string text = "OK"
boolean default = true
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Clicked!
//
//	Description:  	Perform the window OK process.
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

type ddlb_sort from u_ddlb within pfc_w_sortsingle
integer x = 87
integer y = 112
integer width = 873
integer height = 296
integer taborder = 10
boolean sorted = false
end type

type gb_sort from u_gb within pfc_w_sortsingle
integer x = 32
integer y = 36
integer width = 1687
integer height = 220
integer taborder = 0
string text = "Sort items by"
end type

type cb_dlghelp from u_cb within pfc_w_sortsingle
integer x = 1344
integer y = 300
integer width = 375
integer taborder = 50
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

showHelp ("pfcdlg.hlp", topic!, 1100)
end event

