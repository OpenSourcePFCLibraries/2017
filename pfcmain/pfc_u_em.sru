HA$PBExportHeader$pfc_u_em.sru
$PBExportComments$PFC Editmask class
forward
global type pfc_u_em from editmask
end type
end forward

global type pfc_u_em from editmask
integer width = 229
integer height = 84
integer taborder = 1
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 1090519039
borderstyle borderstyle = stylelowered!
string mask = "###,###.00"
double increment = 1
string minmax = "0~~"
event type integer pfc_cut ( )
event type integer pfc_copy ( )
event type integer pfc_paste ( )
event type integer pfc_undo ( )
event type integer pfc_clear ( )
event type integer pfc_selectall ( )
event rbuttonup pbm_rbuttonup
event contextmenu pbm_contextmenu
event pfc_prermbmenu ( ref m_edit am_edit )
event type integer pfc_ddcalendar ( )
event type integer pfc_ddcalculator ( )
end type
global pfc_u_em pfc_u_em

type variables
Public:
u_calendar	iuo_calendar
u_calculator	iuo_calculator

Protected:
boolean		ib_autoselect
boolean		ib_rmbmenu = true
boolean		ib_IsObsolete
end variables

forward prototypes
public function integer of_getparentwindow (ref window aw_parent)
public function integer of_setdropdowncalendar (boolean ab_switch)
public function integer of_setdropdowncalculator (boolean ab_switch)
protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default)
end prototypes

event pfc_cut;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_cut
//	Arguments:		None
//	Returns:			integer - Return value from the PowerScript Cut function
//	Description:		Cut the text to the clipboard.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
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
Return this.Cut()
end event

event pfc_copy;//////////////////////////////////////////////////////////////////////////////
//	Event:  			pfc_copy
//	Arguments:		None
//	Returns:  		integer - Return value from the PowerScript Copy function
//	Description:		Copy the text to the clipboard.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
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
Return this.Copy()
end event

event pfc_paste;//////////////////////////////////////////////////////////////////////////////
//	Event:  			pfc_paste
//	Arguments:		None
//	Returns:  		integer -	Return value from the PowerScript Paste function
//	Description:		Paste the text from the clipboard.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
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
Return this.Paste()
end event

event pfc_undo;//////////////////////////////////////////////////////////////////////////////
//	Event:  			pfc_undo
//	Arguments:		None
//	Returns:  		integer - 	Return value from the PowerScript CanUndo function
//						0 If there is nothing to Undo.
//	Description:		Cancels the last edit, restoring the text to the content before the last change.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
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
if this.CanUndo() then
	Return this.Undo()
end if

Return 0
end event

event pfc_clear;//////////////////////////////////////////////////////////////////////////////
//	Event:  			pfc_clear
//	Arguments:		None
//	Returns:  		integer - 	Return value from the PowerScript Clear function
//	Description:		Clear Text (no clipboard) functionality
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
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
Return this.Clear()
end event

event pfc_selectall;//////////////////////////////////////////////////////////////////////////////
//	Event:  			pfc_selectall
//	Arguments:		None
//	Returns:  		integer - 	Return value from the PowerScript SelectAl function
//	Description:		Select all the text.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
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
Return this.SelectText (1, Len (this.text))
end event

event rbuttonup;//////////////////////////////////////////////////////////////////////////////
//	Event:			rbuttonup
//	Description:			
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						 5.0   Initial version
//						 8.0   Moved existing code for PopUp menu to new contextmenu event
//						12.5	Redirect code to contextmenu event
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
//	Event:			contextmenu
//	Description:		Popup menu
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						8.0   Initial version
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
if not ib_rmbmenu then
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
lm_edit.m_edititem.m_copy.enabled = false
lm_edit.m_edititem.m_cut.enabled = false
if Len (this.SelectedText()) > 0 then
	lm_edit.m_edititem.m_copy.enabled = true
	if not this.displayonly then
		lm_edit.m_edititem.m_cut.enabled = true
	end if
end if

if Len (ClipBoard()) > 0 and not this.displayonly then
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

event pfc_ddcalendar;If IsValid(iuo_calendar) Then
	Return iuo_calendar.Event pfc_dropdown()
End If

Return 0

end event

event pfc_ddcalculator;
If IsValid(iuo_calculator) Then
	Return iuo_calculator.Event pfc_dropdown()
End If

Return 0

end event

public function integer of_getparentwindow (ref window aw_parent);//////////////////////////////////////////////////////////////////////////////
//	Public Function:		of_GetParentWindow
//	Arguments:			aw_parent   The Parent window for this object (passed by reference).
//	   										If a parent window is not found, aw_parent is NULL
//	Returns:  			integer
//	 						1 = success
//							-1 = error
//	Description:	 		Calculates the parent window of a window object
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							5.0   Initial version
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

public function integer of_setdropdowncalendar (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  	of_SetDropDownCalendar
//	Arguments: 			boolean
//   						TRUE  - Start (create) the service
//   						FALSE - Stop (destroy ) the service
//	Returns:  			Integer
//						 	1 - Successful operation.
//						 	0 - No action taken.
//							-1 - An error was encountered.
//	Description:  		Starts or stops the DropDown Calendar visual object.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							6.0			Initial version
// 							6.0.01		Corrected to tell the object to behave as a dropdown object.
// 							6.0.01		Enhanced so that the Message object is not overwritten by the 
//										OpenUserObject function.
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
window lw_parent
string	ls_classname
powerobject	lpo_message
n_cst_calendarattrib lnv_calendarattrib

//Check arguments
If IsNull(ab_switch) Then
	Return -1
End If

// Check for an appropriate Mask Type.
If this.MaskDataType <> DateMask! Then
	Return -1
End If

// Get parent window reference.
of_GetParentWindow(lw_parent)
If IsNull(lw_parent) or Not IsValid(lw_parent) Then
	Return -1
End If

IF ab_Switch THEN
	IF Not IsValid (iuo_calendar) THEN
		// If using pfc_n_msg, store the Message Object (dynamic call).
		If IsValid(message) Then
			ls_classname = Trim(Lower(message.ClassName()))
			If ls_classname = 'n_msg' Then lpo_message = Create Using 'n_msg'
			If IsValid(lpo_message) Then message.Dynamic of_CopyTo(lpo_message)
		End If				
		
		// Tell the object to behave as a dropdown object.
		lnv_calendarattrib.ib_dropdown = True		
		lw_parent.OpenUserObjectWithParm(iuo_calendar, lnv_calendarattrib)
		iuo_calendar.of_SetRequestor (this)

		// If using pfc_n_msg, restore the Message Object (dynamic call).
		If IsValid(lpo_message) Then 
			lpo_message.Dynamic of_CopyTo(message)
			Destroy lpo_message
		End If
		Return 1
	END IF
ELSE 
	IF IsValid (iuo_calendar) THEN
		lw_parent.CloseUserObject(iuo_calendar)
		Return 1
	END IF	
END IF 

Return 0
end function

public function integer of_setdropdowncalculator (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  	of_SetDropDownCalculator
//	Arguments: 			boolean
//   						TRUE  - Start (create) the service
//   						FALSE - Stop (destroy ) the service
//	Returns:  			Integer
//						 	1 - Successful operation.
//							 0 - No action taken.
//							-1 - An error was encountered.
//	Description:  		Starts or stops the DropDown Calculator visual object.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							6.0			Initial version
// 							6.0.01		Corrected to tell the object to behave as a dropdown object.
// 							6.0.01		Enhanced so that the Message object is not overwritten by the 
//										OpenUserObject function.
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
window 	lw_parent
string	ls_classname
powerobject	lpo_message
n_cst_calculatorattrib lnv_calculatorattrib

//Check arguments
If IsNull(ab_switch) Then
	Return -1
End If

// Check for an appropriate Mask Type.
If this.MaskDataType <> DecimalMask! And &
	this.MaskDataType <> NumericMask! Then
	Return -1
End If

// Get parent window reference.
of_GetParentWindow(lw_parent)
If IsNull(lw_parent) or Not IsValid(lw_parent) Then
	Return -1
End If

IF ab_Switch THEN
	IF Not IsValid (iuo_calculator) THEN
		// If using pfc_n_msg, store the Message Object (dynamic call).
		If IsValid(message) Then
			ls_classname = Trim(Lower(message.ClassName()))
			If ls_classname = 'n_msg' Then lpo_message = Create Using 'n_msg'
			If IsValid(lpo_message) Then message.Dynamic of_CopyTo(lpo_message)
		End If		
		
		// Tell the object to behave as a dropdown object.
		lnv_calculatorattrib.ib_dropdown = True		
		lw_parent.OpenUserObjectWithParm(iuo_calculator, lnv_calculatorattrib)
		iuo_calculator.of_SetRequestor (this)
		
		// If using pfc_n_msg, restore the Message Object (dynamic call).
		If IsValid(lpo_message) Then 
			lpo_message.Dynamic of_CopyTo(message)
			Destroy lpo_message
		End If
		Return 1
	END IF
ELSE 
	IF IsValid (iuo_calculator) THEN
		lw_parent.CloseUserObject(iuo_calculator)
		Return 1
	END IF	
END IF 

Return 0
end function

protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default);//////////////////////////////////////////////////////////////////////////////
//	Protected Function:	of_MessageBox
//	Arguments:				as_id			An ID for the Message.
//								as_title  	Text for title bar
//								as_text		Text for the actual message.
//								ae_icon 		The icon you want to display on the MessageBox.
//								ae_button	Set of CommandButtons you want to display on the MessageBox.
//								ai_default  The default button.
//	Returns:  				integer - Return value of the MessageBox.
//	Description:				Display a PowerScript MessageBox.  
//								Allow PFC MessageBoxes to be manipulated prior to their actual display.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History				Version
//								6.0   Initial version
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
Return MessageBox(as_title, as_text, ae_icon, ae_button, ai_default)
end function

event getfocus;//////////////////////////////////////////////////////////////////////////////
//	Event:  			getfocus
//	Arguments:		None
//	Returns:  		None
//	Description:		If appropriate, notify the parent window that this control got focus.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
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
if ib_autoselect then
	this.Post Event pfc_selectall ()
end if
end event

event destructor;//////////////////////////////////////////////////////////////////////////////
//	Event:  			Destructor
//	Arguments:		None
//	Returns:  		None
//	Description:		Perform cleanup
//////////////////////////////////////////////////////////////////////////////
//	Rev. History		Version
//						5.0   Initial version
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
of_SetDropDownCalendar(False)
of_SetDropDownCalculator(False)
end event

on pfc_u_em.create
end on

on pfc_u_em.destroy
end on

