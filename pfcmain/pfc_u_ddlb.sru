HA$PBExportHeader$pfc_u_ddlb.sru
$PBExportComments$PFC DropDownListBox class
forward
global type pfc_u_ddlb from dropdownlistbox
end type
end forward

global type pfc_u_ddlb from dropdownlistbox
integer width = 343
integer height = 248
integer taborder = 1
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
event type integer pfc_cut ( )
event type integer pfc_copy ( )
event type integer pfc_paste ( )
event type integer pfc_clear ( )
event type integer pfc_selectall ( )
event cbneditchange pbm_cbneditchange
event rbuttonup pbm_rbuttonup
event contextmenu pbm_contextmenu
event pfc_prermbmenu ( ref m_edit am_edit )
end type
global pfc_u_ddlb pfc_u_ddlb

type variables
Protected:
boolean	ib_autoselect
boolean	ib_rmbmenu = true
boolean	ib_search		// Search (type ahead) attribute.
boolean		ib_IsObsolete
end variables

forward prototypes
public function integer of_getparentwindow (ref window aw_parent)
protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default)
public function integer of_additems (string as_items[], boolean ab_append)
public function integer of_additems (string as_items[])
end prototypes

event pfc_cut;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_cut
//
//	(Arguments:		None)
//
//	(Returns:  		integer
//						Return value from the PowerScript Cut function)
//
//	Description:	Cut the text to the clipboard.
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

Return this.Cut()
end event

event pfc_copy;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_copy
//
//	(Arguments:		None)
//
//	(Returns:  		integer
//						Return value from the PowerScript Copy function)
//
//	Description:	Copy the text to the clipboard.
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

Return this.Copy()
end event

event pfc_paste;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_paste
//
//	(Arguments:		None)
//
//	(Returns:  		integer
//						Return value from the PowerScript Paste function)
//
//	Description:	Paste the text from the clipboard.
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

Return this.Paste()
end event

event pfc_clear;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_clear
//
//	(Arguments:		None)
//
//	(Returns:  		integer
//						Return value from the PowerScript Paste function)
//
//	Description:	Clear Text (no clipboard) functionality
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

Return this.Clear()
end event

event pfc_selectall;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_selectall
//
//	(Arguments:		None)
//
//	(Returns:  		integer
//						Return value from the PowerScript SelectAll function)
//
//	Description:	Select all the text.
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

// Select all text
Return this.SelectText (1, Len (this.text))
end event

event cbneditchange;//////////////////////////////////////////////////////////////////////////////
//
//	Event: 			cbneditchange
//
//	Description:	Search the ddlb for the text entered. 
//						(Provides Type ahead features.)
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

integer	li_searchtextlen
integer	li_searchindex
string	ls_searchtext
string	ls_foundtext
boolean	lb_keyback
boolean	lb_keydel

// Check search flag.
if not ib_search then return

// Store "Key" keystrokes.
lb_keyback = KeyDown(KeyBack!)
lb_keydel = KeyDown(KeyDelete!)

// Get current text
ls_searchtext = this.text
li_searchtextlen = Len (ls_searchtext)

// If there is nothing to search or the user performed a delete or backspace operation,
//	do not perform the search.
If li_searchtextlen <=0 Or lb_keyback Or lb_keydel Then Return

// Find the text.
li_searchindex = this.FindItem (ls_searchtext, 0)
if li_searchindex > 0 then
	// Set the text.
	ls_foundtext = this.Text (li_searchindex)
	this.text = ls_foundtext
	
	// Determine what to highlight or where to move the cursor.
	if li_searchtextlen = len(ls_foundtext) THEN	
		// Move the cursor to the end.
		this.SelectText (Len (ls_foundtext)+1, 0)	
	else
		// Highlight the portion the user has not actually typed.		
		this.SelectText (li_searchtextlen + 1, Len (ls_foundtext))
	end if
end if

end event

event rbuttonup;//////////////////////////////////////////////////////////////////////////////
//	Event:				rbuttonup
//	Description:			
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							5.0   Initial version
//							8.0   Moved existing code for PopUp menu to new contextmenu event
//						   	12.5	Redirect code to contextmenu event
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////

Return this.event contextmenu( xpos, ypos)
end event

event contextmenu;//////////////////////////////////////////////////////////////////////////////
//	Event:				contextmenu
//	Description:			Popup menu
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							8.0   Initial version
//////////////////////////////////////////////////////////////////////////////
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
//////////////////////////////////////////////////////////////////////////////
boolean	lb_frame
m_edit	lm_edit
window	lw_parent
window	lw_frame
window	lw_sheet
window	lw_childparent

// Determine if RMB popup menu should occur
if not ib_rmbmenu or not this.allowedit then
	return 1
end if

// Determine parent window for PointerX, PointerY offset
this.of_GetParentWindow (lw_parent)
if IsValid (lw_parent) then
	// Get the MDI frame window if available
	lw_frame = lw_parent
	do while IsValid (lw_frame)
		if lw_frame.windowtype = mdi! or lw_frame.windowtype = mdihelp! then
			lb_frame = true
			exit
		else
			lw_frame = lw_frame.ParentWindow()
		end if
	loop
	
	if lb_frame then
		// If MDI frame window is available, use it as the reference point for the
		// popup menu for sheets (windows opened with OpenSheet function) or child windows
		if lw_parent.windowtype = child! then
			lw_parent = lw_frame
		else
			lw_sheet = lw_frame.GetFirstSheet()
			if IsValid (lw_sheet) then
				do
					// Use frame reference for popup menu if the parentwindow is a sheet
					if lw_sheet = lw_parent then
						lw_parent = lw_frame
						exit
					end if
					lw_sheet = lw_frame.GetNextSheet (lw_sheet)
				loop until IsNull(lw_sheet) Or not IsValid (lw_sheet)
			end if
		end if
	else
		// SDI application.  All windows except for child windows will use the parent
		// window of the control as the reference point for the popmenu
		if lw_parent.windowtype = child! then
			lw_childparent = lw_parent.ParentWindow()
			if IsValid (lw_childparent) then
				lw_parent = lw_childparent
			end if
		end if
	end if
else
	return 1
end if

// Create popup menu
lm_edit = create m_edit
lm_edit.of_SetParent (this)

// Enable menu items if appropriate
if Len (this.SelectedText()) > 0 then
	lm_edit.m_edititem.m_copy.enabled = true
	lm_edit.m_edititem.m_cut.enabled = true
else
	lm_edit.m_edititem.m_copy.enabled = false
	lm_edit.m_edititem.m_cut.enabled = false
end if

if Len (ClipBoard()) > 0 then
	lm_edit.m_edititem.m_paste.enabled = true
else
	lm_edit.m_edititem.m_paste.enabled = false
end if

if Len (this.text) > 0 then
	lm_edit.m_edititem.m_selectall.enabled = true
else
	lm_edit.m_edititem.m_selectall.enabled = false
end if

this.event pfc_prermbmenu (lm_edit)

lm_edit.m_edititem.PopMenu (lw_parent.PointerX() + 5, lw_parent.PointerY() + 10)

destroy lm_edit

return 1
end event

public function integer of_getparentwindow (ref window aw_parent);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetParentWindow
//
//	Access:  public
//
//	Arguments:
//	aw_parent   The Parent window for this object (passed by reference).
//	   If a parent window is not found, aw_parent is NULL
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:	 Calculates the parent window of a window object
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

powerobject	lpo_parent

lpo_parent = this.GetParent()

// Loop getting the parent of the object until it is of type window!
do while IsValid (lpo_parent) 
	if lpo_parent.TypeOf() <> window! then
		lpo_parent = lpo_parent.GetParent()
	else
		exit
	end if
loop

if IsNull(lpo_parent) Or not IsValid (lpo_parent) then
	setnull(aw_parent)	
	return -1
end If

aw_parent = lpo_parent
return 1

end function

protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  			of_MessageBox
//
//	Access:  			protected
//
//	Arguments:
//	as_id			An ID for the Message.
//	as_title  	Text for title bar
//	as_text		Text for the actual message.
//	ae_icon 		The icon you want to display on the MessageBox.
//	ae_button	Set of CommandButtons you want to display on the MessageBox.
//	ai_default  The default button.
//
//	Returns:  integer
//	Return value of the MessageBox.
//
//	Description:
//	Display a PowerScript MessageBox.  
//	Allow PFC MessageBoxes to be manipulated prior to their actual display.
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

Return MessageBox(as_title, as_text, ae_icon, ae_button, ai_default)
end function

public function integer of_additems (string as_items[], boolean ab_append);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_additems (syntax 1)
//
// Access:			Public
//
// Arguments:
// as_items[]:		The list of items to be added
//
// ab_append:			TRUE, append entries to the existing ones,
//						FALSE, reset control's contents before adding
//						specifeid entries.
//
// Returns:			integer
//						The number of added items, or
//						-1, if an error occurs.
//
// Description:	Add the specified list of items in append mode or not.
//
// Usage:			Call this method to add a list of items at once
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5	Initial version
///
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

integer	li_i
integer 	li_limit

li_limit = UpperBound( as_items )

if ab_append = false then
	this.reset( )
end if

for li_i = 1 to li_limit
	this.additem( as_items[li_i] )
next

return li_limit
end function

public function integer of_additems (string as_items[]);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_additems (syntax 1)
//
// Access:			Public
//
// Arguments:
// as_items[]:		The list of items to be added
//
// Returns:			integer
//						The number of added items, or
//						-1, if an error occurs.
//
// Description:	Add the specified list of items in default append mode.
//
// Usage:			Call this method to add a list of items at once
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5	Initial version
///
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
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

return this.of_additems( as_items, true )
end function

event getfocus;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			GetFocus
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	If appropriate, notify the parent window that this
//						control got focus.
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

window 	lw_parent

//Check for microhelp requirements.
If gnv_app.of_GetMicrohelp() Then
	//Notify the parent.
	of_GetParentWindow(lw_parent)
	If IsValid(lw_parent) Then
		lw_parent.Dynamic Event pfc_ControlGotFocus (this)
	End If
End If

//If appropriate, select the entire text.
if this.AllowEdit and ib_autoselect then
	this.Post Event pfc_selectall ()
end if
	
end event

on pfc_u_ddlb.create
end on

on pfc_u_ddlb.destroy
end on

