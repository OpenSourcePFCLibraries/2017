HA$PBExportHeader$pfc_w_sheet.srw
$PBExportComments$PFC Sheet Window class
forward
global type pfc_w_sheet from w_master
end type
end forward

global type pfc_w_sheet from w_master
int X=214
int Y=221
int Width=2486
int Height=1485
end type
global pfc_w_sheet pfc_w_sheet

type variables

end variables

on pfc_w_sheet.create
call w_master::create
end on

on pfc_w_sheet.destroy
call w_master::destroy
end on

event pfc_controlgotfocus;call w_master::pfc_controlgotfocus;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_controlgotfocus
//
//	Arguments:		
//	adrg_control   Control which just got focus
//
//	Returns:  none
//
//	Description:
//	Display the microhelp stored in the tag value of the current control
//
//	Note:  The format is MICROHELP=<microhelp to be displayed>
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

string			ls_columntag
string			ls_microhelp
string			ls_colname
datawindow		ldw_control
n_cst_string 	lnv_string 

// Request microhelp
if gnv_app.of_GetMicrohelp() then
	// If control with focus is a datawindow, use current column's microhelp
	if adrg_control.TypeOf() = DataWindow! then
		ldw_control = adrg_control
		ls_colname = ldw_control.GetColumnName()
		if Len (ls_colname) > 0 then
			// Check the column tag for any microhelp information.
			ls_columntag = ldw_control.Describe (ls_colname + ".tag")
			ls_microhelp = lnv_string.of_GetKeyValue (ls_columntag, "microhelp", ";")
		end if
	else
		// Check the control tag for any microhelp information.
		ls_microhelp = lnv_string.of_GetKeyValue (adrg_control.tag, "microhelp", ";")
	end if

	// If the microhelp variable is empty make sure it displays "Ready".
	if lnv_string.of_IsEmpty (ls_microhelp) then
		ls_microhelp = ''	
	end If

	// display microhelp
	this.event pfc_microHelp (ls_microhelp)
end if

end event

event pfc_microhelp;call w_master::pfc_microhelp;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_microhelp
//
//	Arguments:
//	as_microhelp   microhelp to be displayed
//
//	Returns:  none
//
//	Description:
//	Notify frame to display microhelp
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

window	lw_frame

lw_frame = this.ParentWindow()
if IsValid (lw_frame) then
	// Send notification to the MDI frame.
	lw_frame.dynamic event pfc_microhelp (as_microhelp)
end if

end event

event activate;call w_master::activate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  activate
//
//	Description:
//	notify frame that microhelp needs to be refreshed
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

object				le_object
graphicobject	lgo_focus

if gnv_app.of_GetMicrohelp() then
	lgo_focus = GetFocus()
	if IsValid (lgo_focus) then
		le_object = lgo_focus.TypeOf()
		if le_object <> mdiclient! and le_object <> menu! and le_object <> window! then
			this.event pfc_ControlGotFocus (lgo_focus)
		end if
	end if
end if
end event

