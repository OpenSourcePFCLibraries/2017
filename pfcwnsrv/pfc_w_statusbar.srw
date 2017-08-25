HA$PBExportHeader$pfc_w_statusbar.srw
$PBExportComments$PFC Statusbar window window
forward
global type pfc_w_statusbar from w_popup
end type
type dw_statusbar from u_dw within pfc_w_statusbar
end type
end forward

global type pfc_w_statusbar from w_popup
boolean visible = false
integer x = 672
integer y = 272
integer width = 1861
integer height = 60
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
long backcolor = 80263328
event wininichange pbm_wininichange
dw_statusbar dw_statusbar
end type
global pfc_w_statusbar pfc_w_statusbar

type prototypes

end prototypes

type variables
protected:
Environment	ienv_object
Integer		ii_winmaxwidth
long		il_warningcolor=255	        // Red
long 		il_buttonface
long		ii_borderheight
long		ii_borderwidth
integer 		ii_secondstorefresh = 60   // one minute
boolean		ib_win95=False
w_frame 		iw_parentwindow
n_cst_platform 	inv_platform
end variables

forward prototypes
public function integer of_setrefreshrate (integer ai_seconds)
public function integer of_refreshposition ()
public function integer of_createvisuals ()
public function integer of_updatevisuals (string as_id, string as_type, string as_value)
public function integer of_updatetimerformat (string as_format)
public function integer of_updatedwtimerinterval (long ai_milliseconds)
protected function integer of_refreshvisuals ()
protected function integer of_refreshcolors ()
protected function integer of_setposition ()
public function integer of_modify (string as_modifyexp)
protected function integer of_getsystemsettings ()
protected function long of_color (string as_rgb)
protected function integer of_restorefocuspoint (graphicobject ago_focus)
end prototypes

event wininichange;call super::wininichange;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			wininichange
//
//	Arguments:
//	section			Name of the section changed
//
//	Returns:  		None
//
//	Description:  	
//	This is triggered whenever the appearances of the desktop are changed.
//	We need to force the window and the objects to reflect these changes.
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

Integer li_rc 

// Get the new settings.
li_rc = of_GetSystemSettings() 

// Refresh the colors of all the objects.
li_rc = of_RefreshColors()

// Force a resize on the Frame to enforce the correct position of this window.
If IsValid(iw_parentwindow) Then
	li_rc = iw_parentwindow.resize(iw_parentwindow.width, iw_parentwindow.height)
End If

Return 

end event

public function integer of_setrefreshrate (integer ai_seconds);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_setrefreshrate
//
//	Access:  public
//
//	Arguments:
//	ai_seconds  	The number of seconds between Pre-Defined object refreshes.
//
//	Returns:  Integer
// 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  
//	Reset the refresh rate for the Pre-Defined objects.
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

If IsNull(ai_seconds) or ai_seconds < 0 Then
	Return -1
End If

// Store the value for later use.
ii_secondstorefresh = ai_seconds

// Reset the timer.
timer(ii_secondstorefresh,this)

// Force a timer event now.
this.Event Timer()

Return 1
end function

public function integer of_refreshposition ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_RefreshPosition
//
//	Access:  		public
//
//	Arguments: 		None
//
//	Returns:  		Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	
//	Movement of the Parent Frame Window is currently ongoing.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Hide statusbar (disable timer) when the parentwindow is minimized or 
//			not visible.
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

// Check window reference.
If IsNull(iw_parentwindow) Or Not IsValid(iw_parentwindow) Then
	Return -1
End If

if iw_parentwindow.windowstate = minimized! or &
	Not iw_parentwindow.Visible or &
	iw_parentwindow.mdi_1.microhelpheight + 150 > iw_parentwindow.Height then
	// Hide statusbar (disable timer) when the parentwindow is minimized or
	// not visible.
	this.visible = false
	Timer (0, this)
	return 1
end if
	
// Hide until the move is complete.
this.visible = false
Timer (0, this)

li_rc = of_SetPosition()
If IsValid(iw_parentwindow) Then iw_parentwindow.SetFocus()
Timer (0.5, this)

Return 1
end function

public function integer of_createvisuals ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_CreateVisuals
//
//	Access:  Public
//
//	Arguments:	None
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Creates the Visual Object (a dw object) that holds all registerd objects.
//	This is called after opening this GUI or anytime the StatusBar userobject
//	creates a new entry or destroys a new entry through its of_Register...()
// and of_UnRegister...() functions.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Restore the focus point to the correct object which may not be the frame.
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
string		ls_dwdefinition
string		ls_errorbuffer
string		ls_replacestring
integer		li_height
graphicobject lgo_withfocus
n_cst_string	lnv_string

// Check for the required reference.
If IsNull(iw_parentwindow) Or Not IsValid(iw_parentwindow) Then
	Return -1
End If

// Keep track of the object with focus.
lgo_withfocus = GetFocus()	

// Get the text necessary to build the appropriate datawindow object.
li_rc = iw_parentwindow.inv_statusbar.of_createdwobject( &
						ls_dwdefinition, ii_winmaxwidth, li_height)
If li_rc <> 1 Then
	Return -1
End If

// Change the Background color of all the objects to be the 
//	appropriate background color.
ls_replacestring = 'background.color="'+string(il_buttonface)+'"'
ls_dwdefinition = lnv_string.of_GlobalReplace(ls_dwdefinition, &
			'background.color="12632256"', ls_replacestring, TRUE)

// Set it on the DataWindow Control (which set focus on it).
li_rc = dw_statusbar.Create ( ls_dwdefinition, ls_errorbuffer)
If li_rc <> 1 Then
	Return -1
End If

// Update the colors of this window and the datawindow objects.
li_rc = of_RefreshColors()

// Set the Height of the Status bar.
this.height = li_height
dw_statusbar.Height = li_height

// Define the Width of the status bar.
dw_statusbar.Width = ii_winmaxwidth
this.Width = ii_winmaxwidth

// Set its position.
of_SetPosition()

// Force an Update of the Pre-Defined Objects.
of_RefreshVisuals()

// Restore the focus point to the previous valid focus point.
of_RestoreFocusPoint(lgo_withfocus)

Return 1
end function

public function integer of_updatevisuals (string as_id, string as_type, string as_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_UpdateVisuals
//
//	Access:  Public
//
//	Arguments:	
//	as_id		The ID of the User Defined object which needs its value modified.
//	as_type	The Type of User Defined object. (text or bitmap)
//	as_value	The new desired value.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Updates the User Defined object.  
//	This can either be Text or a new bitmap.
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


string	ls_modifyexp
string	ls_rc

// According to the Type, create the appropriate Modify statement.
If Pos(as_type, 'bitmap') > 0 Then
	ls_modifyexp = as_id+'.Expression="bitmap(~'' + as_value + '~')" '
Else
	ls_modifyexp = as_id+'.Expression=~'"'+ as_value + '"~' '	
End IF
					
// Execute the Modify statment.					
ls_rc = dw_statusbar.Modify (ls_modifyexp)		

If Len(ls_rc) > 0 Then
	Return -1
End If
Return 1
end function

public function integer of_updatetimerformat (string as_format);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_UpdateDWTimerFormat
//
//	Access:  Public
//
//	Arguments:	
//	ai_milliseconds	The new Timer Format.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Refreshes the Pre-Defined Datawindow Timer Format.
//	This is used for the Timer Pre-Defined object only.
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

string	ls_modifyexp
string	ls_rc

If IsNull(as_format) Then
	as_format = ''
End If

// Create and Execute the Modify statment.
ls_modifyexp = "pfc_timer.Format='"+as_format+"'"
ls_rc = dw_statusbar.Modify (ls_modifyexp)		

If Len(ls_rc) > 0 Then
	Return -1
End If
Return 1
end function

public function integer of_updatedwtimerinterval (long ai_milliseconds);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_UpdateDWTimerInterval
//
//	Access:  Public
//
//	Arguments:	
//	ai_milliseconds	The new Timer interval in milliseconds.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Refreshes the Pre-Defined Datawindow Timer Interval.
//	This is used for the Timer Pre-Defined object only.
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

string	ls_modifyexp
string	ls_rc

// Create and Execute the Modify statment.
ls_modifyexp = "DataWindow.Timer_Interval='"+String(ai_milliseconds)+"'"
ls_rc = dw_statusbar.Modify (ls_modifyexp)		

If Len(ls_rc) > 0 Then
	Return -1
End If
Return 1
end function

protected function integer of_refreshvisuals ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RefreshVisuals
//
//	Access:  Public
//
//	Arguments:	None
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Refreshes the Pre-Defined Visual Objects. 
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 When appropriate display N/A (for NotApplicable or NotAvailable)
//		instead of a negative return code.
//	12.5	of_getFreeMemory() has been modified to return a longLong and report
//			memory Threshold in gigaBytes.
//			Instantiate platform service if needed
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

LongLong	lll_resource
long 		ll_resource
string	ls_modifyexp
string	ls_rc

// Validate required references.
If IsNull(iw_parentwindow) Or Not IsValid(iw_parentwindow) Then
	Return -1
End If
If IsNull(iw_parentwindow.inv_statusbar) Or &
	Not IsValid(iw_parentwindow.inv_statusbar) Then 
	Return -1
End If

// If appropriate update the Memory value.
If iw_parentwindow.inv_statusbar.of_GetMem() Then
	IF NOT IsValid (inv_platform) THEN f_SetPlatform (inv_platform, TRUE)
	lll_resource = inv_platform.of_GetFreeMemory()
	If lll_resource <> -1 then
		// Display the reading.  Color it if below threshold.
		ls_modifyexp = "pfc_mem.Expression=~"'"+ &
							'Mem: '+string(lll_resource/1073741824,"###.0")+ " GB'~" "
		if lll_resource < iw_parentwindow.inv_statusbar.of_GetMemThreshold() then
			ls_modifyexp = ls_modifyexp + "pfc_mem.Background.Color='"+ &
								string(il_warningcolor)+"' "
		Else
			ls_modifyexp =	ls_modifyexp + "pfc_mem.Background.Color='"+ &
								string(il_buttonface)+"' "
		End if
	Else
		// Display NotApplicable/NotAvailable.		
		ls_modifyexp = "pfc_mem.Expression=~"'"+ "Mem: N/A'~" " + &
							"pfc_mem.Background.Color='"+ string(il_buttonface)+"' "
	End If
	ls_rc = dw_statusbar.Modify (ls_modifyexp)		
End If

// If appropriate update the User Memory value.
If iw_parentwindow.inv_statusbar.of_GetUser() Then
	IF NOT IsValid (inv_platform) THEN f_SetPlatform (inv_platform, TRUE)
	ll_resource = inv_platform.of_GetFreeResources(2)
	If ll_resource <> -1 Then
		// Display the reading.  Color it if below threshold.		
		ls_modifyexp = "pfc_user.Expression=~"'"+ &
							'User: '+string(ll_resource,"###")+ " %'~" "
		if ll_resource < iw_parentwindow.inv_statusbar.of_GetUserThreshold() then
			ls_modifyexp = ls_modifyexp + "pfc_user.Background.Color='"+ &
								string(il_warningcolor)+"' "
		Else
			ls_modifyexp =	ls_modifyexp + "pfc_user.Background.Color='"+ &
								string(il_buttonface)+"' "
		End if
	Else
		// Display NotApplicable/NotAvailable.
		ls_modifyexp = "pfc_user.Expression=~"'"+ "User: N/A'~" " + &
							"pfc_user.Background.Color='"+ string(il_buttonface)+"' "	
	End If
	ls_rc = dw_statusbar.Modify (ls_modifyexp)		
End If

// If appropriate update the GDI Memory value.
If iw_parentwindow.inv_statusbar.of_GetGDI() Then
	IF NOT IsValid (inv_platform) THEN f_SetPlatform (inv_platform, TRUE)
	ll_resource = inv_platform.of_GetFreeResources(1)
	If ll_resource <> -1 then
		// Display the reading.  Color it if below threshold.		
		ls_modifyexp = "pfc_gdi.Expression=~"'"+ &
							'GDI: '+string(ll_resource,"###")+ " %'~" "
		if ll_resource < iw_parentwindow.inv_statusbar.of_GetGDIThreshold() then
			ls_modifyexp = ls_modifyexp + "pfc_gdi.Background.Color='"+ &
								string(il_warningcolor)+"' "
		Else
			ls_modifyexp =	ls_modifyexp + "pfc_gdi.Background.Color='"+ &
								string(il_buttonface)+"' "
		End if
	Else
		// Display NotApplicable/NotAvailable.		
		ls_modifyexp = "pfc_gdi.Expression=~"'"+ "GDI: N/A'~" " + &
							"pfc_gdi.Background.Color='"+ string(il_buttonface)+"' "				
	End If		
	ls_rc = dw_statusbar.Modify (ls_modifyexp)		
End If

Return 1
end function

protected function integer of_refreshcolors ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RefreshColors
//
//	Access:  Protected
//
//	Arguments:	None
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Refreshes the colors of all the appropriate objects to match the desired
//	background color.
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

string 		ls_allobjects
string		ls_object
string		ls_modifyexp
string		ls_rc
n_cst_string	lnv_string

// Get the datawindow objects.
ls_allobjects = dw_statusbar.Describe('DataWindow.Objects')

// Set window background to match buttonface.
this.backcolor = il_buttonface

// Set each datawindow object background to match buttonface.
DO UNTIL Len(ls_allobjects) <= 0
	ls_object = lnv_string.of_gettoken(ls_allobjects,'~t')
	ls_modifyexp =	ls_object+".Background.Color='"+string(il_buttonface)+"' "
	ls_rc = dw_statusbar.Modify (ls_modifyexp)	
LOOP

Return 1
end function

protected function integer of_setposition ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetPosition
//
//	Access:  	public
//
//	Arguments: 	None
//
//	Returns:  	Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  	
//	Moves this StatusBar window so it is positioned over the lower right
//	hand portion of the Microhelp bar.
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

long 		ll_microhelp_ypos, ll_frame_xpos, ll_desiredstatubar_xpos
integer	li_xpos_extra=0, li_ypos_extra=0

// Check window reference.
If IsNull(iw_parentwindow) Or Not IsValid(iw_parentwindow) Then
	Return -1
End If

if iw_parentwindow.windowstate = minimized! then 
	return 1
end if

// Windows 95 has a bigger gap on the hand right side.
If ib_win95 Then
	li_xpos_extra = 50
	li_ypos_extra = 1
End If
	
If Not iw_parentwindow.resizable	Then
	li_ypos_extra += 3
End If
	
// The Y Position of the Status Bar is the Bottom of the Frame Window
// minus the MicroHelpHeight minus the MicroHelpBorderHeight.
ll_microhelp_ypos = &
			(iw_parentwindow.y + iw_parentwindow.height + li_ypos_extra) - &
			(iw_parentwindow.mdi_1.microhelpheight + ii_borderheight)				

// The desired X Position of the Status Bar is the Frame Right End minus
// the StatusBar window.  Also subtract the extra spacing on win95.
ll_desiredstatubar_xpos = &
			iw_parentwindow.x + iw_parentwindow.workspacewidth() + &
			ii_borderwidth - (ii_winmaxwidth + 12 + li_xpos_extra)
				
// The Frame X Position.
ll_frame_xpos = iw_parentwindow.x  + (2*ii_borderwidth) + 16

if ll_desiredstatubar_xpos < ll_frame_xpos then 
	// Status Bar would extend to the left of the frame.
	this.move(ll_frame_xpos , ll_microhelp_ypos)
	// Make the StatuBar the width of the frame.
	this.width = workspacewidth(iw_parentwindow) - (20 + li_xpos_extra)
else 
	// Normal as large as defined Status Bar window.
	this.move(ll_desiredstatubar_xpos , ll_microhelp_ypos)
	this.width = ii_winmaxwidth
end if

Return 1
end function

public function integer of_modify (string as_modifyexp);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_modify
//
//	Access:  Public
//
//	Arguments:	
//	as_modifyexp	The modify string to execute
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Modifies the properties of an object
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

string	ls_rc

dw_statusbar.SetRedraw(False)

// Execute the Modify statment.					
ls_rc = dw_statusbar.Modify (as_modifyexp)		

dw_statusbar.SetRedraw(True)

If ls_rc <> "" Then
	Return -1
End If

Return 1

end function

protected function integer of_getsystemsettings ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetSystemSettings
//
//	Access:  protected
//
//	Arguments : None
//
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  
//	Get the needed settings from the registry or win.ini
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Provide default value for buttonface Color.
// 5.0.03 Added WindowNT 4.0 support.
// 7.0	 Changed calculation of border size
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

string ls_temp
string ls_buttonface
integer li_border
n_cst_platform lnv_platform

f_setplatform(lnv_platform, true)

li_border = lnv_platform.of_GetActiveWindowBorder()
RegistryGet ('hkey_current_user\control panel\colors', 'buttonface', ls_buttonface)

IF li_border > 0 THEN
	ii_borderheight = PixelsToUnits(li_border, ypixelstounits!)
	ii_borderwidth = PixelsToUnits(li_border, xpixelstounits!)
END IF

// Provide default value for the ButtonFace color.
If IsNull(ls_buttonface) or Len(ls_buttonface)=0 Then
	il_buttonface = 78682240
Else
	il_buttonface = of_Color(ls_buttonface)
End If

f_setplatform(lnv_platform, false)

Return 1
end function

protected function long of_color (string as_rgb);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_color
//
//	Access:  protected
//
//	Arguments:
//	as_rgb 	a string in the format "### ### ###"
//
//	Returns:  long 
//	the actual color
//
//	Description:
//	Convert the passed RGB string to a long.
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
 
string 	ls_color
integer 	li_rgb[3]
long 		ll_cnt
n_cst_string lnv_string

For ll_cnt = 1 To 3
	ls_color = lnv_string.of_gettoken(as_rgb,' ')
	li_rgb[ll_cnt] = Integer(ls_color)
Next

Return RGB(li_rgb[1], li_rgb[2], li_rgb[3])

end function

protected function integer of_restorefocuspoint (graphicobject ago_focus);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RestoreFocusPoint
//
//	Access:  protected
//
//	Arguments:
//	  ago_focus object which should get focus.
//
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  
//	Restore the focus point to the passed in object.  If an invalid object is 
//	passed in or the object passed in belongs to this window, then the focus
// point is passed in to the parentwindow.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0.03 Initial version
// 7.0	Added new controls hprogressbar!, htrackbar!, vprogressbar!,
//			vtrackbar!, picturehyperlink!, statichyperlink!
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
window 	lw_obj
dragobject ldrg_obj

If IsValid(ago_focus) Then

	// Make sure we are not trying to restore focus to an object in this window.
	If ago_focus = dw_statusbar or ago_focus = this Then
		// Set focus on the parent frame.
		If IsValid(iw_parentwindow) Then
			li_rc = iw_parentwindow.SetFocus()
		Else
			li_rc = -1
		End If
	Else
		// Attempt to set focus on the passed-in object.
		CHOOSE CASE ago_focus.TypeOf()
			CASE Window!
				lw_obj = ago_focus
				li_rc = lw_obj.SetFocus()

			CASE  checkbox!, commandbutton!, datawindow!, dropdownlistbox!, dropdownpicturelistbox!, &
					editmask!, graph!, groupbox!, hprogressbar!, hscrollbar!, htrackbar!, listbox!,  &
					listview!, multilineedit!, olecontrol!, olecustomcontrol!, omcontrol!, omcustomcontrol!,  &
					omembeddedcontrol!, picture!, picturebutton!, picturehyperlink!, picturelistbox!,  &
					radiobutton!, richtextedit!, singlelineedit!, statichyperlink!, statictext!,  &
					tab!, treeview!, userobject!, vprogressbar!, vscrollbar!, vtrackbar!
				ldrg_obj = ago_focus
				li_rc = ldrg_obj.SetFocus()

			CASE else
				// Not a valid object, set focus on the parent frame.
				If IsValid(iw_parentwindow) Then
					li_rc = iw_parentwindow.SetFocus()
				Else
					li_rc = -1
				End If
			
		END CHOOSE
	End If
Else
	// By default, set focus on the parent frame.	
	If IsValid(iw_parentwindow) Then
		li_rc = iw_parentwindow.SetFocus()
	Else
		li_rc = -1
	End If
End If

Return li_rc
end function

event open;//////////////////////////////////////////////////////////////////////////////
//	Object Name:		pfc_w_statusbar
//	Description:			Status bar window that 'floats' over the microhelp area of a MDI frame.
//							Note:  This window opens with the Visible Setting = False.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							5.0			Initial version
// 							5.0.02		Updated check for Operating system.
// 							5.0.03		Added checks for WindowsNT 4.0.
// 							7.0			Added InsertRow to StatusBar dw
//								12.5			Platform service only if needed
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
integer	li_rc

// Get the parent window.
iw_parentwindow = ParentWindow()

// Disable the CloserQuery process.
ib_disableclosequery = true

// Determine the environment.
GetEnvironment(ienv_object)
ib_win95 = (ienv_object.ostype = Windows! and  & 
				(ienv_object.osMajorRevision = 4 or & 
					(ienv_object.osMajorRevision = 3 and &
						ienv_object.osMinorRevision >= 95))) or &
				(ienv_object.ostype = WindowsNT! and & 
				 ienv_object.osMajorRevision >= 4)

// Get the Current System settings prior to Creating the visuals.
li_rc = of_GetSystemSettings() 

// Create the visuals.
li_rc = of_CreateVisuals()
If li_rc <> 1 Then
	Close(this)
End If

// Set the initial position.
this.of_SetPosition() 

dw_statusbar.InsertRow (0)

// Go every 'n' seconds to refresh the items.
timer(ii_secondstorefresh,this) 

// Make sure focus is on the Frame.
If IsValid(iw_parentwindow) Then
	iw_parentwindow.SetFocus()
End If
end event

event timer;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			timer
//
//	Arguments: 		None
//
//	Returns:  		None
//
//	Description:  	
//	Every is_secondstorefresh this event will refresh the displayed objects.
//	Note: The timer 'pfc_timer' is updated by the DataWindow object timer.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Restore the focus point to the correct object which may not be the frame.
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

integer li_rc
graphicobject lgo_withfocus

// Check for the required reference.
If IsNull(iw_parentwindow) Or Not IsValid(iw_parentwindow) Then
	Return
End If

// Refresh the displayed objects.
li_rc = of_RefreshVisuals()

// The move/resize stopped, make the status bar visible once again.
if this.Visible=False then
	// Keep track of the object with focus.
	lgo_withfocus = GetFocus()	
	
	// Make this window visible (window gets focus).
	this.Visible = True
	
	// Restore the focus point to the previous valid focus point.
	of_RestoreFocusPoint(lgo_withfocus)
	
	// Reset the timer.
	Timer (ii_secondstorefresh, this)
end if

end event

on pfc_w_statusbar.create
int iCurrent
call super::create
this.dw_statusbar=create dw_statusbar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_statusbar
end on

on pfc_w_statusbar.destroy
call super::destroy
destroy(this.dw_statusbar)
end on

event close;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		close
//
//	Arguments:	None
//
//	Returns:  	None
//
//	Description: 
//	Destroy the platform service.
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

// Destroy the platform service.
f_setplatform(inv_platform,false)

end event

event pfc_controlgotfocus;// Override Ancestor
end event

event resize;// Override Ancestor.
end event

event move;// Override Ancestor.
end event

type dw_statusbar from u_dw within pfc_w_statusbar
integer width = 1394
integer height = 60
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event rbuttonup;// Override Ancestor.

//////////////////////////////////////////////////////////////////////////////
//
//	Event:  rbuttonup
//
//	Returns:	None
//
//	Description:
//	Notification from the GUI StatusBar.
// Notify the service that a right button up has occurred on the StatusBar.
//
// Note: The event on the service can be used to take on some action 
//	when the user performs certain actions on the Status Bar.
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

// Notify the service that a right button up has occurred on the StatusBar.
If IsValid(iw_parentwindow) Then
	iw_parentwindow.inv_statusbar.Event pfc_StatusBarrbuttonup (xpos, ypos, dwo.Name)
end If

// Keep focus on the Frame.
If IsValid(iw_parentwindow) Then
	SetFocus(iw_parentwindow)
End If
end event

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  doubleclicked
//
//	Returns:	None
//
//	Description:
//	Notification from the GUI StatusBar.
// Notify the service that a doubleclicked has occurred on the StatusBar.
//
// Note: The event on the service can be used to take on some action 
//	when the user performs certain actions on the Status Bar.
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

// Notify the service that a doubleclicked has occurred on the StatusBar.
If IsValid(iw_parentwindow) Then
	iw_parentwindow.inv_statusbar.Event pfc_StatusBarDoubleClick (xpos, ypos, dwo.Name)
end If

// Keep focus on the Frame.
If IsValid(iw_parentwindow) Then
	SetFocus(iw_parentwindow)
End If
end event

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  clicked
//
//	Returns:	None
//
//	Description:
//	Notification from the GUI StatusBar.
// Notify the service that a click has occurred on the StatusBar.
//
// Note: The event on the service can be used to take on some action 
//	when the user performs certain actions on the Status Bar.
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

// Notify the service that a click has occurred on the StatusBar.
If IsValid(iw_parentwindow) Then
	iw_parentwindow.inv_statusbar.Event pfc_StatusBarClicked (xpos, ypos, dwo.Name)
end If

// Keep focus on the Frame.
If IsValid(iw_parentwindow) Then
	SetFocus(iw_parentwindow)
End If
end event

event getfocus;// Override Ancestor. 
end event

event rbuttondown;// Override Ancestor. 

//////////////////////////////////////////////////////////////////////////////
//
//	Event:  rbuttondown
//
//	Returns:	None
//
//	Description:
// Keep focus on the Frame.
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

// Keep focus on the Frame.
If IsValid(iw_parentwindow) Then
	SetFocus(iw_parentwindow)
End If
end event

