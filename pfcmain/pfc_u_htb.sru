HA$PBExportHeader$pfc_u_htb.sru
$PBExportComments$PFC HorizontalTrackBar class
forward
global type pfc_u_htb from htrackbar
end type
end forward

global type pfc_u_htb from htrackbar
integer width = 466
integer height = 104
string dragicon = "none!"
string pointer = "Arrow!"
integer maxposition = 100
integer tickfrequency = 10
event pfc_positionchanged ( integer ai_type,  integer ai_scrollpos )
end type
global pfc_u_htb pfc_u_htb

type variables
Public:
constant integer CST_LINE_LEFT 		= 1
constant integer CST_LINE_RIGHT 	= 2
constant integer CST_PAGE_LEFT 		= 3
constant integer CST_PAGE_RIGHT 	= 4
constant integer CST_MOVED			= 5

constant integer WM_MOUSEWHEEL = 522
constant long	  WP_MW_UP = 7864320
constant long	  LP_MW_UP = 18285400
constant long	  WP_MW_down = 4287102976
constant long	  LP_MW_down = 18023255

Protected:
boolean		ib_IsObsolete
end variables

forward prototypes
protected function integer of_MessageBox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default)
public function integer of_getparentwindow (ref window aw_parent)
end prototypes

event pfc_positionchanged(integer ai_type, integer ai_scrollpos);//////////////////////////////////////////////////////////////////////////////
//
// Event:			pfc_positionchanged
//
// Access:			public
//
// Arguments:
// ai_type:		The type of movement that occured. Possible
//						values are :
//			CST_LINE_LEFT 	(1)
//			CST_LINE_RIGHT 	(2)
//			CST_PAGE_LEFT 	(3)
//			CST_PAGE_RIGHT (4)
//			CST_MOVED		(5)
//
// ai_scrollpos:			The scrollpos value 
//
// Returns:			(none)
//						
//
// Description:	Centralize any position changed event that occured.
//					Thie event is automatically triggered by the lineleft,
//					lineright, pageleft, pageright and moved standards events.
//
// Usage:		Extendq code at descendent level in order to manage
//					any position changes centrally.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
// 12.5		Initial version
//////////////////////////////////////////////////////////////////////////////

end event

protected function integer of_MessageBox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default);//////////////////////////////////////////////////////////////////////////////
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
//	7.0   Initial version
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
//	7.0   Initial version
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

event getfocus;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			getfocus
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
//	7.0   Initial version
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

end event

on pfc_u_htb.create
end on

on pfc_u_htb.destroy
end on

event moved;//////////////////////////////////////////////////////////////////////////////
//
// Event:			moved
//
// Access:			public
//
// Returns:			long
//						
//
// Description:	Propagates event to pfc_positionchanged() event
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
//////////////////////////////////////////////////////////////////////////////

this.event pfc_positionchanged( CST_MOVED, scrollpos )

end event

event lineleft;//////////////////////////////////////////////////////////////////////////////
//
// Event:			lineleft
//
// Access:			public
//
// Returns:			long
//						
//
// Description:	Propagates event to pfc_positionchanged() event
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
//////////////////////////////////////////////////////////////////////////////

this.event pfc_positionchanged( cst_line_left , this.position )
end event

event lineright;//////////////////////////////////////////////////////////////////////////////
//
// Event:			lineright
//
// Access:			public
//
// Returns:			long
//						
//
// Description:	Propagates event to pfc_positionchanged() event
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
//////////////////////////////////////////////////////////////////////////////

this.event pfc_positionchanged( cst_line_right , this.position )
end event

event pageleft;//////////////////////////////////////////////////////////////////////////////
//
// Event:			pageleft
//
// Access:			public
//
// Returns:			long
//						
//
// Description:	Propagates event to pfc_positionchanged() event
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
//////////////////////////////////////////////////////////////////////////////

this.event pfc_positionchanged( cst_page_left , this.position )
end event

event pageright;//////////////////////////////////////////////////////////////////////////////
//
// Event:			pageright
//
// Access:			public
//
// Returns:			long
//						
//
// Description:	Propagates event to pfc_positionchanged() event
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
//////////////////////////////////////////////////////////////////////////////

this.event pfc_positionchanged( cst_page_right , this.position )
end event

event other;//////////////////////////////////////////////////////////////////////////////
//
// Event:			other
//
// Access:			public
//
// Arguments:
// wparam:		see Powerbuilder documentation for more
//						information.
// lparam:			see Powerbuilder documentation for more
//						information.
//
// Returns:			long
//						
//
// Description:	Handle Mouse Wheel actions and propagates results to
//						pfc_positionchanged() event with type = CST_MOVED.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5	Initial version
//////////////////////////////////////////////////////////////////////////////

if message.number = WM_mousewheel then
	if wparam = wp_mw_down and lparam = lp_mw_down then
			this.position ++
	elseif wparam = wp_mw_up and lparam = lp_mw_up then
			this.position --
	end if
	this.post event pfc_positionchanged( cst_moved , this.position)
end if
end event

