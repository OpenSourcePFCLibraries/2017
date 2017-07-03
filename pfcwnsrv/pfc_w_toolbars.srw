HA$PBExportHeader$pfc_w_toolbars.srw
$PBExportComments$PFC Customizable Toolbars window
forward
global type pfc_w_toolbars from w_response
end type
type st_selecttoolbar from u_st within pfc_w_toolbars
end type
type cb_ok from u_cb within pfc_w_toolbars
end type
type cb_cancel from u_cb within pfc_w_toolbars
end type
type cbx_text from u_cbx within pfc_w_toolbars
end type
type cbx_tips from u_cbx within pfc_w_toolbars
end type
type cb_apply from u_cb within pfc_w_toolbars
end type
type gb_app from groupbox within pfc_w_toolbars
end type
type rb_top from u_rb within pfc_w_toolbars
end type
type rb_bottom from u_rb within pfc_w_toolbars
end type
type rb_left from u_rb within pfc_w_toolbars
end type
type rb_right from u_rb within pfc_w_toolbars
end type
type rb_floating from u_rb within pfc_w_toolbars
end type
type dw_toolbars from u_dw within pfc_w_toolbars
end type
type gb_position from groupbox within pfc_w_toolbars
end type
type cb_dlghelp from u_cb within pfc_w_toolbars
end type
end forward

global type pfc_w_toolbars from w_response
integer x = 1193
integer y = 380
integer width = 1664
integer height = 1380
string title = "Customize Toolbars"
long backcolor = 80263328
st_selecttoolbar st_selecttoolbar
cb_ok cb_ok
cb_cancel cb_cancel
cbx_text cbx_text
cbx_tips cbx_tips
cb_apply cb_apply
gb_app gb_app
rb_top rb_top
rb_bottom rb_bottom
rb_left rb_left
rb_right rb_right
rb_floating rb_floating
dw_toolbars dw_toolbars
gb_position gb_position
cb_dlghelp cb_dlghelp
end type
global pfc_w_toolbars pfc_w_toolbars

type variables
Protected:

integer		ii_returncode=-99
integer		ii_toolbarindex
application	iapp_object
//	7.0   Instance variable datatype changed from os_toolbar to n_cst_toolbarattrib type
//	7.0   Instance variable name changed from istr_toolbar to inv_toolbar
n_cst_toolbarattrib	inv_toolbar[]
n_cst_toolbarattrib	inv_toolbarattrib

// 7.0	This variable is obsolete.  Left in for migration purposes.
//			DO NOT USE THIS VARIABLE
n_cst_toolbarattrib	istr_toolbar[]

end variables

event pfc_apply;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_apply
//
//	Arguments:  none
//
//	Returns:  none
//
//	Description:  Apply the changes to the toolbar properties
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

integer	li_cnt
integer	li_arraysize

// Set toolbar settings
li_arraysize = UpperBound (inv_toolbar[])
for li_cnt = 1 to li_arraysize
	inv_toolbar[li_cnt].iw_owner.SetToolbar (inv_toolbar[li_cnt].i_barindex, &
			inv_toolbar[li_cnt].b_visible, inv_toolbar[li_cnt].e_alignment, inv_toolbar[li_cnt].s_title)
next

// Set application toolbar settings
if IsValid (iapp_object) then
	iapp_object.ToolbarText = cbx_text.checked
	iapp_object.ToolbarTips = cbx_tips.checked
end if

cb_apply.Enabled = False

end event

event pfc_cancel;call w_response::pfc_cancel;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_cancel
//
//	Arguments:  none
//
//	Returns:  none
//
//	Description:  Cancel from window
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

// Set the return code.
ii_returncode = 0

// Close the window.
CloseWithReturn (this, ii_returncode)
end event

event open;call super::open;//////////////////////////////////////////////////////////////////////////////////////////
//
//	Event:  open
//
//	Description:
//	Initialize window based on passed-in object
//
//////////////////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////////////////

boolean	b_visible
integer	li_toolbarcount
integer	li_framearrayindex[]
integer	li_sheetarrayindex[]
integer	li_cnt
integer	li_titlenumber
integer	li_arraysize
integer	li_rc
long		ll_row
string		s_title
string		ls_name
toolbaralignment	le_alignment
n_cst_menu			lnv_menu
n_cst_conversion	lnv_conversion
window				lw_frame
window				lw_sheet

ib_disableclosequery = true

gb_position.SetPosition (tobottom!)

iapp_object = GetApplication()
inv_toolbarattrib = message.PowerObjectParm

// Get frame window passed in
lw_frame = inv_toolbarattrib.iw_owner

// Get the active sheet of the MDI frame
if IsValid (lw_frame) then lw_sheet = lw_frame.GetActiveSheet()

// Set the Visible and Enabled attributes of the window
cbx_text.enabled = inv_toolbarattrib.ib_largebuttonsenabled
cbx_tips.enabled = inv_toolbarattrib.ib_tooltipsenabled
if cbx_text.enabled = false and cbx_tips.enabled = false then
	gb_app.enabled = false
end if
gb_position.enabled = inv_toolbarattrib.ib_positionenabled
rb_top.enabled = inv_toolbarattrib.ib_positionenabled
rb_bottom.enabled = inv_toolbarattrib.ib_positionenabled
rb_left.enabled = inv_toolbarattrib.ib_positionenabled
rb_right.enabled = inv_toolbarattrib.ib_positionenabled
rb_floating.enabled = inv_toolbarattrib.ib_positionenabled

//////////////////////////////////////////////////////////////////////////////////////////
// Determine if frame toolbar(s) exists and add to listbox.
// Note:  li_ToolbarCount must match the Position of the new entry on lb_ToolBar.
//////////////////////////////////////////////////////////////////////////////////////////
if IsValid (lw_frame) then
	// Get an array containing all unique ToolbarItemBarIndex(s)
	If lnv_menu.of_GetAllToolbarIndex (lw_frame.MenuID, li_framearrayindex) > 0 Then
		li_arraysize = UpperBound (li_framearrayindex[])
		For li_cnt = 1 to li_arraysize
			li_rc = lw_frame.GetToolbar (li_framearrayindex[li_cnt], b_visible, le_alignment, s_title)
			If li_rc > 0 Then			
				li_toolbarcount++
				inv_toolbar[li_toolbarcount].iw_owner = lw_frame
				inv_toolbar[li_toolbarcount].i_barindex = li_framearrayindex[li_cnt]
				inv_toolbar[li_toolbarcount].b_visible = b_visible
				inv_toolbar[li_toolbarcount].e_alignment = le_alignment
				inv_toolbar[li_toolbarcount].s_title = s_title
				// Set the Toolbar title
				ls_name = inv_toolbar[li_toolbarcount].s_title
				if Len (ls_name) = 0 then 
					li_titlenumber ++
					ls_name = "Frame Toolbar"
					If li_titlenumber > 1 Then ls_name = ls_name+String (li_titlenumber)
				End If

				ll_row = dw_toolbars.InsertRow (0)
				dw_toolbars.object.toolbarname[ll_row] = ls_name
				dw_toolbars.object.toolbarvisible[ll_row] = lnv_conversion.of_String (inv_toolbar[li_toolbarcount].b_visible, "YN")

				inv_toolbar[li_toolbarcount].s_displayname = ls_name
			End If
		Next 
	end if
end if

//////////////////////////////////////////////////////////////////////////////////////////
// Determine if sheet toolbar(s) exists and add to listbox.
// Note: li_ToolbarCount must match the Position of the new entry on lb_ToolBar.
//////////////////////////////////////////////////////////////////////////////////////////
if IsValid (lw_sheet) then
	li_titlenumber = 0
	// Get an array containing all unique ToolbarItemBarIndex(s)
	If lnv_menu.of_GetAllToolbarIndex (lw_sheet.MenuID, li_sheetarrayindex) > 0 Then
		li_arraysize = UpperBound (li_sheetarrayindex[])
		For li_cnt = 1 to li_arraysize
			li_rc = lw_sheet.GetToolbar (li_sheetarrayindex[li_cnt], b_visible, le_alignment, s_title)	
			If li_rc > 0 Then
				li_toolbarcount++
				inv_toolbar[li_toolbarcount].iw_owner = lw_sheet
				inv_toolbar[li_toolbarcount].i_barindex = li_sheetarrayindex[li_cnt]	
				inv_toolbar[li_toolbarcount].b_visible = b_visible
				inv_toolbar[li_toolbarcount].e_alignment = le_alignment
				inv_toolbar[li_toolbarcount].s_title = s_title
				// Set the Toolbar title
				ls_name = inv_toolbar[li_toolbarcount].s_title
				if Len (ls_name) = 0 then 
					li_titlenumber ++
					ls_name = "Sheet Toolbar"
					If li_titlenumber > 1 Then ls_name = ls_name + String (li_titlenumber)
				End If

				ll_row = dw_toolbars.InsertRow (0)
				dw_toolbars.object.toolbarname[ll_row] = ls_name
				dw_toolbars.object.toolbarvisible[ll_row] = lnv_conversion.of_String (inv_toolbar[li_toolbarcount].b_visible, "YN")

				inv_toolbar[li_toolbarcount].s_displayname = ls_name
			End If
		Next 
	end if	
end if

// If no toolbars exist, disable controls.
if li_toolbarcount = 0 then
	cb_ok.enabled = false
	cbx_text.enabled = false
	cbx_tips.enabled = false
	gb_position.enabled = false
	gb_app.enabled = false
	rb_top.enabled = false
	rb_bottom.enabled = false
	rb_right.enabled = false
	rb_left.enabled = false
	rb_floating.enabled = false
	dw_toolbars.enabled = false
	return
End If

// Set application text and tips settings
cbx_text.checked = iapp_object.toolbartext
cbx_tips.checked = iapp_object.toolbartips

// Set current toolbar to first
if dw_toolbars.RowCount() > 0 then
	dw_toolbars.SetRow (1)
	dw_toolbars.event rowfocuschanged (1)
end if

end event

event pfc_default;call w_response::pfc_default;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_default
//
//	Arguments:  none
//
//	Returns:  none
//
//	Description:  Apply the changes then close the window
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

// Apply the changes.
this.Event pfc_apply ()

// Set the window return code.
ii_returncode = 1

// Close the window.
CloseWithReturn (this, ii_returncode)
end event

on pfc_w_toolbars.create
int iCurrent
call super::create
this.st_selecttoolbar=create st_selecttoolbar
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.cbx_text=create cbx_text
this.cbx_tips=create cbx_tips
this.cb_apply=create cb_apply
this.gb_app=create gb_app
this.rb_top=create rb_top
this.rb_bottom=create rb_bottom
this.rb_left=create rb_left
this.rb_right=create rb_right
this.rb_floating=create rb_floating
this.dw_toolbars=create dw_toolbars
this.gb_position=create gb_position
this.cb_dlghelp=create cb_dlghelp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_selecttoolbar
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.cb_cancel
this.Control[iCurrent+4]=this.cbx_text
this.Control[iCurrent+5]=this.cbx_tips
this.Control[iCurrent+6]=this.cb_apply
this.Control[iCurrent+7]=this.gb_app
this.Control[iCurrent+8]=this.rb_top
this.Control[iCurrent+9]=this.rb_bottom
this.Control[iCurrent+10]=this.rb_left
this.Control[iCurrent+11]=this.rb_right
this.Control[iCurrent+12]=this.rb_floating
this.Control[iCurrent+13]=this.dw_toolbars
this.Control[iCurrent+14]=this.gb_position
this.Control[iCurrent+15]=this.cb_dlghelp
end on

on pfc_w_toolbars.destroy
call super::destroy
destroy(this.st_selecttoolbar)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.cbx_text)
destroy(this.cbx_tips)
destroy(this.cb_apply)
destroy(this.gb_app)
destroy(this.rb_top)
destroy(this.rb_bottom)
destroy(this.rb_left)
destroy(this.rb_right)
destroy(this.rb_floating)
destroy(this.dw_toolbars)
destroy(this.gb_position)
destroy(this.cb_dlghelp)
end on

event close;call w_response::close;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  close
//
//	Description:	 Close window with return code
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

// Check that a return code has already been associated to the close operation.
If ii_returncode = -99 Then
	this.Event pfc_cancel ()
End If
end event

type st_selecttoolbar from u_st within pfc_w_toolbars
integer x = 37
integer y = 20
integer width = 1454
long backcolor = 79741120
boolean enabled = true
string text = "&Toolbars:"
end type

type cb_ok from u_cb within pfc_w_toolbars
integer x = 41
integer y = 1160
integer width = 375
integer taborder = 50
string text = "OK"
boolean default = true
end type

event clicked;call u_cb::clicked;parent.Event pfc_default ()
end event

type cb_cancel from u_cb within pfc_w_toolbars
integer x = 434
integer y = 1160
integer width = 375
integer taborder = 60
string text = "Cancel"
boolean cancel = true
end type

event clicked;call u_cb::clicked;parent.Event pfc_cancel ()
end event

type cbx_text from u_cbx within pfc_w_toolbars
integer x = 91
integer y = 936
integer width = 1358
integer height = 76
integer taborder = 30
long backcolor = 79741120
string text = "&Large Buttons"
end type

event clicked;call u_cbx::clicked;cb_apply.Enabled = True

end event

type cbx_tips from u_cbx within pfc_w_toolbars
integer x = 91
integer y = 1016
integer width = 1358
integer height = 76
integer taborder = 40
long backcolor = 79741120
string text = "&Show Tooltips"
end type

event clicked;call u_cbx::clicked;cb_apply.Enabled = True

end event

type cb_apply from u_cb within pfc_w_toolbars
integer x = 827
integer y = 1160
integer width = 375
integer taborder = 70
boolean enabled = false
string text = "&Apply"
end type

event clicked;call u_cb::clicked;parent.Event pfc_apply ()
end event

type gb_app from groupbox within pfc_w_toolbars
integer x = 37
integer y = 860
integer width = 1559
integer height = 268
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Application settings"
end type

type rb_top from u_rb within pfc_w_toolbars
integer x = 91
integer y = 472
integer width = 1358
integer height = 68
string text = "T&op"
end type

event clicked;call u_rb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//
//	Description:
//	Update the stored toolbar information
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

inv_toolbar[ii_toolbarindex].e_alignment = alignattop!
cb_apply.enabled = true
end event

type rb_bottom from u_rb within pfc_w_toolbars
integer x = 91
integer y = 536
integer width = 1358
integer height = 68
string text = "&Bottom"
end type

event clicked;call u_rb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//
//	Description:
//	Update the stored toolbar information
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

inv_toolbar[ii_toolbarindex].e_alignment = alignatbottom!
cb_apply.enabled = true
end event

type rb_left from u_rb within pfc_w_toolbars
integer x = 91
integer y = 600
integer width = 1358
integer height = 68
string text = "L&eft"
end type

event clicked;call u_rb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//
//	Description:
//	Update the stored toolbar information
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

inv_toolbar[ii_toolbarindex].e_alignment = alignatleft!
cb_apply.enabled = true
end event

type rb_right from u_rb within pfc_w_toolbars
integer x = 91
integer y = 664
integer width = 1358
integer height = 68
string text = "&Right"
end type

event clicked;call u_rb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//
//	Description:
//	Update the stored toolbar information
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

inv_toolbar[ii_toolbarindex].e_alignment = alignatright!
cb_apply.enabled = true
end event

type rb_floating from u_rb within pfc_w_toolbars
integer x = 91
integer y = 728
integer width = 1358
integer height = 68
string text = "&Floating"
end type

event clicked;call u_rb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//
//	Description:
//	Update the stored toolbar information
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

inv_toolbar[ii_toolbarindex].e_alignment = floating!
cb_apply.enabled = true
end event

type dw_toolbars from u_dw within pfc_w_toolbars
integer x = 37
integer y = 84
integer width = 1559
integer height = 312
integer taborder = 10
string dataobject = "d_toolbars"
end type

event rowfocuschanged;call super::rowfocuschanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  rowfocuschanged
//
//	Description:
//	Updates the toolbar information displayed
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

string	ls_item
string	ls_checked
n_cst_conversion lnv_conversion

// Validate row
if currentrow <= 0 then
	return
end if

inv_rowselect.of_RowSelect (currentrow)

// Obtain the current selected item
ls_item = this.object.toolbarname[currentrow]
if Len (ls_item) = 0 then
	return
end if

// Populate controls with correct values for the current toolbar selection.
ii_toolbarindex = currentrow
if ii_toolbarindex	 > 0 then
	ls_checked = lnv_conversion.of_String (inv_toolbar[ii_toolbarindex].b_visible, "YN")
	if IsNull (ls_checked) then
		ls_checked = 'N'
	end if
	this.object.toolbarvisible[currentrow] = ls_checked
	choose case inv_toolbar[ii_toolbarindex].e_alignment
		case alignattop!
			rb_top.checked = true
		case alignatbottom!
			rb_bottom.checked = true
		case alignatright!
			rb_right.checked = true
		case alignatleft!
			rb_left.checked = true
		case floating!
			rb_floating.checked = true
	end choose
end if
end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  itemchanged
//
//	Description:
//	Update toolbarvisible information
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

boolean	lb_checked
n_cst_conversion	lnv_conversion

// Validate arguments
if IsNull (dwo) then
	return
end if

if dwo.name = "toolbarvisible" then
	if ii_toolbarindex > 0 then
		lb_checked = lnv_conversion.of_Boolean (data)
		if not IsNull (lb_checked) then
			inv_toolbar[ii_toolbarindex].b_visible = lb_checked
			cb_apply.Enabled = True
		end if
	end if
end if
end event

event constructor;call super::constructor;of_SetRowSelect (true)
ib_rmbmenu = FALSE
end event

type gb_position from groupbox within pfc_w_toolbars
integer x = 37
integer y = 416
integer width = 1559
integer height = 404
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Position"
end type

type cb_dlghelp from u_cb within pfc_w_toolbars
integer x = 1221
integer y = 1160
integer width = 375
integer taborder = 80
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

showHelp ("pfcdlg.hlp", topic!, 1300)
end event

