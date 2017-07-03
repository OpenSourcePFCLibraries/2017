HA$PBExportHeader$pfc_w_replace.srw
$PBExportComments$PFC Replace window
forward
global type pfc_w_replace from w_popup
end type
type st_findwhere from u_st within pfc_w_replace
end type
type st_findwhat from u_st within pfc_w_replace
end type
type ddlb_findwhere from u_ddlb within pfc_w_replace
end type
type st_searchdirection from u_st within pfc_w_replace
end type
type cbx_wholeword from u_cbx within pfc_w_replace
end type
type cbx_matchcase from u_cbx within pfc_w_replace
end type
type cb_findnext from u_cb within pfc_w_replace
end type
type cb_cancel from u_cb within pfc_w_replace
end type
type sle_findwhat from u_sle within pfc_w_replace
end type
type sle_replace from u_sle within pfc_w_replace
end type
type st_replace from u_st within pfc_w_replace
end type
type cb_replace from u_cb within pfc_w_replace
end type
type cb_replaceall from u_cb within pfc_w_replace
end type
type ddlb_searchdirection from pfc_u_ddlb within pfc_w_replace
end type
type cb_dlghelp from u_cb within pfc_w_replace
end type
end forward

global type pfc_w_replace from w_popup
integer x = 384
integer y = 560
integer width = 2190
integer height = 1012
string title = "Replace"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
long backcolor = 80263581
event pfc_default ( )
event pfc_findnext ( )
event pfc_replace ( )
event pfc_replaceall ( )
st_findwhere st_findwhere
st_findwhat st_findwhat
ddlb_findwhere ddlb_findwhere
st_searchdirection st_searchdirection
cbx_wholeword cbx_wholeword
cbx_matchcase cbx_matchcase
cb_findnext cb_findnext
cb_cancel cb_cancel
sle_findwhat sle_findwhat
sle_replace sle_replace
st_replace st_replace
cb_replace cb_replace
cb_replaceall cb_replaceall
ddlb_searchdirection ddlb_searchdirection
cb_dlghelp cb_dlghelp
end type
global pfc_w_replace pfc_w_replace

type variables
Public:
n_cst_findattrib	inv_findattrib

end variables

event pfc_default;call w_popup::pfc_default;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_default
//
//	Arguments: 		None
//	
//	Returns:  		None
//
//	Description:   Gather all the inforamtion entered by the user.
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

//Set text to search for.
inv_findattrib.is_find = sle_findwhat.text

//Set searchwhere index (this index is the array number the user selected).
inv_findattrib.ii_lookindex = ddlb_findwhere.finditem(ddlb_findwhere.text,1)

//Set text which replaces the searched text.
inv_findattrib.is_replacewith = sle_replace.text

//Set the direction flag.
inv_findattrib.is_direction = ddlb_searchdirection.text

//Set wholeword flag
inv_findattrib.ib_wholeword = cbx_wholeword.checked

//St match case flag
inv_findattrib.ib_matchcase = cbx_matchcase.checked


end event

event pfc_findnext;call super::pfc_findnext;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_findnext
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Populate the find attributes and perform the find next
//						processing.
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

//Populate the find attributes.
this.Event pfc_default ()

//Call event on requestor to process.
If inv_findattrib.ipo_requestor.dynamic event pfc_findnext(inv_findattrib) = 0 Then
	of_Messagebox("pfc_replace_finishsearch", this.Title, &
		this.Title+" has finished searching.", Information!, Ok!, 1)
end if

end event

event pfc_replace;call super::pfc_replace;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_replace
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Populate the find attributes and perform the replace
//						processing.
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

//Populate the find attributes.
this.Event pfc_default ()

//Call event on requestor to process.
If inv_findattrib.ipo_requestor.dynamic event pfc_replace(inv_findattrib) = 0 Then
	of_Messagebox("pfc_replace_finishreplacesearch", this.Title, &
		this.Title+" has finished searching.", Information!, Ok!, 1)
end if

end event

event pfc_replaceall;call super::pfc_replaceall;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_repaceall
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Populate the find attributes and perform the replace all
//						processing.
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

long ll_rc

//Populate the find attributes.
this.Event pfc_default ()

//Call event on requestor to process.
ll_rc = inv_findattrib.ipo_requestor.dynamic event pfc_replaceall(inv_findattrib)
If ll_rc >=0 Then
	of_MessageBox("pfc_replace_finishreplace", this.Title, &
		this.Title+" has finished replacing "+string(ll_rc)+" items.", &
		Information!, Ok!, 1)
end if

end event

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Open
//
//	Arguments: 		None
//	
// Returns:  		None	
//
//	Description:  	This event is used to initialize the window using the passed in
//						nvo-structure
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0	Window height does not change due to accomodate help button
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
integer	li_adjust

//Make a local copy of attribute nvo-structure
inv_findattrib = message.powerobjectparm

//Allow window to close without the CloseQuery checks being performed.
ib_disableclosequery = True

//////////////////////////////////////////////////////////////////////////////
// Set the Enabled/Visible attributes for the appropriate controls.
//////////////////////////////////////////////////////////////////////////////

//The Whole Word control.
cbx_wholeword.Visible = inv_findattrib.ib_wholewordvisible
cbx_wholeword.Enabled = inv_findattrib.ib_wholewordenabled

//The Match Case control.
cbx_matchcase.Visible = inv_findattrib.ib_matchcasevisible
cbx_matchcase.Enabled = inv_findattrib.ib_matchcaseenabled

//The lookup controls.
ddlb_findwhere.Visible = inv_findattrib.ib_lookvisible
st_findwhere.Visible = inv_findattrib.ib_lookvisible
ddlb_findwhere.Enabled = inv_findattrib.ib_lookenabled
st_findwhere.Enabled = inv_findattrib.ib_lookenabled

//The direction controls.
ddlb_searchdirection.Visible = inv_findattrib.ib_directionvisible
st_searchdirection.Visible = inv_findattrib.ib_directionvisible
ddlb_searchdirection.Enabled = inv_findattrib.ib_directionenabled
st_searchdirection.Enabled = inv_findattrib.ib_directionenabled

//////////////////////////////////////////////////////////////////////////////
// Initialize controls with the appropriate data.
//////////////////////////////////////////////////////////////////////////////

//Set the lookup values.
If ddlb_findwhere.visible Then
	li_count = upperbound(inv_findattrib.is_lookdata)
	if li_count >0  THEN 
		for li_i=1 TO li_count
			ddlb_findwhere.additem(inv_findattrib.is_lookdisplay[li_i])
		next
	end if
	If inv_findattrib.ii_lookindex > 0 Then
		ddlb_findwhere.SelectItem(inv_findattrib.ii_lookindex)	
	Else
		ddlb_findwhere.SelectItem(1)	
	End If
End If

//Set text to Find What.
sle_findwhat.text = inv_findattrib.is_find

//Set the text to replace with.
sle_replace.text = inv_findattrib.is_replacewith

//Set the WholeWord flag.
If cbx_wholeword.Visible Then
	cbx_wholeword.Checked = inv_findattrib.ib_wholeword
End If

//Set the MatchCase flag.
If cbx_matchcase.Visible Then
	cbx_matchcase.Checked = inv_findattrib.ib_matchcase
End If	

//Set the Direction attribute.
If ddlb_searchdirection.visible Then
	If Lower(inv_findattrib.is_direction)= 'up' Then
		ddlb_searchdirection.Text = 'Up'
	Else
		ddlb_searchdirection.Text = 'Down'
	End If
End If

//////////////////////////////////////////////////////////////////////////////
// Resize window and Move controls, if appropriate.
//////////////////////////////////////////////////////////////////////////////

//If the lookup controls are not visible, moving of other controls is required.
if ddlb_findwhere.visible = False then
	// calculate Y position to adjust.
	li_adjust = sle_findwhat.y - ddlb_findwhere.y

	//Move Controls up
	cbx_matchcase.y = cbx_matchcase.y - li_adjust
	cbx_wholeword.y = cbx_wholeword.y - li_adjust
	st_searchdirection.y = st_searchdirection.y - li_adjust	
	ddlb_searchdirection.y = ddlb_searchdirection.y - li_adjust
	st_replace.y = st_replace.y - li_adjust	
	sle_replace.y = sle_replace.y  - li_adjust
	st_findwhat.y = st_findwhat.y - li_adjust	
	sle_findwhat.y = sle_findwhat.y - li_adjust
	
	//Set focus on the appropriate control.
	sle_findwhat.setfocus()
end if

//If the wholeword is not visible, move the matchase control.
If cbx_wholeword.visible = False and cbx_matchcase.Visible Then
	cbx_matchcase.Y = cbx_wholeword.Y
End If

//If all bottom conrols are not visible, adjust the size of the window.
If ddlb_searchdirection.Visible=False And cbx_wholeword.visible = False And &
	cbx_matchcase.Visible= False Then
End If
end event

on pfc_w_replace.create
int iCurrent
call super::create
this.st_findwhere=create st_findwhere
this.st_findwhat=create st_findwhat
this.ddlb_findwhere=create ddlb_findwhere
this.st_searchdirection=create st_searchdirection
this.cbx_wholeword=create cbx_wholeword
this.cbx_matchcase=create cbx_matchcase
this.cb_findnext=create cb_findnext
this.cb_cancel=create cb_cancel
this.sle_findwhat=create sle_findwhat
this.sle_replace=create sle_replace
this.st_replace=create st_replace
this.cb_replace=create cb_replace
this.cb_replaceall=create cb_replaceall
this.ddlb_searchdirection=create ddlb_searchdirection
this.cb_dlghelp=create cb_dlghelp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_findwhere
this.Control[iCurrent+2]=this.st_findwhat
this.Control[iCurrent+3]=this.ddlb_findwhere
this.Control[iCurrent+4]=this.st_searchdirection
this.Control[iCurrent+5]=this.cbx_wholeword
this.Control[iCurrent+6]=this.cbx_matchcase
this.Control[iCurrent+7]=this.cb_findnext
this.Control[iCurrent+8]=this.cb_cancel
this.Control[iCurrent+9]=this.sle_findwhat
this.Control[iCurrent+10]=this.sle_replace
this.Control[iCurrent+11]=this.st_replace
this.Control[iCurrent+12]=this.cb_replace
this.Control[iCurrent+13]=this.cb_replaceall
this.Control[iCurrent+14]=this.ddlb_searchdirection
this.Control[iCurrent+15]=this.cb_dlghelp
end on

on pfc_w_replace.destroy
call super::destroy
destroy(this.st_findwhere)
destroy(this.st_findwhat)
destroy(this.ddlb_findwhere)
destroy(this.st_searchdirection)
destroy(this.cbx_wholeword)
destroy(this.cbx_matchcase)
destroy(this.cb_findnext)
destroy(this.cb_cancel)
destroy(this.sle_findwhat)
destroy(this.sle_replace)
destroy(this.st_replace)
destroy(this.cb_replace)
destroy(this.cb_replaceall)
destroy(this.ddlb_searchdirection)
destroy(this.cb_dlghelp)
end on

type st_findwhere from u_st within pfc_w_replace
integer x = 32
integer y = 48
integer width = 526
integer height = 72
long backcolor = 79416533
string text = "Find wher&e"
end type

type st_findwhat from u_st within pfc_w_replace
integer x = 32
integer y = 176
integer width = 526
integer height = 72
long backcolor = 79416533
string text = "Fi&nd what"
end type

type ddlb_findwhere from u_ddlb within pfc_w_replace
integer x = 571
integer y = 48
integer width = 1056
integer height = 308
integer taborder = 10
boolean sorted = false
integer accelerator = 101
end type

type st_searchdirection from u_st within pfc_w_replace
integer x = 32
integer y = 428
integer width = 526
integer height = 72
long backcolor = 79416533
string text = "&Search"
end type

type cbx_wholeword from u_cbx within pfc_w_replace
integer x = 571
integer y = 696
integer width = 1504
integer height = 72
integer taborder = 50
long backcolor = 79416533
string text = "Whole &Word"
end type

type cbx_matchcase from u_cbx within pfc_w_replace
integer x = 571
integer y = 792
integer width = 1504
integer height = 72
integer taborder = 60
long backcolor = 79416533
string text = "Match &Case  "
end type

type cb_findnext from u_cb within pfc_w_replace
integer x = 1696
integer y = 36
integer width = 402
integer taborder = 70
string text = "&Find Next"
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event: 		 	Clicked
//
//	Arguments: 		None
//
//	Returns:  		None
//
//	Description:  Perform the find next processing.
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

Parent.Event pfc_findnext ()
end event

type cb_cancel from u_cb within pfc_w_replace
integer x = 1696
integer y = 360
integer width = 402
integer taborder = 100
string text = "Cancel"
boolean cancel = true
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Clicked
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Close this window.
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

Close(Parent)
end event

type sle_findwhat from u_sle within pfc_w_replace
integer x = 571
integer y = 164
integer width = 1056
integer height = 80
integer taborder = 20
integer accelerator = 110
end type

type sle_replace from u_sle within pfc_w_replace
integer x = 571
integer y = 288
integer width = 1056
integer height = 80
integer taborder = 30
integer accelerator = 112
end type

type st_replace from u_st within pfc_w_replace
integer x = 32
integer y = 300
integer width = 526
integer height = 72
long backcolor = 79416533
string text = "Re&place with"
end type

type cb_replace from u_cb within pfc_w_replace
integer x = 1696
integer y = 144
integer width = 402
integer taborder = 80
string text = "&Replace"
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event: 		 	Clicked
//
//	Arguments: 		None
//
//	Returns:  		None
//
//	Description:  Perform the replace processing.
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

Parent.Event pfc_replace ()

end event

type cb_replaceall from u_cb within pfc_w_replace
integer x = 1696
integer y = 252
integer width = 402
integer taborder = 90
string text = "Replace &All"
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event: 		 	Clicked
//
//	Arguments: 		None
//
//	Returns:  		None
//
//	Description:  Perform the replace processing.
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

Parent.Event pfc_replaceall ()

end event

type ddlb_searchdirection from pfc_u_ddlb within pfc_w_replace
integer x = 571
integer y = 424
integer height = 208
integer taborder = 40
long backcolor = 1090519039
boolean sorted = false
string item[] = {"Down","Up"}
integer accelerator = 115
end type

type cb_dlghelp from u_cb within pfc_w_replace
integer x = 1696
integer y = 468
integer width = 402
integer taborder = 110
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

showHelp ("pfcdlg.hlp", topic!, 600)
end event

