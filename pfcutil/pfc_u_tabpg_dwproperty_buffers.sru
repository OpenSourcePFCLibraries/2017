HA$PBExportHeader$pfc_u_tabpg_dwproperty_buffers.sru
$PBExportComments$PFC DataWindow Property - The buffers tabpage
forward
global type pfc_u_tabpg_dwproperty_buffers from u_tabpg_dwproperty_base
end type
type rb_primary from u_rb within pfc_u_tabpg_dwproperty_buffers
end type
type rb_filtered from u_rb within pfc_u_tabpg_dwproperty_buffers
end type
type rb_deleted from u_rb within pfc_u_tabpg_dwproperty_buffers
end type
type cb_sort from u_cb within pfc_u_tabpg_dwproperty_buffers
end type
type cb_filter from u_cb within pfc_u_tabpg_dwproperty_buffers
end type
type cb_undelete from u_cb within pfc_u_tabpg_dwproperty_buffers
end type
type st_primaryrowcount_t from statictext within pfc_u_tabpg_dwproperty_buffers
end type
type st_modifiedcount_t from u_st within pfc_u_tabpg_dwproperty_buffers
end type
type st_primaryrowcount from statictext within pfc_u_tabpg_dwproperty_buffers
end type
type st_modifiedcount from u_st within pfc_u_tabpg_dwproperty_buffers
end type
type st_filteredcount from statictext within pfc_u_tabpg_dwproperty_buffers
end type
type st_deletedcount from statictext within pfc_u_tabpg_dwproperty_buffers
end type
type gb_buffer from u_gb within pfc_u_tabpg_dwproperty_buffers
end type
type dw_requestorview from u_dw within pfc_u_tabpg_dwproperty_buffers
end type
type dw_requestorduplicate from u_dw within pfc_u_tabpg_dwproperty_buffers
end type
end forward

global type pfc_u_tabpg_dwproperty_buffers from u_tabpg_dwproperty_base
event type integer pfc_propertybufferchanged ( dwbuffer adwb_buffer )
event type integer pfc_propertystats ( )
event type integer pfc_propertyundelete ( )
rb_primary rb_primary
rb_filtered rb_filtered
rb_deleted rb_deleted
cb_sort cb_sort
cb_filter cb_filter
cb_undelete cb_undelete
st_primaryrowcount_t st_primaryrowcount_t
st_modifiedcount_t st_modifiedcount_t
st_primaryrowcount st_primaryrowcount
st_modifiedcount st_modifiedcount
st_filteredcount st_filteredcount
st_deletedcount st_deletedcount
gb_buffer gb_buffer
dw_requestorview dw_requestorview
dw_requestorduplicate dw_requestorduplicate
end type
global pfc_u_tabpg_dwproperty_buffers pfc_u_tabpg_dwproperty_buffers

type variables

end variables

event pfc_PropertyBufferChanged;call super::pfc_PropertyBufferChanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyBufferChanged
//
//	Arguments:  
//	adwb_buffer	The requested buffer.
//
//	Returns:  none
//	
//	Description:	 
//	Notification that the buffer has been changed or needs refresing.
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

Integer	li_rc
long		ll_filteredcount
long		ll_deletedcount

//Validate the argument
If adwb_buffer = Primary! or adwb_buffer = Filter! or adwb_buffer = Delete! Then
	// Expected value.
Else
	Return -1
End If

// Initialize
dw_requestorduplicate.Reset()


If adwb_buffer = Primary! Then
	// Set the datawindows.
	dw_requestorduplicate.Visible = False
	dw_requestorview.Visible = True

	// Set the buttons.
	cb_undelete.Enabled = False
	cb_filter.Enabled = True
	cb_sort.Enabled = True

ElseIf adwb_buffer = Filter! Then
	// For Display only.  Copy the Filtered rows to the Duplicate dw.
	ll_filteredcount = dw_requestorview.FilteredCount()
	If ll_filteredcount > 0 Then
		li_rc = dw_requestorview.RowsCopy (1, ll_filteredcount, Filter!, &
					dw_requestorduplicate, 1, Primary!)
		If li_rc <= 0 Then Return -1
	End If
	
	// Set the datawindows.
	dw_requestorduplicate.Visible = True
	dw_requestorview.Visible = False	
	
	// Set the buttons.
	cb_undelete.Enabled = False
	cb_filter.Enabled = True
	cb_sort.Enabled = False	
	
Else // Delete! buffer.
	// For Display only.  Copy the Deleted rows to the Duplicate dw.
	ll_deletedcount = dw_requestorview.DeletedCount()
	If ll_deletedcount > 0 Then
		li_rc = dw_requestorview.RowsCopy (1, dw_requestorview.DeletedCount(), Delete!,  &
					dw_requestorduplicate, 1, Primary!)
		If li_rc <= 0 Then Return -1	
	End If
	
	// Set the datawindows.
	dw_requestorduplicate.Visible = True
	dw_requestorview.Visible = False	
	
	// Set the buttons.
	cb_undelete.Enabled = False	
	cb_filter.Enabled = False
	cb_sort.Enabled = False	
	
End If

Return 1
end event

event pfc_PropertyStats;call super::pfc_PropertyStats;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_stat
//
//	Arguments:  
//	adwb_buffer	The requested buffer.
//
//	Returns:  none
//	
//	Description:	 
//	Notification that the buffer has been changed or needs refresing.
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

st_primaryrowcount.Text = string(dw_requestorview.RowCount())
st_modifiedcount.Text = string(dw_requestorview.ModifiedCount())
st_filteredcount.Text = string(dw_requestorview.FilteredCount())
st_deletedcount.Text = string(dw_requestorview.DeletedCount())

Return 1
end event

event pfc_PropertyUndelete;call super::pfc_PropertyUndelete;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyUndelete
//
//	Description:  Restore selected rows to the primary buffer
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

long	ll_selectedrow
long	ll_row
long	ll_focusrow
long	ll_restored

SetPointer (hourglass!) 

// Move selected rows from delete to primary buffer
ll_selectedrow = dw_requestorduplicate.GetSelectedRow (0)
ll_row = ll_selectedrow
do while ll_selectedrow > 0 
	if dw_requestorview.RowsMove (ll_row, ll_row, delete!, dw_requestorview, dw_requestorview.RowCount() + 1 , primary!) = 1 then
		ll_restored++
		ll_selectedrow = dw_requestorduplicate.GetSelectedRow (ll_selectedrow)
		ll_row = ll_selectedrow - ll_restored
	else
		exit
	end if
loop

// Scroll to first restored row
ll_focusrow = dw_requestorview.RowCount() - ll_restored + 1
dw_requestorview.ScrolltoRow (ll_focusrow) 

dw_requestorview.SetRow (ll_focusrow)

// Return the number of rows restored
Return ll_restored

end event

on pfc_u_tabpg_dwproperty_buffers.create
int iCurrent
call super::create
this.rb_primary=create rb_primary
this.rb_filtered=create rb_filtered
this.rb_deleted=create rb_deleted
this.cb_sort=create cb_sort
this.cb_filter=create cb_filter
this.cb_undelete=create cb_undelete
this.st_primaryrowcount_t=create st_primaryrowcount_t
this.st_modifiedcount_t=create st_modifiedcount_t
this.st_primaryrowcount=create st_primaryrowcount
this.st_modifiedcount=create st_modifiedcount
this.st_filteredcount=create st_filteredcount
this.st_deletedcount=create st_deletedcount
this.gb_buffer=create gb_buffer
this.dw_requestorview=create dw_requestorview
this.dw_requestorduplicate=create dw_requestorduplicate
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_primary
this.Control[iCurrent+2]=this.rb_filtered
this.Control[iCurrent+3]=this.rb_deleted
this.Control[iCurrent+4]=this.cb_sort
this.Control[iCurrent+5]=this.cb_filter
this.Control[iCurrent+6]=this.cb_undelete
this.Control[iCurrent+7]=this.st_primaryrowcount_t
this.Control[iCurrent+8]=this.st_modifiedcount_t
this.Control[iCurrent+9]=this.st_primaryrowcount
this.Control[iCurrent+10]=this.st_modifiedcount
this.Control[iCurrent+11]=this.st_filteredcount
this.Control[iCurrent+12]=this.st_deletedcount
this.Control[iCurrent+13]=this.gb_buffer
this.Control[iCurrent+14]=this.dw_requestorview
this.Control[iCurrent+15]=this.dw_requestorduplicate
end on

on pfc_u_tabpg_dwproperty_buffers.destroy
call super::destroy
destroy(this.rb_primary)
destroy(this.rb_filtered)
destroy(this.rb_deleted)
destroy(this.cb_sort)
destroy(this.cb_filter)
destroy(this.cb_undelete)
destroy(this.st_primaryrowcount_t)
destroy(this.st_modifiedcount_t)
destroy(this.st_primaryrowcount)
destroy(this.st_modifiedcount)
destroy(this.st_filteredcount)
destroy(this.st_deletedcount)
destroy(this.gb_buffer)
destroy(this.dw_requestorview)
destroy(this.dw_requestorduplicate)
end on

event pfc_propertyopen;call super::pfc_propertyopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_Propertyopen
//
//	Arguments:  None
//
//	Returns:  Integer
//	
//	Description:	 
//	
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

// Update the onscreen stats.
Event pfc_PropertyStats()

Return 1

end event

event pfc_propertyinitialize;call super::pfc_propertyinitialize;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyInitialize
//
//	Arguments:  
//	 anv_attrib   The datawindow property attributes.
//
//	Returns: Integer
//	 1 = successful
// -1 = Error
//
//	Description:
//	 Initializes the object.
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

integer	li_rc
string 	ls_dataobject

// Determine which Dataobject to try first.
If Len(Trim(inv_attrib.is_dataobjectbuffer)) > 0 Then
	ls_dataobject = Trim(inv_attrib.is_dataobjectbuffer)
Else
	ls_dataobject = idw_requestor.DataObject
End If

// Set/Validate the dataobject on the RequestorView used for the Primary view.
dw_requestorview.DataObject = ls_dataobject
li_rc = idw_requestor.ShareData ( dw_requestorview )
If li_rc <= 0 Then
	// Try the Dataobject associated with the Requestor.
	ls_dataobject = idw_requestor.DataObject
	dw_requestorview.DataObject = ls_dataobject
	li_rc = idw_requestor.ShareData ( dw_requestorview )
	If li_rc <= 0 Then	
		Return -1
	End If
End If

// Make all the columns available. 
li_rc = dw_requestorview.Event pfc_propertyunprotect()

// Set the new dataobject on the DuplicateDW used for Filter and Delete views.
// Make sure that the DuplicateDW is readonly.
dw_requestorduplicate.DataObject = ls_dataobject
dw_requestorduplicate.Object.DataWindow.ReadOnly = "Yes"

Return 1
end event

type rb_primary from u_rb within pfc_u_tabpg_dwproperty_buffers
integer x = 229
integer y = 168
integer width = 631
integer height = 68
string text = "&Primary"
boolean checked = true
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//
//	Description:	 Notification to refresh the main object view.
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

Parent.Event pfc_PropertyBufferChanged(Primary!)
end event

type rb_filtered from u_rb within pfc_u_tabpg_dwproperty_buffers
integer x = 229
integer y = 256
integer width = 631
integer height = 68
boolean bringtotop = true
string text = "&Filtered"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//
//	Description:	 Notification to refresh the main object view.
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

Parent.Event pfc_PropertyBufferChanged(Filter!)
end event

type rb_deleted from u_rb within pfc_u_tabpg_dwproperty_buffers
integer x = 229
integer y = 344
integer width = 631
integer height = 68
boolean bringtotop = true
string text = "&Deleted"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//
//	Description:	 Notification to refresh the main object view.
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

Parent.Event pfc_PropertyBufferChanged(Delete!)
end event

type cb_sort from u_cb within pfc_u_tabpg_dwproperty_buffers
integer x = 896
integer y = 1260
integer width = 398
integer taborder = 50
string text = "&Sort"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//
//	Description:	 Notify the view datawindow to display its sort dialog.
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

// Notify the datawindow to display its sort dialog.
Parent.Enabled = False
dw_requestorview.Event pfc_sortdlg()
Parent.Enabled = True

// Reset focus to this control.
this.SetFocus()
end event

type cb_filter from u_cb within pfc_u_tabpg_dwproperty_buffers
integer x = 1317
integer y = 1260
integer width = 398
integer taborder = 60
boolean bringtotop = true
string text = "&Filter"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//
//	Description:	 Notify the view datawindow to display its filter dialog.
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

// Notify the datawindow to display its filter dialog.
Parent.Enabled = False
dw_requestorview.Event pfc_filterdlg()
Parent.Enabled = True

// Update the onscreen stats.
Parent.Event pfc_PropertyStats()

// Refresh the Duplicate DW which is currently displaying the filtered rows.
If rb_filtered.Checked Then
	rb_filtered.Event Clicked()
End If

// Reset focus to this control.
this.SetFocus()
end event

type cb_undelete from u_cb within pfc_u_tabpg_dwproperty_buffers
event type integer pfc_selectionchange ( )
integer x = 475
integer y = 1260
integer width = 398
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string text = "&Undelete"
end type

event pfc_selectionchange;call super::pfc_selectionchange;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_selectionchange
//	
//	Description:	 Enable or Disable button depending on Highlighted rows.
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

// Option is only valid for the Delete! buffer.
If rb_deleted.Checked Then
	// Enable or Disable button depending on Highlighted rows.
	this.Enabled = (dw_requestorduplicate.GetSelectedRow(0) > 0)
End If

Return 1
end event

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//	
//	Description:	 Perform Undelete functionality.
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

// Perform Undelete functionality.
Parent.Event pfc_PropertyUndelete()

// Update the onscreen stats.
Parent.Event pfc_PropertyStats()

// Refresh the Duplicate DW which is currently displaying the Deleted rows.
If rb_deleted.Checked Then
	rb_deleted.Event Clicked()
End If

// Reset focus to this control.
this.SetFocus()
end event

type st_primaryrowcount_t from statictext within pfc_u_tabpg_dwproperty_buffers
integer x = 905
integer y = 88
integer width = 466
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "RowCount:"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_modifiedcount_t from u_st within pfc_u_tabpg_dwproperty_buffers
integer x = 229
integer y = 428
integer width = 631
string text = "Modified:"
end type

type st_primaryrowcount from statictext within pfc_u_tabpg_dwproperty_buffers
integer x = 946
integer y = 164
integer width = 215
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_modifiedcount from u_st within pfc_u_tabpg_dwproperty_buffers
integer x = 946
integer y = 428
integer width = 215
integer height = 68
boolean bringtotop = true
string text = "0"
alignment alignment = right!
end type

type st_filteredcount from statictext within pfc_u_tabpg_dwproperty_buffers
integer x = 946
integer y = 252
integer width = 215
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_deletedcount from statictext within pfc_u_tabpg_dwproperty_buffers
integer x = 946
integer y = 340
integer width = 215
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_buffer from u_gb within pfc_u_tabpg_dwproperty_buffers
integer x = 27
integer y = 36
integer width = 1687
integer height = 508
integer taborder = 10
string text = "Buffer"
end type

type dw_requestorview from u_dw within pfc_u_tabpg_dwproperty_buffers
event type integer pfc_propertyunprotect ( )
integer x = 27
integer y = 584
integer width = 1687
integer height = 648
integer taborder = 20
boolean hscrollbar = true
end type

event pfc_propertyunprotect;call super::pfc_propertyunprotect;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_propertyunprotect
//
//	Arguments:  None
//
//	Returns: Integer
//	 1 = successful
// -1 = Error
//
//	Description:
//	 Unprotects all columns.
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

integer	li_rc
integer	li_upper
integer	li_cnt
integer	li_value
string	ls_rc
string	ls_modifyexp
string	ls_collist[]

// Validate required reference.
If IsNull(inv_reqcolumn) or Not IsValid(inv_reqcolumn) Then
	Return -1
End If

// Get a list of the visible columns.
li_rc = inv_reqcolumn.of_GetObjects (ls_collist, "column", "*", true) 
li_upper = UpperBound(ls_collist)

// Loop around all columns to unprotect them.
For li_cnt = 1 to li_upper
	ls_modifyexp += ls_collist[li_cnt] + ".Protect = 0 "
Next
If Len(ls_modifyexp) > 0 Then
	ls_rc = this.Modify(ls_modifyexp)
	If Len(ls_rc) > 0 Then Return -1
End If

// Loop around all columns to make sure they have a tabsequence.
ls_modifyexp = ''
For li_cnt = 1 to li_upper
	ls_modifyexp += ls_collist[li_cnt] + ".TabSequence="+ String(li_cnt+li_value)+ " "
	li_value += 10
Next
If Len(ls_modifyexp) > 0 Then
	ls_rc = this.Modify(ls_modifyexp)
	If Len(ls_rc) > 0 Then Return -1
End If

Return 1
end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  constructor
//	
//	Description:	 Start desired services.
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

// Start the service to allow moving past required columns.
this.of_SetReqColumn(True)

// Start the service to help Manage inserts and deletes.
this.of_SetRowManager(True)
inv_rowmanager.of_SetRestoreRow(False)

// Start the service to highlight the current row.
this.of_SetRowSelect(True)
inv_rowselect.of_SetStyle(inv_rowselect.EXTENDED)

// Start the service to allow Filtering.
this.of_SetFilter(True)
inv_filter.of_SetStyle(inv_filter.DEFAULT)

// Start the service to allow sorting.
this.of_SetSort(True)
inv_sort.of_SetStyle(inv_sort.DROPDOWNLISTBOX )

end event

event pfc_deleterow;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_deleterow
//	
//	Description:	 After deleting rows, update the onscreen stats.
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

// ------ Override Ancestor in order to get its return code --------

integer	li_rc

li_rc = Super::EVENT pfc_deleterow( )

// Update the onscreen stats.
Parent.Event pfc_PropertyStats()

Return li_rc
end event

event pfc_addrow;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_deleterow
//	
//	Description:	 After Adding rows, update the onscreen stats.
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

// ------ Override Ancestor in order to get its return code --------

integer	li_rc

li_rc = Super::EVENT pfc_addrow( )

// Update the onscreen stats.
Parent.Event pfc_PropertyStats()


Return li_rc
end event

event pfc_insertrow;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_deleterow
//	
//	Description:	 After inserting rows, update the onscreen stats.
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

// ------ Override Ancestor in order to get its return code --------

integer	li_rc

li_rc = Super::EVENT pfc_insertrow( )

// Update the onscreen stats.
Parent.Event pfc_PropertyStats()

Return li_rc
end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  itemchanged
//	
//	Description:	 After an item changes, update the onscreen stats.
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

// Update the onscreen stats by posting the event.
Parent.Post Event pfc_PropertyStats()

end event

event pfc_restorerow;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_deleterow
//	
//	Description:	 After Restoring rows, update the onscreen stats.
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

// ------ Override Ancestor in order to get its return code --------

integer	li_rc

li_rc = Super::EVENT pfc_restorerow( )

// Update the onscreen stats.
Parent.Event pfc_PropertyStats()

Return li_rc
end event

type dw_requestorduplicate from u_dw within pfc_u_tabpg_dwproperty_buffers
integer x = 27
integer y = 584
integer width = 1687
integer height = 648
integer taborder = 30
boolean hscrollbar = true
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  constructor
//	
//	Description:	 Start desired services.
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

// Always start out hidden.
this.Visible = False

// Start the service to Select Rows.
this.of_SetRowSelect(True)
If IsValid(inv_rowselect) Then
	inv_rowselect.of_SetStyle(inv_rowselect.EXTENDED)
End If

end event

event rowfocuschanged;call super::rowfocuschanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  rowfocuschanged
//	
//	Description:	 Notify the Undelete button of possible row selection changes.
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

// Notify the Undelete button of possible row selection changes.
cb_undelete.Post Event pfc_selectionchange()

Return 


end event

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//	
//	Description:	 Notify the Undelete button of possible row selection changes.
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

// ------ Override Ancestor in order to get its return code --------

integer	li_rc

li_rc = Super::EVENT clicked(xpos, ypos, row, dwo)

// Notify the Undelete button of possible row selection changes.
cb_undelete.Post Event pfc_selectionchange()

Return li_rc

end event

event lbuttonup;call super::lbuttonup;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  lbuttonup
//	
//	Description:	 Notify the Undelete button of possible row selection changes.
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

// Notify the Undelete button of possible row selection changes.
cb_undelete.Post Event pfc_selectionchange()

end event

event rbuttondown;call super::rbuttondown;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  rbuttondown
//	
//	Description:	 Notify the Undelete button of possible row selection changes.
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

// Notify the Undelete button of possible row selection changes.
cb_undelete.Post Event pfc_selectionchange()

end event

event rbuttonup;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  rbuttonup
//	
//	Description:	 Notify the Undelete button of possible row selection changes.
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

// ------ Override Ancestor in order to get its return code --------

integer	li_rc

li_rc = Super::EVENT rbuttonup(xpos, ypos, row, dwo)

// Notify the Undelete button of possible row selection changes.
cb_undelete.Post Event pfc_selectionchange()

Return li_rc

end event

