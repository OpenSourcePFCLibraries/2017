HA$PBExportHeader$pfc_u_tabpg_dwproperty_status.sru
$PBExportComments$PFC DataWindow Property - The status tabpage
forward
global type pfc_u_tabpg_dwproperty_status from u_tabpg_dwproperty_base
end type
type gb_column from u_gb within pfc_u_tabpg_dwproperty_status
end type
type dw_requestorview from u_dw within pfc_u_tabpg_dwproperty_status
end type
type st_rownumber_t from statictext within pfc_u_tabpg_dwproperty_status
end type
type st_rowstatus from statictext within pfc_u_tabpg_dwproperty_status
end type
type st_columnname_t from statictext within pfc_u_tabpg_dwproperty_status
end type
type st_columnstatus from statictext within pfc_u_tabpg_dwproperty_status
end type
type ddlb_rowstatus from u_ddlb within pfc_u_tabpg_dwproperty_status
end type
type ddlb_columnstatus from u_ddlb within pfc_u_tabpg_dwproperty_status
end type
type st_rownumber from statictext within pfc_u_tabpg_dwproperty_status
end type
type st_columnname from statictext within pfc_u_tabpg_dwproperty_status
end type
type cbx_assistrow from u_cbx within pfc_u_tabpg_dwproperty_status
end type
type gb_row from u_gb within pfc_u_tabpg_dwproperty_status
end type
end forward

global type pfc_u_tabpg_dwproperty_status from u_tabpg_dwproperty_base
event type integer pfc_propertystats ( )
gb_column gb_column
dw_requestorview dw_requestorview
st_rownumber_t st_rownumber_t
st_rowstatus st_rowstatus
st_columnname_t st_columnname_t
st_columnstatus st_columnstatus
ddlb_rowstatus ddlb_rowstatus
ddlb_columnstatus ddlb_columnstatus
st_rownumber st_rownumber
st_columnname st_columnname
cbx_assistrow cbx_assistrow
gb_row gb_row
end type
global pfc_u_tabpg_dwproperty_status pfc_u_tabpg_dwproperty_status

type variables
Protected:
boolean ib_assistrowstatus
end variables

event pfc_propertystats;call super::pfc_propertystats;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyStat
//
//	Arguments:  
//	adwb_buffer	The requested buffer.
//
//	Returns:  none
//	
//	Description:	 
//	Update the on-screen buffer information.
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

integer		li_rc
long			ll_currow
string		ls_colname
dwItemStatus le_status
string		ls_status
n_cst_conversion lnv_conversion

ll_currow = dw_requestorview.GetRow()
ls_colname = dw_requestorview.GetColumnName()

If ll_currow > 0 And Len(ls_colname) > 0 Then
	// -- Set the stat fields. --
	// Row.
	st_rownumber.Text = string(ll_currow)
	le_status = dw_requestorview.GetItemStatus ( ll_currow, 0, Primary!)
	ls_status = lnv_conversion.of_string(le_status)
	li_rc = ddlb_rowstatus.SelectItem(ls_status, 0)
	ddlb_rowstatus.Enabled = True
	
	// Column
	st_columnname.Text = ls_colname
	le_status = dw_requestorview.GetItemStatus ( ll_currow, ls_colname, Primary!)
	ls_status = lnv_conversion.of_string(le_status)
	li_rc = ddlb_columnstatus.SelectItem(ls_status, 0)	
	ddlb_columnstatus.Enabled = True
	
Else
	// -- Clear the stat fields. --
	// Row.
	st_rownumber.Text = 'N/A'
	ddlb_rowstatus.SelectItem(0)
	ddlb_rowstatus.Enabled = False
	
	// Column.
	st_columnname.Text = 'N/A'
	ddlb_columnstatus.SelectItem(0)
	ddlb_columnstatus.Enabled = False	
End If

Return 1
end event

on pfc_u_tabpg_dwproperty_status.create
int iCurrent
call super::create
this.gb_column=create gb_column
this.dw_requestorview=create dw_requestorview
this.st_rownumber_t=create st_rownumber_t
this.st_rowstatus=create st_rowstatus
this.st_columnname_t=create st_columnname_t
this.st_columnstatus=create st_columnstatus
this.ddlb_rowstatus=create ddlb_rowstatus
this.ddlb_columnstatus=create ddlb_columnstatus
this.st_rownumber=create st_rownumber
this.st_columnname=create st_columnname
this.cbx_assistrow=create cbx_assistrow
this.gb_row=create gb_row
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_column
this.Control[iCurrent+2]=this.dw_requestorview
this.Control[iCurrent+3]=this.st_rownumber_t
this.Control[iCurrent+4]=this.st_rowstatus
this.Control[iCurrent+5]=this.st_columnname_t
this.Control[iCurrent+6]=this.st_columnstatus
this.Control[iCurrent+7]=this.ddlb_rowstatus
this.Control[iCurrent+8]=this.ddlb_columnstatus
this.Control[iCurrent+9]=this.st_rownumber
this.Control[iCurrent+10]=this.st_columnname
this.Control[iCurrent+11]=this.cbx_assistrow
this.Control[iCurrent+12]=this.gb_row
end on

on pfc_u_tabpg_dwproperty_status.destroy
call super::destroy
destroy(this.gb_column)
destroy(this.dw_requestorview)
destroy(this.st_rownumber_t)
destroy(this.st_rowstatus)
destroy(this.st_columnname_t)
destroy(this.st_columnstatus)
destroy(this.ddlb_rowstatus)
destroy(this.ddlb_columnstatus)
destroy(this.st_rownumber)
destroy(this.st_columnname)
destroy(this.cbx_assistrow)
destroy(this.gb_row)
end on

event pfc_propertyopen;call super::pfc_propertyopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyOpen
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
If Len(Trim(inv_attrib.is_dataobjectstatus)) > 0 Then
	ls_dataobject = Trim(inv_attrib.is_dataobjectstatus)
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

Return 1
end event

type gb_column from u_gb within pfc_u_tabpg_dwproperty_status
integer x = 27
integer y = 344
integer width = 1687
integer height = 280
integer taborder = 0
string text = "Column"
end type

type dw_requestorview from u_dw within pfc_u_tabpg_dwproperty_status
event type integer pfc_propertyunprotect ( )
integer x = 27
integer y = 660
integer width = 1687
integer height = 676
integer taborder = 40
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

// Start the service to highlight the current row.
this.of_SetRowSelect(True)
If IsValid(inv_rowselect) Then
	inv_rowselect.of_SetStyle(inv_rowselect.SINGLE)
End If

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

event itemfocuschanged;call super::itemfocuschanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  itemfocuschanged
//	
//	Description:	 Update the onscreen stats to match the item with focus.
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

type st_rownumber_t from statictext within pfc_u_tabpg_dwproperty_status
integer x = 64
integer y = 200
integer width = 384
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Number: "
alignment alignment = right!
boolean focusrectangle = false
end type

type st_rowstatus from statictext within pfc_u_tabpg_dwproperty_status
integer x = 718
integer y = 200
integer width = 475
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Status:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_columnname_t from statictext within pfc_u_tabpg_dwproperty_status
integer x = 64
integer y = 504
integer width = 384
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Name:"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_columnstatus from statictext within pfc_u_tabpg_dwproperty_status
integer x = 718
integer y = 504
integer width = 475
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Status:"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_rowstatus from u_ddlb within pfc_u_tabpg_dwproperty_status
integer x = 1225
integer y = 188
integer width = 416
integer height = 268
integer taborder = 20
string item[] = {"DataModified!","New!","NewModified!","NotModified!"}
end type

event selectionchanged;call super::selectionchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  selectionchanged
//	
//	Description:
//	Attempt to change the rowstatus to the new selection.
//
//	Note:
//	From PB help.
//	For rows, not all status changes are valid. 
//	For example, you cannot change NewModified! to New!. 
//	Some status changes, although allowed, result in a different status than you specify. 
//	For example, changing DataModified! to New! results in a status of NewModified!. 
//
//	The following table illustrates the effect of changing the row's original status 
//	to another status specified with SetItemStatus. If the table says Yes, 
//	then the specified status takes effect. If the table says No, 
//	specifying that status in SetItemStatus has no effect. 
//	If the table specifies a different status, it is the status that results
//	from the status you specify.
//	
//	Specified status 
//	Original status	|	New!				NewModified!	DataModified!	NotModified!
//							------------------------------------------------------------
//	New!					|	-					Yes				Yes				No
//	NewModified!		|	No					-					Yes				New!
//	DataModified!		|	NewModified!	Yes				-					Yes
//	NotModified!		|	Yes				Yes				Yes				-
//
//	When a particular status change is not allowed, you can call SetItemStatus 
//	more than once to set the row to the desired setting. For example, if you
//	want to set a row with New! status to NotModified!, you can set it first
//	to DataModified! and then to NotModified!.
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

integer		li_rc
long			ll_currow
string		ls_desiredstatus
dwItemStatus le_currentstatus
dwItemStatus le_desiredstatus
n_cst_conversion lnv_conversion

// Get the current datawindow row.
ll_currow = dw_requestorview.GetRow()

If ll_currow > 0 Then
	// Get the desired Row status.
	ls_desiredstatus = this.Text
	li_rc = lnv_conversion.of_dwItemStatus(ls_desiredstatus, le_desiredstatus)
	
	// Get the current Row status.
	le_currentstatus = dw_requestorview.GetItemStatus(ll_currow, 0, Primary!)
			
	If le_currentstatus = le_desiredstatus Then 
		// Row status requested is the same as the current.
		Return
	End If	
	
	If li_rc > 0 Then
		If ib_assistrowstatus  Then
			// Depending on the desired status, there may be a need for intermediate settings.
			If le_currentstatus = New! and le_desiredstatus = NotModified! Then
				li_rc = dw_requestorview.SetItemStatus(ll_currow, 0, Primary!, DataModified!	)	
			ElseIf le_currentstatus = NewModified! and le_desiredstatus = New! Then
				li_rc = dw_requestorview.SetItemStatus(ll_currow, 0, Primary!, DataModified!	)		
				li_rc = dw_requestorview.SetItemStatus(ll_currow, 0, Primary!, NotModified!)
			ElseIf le_currentstatus = NewModified! and le_desiredstatus = NotModified! Then
				li_rc = dw_requestorview.SetItemStatus(ll_currow, 0, Primary!, DataModified!)
			ElseIf le_currentstatus = DataModified! and le_desiredstatus = New! Then
				li_rc = dw_requestorview.SetItemStatus(ll_currow, 0, Primary!, NotModified!)
			End If
		End If
		
		// Perform final or firstAndOnly step to change the staus.
		li_rc = dw_requestorview.SetItemStatus(ll_currow, 0, Primary!, le_desiredstatus)

	End If
End If

// Update the onscreen stats.
Parent.Event pfc_PropertyStats()
end event

type ddlb_columnstatus from u_ddlb within pfc_u_tabpg_dwproperty_status
integer x = 1221
integer y = 492
integer width = 416
integer height = 268
integer taborder = 30
boolean bringtotop = true
string item[] = {"DataModified!","New!","NewModified!","NotModified!"}
end type

event selectionchanged;call super::selectionchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  selectionchanged
//	
//	Description:
//	Attempt to change the columnstatus to the new selection.
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

integer		li_rc
long			ll_currow
string		ls_colname
string		ls_status
dwItemStatus le_status
n_cst_conversion lnv_conversion

// Get the current row and column.
ll_currow = dw_requestorview.GetRow()
ls_colname = dw_requestorview.GetColumnName()

If ll_currow > 0 And Len(ls_colname) > 0 Then
	ls_status = this.Text
	li_rc = lnv_conversion.of_dwItemStatus(ls_status, le_status)
	If li_rc > 0 Then
		li_rc = dw_requestorview.SetItemStatus(ll_currow, ls_colname, Primary!, le_status)
	End If
End If

// Update the onscreen stats.
Parent.Event pfc_PropertyStats()

end event

type st_rownumber from statictext within pfc_u_tabpg_dwproperty_status
integer x = 462
integer y = 200
integer width = 251
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "N/A"
boolean focusrectangle = false
end type

type st_columnname from statictext within pfc_u_tabpg_dwproperty_status
integer x = 462
integer y = 504
integer width = 251
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "N/A"
boolean focusrectangle = false
end type

type cbx_assistrow from u_cbx within pfc_u_tabpg_dwproperty_status
integer x = 101
integer y = 104
integer width = 1577
integer height = 60
integer taborder = 10
string text = "Assist Status change"
end type

event clicked;call super::clicked;ib_assistrowstatus = this.Checked
end event

type gb_row from u_gb within pfc_u_tabpg_dwproperty_status
integer x = 27
integer y = 36
integer width = 1687
integer height = 280
integer taborder = 0
string text = "Row"
end type

