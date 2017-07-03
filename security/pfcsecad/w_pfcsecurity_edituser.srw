HA$PBExportHeader$w_pfcsecurity_edituser.srw
$PBExportComments$Response Window used to edit a single user/group
forward
global type w_pfcsecurity_edituser from w_response
end type
type dw_user from u_dw within w_pfcsecurity_edituser
end type
type cb_ok from u_cb within w_pfcsecurity_edituser
end type
type cb_cancel from u_cb within w_pfcsecurity_edituser
end type
end forward

global type w_pfcsecurity_edituser from w_response
integer x = 549
integer y = 464
integer width = 919
integer height = 512
string title = "Edit User"
long backcolor = 80921269
boolean center = true
dw_user dw_user
cb_ok cb_ok
cb_cancel cb_cancel
end type
global w_pfcsecurity_edituser w_pfcsecurity_edituser

type variables
Protected:
s_pfcsecurity_user_data istr_data
end variables

on w_pfcsecurity_edituser.create
int iCurrent
call super::create
this.dw_user=create dw_user
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_user
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.cb_cancel
end on

on w_pfcsecurity_edituser.destroy
call super::destroy
destroy(this.dw_user)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  w_pfcsecurity_edit_user
//
//	Description:  Allows the editing of user or group information
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
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License

//
// https://opensource.org/licenses/MIT
//
// ======================================================================
//
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
//////////////////////////////////////////////////////////////////////////////
window w_parent
istr_data = message.powerobjectparm
if not isvalid(istr_data) then //did we get a parameter object?
	cb_cancel.event post clicked()
	return
end if
dw_user.insertrow(0) // make a row and copy the passed information
dw_user.object.user_type[1] = istr_data.user_type
dw_user.object.name[1] = istr_data.name
dw_user.object.description[1] = istr_data.desc
dw_user.object.priority[1] = istr_data.priority

choose case istr_data.status // make it look correct 
	case 1 
		this.title = 'Add'
		dw_user.object.name.background.color = 16777215
		dw_user.object.description.background.color = 16777215
		dw_user.object.priority.background.color = 16777215
	case 2
		this.title = 'Edit'
		dw_user.object.name.tabsequence = 0
		dw_user.object.description.background.color = 16777215
		dw_user.object.priority.background.color = 16777215
	case 3 
		this.title = 'Delete'
		dw_user.object.datawindow.readonly = true
end choose
if istr_data.user_type = 0 then
	this.title = this.title + ' User'
	dw_user.object.priority.visible = false
	dw_user.object.priority_t.visible = false
	dw_user.object.priority[1] = 0
elseif istr_data.user_type = 1 then
	this.title = this.title + ' Group'
else
	this.title = this.title + ' User from Group'
	dw_user.object.priority.visible = false
	dw_user.object.priority_t.visible = false
	dw_user.object.priority[1] = 0
end if
w_parent = this.parentwindow()

// center the window on the calling window
this.move(w_parent.x + w_parent.width/2 - this.width/2,w_parent.y + w_parent.height/2- this.height/2)
end event

type dw_user from u_dw within w_pfcsecurity_edituser
integer x = 5
integer y = 24
integer width = 878
integer taborder = 10
string dataobject = "d_pfcsecurity_user_info"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event pfc_prermbmenu;call super::pfc_prermbmenu;// Set up the PopUp Menu.
am_dw.m_table.m_dash11.visible = false
am_dw.m_table.m_insert.visible = False
am_dw.m_table.m_addrow.visible = False
am_dw.m_table.m_delete.visible = False

end event

event constructor;call super::constructor;of_setupdateable(false)
end event

event itemchanged;call super::itemchanged;string ls_col 
ls_col = dwo.name
if lower(ls_col) = 'priority' and istr_data.user_type = 1 then
	if integer(data) <=	0 then
		return 1
	end if

end if
end event

event itemerror;call super::itemerror;string ls_col 
ls_col = dwo.name
if lower(ls_col) = 'priority' and istr_data.user_type = 1 then
	if integer(data) <=	0 then
		messagebox(parent.title,'Priority for groups must be greater than zero',information!)
		return 1
	end if

end if
end event

type cb_ok from u_cb within w_pfcsecurity_edituser
integer x = 133
integer y = 300
integer taborder = 20
string text = "OK"
boolean default = true
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//
//	(Arguments: None
//
//	Returns:  None
//
//	Description:  passed the information back to the calling window
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
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License

//
// https://opensource.org/licenses/MIT
//
// ======================================================================
//
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
//////////////////////////////////////////////////////////////////////////////
if dw_user.accepttext() = -1 then return
// if there have been no changes to the data  and we were not called for a delete then
// return an error code to let the calling window know that there were no changes
if dw_user.modifiedcount() = 0 and istr_data.status <> 3 then 
	istr_data.status = -1
else // otherwise return the information
	istr_data.name = dw_user.object.name[1]
	istr_data.desc = dw_user.object.description[1]
	istr_data.priority = dw_user.object.priority[1]
end if


closewithreturn(parent,istr_data)
end event

type cb_cancel from u_cb within w_pfcsecurity_edituser
integer x = 517
integer y = 300
integer taborder = 30
string text = "Cancel"
boolean cancel = true
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked
//
//	Arguments: None
//
//	Returns:  None
//
//	Description:  Close the window, returning a canceled return code
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
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License

//
// https://opensource.org/licenses/MIT
//
// ======================================================================
//
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
//////////////////////////////////////////////////////////////////////////////
dw_user.reset() // !!!Hack
istr_data.status = -1
closewithreturn(parent,istr_data)
end event

