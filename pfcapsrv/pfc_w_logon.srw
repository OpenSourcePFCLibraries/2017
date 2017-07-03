HA$PBExportHeader$pfc_w_logon.srw
$PBExportComments$PFC Logon window
forward
global type pfc_w_logon from w_response
end type
type p_logo from u_p within pfc_w_logon
end type
type st_help from u_st within pfc_w_logon
end type
type cb_ok from u_cb within pfc_w_logon
end type
type cb_cancel from u_cb within pfc_w_logon
end type
type sle_userid from u_sle within pfc_w_logon
end type
type sle_password from u_sle within pfc_w_logon
end type
type st_2 from u_st within pfc_w_logon
end type
type st_3 from u_st within pfc_w_logon
end type
end forward

global type pfc_w_logon from w_response
integer x = 704
integer y = 516
integer width = 2249
integer height = 520
string title = "Logon"
long backcolor = 80263328
p_logo p_logo
st_help st_help
cb_ok cb_ok
cb_cancel cb_cancel
sle_userid sle_userid
sle_password sle_password
st_2 st_2
st_3 st_3
end type
global pfc_w_logon pfc_w_logon

type variables
Protected:
n_cst_logonattrib	inv_logonattrib
integer		ii_logonattempts = 1
end variables

on pfc_w_logon.create
int iCurrent
call super::create
this.p_logo=create p_logo
this.st_help=create st_help
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.sle_userid=create sle_userid
this.sle_password=create sle_password
this.st_2=create st_2
this.st_3=create st_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_logo
this.Control[iCurrent+2]=this.st_help
this.Control[iCurrent+3]=this.cb_ok
this.Control[iCurrent+4]=this.cb_cancel
this.Control[iCurrent+5]=this.sle_userid
this.Control[iCurrent+6]=this.sle_password
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_3
end on

on pfc_w_logon.destroy
call super::destroy
destroy(this.p_logo)
destroy(this.st_help)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.sle_userid)
destroy(this.sle_password)
destroy(this.st_2)
destroy(this.st_3)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  open
//
//	Description:  Get information from the logon object
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.04 Validate for a valid PowerObjectParm
// 6.0 	Enhanced to support multiple logon attempts.
// 6.0.01 Hide the picture if there is no application bitmap.
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

ib_disableclosequery = true

// Validate for a valid PowerObjectParm
If IsValid(Message.PowerObjectParm) Then
	If inv_logonattrib.ClassName() = Message.PowerObjectParm.ClassName() Then
		inv_logonattrib = Message.PowerObjectParm
	End IF
Else
	// Set the return code to mean the window was closed by error.
	inv_logonattrib.ii_rc = -1
	inv_logonattrib.is_userid = ""
	CloseWithReturn (this, inv_logonattrib)
	Return
End If

// User ID
sle_userid.text = inv_logonattrib.is_userid

// Password
sle_password.text = inv_logonattrib.is_password

// Logo
If Len(inv_logonattrib.is_logo) > 0 Then
	p_logo.picturename = inv_logonattrib.is_logo
Else
	p_logo.Visible = False
End If

// Application Name
if Len (inv_logonattrib.is_appname) = 0 then
	inv_logonattrib.is_appname = "the application"	
end if
st_help.text = st_help.text + inv_logonattrib.is_appname + "."

// Set the logon attempts variable
If IsValid(inv_logonattrib) Then
	If Not IsNull(inv_logonattrib.ii_logonattempts) Then
		ii_logonattempts = inv_logonattrib.ii_logonattempts
	End If
End If

// Set focus
if Len (sle_userid.text) > 0 then
	if Len (sle_password.text) > 0 then
		cb_ok.SetFocus()
	else
		sle_password.SetFocus()
	end if
else
	sle_userid.SetFocus()
end if

end event

event pfc_default;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_default
//
//	Arguments:  none
//
//	Returns:  none
//
//	Description:  Peform logon
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0 	Enhanced to support multiple logon attempts.
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

//////////////////////////////////////////////////////////////////////////////
// Check required fields
//////////////////////////////////////////////////////////////////////////////
if Len (sle_userid.text) = 0 then
	of_MessageBox ("pfc_logon_enterid", inv_logonattrib.is_appname, &
		"Please enter a User ID to logon.", exclamation!, OK!, 1)
	sle_userid.SetFocus()
	return
end if
if Len (sle_password.text) = 0 then
	of_MessageBox ("pfc_logon_enterpassword", inv_logonattrib.is_appname, &
		"Please enter a password to logon.", exclamation!, OK!, 1)
	sle_password.SetFocus()
	return
end if
if Isnull(inv_logonattrib.ipo_source) or Not IsValid (inv_logonattrib.ipo_source) then
	this.event pfc_cancel()
	return
End If

//////////////////////////////////////////////////////////////////////////////
// Attempt to logon
//////////////////////////////////////////////////////////////////////////////
ii_logonattempts --
li_rc = inv_logonattrib.ipo_source.dynamic event pfc_logon &
	(sle_userid.text, sle_password.text)
if IsNull (li_rc) then 
	this.event pfc_cancel()
	return
ElseIf li_rc <= 0 Then
	If ii_logonattempts > 0 Then
		// There are still have more attempts for a succesful login.
		of_MessageBox ("pfc_logon_incorrectpassword", "Login", &
			"The password is incorrect.", StopSign!, Ok!, 1)
		sle_password.SetFocus()
		Return
	Else
		// Failure return code
		inv_logonattrib.ii_rc = -1	
		CloseWithReturn (this, inv_logonattrib)
	End If
Else
	// Successful return code
	inv_logonattrib.ii_rc = 1
	inv_logonattrib.is_userid = sle_userid.text
	inv_logonattrib.is_password = sle_password.text	
	CloseWithReturn (this, inv_logonattrib)	
End if

Return
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
inv_logonattrib.ii_rc = 0

inv_logonattrib.is_userid = ""
CloseWithReturn (this, inv_logonattrib)
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
if inv_logonattrib.ii_rc=-99 then
	this.event pfc_cancel ()
end if
end event

type p_logo from u_p within pfc_w_logon
integer x = 37
integer y = 44
boolean originalsize = true
end type

type st_help from u_st within pfc_w_logon
integer x = 256
integer y = 44
integer width = 1522
integer height = 120
long backcolor = 79741120
string text = "Enter a User ID and password to log onto "
end type

type cb_ok from u_cb within pfc_w_logon
integer x = 1842
integer y = 28
integer taborder = 30
string text = "OK"
boolean default = true
end type

event clicked;call u_cb::clicked;parent.event pfc_default()
end event

type cb_cancel from u_cb within pfc_w_logon
integer x = 1842
integer y = 140
integer taborder = 40
string text = "Cancel"
boolean cancel = true
end type

event clicked;call u_cb::clicked;parent.event pfc_cancel()
end event

type sle_userid from u_sle within pfc_w_logon
integer x = 681
integer y = 200
integer width = 1088
integer height = 76
integer taborder = 10
boolean autohscroll = true
end type

event constructor;call u_sle::constructor;this.ib_autoselect = true
end event

type sle_password from u_sle within pfc_w_logon
integer x = 681
integer y = 304
integer width = 1088
integer height = 76
integer taborder = 20
boolean autohscroll = true
boolean password = true
end type

event constructor;call u_sle::constructor;this.ib_autoselect = true
end event

type st_2 from u_st within pfc_w_logon
integer x = 82
integer y = 208
integer width = 571
integer height = 72
string text = "User ID:"
alignment alignment = right!
end type

type st_3 from u_st within pfc_w_logon
integer x = 82
integer y = 308
integer width = 571
integer height = 72
string text = "Password:"
alignment alignment = right!
end type

