HA$PBExportHeader$pfc_w_restorerow.srw
$PBExportComments$PFC Display RestoreRow Buffer dialog window
forward
global type pfc_w_restorerow from w_response
end type
type dw_delete from u_dw within pfc_w_restorerow
end type
type cb_ok from u_cb within pfc_w_restorerow
end type
type cb_cancel from u_cb within pfc_w_restorerow
end type
type cb_selectall from u_cb within pfc_w_restorerow
end type
type cb_invertselection from u_cb within pfc_w_restorerow
end type
type cb_dlghelp from u_cb within pfc_w_restorerow
end type
end forward

global type pfc_w_restorerow from w_response
integer x = 859
integer y = 612
integer width = 1527
integer height = 748
string title = "Restore"
long backcolor = 80263328
dw_delete dw_delete
cb_ok cb_ok
cb_cancel cb_cancel
cb_selectall cb_selectall
cb_invertselection cb_invertselection
cb_dlghelp cb_dlghelp
end type
global pfc_w_restorerow pfc_w_restorerow

type variables
Protected:
integer	ii_dwmaxwidth = 1451
integer	ii_dwmaxheight = 1168
integer	ii_dwminwidth = 729
integer	ii_dwminheight = 564
n_cst_restorerowattrib inv_restorerowattrib 
n_cst_returnattrib 	inv_return
datawindow idw_parm

end variables

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  pfc_w_restorerow
//
//	Description:  Allows deleted rows to be restored to the primary buffer
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

long	ll_rowcount
long	ll_width
long	ll_height
long	 ll_loop
string ls_rownumbertype
long	ll_rownumbers[]

SetPointer (hourglass!)

ib_disableclosequery = true

// Get the Passed-in PowerObjectParm
inv_restorerowattrib  = Message.PowerObjectParm
idw_parm = inv_restorerowattrib.idw_active
dw_delete.dataobject = inv_restorerowattrib.idw_active.dataobject
dw_delete.Reset()

// Protect columns
dw_delete.inv_rowselect.of_Modify ("protect", "1", "column", "*", true)

// Copy the rows in the delete buffer to the DW control
idw_parm.RowsCopy (1, idw_parm.DeletedCount (), delete!, dw_delete, 1, primary!)
dw_delete.SelectRow (0, False)

// Get the rowcount.
ll_rowcount = dw_delete.RowCount()

// Apply the appropriate filter (length must be greater than 1).
inv_restorerowattrib.is_filter = Trim(inv_restorerowattrib.is_filter)
If Len(inv_restorerowattrib.is_filter) > 1 Then
	// Execute and validate the filter.
	If dw_delete.SetFilter(inv_restorerowattrib.is_filter) <> 1 Then 
		// Set the return code to mean the window was closed due to an invalid filter.
		inv_return.ii_rc = -1
		CloseWithReturn (this, inv_return)
		Return
	End If
	If dw_delete.Filter() <> 1 Then 
		// Set the return code to mean the window was closed due to an invalid filter.
		inv_return.ii_rc = -1
		CloseWithReturn (this, inv_return)
		Return
	End If		
End If

// Apply the appropriate sort (length must be greater than 1).
inv_restorerowattrib.is_sort = Trim(inv_restorerowattrib.is_sort)
If Len(inv_restorerowattrib.is_sort) > 1 Then
	// Execute and validate the sort.
	If dw_delete.SetSort(inv_restorerowattrib.is_sort) <> 1 Then 
		// Set the return code to mean the window was closed due to an invalid sort.
		inv_return.ii_rc = -1
		CloseWithReturn (this, inv_return)
		Return
	End If
	If dw_delete.Sort() <> 1 Then 
		// Set the return code to mean the window was closed due to an invalid sort.
		inv_return.ii_rc = -1
		CloseWithReturn (this, inv_return)
		Return
	End If		
End If	

// Prevent rows from starting highlighted.
dw_delete.SelectRow (0, False)

// Register controls for resize window service
of_SetResize (true)
inv_resize.of_Register (dw_delete, inv_resize.SCALERIGHTBOTTOM)
inv_resize.of_Register (cb_ok, inv_resize.FIXEDRIGHT)
inv_resize.of_Register (cb_cancel, inv_resize.FIXEDRIGHT)
inv_resize.of_Register (cb_invertselection, inv_resize.FIXEDRIGHT)
inv_resize.of_Register (cb_selectall, inv_resize.FIXEDRIGHT)
inv_resize.of_Register (cb_dlghelp, inv_resize.FIXEDRIGHT)

// Resize DW according to DW object passed in
ll_width = dw_delete.inv_rowselect.of_GetWidth()
ll_width = Min (ii_dwmaxwidth, ll_width)
if ll_width = ii_dwmaxwidth then
	dw_delete.hscrollbar = true
end if
ll_width = Max (ii_dwminwidth, ll_width) 

ll_height = dw_delete.inv_rowselect.of_GetHeight()
ll_height = Min (ii_dwmaxheight, ll_height)
ll_height = Max (ii_dwminheight, ll_height)

Resize (this.width + (ll_width - dw_delete.width), &
	this.height + (ll_height - dw_delete.height))

if ll_rowcount > 0 then
	cb_selectall.enabled = true
	cb_invertselection.enabled = true
else
	cb_ok.enabled = false
	cb_invertselection.enabled = false
	cb_selectall.enabled = false
end if

end event

on pfc_w_restorerow.create
int iCurrent
call super::create
this.dw_delete=create dw_delete
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.cb_selectall=create cb_selectall
this.cb_invertselection=create cb_invertselection
this.cb_dlghelp=create cb_dlghelp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_delete
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.cb_cancel
this.Control[iCurrent+4]=this.cb_selectall
this.Control[iCurrent+5]=this.cb_invertselection
this.Control[iCurrent+6]=this.cb_dlghelp
end on

on pfc_w_restorerow.destroy
call super::destroy
destroy(this.dw_delete)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.cb_selectall)
destroy(this.cb_invertselection)
destroy(this.cb_dlghelp)
end on

event pfc_default;call super::pfc_default;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_default
//
//	Description:  
//	Restore selected rows to the primary buffer
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

long	ll_row
long	ll_rowidmax
long	ll_rowid
long	ll_selectedrow
long	ll_focusrow
long	ll_restored
long	ll_originalrow
long	ll_currrow
long	ll_rowcount
long	ll_idx
integer	li_rc
boolean lb_done

SetPointer (hourglass!) 

// Validate required references.
If IsNull(idw_parm) Or Not IsValid(idw_parm) Then
	inv_return.ii_rc = -1
	CloseWithReturn (this, inv_return) 	
End If

// Get the original - current row.
ll_originalrow = idw_parm.GetRow()

// Loop around as long as there is a highlighted row.
DO
	// Get the first highlighted row.
	ll_selectedrow = dw_delete.GetSelectedRow (0)
	If ll_selectedrow > 0 Then
		// Get the original location prior to any Sorting or Filtering.
		ll_rowidmax = dw_delete.GetRowIdFromRow (ll_selectedrow)
		ll_row = ll_selectedrow
	
		// Process needs to undelete from bottom-up.
		DO
			// Get the other selected rows and check for largest ll_rowid.
			ll_selectedrow = dw_delete.GetSelectedRow (ll_selectedrow)
			If ll_selectedrow > 0 Then
				// Get the original location prior to any Sorting or Filtering.
				ll_rowid = dw_delete.GetRowIdFromRow (ll_selectedrow)
				If ll_rowid > ll_rowidmax  Then
					// A new bottom row has been found.
					ll_rowidmax = ll_rowid
					ll_row = ll_selectedrow
				End If
			End If
		LOOP UNTIL  ll_selectedrow <= 0

		// Undelete the row from the real datawindow.  Remove from the restorerow window.
		li_rc =	idw_parm.RowsMove (ll_rowidmax, ll_rowidmax, delete!, &
					idw_parm, idw_parm.RowCount() + 1 , primary!)
		dw_delete.DeleteRow(ll_row)
		
		// Validate the Undelete  was successful.
		if li_rc = 1 then
			idw_parm.SelectRow (idw_parm.RowCount(), False)
			ll_restored++
			// Make sure a search for the next row to undelete is performed
			ll_selectedrow = 1			
		else
			exit
		end if	

	End If
LOOP UNTIL ll_selectedrow <= 0

If ll_restored > 0 Then
	// Get the current row.
	ll_currrow = idw_parm.GetRow()

	// Scroll to first restored row
	ll_focusrow = idw_parm.RowCount() - ll_restored + 1
	li_rc = idw_parm.ScrolltoRow (ll_focusrow) 
	li_rc = idw_parm.SetRow (ll_focusrow)
	li_rc = idw_parm.SelectRow (0, False)

	// If the SetRow did not, Make sure notification of rowfocuschanged is sent. 
	If ll_restored > 0 And ll_currrow = ll_focusrow Then
		idw_parm.Event rowfocuschanged(ll_focusrow)
	End If
End If

// Return the number of rows restored
inv_return.ii_rc = ll_restored
CloseWithReturn (this, inv_return) 

end event

event pfc_cancel;call super::pfc_cancel;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_Cancel
//
//	Arguments:  none
//
//	Returns:  none
//
//	Description:
//	Set the return code to 0 (cancel)
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

// Set the return code to mean the window was closed by a cancel operation.
inv_return.ii_rc = 0
CloseWithReturn (this, inv_return)
end event

event close;call super::close;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  close
//
//	Description:
//	Treat window close from control menu as cancel operation
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

// If the return code matches the default value,
// then window is currently being closed as a Cancel operation.
if inv_return.ii_rc=-99 then
	this.event pfc_cancel ()
end if
end event

type dw_delete from u_dw within pfc_w_restorerow
integer x = 41
integer y = 36
integer width = 942
integer height = 572
integer taborder = 10
end type

event constructor;call u_dw::constructor;// Extended select
of_SetRowselect (true)
inv_rowselect.of_SetStyle (2)

// DW is not updateable
of_SetUpdateable (false)

// No RMB support
ib_rmbmenu = false
end event

event clicked;call u_dw::clicked;// Enable OK button if any rows are selected
if this.GetSelectedRow (0) > 0 then
	cb_ok.enabled = true
else
	cb_ok.enabled = false
end if
end event

type cb_ok from u_cb within pfc_w_restorerow
integer x = 1024
integer y = 40
integer width = 457
integer taborder = 20
boolean enabled = false
string text = "OK"
boolean default = true
end type

event clicked;call u_cb::clicked;parent.event pfc_default()
end event

type cb_cancel from u_cb within pfc_w_restorerow
integer x = 1024
integer y = 148
integer width = 457
integer taborder = 30
string text = "Cancel"
boolean cancel = true
end type

event clicked;call u_cb::clicked;parent.event pfc_cancel()
end event

type cb_selectall from u_cb within pfc_w_restorerow
integer x = 1024
integer y = 280
integer width = 457
integer taborder = 40
boolean enabled = false
string text = "Select &All"
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//
//	Description:  Select all rows
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

// Select all rows
dw_delete.SelectRow (0, true) 

// Enabled command buttons
if dw_delete.GetSelectedRow (0) > 0 then
	cb_ok.enabled = true
else
	cb_ok.enabled = false
end if
end event

type cb_invertselection from u_cb within pfc_w_restorerow
integer x = 1024
integer y = 388
integer width = 457
integer taborder = 50
boolean enabled = false
string text = "&Invert Selection"
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//
//	Description:  Invert row selection
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

// Invert row selections
dw_delete.inv_rowselect.of_InvertSelection()

// Enabled command buttons
if dw_delete.GetSelectedRow (0) > 0 then
	cb_ok.enabled = true
else
	cb_ok.enabled = false
end if
end event

type cb_dlghelp from u_cb within pfc_w_restorerow
integer x = 1024
integer y = 516
integer width = 457
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

showHelp ("pfcdlg.hlp", topic!, 700)
end event

