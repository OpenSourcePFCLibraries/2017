HA$PBExportHeader$pfc_n_cst_winsrv_statusbar.sru
$PBExportComments$PFC Widow Statusbar service
forward
global type pfc_n_cst_winsrv_statusbar from n_cst_winsrv
end type
end forward

global type pfc_n_cst_winsrv_statusbar from n_cst_winsrv
event type integer pfc_resize ( unsignedlong aul_sizetype,  integer ai_newwidth,  integer ai_newheight )
event type integer pfc_move ( integer ai_xpos,  integer ai_ypos )
event pfc_statusbarrbuttonup ( integer ai_xpos,  integer ai_ypos,  string as_name )
event pfc_statusbardoubleclick ( integer ai_xpos,  integer ai_ypos,  string as_name )
event pfc_statusbarclicked ( integer ai_xpos,  integer ai_ypos,  string as_name )
event type integer pfc_hide ( )
event type integer pfc_show ( )
end type
global pfc_n_cst_winsrv_statusbar pfc_n_cst_winsrv_statusbar

type variables
Public:
// Bar display style constants.
constant integer BAR = 0
constant integer PCTCOMPLETE = 1
constant integer POSITION = 2

// Bar fill style constants.
constant integer LEFTRIGHT = 0
constant integer RIGHTLEFT = 1
constant integer TOPDOWN = 2
constant integer BOTTOMUP = 3

Protected:

// Registrable object styles constants.
constant string	TEXT = 'text'
constant string	BITMAP = 'bitmap'
constant string	PREDEFINED = 'predefined'

constant string	ics_typetext = 'text'		//Obsoleted in 6.0
constant string	ics_typebitmap = 'bitmap'	//Obsoleted in 6.0
constant string	ics_typepredefined = 'predefined'  //Obsoleted in 6.0

environment	ienv_object
integer		ii_gapwidth = 15
integer		ii_bordertype= 5
integer		ii_refreshrate = 60 // 1 minute

boolean		ib_gdi
long		il_gdithreshold
integer		ii_gdiwidth= 250
boolean		ib_user
long		il_userthreshold
integer		ii_userwidth= 270
boolean		ib_mem
longLong		ill_memthreshold
integer		ii_memwidth= 350
boolean		ib_timer
long		il_timerinterval=1000	// In milliseconds
integer		ii_timerwidth= 400
string		is_timerformat='m-d-yy h:mm:ss'

boolean		ib_bar
boolean		ib_barautoreset = True
integer		ii_bardisplaystyle = BAR 
integer		ii_barfillstyle = LEFTRIGHT 
integer		ii_barmax = 100
integer		ii_barmin = 1
integer		ii_barstep = 10
integer		ii_barposition
integer		ii_barpctcomplete = 0
integer		ii_barwidth= 200
integer		ii_barheight = 100
integer		ii_baroffsetx = 10
integer		ii_baroffsety = 7
integer		ii_barstartx
integer		ii_barstarty
long		il_barfillcolor = 10789024	// med gray
long		il_bartextcolor = 0 		//black

w_statusbar	iw_statusbar
//	7.0   Instance variable datatype changed from os_dwobjects to n_cst_winsrv_statusbarattrib type
//	7.0   Instance variable name changed from istr_dwobjects to inv_dwobjects
n_cst_winsrv_statusbarattrib	inv_dwobjects[]

// 7.0	This variable is obsolete.  Left in for migration purposes.
//			DO NOT USE THIS VARIABLE
n_cst_winsrv_statusbarattrib	istr_dwobjects[]

// MicroHelpHeight adjustable values. (if needed changed in constructor)
integer		ii_microhelpstartvalue = 61
integer		ii_microhelpsubtractvalue = 15
integer		ii_microhelpwin3xsubtractvalue = 15
integer		ii_microhelpwinnt3xsubtractvalue = 18


end variables

forward prototypes
public function integer of_open (boolean ab_switch)
public function boolean of_getmem ()
public function boolean of_getuser ()
public function boolean of_gettimer ()
public function long of_getuserthreshold ()
public function integer of_setuser (boolean ab_switch)
public function integer of_setmem (boolean ab_switch)
public function integer of_setuserthreshold (long al_threshold)
protected function integer of_registerpredefined (string as_id, integer ai_width)
public function integer of_settimer (boolean ab_switch)
public function integer of_unregister (string as_id)
protected function integer of_unregisterpredefined (string as_id)
public function integer of_getgapwidth ()
public function integer of_setgapwidth (integer ab_gap)
public function integer of_getbordertype ()
public function integer of_register (string as_id, string as_type, string as_value, integer ai_width, integer ai_bordertype, integer ai_gapwidth)
public function integer of_register (string as_id, string as_type, string as_value, integer ai_width)
public function integer of_settimerinterval (long al_milliseconds)
public function integer of_setuserwidth (integer ai_width)
public function integer of_setgdiwidth (integer ai_width)
public function integer of_setmemwidth (integer ai_width)
public function integer of_settimerwidth (integer ai_width)
public function integer of_settimerformat (string as_format)
public function integer of_register (string as_id, string as_type, string as_value, integer ai_width, integer ai_bordertype)
public function integer of_setrefreshrate (integer ai_seconds)
public function boolean of_getgdi ()
public function long of_getgdithreshold ()
public function integer of_getrefreshrate ()
protected function boolean of_ispredefined (string as_id)
public function integer of_modify (string as_id, string as_value)
public function integer of_setbordertype (integer ai_bordertype)
public function integer of_setgdi (boolean ab_switch)
public function integer of_setgdithreshold (long al_threshold)
protected function integer of_calculatemicrohelpheight ()
public function integer of_setbar (boolean ab_switch)
public function boolean of_getbar ()
public function integer of_setbarwidth (integer ai_width)
public function integer of_setbarstep (integer ai_step)
public function integer of_getbarwidth ()
public function integer of_getbarstep ()
public function integer of_modify (string as_modifyexp)
public function integer of_setbaroffsetx (integer ai_offset)
public function integer of_setbaroffsety (integer ai_offset)
public function integer of_setbarposition (integer ai_position)
public function integer of_getbarposition ()
public function integer of_barreset ()
public function integer of_getbarfillstyle ()
public function integer of_setbarfillstyle (integer ai_fillstyle)
protected function integer of_updatepredefined (string as_id, integer ai_width)
public function integer of_barincrement (integer ai_inc)
public function long of_gettimerinterval ()
public function integer of_getbardisplaystyle ()
public function integer of_setbardisplaystyle (integer ai_displaystyle)
public function boolean of_isbarautoreset ()
public function integer of_setbarautoreset (boolean ab_switch)
public function integer of_getbarpctcomplete ()
public function integer of_setbarfillcolor (long al_color)
public function long of_getbarfillcolor ()
public function integer of_getbarmaximum ()
public function integer of_getbarminimum ()
public function integer of_setbarmaximum (integer ai_maximum)
public function integer of_setbarminimum (integer ai_minimum)
public function long of_getbartextcolor ()
public function integer of_setbartextcolor (long al_textcolor)
protected function string of_barupdatevisuals (decimal adc_completion)
public function integer of_createdwobject (ref string as_createstmt, ref integer ai_width, ref integer ai_height)
public function integer of_barincrement ()
protected function integer of_restorefocuspoint (graphicobject ago_focus)
public function longlong of_getmemthreshold ()
public function integer of_setmemthreshold (longlong all_threshold)
public function integer of_setmemthreshold (long al_threshold)
end prototypes

event pfc_resize;call super::pfc_resize;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  resize
//
//	Returns:	Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  Notify statusbar window that the frame has resized.
// Note: This causes the w_statusbar window to be resized/moved to it's 
//	parents new size/position.
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

// Check the reference to the StatusBar Window.
If IsNull(iw_statusbar) Or Not IsValid(iw_statusbar) Then
	Return -1
End If

Return iw_statusbar.of_RefreshPosition()

end event

event pfc_move;call super::pfc_move;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_move
//
//	Returns:	Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  Notify statusbar window that the frame has moved.
// Note: This causes the w_statusbar window to be resized/moved to it's 
//	parents new size/position.
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

// Check the reference to the StatusBar Window.
If IsNull(iw_statusbar) Or Not IsValid(iw_statusbar) Then
	Return -1
End If

Return iw_statusbar.of_RefreshPosition()

end event

event pfc_statusbarrbuttonup;call super::pfc_statusbarrbuttonup;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_StatusBarRButtonUp
//
//	Returns:	None
//
//	Description:
//	Notification from the GUI StatusBar.
// A Right Button Up has occurred on the StatusBar.
//
// Note: This event can be used to take some action when the user performs
//	the action on the Status Bar.
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


end event

event pfc_statusbardoubleclick;call super::pfc_statusbardoubleclick;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_StatusBarDoubleClick
//
//	Returns:	None
//
//	Description:
//	Notification from the GUI StatusBar.
// A doubleclick has occurred on the StatusBar.
//
// Note: This event can be used to take some action when the user performs
//	the action on the Status Bar.
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


end event

event pfc_statusbarclicked;call super::pfc_statusbarclicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_StatusBarClick
//
//	Returns:	None
//
//	Description:
//	Notification from the GUI StatusBar.
// A click has occurred on the StatusBar.
//
// Note: This event can be used to take some action when the user performs
//	the action on the Status Bar.
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


end event

event pfc_hide;call super::pfc_hide;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_hide
//
//	Returns:	Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  Notify statusbar window that the frame has been hidden.
// Note: This causes the w_statusbar window to be hidden.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0.03   Initial version
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

// Check the reference to the StatusBar Window.
If IsNull(iw_statusbar) Or Not IsValid(iw_statusbar) Then
	Return -1
End If

Return iw_statusbar.of_RefreshPosition()
end event

event pfc_show;call super::pfc_show;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_show
//
//	Returns:	Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:  Notify statusbar window that the frame has been shown.
// Note: This causes the w_statusbar window to be Shown.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0.03   Initial version
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

// Check the reference to the StatusBar Window.
If IsNull(iw_statusbar) Or Not IsValid(iw_statusbar) Then
	Return -1
End If

Return iw_statusbar.of_RefreshPosition()
end event

public function integer of_open (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_Open
//
//	Access:  	public
//
//	Arguments:	
//	ab_switch	True to open the window. False to close the window.
//
//	Returns:  	Integer
//	1 if it succeeds.
//	0 no action taken.
//$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Opens an instance of w_statusbar window.
//	Sets the desired refresh rate.
//	Makes sure focus stays on the Frame window.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Added functionality to properly restore focus.
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

Integer 	li_rc 
Integer	li_width, li_height
string 	ls_dwdefinition
graphicobject lgo_withfocus

//Check arguments
If IsNull(ab_switch) Then
	Return -1
End If

// Check window reference.
If IsNull(iw_requestor) Or Not IsValid(iw_requestor) Then
	Return -1
End If

// Create the datawindow object.
li_rc = of_createdwobject(ls_dwdefinition, li_width, li_height)
If li_rc <> 1 Then Return -1

If ab_switch Then
	// Get the current object with focus.
	lgo_withfocus = GetFocus()
	
	// Open the status bar window.
	li_rc = Open(iw_statusbar, iw_requestor)
	
	// Restore the focus to the previous object.
	of_RestoreFocusPoint(lgo_withfocus)
	
	// Set the Refresh rate on the status bar window.
	If IsValid(iw_statusbar) Then
		iw_statusbar.of_SetRefreshRate(ii_refreshrate)
	End If
	Return li_rc
Else
	If IsValid(iw_statusbar) Then
		li_rc = Close(iw_statusbar)
		Return li_rc
	End If
End If

Return 0
end function

public function boolean of_getmem ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetMem
//
//	Access:  Public
//
//	Arguments:	None
//	
//	Returns:  boolean
//	True if computer memory is being reported; otherwise false.
//
//	Description:
//	Reports True if computer memory is being reported; otherwise false.
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

Return ib_mem
end function

public function boolean of_getuser ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetUser
//
//	Access:  Public
//
//	Arguments:	None
//	
//	Returns:  boolean
//	True if User memory is being reported; otherwise false.
//
//	Description:
//	Reports True if User memory is being reported; otherwise false.
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

Return ib_user
end function

public function boolean of_gettimer ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetTimer
//
//	Access:  Public
//
//	Arguments:	None
//	
//	Returns:  boolean
//	True if a Timer is being reported; otherwise false.
//
//	Description:
//	Reports True if a Timer is being reported; otherwise false.
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

Return ib_timer
end function

public function long of_getuserthreshold ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetUserThreshold
//
//	Access:  Public
//
//	Arguments:	None
//	
//	Returns:  long
//	The current User Memory Threshold value.
//
//	Description:
//	Gets the current User Memory Threshold value.
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

Return il_userthreshold
end function

public function integer of_setuser (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetUser
//
//	Access:  Public
//
//	Arguments:	
//	ab_switch	True to have the setting on the Status Bar.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Sets the flag to indicate if User memory is to be reported on the Status Bar.
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

// Check arguments.
If IsNull(ab_switch) Then
	Return -1
End If

If ib_user = ab_switch Then
	// No change.
	Return 0
End If

// Set the flag.
ib_user = ab_switch

// Register or Unregister the Pre-Defined option.
If ib_user Then
	li_rc = of_RegisterPreDefined('pfc_user', ii_userwidth)
Else
	li_rc = of_UnRegisterPreDefined('pfc_user')
End If		
Return li_rc
end function

public function integer of_setmem (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetMem
//
//	Access:  Public
//
//	Arguments:	
//	ab_switch	True to have the setting on the Status Bar.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Sets the flag to indicate if Computer memory is to be reported on the Status Bar.
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

// Check arguments.
If IsNull(ab_switch) Then
	Return -1
End If

If ib_mem = ab_switch Then
	// No change.
	Return 0
End If

// Set the flag.
ib_mem = ab_switch

// Register or Unregister the Pre-Defined option.
If ib_mem Then
	li_rc = of_RegisterPreDefined('pfc_mem', ii_memwidth)
Else
	li_rc = of_UnRegisterPreDefined('pfc_mem')
End If
Return li_rc
end function

public function integer of_setuserthreshold (long al_threshold);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetUserThreshold
//
//	Access:  Public
//
//	Arguments:
//	al_threshold	The new Threshold.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Sets a new User Memory Threshold value.
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

// Check arguments.
If IsNull(al_threshold) or al_threshold < 0 Then
	Return -1
End If

il_userthreshold = al_threshold
Return 1
end function

protected function integer of_registerpredefined (string as_id, integer ai_width);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RegisterPreDefined
//
//	Access:  Protected
//
//	Arguments:
//	as_id			The ID of the Pre Defined object to be Registered.
//	ai_width		The desired width of the object.
//	
//	Returns:  integer
//	1 if it succeeds and -1 if an error occurs.
//
//	Description:
//	Registers a Pre-Defined object to be displayed on the GUI Status Bar.
//
//	Note: Will use the current default values for BorderType and GapWidth.
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

Integer 	li_upper
Integer	li_cnt

// Check arguments.
If IsNull(as_id) or Len(trim(as_id))= 0 or  &
	IsNull(ai_width) or ai_width < 0 Then
	Return -1
End If

// Check for a predefined ID.
If Not of_IsPredefined(Trim(as_id)) Then
	// Only valid for Pre-Defined IDs.
	Return -1
End If

// Get the number of Items currently registered.
li_upper = UpperBound (inv_dwobjects)

// Make sure this is not a duplicate ID.
For li_cnt = 1 to li_upper
	If as_id = inv_dwobjects[li_cnt].s_id Then
		Return -1
	End If
Next

// This is a new valid object.  Increment the counter to add it.
li_upper ++

// Add the new object.
inv_dwobjects[li_upper].s_id = as_id
inv_dwobjects[li_upper].s_type = 'predefined'
inv_dwobjects[li_upper].i_width = ai_width
inv_dwobjects[li_upper].i_bordertype = ii_bordertype
inv_dwobjects[li_upper].i_gapwidth = ii_gapwidth

// Notify the GUI of a new object.
If IsValid(iw_statusbar) Then
	iw_statusbar.of_CreateVisuals()
End If

Return 1
end function

public function integer of_settimer (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetTimer
//
//	Access:  Public
//
//	Arguments:	
//	ab_switch	True to have the setting on the Status Bar.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Sets the flag to indicate if a Timer is to be displayed on the Status Bar.
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

// Check arguments.
If IsNull(ab_switch) Then
	Return -1
End If

If ib_timer = ab_switch Then
	// No change.
	Return 0
End If

// Set the flag.
ib_timer = ab_switch

// Register or Unregister the Pre-Defined option.
If ib_timer Then
	li_rc = of_RegisterPreDefined('pfc_timer', ii_timerwidth)
Else
	li_rc = of_UnRegisterPreDefined('pfc_timer')
End If
Return li_rc
end function

public function integer of_unregister (string as_id);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetUnRegister
//
//	Access:  Public
//
//	Arguments:
//	as_id		The ID of the User Defined object to UnRegister.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	UnRegisters the desired User Defined object.
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

Integer 	li_upper
Integer	li_cnt
integer	li_rc

// Check arguments.
If IsNull(as_id) or Len(trim(as_id))= 0 Then
	Return -1
End If

// Check for a predefined id.
If of_IsPredefined(Trim(as_id)) Then
	Return -1
End If

// Get the number of Items currently registered.
li_upper = UpperBound (inv_dwobjects)

// Find the ID and blank the value.
For li_cnt = 1 to li_upper
	If as_id = inv_dwobjects[li_cnt].s_id Then
		inv_dwobjects[li_cnt].s_id = ''
		inv_dwobjects[li_cnt].s_type = ''
		inv_dwobjects[li_cnt].s_value = ''
		inv_dwobjects[li_cnt].i_width = 0
		
		// Notify the GUI change.
		If IsValid(iw_statusbar) Then
			li_rc = iw_statusbar.of_CreateVisuals()
		End If
		Return li_rc
	End If
Next

// Id was not found.
Return -1
end function

protected function integer of_unregisterpredefined (string as_id);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetUnRegisterPredefined
//
//	Access:  Public
//
//	Arguments:
//	as_id		The ID of the Pre-Defined object to UnRegister.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	UnRegisters the desired Pre-Defined object.
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

Integer 	li_upper
Integer	li_cnt
integer	li_rc

// Check arguments.
If IsNull(as_id) or Len(trim(as_id))= 0 Then
	Return -1
End If

// Check for a predefined id.
If Not of_IsPredefined(Trim(as_id)) Then
	Return -1
End If

// Get the number of Items currently registered.
li_upper = UpperBound (inv_dwobjects)

// Find the ID and blank the value.
For li_cnt = 1 to li_upper
	If as_id = inv_dwobjects[li_cnt].s_id Then
		inv_dwobjects[li_cnt].s_id = ''
		inv_dwobjects[li_cnt].s_type = ''
		inv_dwobjects[li_cnt].s_value = ''
		inv_dwobjects[li_cnt].i_width = 0
		
		// Notify the GUI change.
		If IsValid(iw_statusbar) Then
			li_rc = iw_statusbar.of_CreateVisuals()
		End If
		Return li_rc
	End If
Next

// Id was not found.
Return -1
end function

public function integer of_getgapwidth ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetGapWidth
//
//	Access:  Public
//
//	Arguments:	None
//	
//	Returns:  integer
//	The Default gap width for any object created.
//
//	Description:
//	Gets the default gap width for any object created.
//	The gap width is the spacing between the previous object created and the
//	next object created.
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

Return ii_gapwidth
end function

public function integer of_setgapwidth (integer ab_gap);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetGapWidth
//
//	Access:  Public
//
//	Arguments:
//	ab_gap	The new default Gap Width.
//	
//	Returns:  integer
//	1 if it succeeds and -1 if an error occurs.
//
//	Description:
//	Set the default Gap Width for any *future* object.
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

// Check argument.
If IsNull(ab_gap) or ab_gap <= 0 Then
	Return -1
End If

//	Set the default Gap Width for any *future* object.
ii_gapwidth = ab_gap
Return 1
end function

public function integer of_getbordertype ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetBorderType
//
//	Access:  Public
//
//	Arguments:	None
//	
//	Returns:  integer
//	The Default border type for any object created.
//
//	Description:
//	Gets the default border type for any object created.
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

Return ii_bordertype
end function

public function integer of_register (string as_id, string as_type, string as_value, integer ai_width, integer ai_bordertype, integer ai_gapwidth);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Register
//
//	Access:  Public
//
//	Arguments:
//	as_id			The ID of the User Defined object to be Registered.
//	as_type		The type of object.
//						Valid values are 'text' and 'bitmap'.
//	as_value		The initial value of the object.
//	ai_width		The desired width of the object.
//	ai_bordertype	The border type to use around the object.
//	ai_gapwidth	The gap to use from the previous registered object.
//	
//	Returns:  integer
//	1 if it succeeds and -1 if an error occurs.
//
//	Description:
//	Registers a new object to be displayed on the GUI Status Bar.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 6.0	Changed to use new constants.
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

Integer 	li_upper
Integer	li_cnt

// Check arguments.
If IsNull(as_id) or Len(trim(as_id))= 0 or IsNull(as_value) or &
	IsNull(ai_width) or ai_width < 0 or IsNull(ai_bordertype) or &
	ai_bordertype <0 or ai_bordertype >6 or IsNull(ai_gapwidth) or &
	ai_gapwidth <=0 Then
	Return -1
End If

// Check for a valid type.
If as_type <> BITMAP And as_type <> TEXT Then
	Return -1
End If

// Check for a predefined id.
If of_IsPredefined(Trim(as_id)) Then
	Return -1
End If

// Get the number of Items currently registered.
li_upper = UpperBound (inv_dwobjects)

// Make sure this is not a duplicate ID.
For li_cnt = 1 to li_upper
	If as_id = inv_dwobjects[li_cnt].s_id Then
		Return -3
	End If
Next

// This is a new valid object.  Increment the counter to add it.
li_upper ++

// Add the new object.
inv_dwobjects[li_upper].s_id = as_id
inv_dwobjects[li_upper].s_type = as_type
inv_dwobjects[li_upper].s_value = as_value
inv_dwobjects[li_upper].i_width = ai_width
inv_dwobjects[li_upper].i_bordertype = ai_bordertype
inv_dwobjects[li_upper].i_gapwidth = ai_gapwidth

// Notify the GUI of a new object.
If IsValid(iw_statusbar) Then
	iw_statusbar.of_CreateVisuals()
End If

Return 1
end function

public function integer of_register (string as_id, string as_type, string as_value, integer ai_width);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Register
//
//	Access:  Public
//
//	Arguments:
//	as_id			The ID of the User Defined object to be Registered.
//	as_type		The type of object.
//						Valid values are 'text' and 'bitmap'.
//	as_value		The initial value of the object.
//	ai_width		The desired width of the object.
//	
//	Returns:  integer
//	1 if it succeeds and -1 if an error occurs.
//
//	Description:
//	Registers a new object to be displayed on the GUI Status Bar.
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

// Register using the current default values for BorderType and GapWidth.
Return of_Register(as_id, as_type, as_value, ai_width, &
						ii_bordertype, ii_gapwidth)
end function

public function integer of_settimerinterval (long al_milliseconds);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetTimerInterval
//
//	Access:  Public
//
//	Arguments:	
//	al_milliseconds	The new Timer Interval to be used in updating the Timer
//							object.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Sets the new Timer Interval to be used in updating the Timer
//	object (if any has been requested or is later requested).
//
//	Note: This only applies to the Pre-Defined Timer object.
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

// Check arguments.
If IsNull(al_milliseconds) or al_milliseconds <0 Then
	Return -1
End If

// Set the timer interval.
il_timerinterval = al_milliseconds

// Notify the GUI of a new value.
If IsValid(iw_statusbar) Then
	li_rc = iw_statusbar.of_UpdateDWTimerInterval(al_milliseconds)
End If


Return 1
end function

public function integer of_setuserwidth (integer ai_width);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetUserWidth
//
//	Access:  Public
//
//	Arguments:
//	ai_width		The new Width.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Sets a new User Memory Width value.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Enhanced to accept a new width after object has been registered.
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

// Check arguments.
If IsNull(ai_width) or ai_width < 0 Then
	Return -1
End If

ii_userwidth = ai_width

// Update the object width, if already registered.
of_UpdatePreDefined('pfc_user', ai_width)

Return 1
end function

public function integer of_setgdiwidth (integer ai_width);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetGDIWidth
//
//	Access:  Public
//
//	Arguments:
//	ai_width		The new Width.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Sets a new GDI Memory Width value.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Enhanced to accept a new width after object has been registered.
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

// Check arguments.
If IsNull(ai_width) or ai_width < 0 Then
	Return -1
End If

ii_gdiwidth = ai_width

// Update the object width, if already registered.
of_UpdatePreDefined('pfc_gdi', ai_width)

Return 1
end function

public function integer of_setmemwidth (integer ai_width);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetMemWidth
//
//	Access:  Public
//
//	Arguments:
//	ai_width		The new Width.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Sets a new Computer Memory Width value.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Enhanced to accept a new width after object has been registered.
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

// Check arguments.
If IsNull(ai_width) or ai_width < 0 Then
	Return -1
End If

ii_memwidth = ai_width

// Update the object width, if already registered.
of_UpdatePreDefined('pfc_mem', ai_width)

Return 1
end function

public function integer of_settimerwidth (integer ai_width);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetTimerWidth
//
//	Access:  Public
//
//	Arguments:
//	ai_width		The new Width.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Sets a new Timer Width value.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Enhanced to accept a new width after object has been registered.
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

// Check arguments.
If IsNull(ai_width) or ai_width < 0 Then
	Return -1
End If

ii_timerwidth = ai_width

// Update the object width, if already registered.
of_UpdatePreDefined('pfc_timer', ai_width)

Return 1
end function

public function integer of_settimerformat (string as_format);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetTimerFormat
//
//	Access:  Public
//
//	Arguments:	
//	as_format	The new format to be used on a Timer object.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Sets the new format to be used on a Timer Object.
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

// Check arguments.
If IsNull(as_format) Then
	Return -1
End If

// Set the new format.
is_timerformat = as_format

// Notify the GUI of a new value.
If IsValid(iw_statusbar) Then
	iw_statusbar.of_updatetimerformat(is_timerformat)
End If

Return 1
end function

public function integer of_register (string as_id, string as_type, string as_value, integer ai_width, integer ai_bordertype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Register
//
//	Access:  Public
//
//	Arguments:
//	as_id			The ID of the User Defined object to be Registered.
//	as_type		The type of object.
//						Valid values are 'text' and 'bitmap'.
//	as_value		The initial value of the object.
//	ai_width		The desired width of the object.
//	ai_bordertype	The border type to use around the object.
//	
//	Returns:  integer
//	1 if it succeeds and -1 if an error occurs.
//
//	Description:
//	Registers a new object to be displayed on the GUI Status Bar.
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

// Register using the current default values for GapWidth.
Return of_Register(as_id, as_type, as_value, ai_width, ai_bordertype, ii_gapwidth)
end function

public function integer of_setrefreshrate (integer ai_seconds);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetRefreshRate
//
//	Access:  Public
//
//	Arguments:
//	ai_seconds	The new Refresh Rate in seconds.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Sets a new Refresh Rate for the GUI Status Bar.
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

// Check arguments.
If IsNull(ai_seconds) or ai_seconds < 0 Then
	Return -1
End If

// Ret the new rate.
ii_refreshrate = ai_seconds

// Notify the GUI of a new value.
If IsValid(iw_statusbar) Then
	iw_statusbar.of_SetRefreshRate(ii_refreshrate)
End If

Return 1
end function

public function boolean of_getgdi ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetGDI
//
//	Access:  Public
//
//	Arguments:	None
//	
//	Returns:  boolean
//	True if GDI memory is being reported; otherwise false.
//
//	Description:
//	Reports True if GDI memory is being reported; otherwise false.
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

Return ib_gdi
end function

public function long of_getgdithreshold ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetGDIThreshold
//
//	Access:  Public
//
//	Arguments:	None
//	
//	Returns:  long
//	The current GDI Memory Threshold value.
//
//	Description:
//	Gets the current GDI Memory Threshold value.
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

Return il_gdithreshold
end function

public function integer of_getrefreshrate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetRefreshRate
//
//	Access:  Public
//
//	Arguments:	None
//	
//	Returns:  long
//	The current Refresh Rate.
//
//	Description:
//	Gets the current Refresh Rate.
//
//	Note: The Timer option does not use this refresh rate.  Look at 
//	of_SetTimerInterval() for more information.
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

Return ii_refreshrate
end function

protected function boolean of_ispredefined (string as_id);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_IsPredefined
//
//	Access:  Protected
//
//	Arguments:
//	as_id		The ID to test.
//
//	Returns:  boolean
//	True if the ID is a Pre-defined ID.
//
//	Description:
//	Determines if the passed ID is a Pre-defined ID.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0   Added pfc_progress for progress bar ability
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

// Convert to lower case.
as_id = Lower(as_id)

// Check if a Pre-Defined ID.
If as_id = 'pfc_timer' or as_id = 'pfc_gdi' or &
	as_id = 'pfc_user' or as_id = 'pfc_mem' or &
	as_id = 'pfc_progress' Then
	// It is a Pre-Defined ID.
	Return True
End If

// Not a Pre-Defined ID.
Return False
end function

public function integer of_modify (string as_id, string as_value);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Modify
//
//	Access:  Public
//
//	Arguments:
//	as_id			The ID of the object to be modified.
//	as_value		The value to be used on the modification of the object.
//	
//	Returns:  integer
//	1 if it succeeds and -1 if an error occurs.
//
//	Description:
//	Modifies the value of the User Defined object.
//	The object can either be a text value or a bitmap name.
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

Integer 	li_upper
Integer	li_cnt
integer	li_rc =1

// Check arguments.
If IsNull(as_id) or Len(trim(as_id))= 0 or IsNull(as_value) Then
	Return -1
End If

// Check for a predefined id.
If of_IsPredefined(Trim(as_id)) Then
	// This is not a valid operation on a pre-defined ID.
	Return -1
End If

// Get the number of Items currently registered.
li_upper = UpperBound (inv_dwobjects)

// Find the ID and Update it.
For li_cnt = 1 to li_upper
	If as_id = inv_dwobjects[li_cnt].s_id Then
		// Modify the value.
		inv_dwobjects[li_cnt].s_value = as_value
		// Notify the GUI of a new value.
		If IsValid(iw_statusbar) Then
			li_rc = iw_statusbar.of_UpdateVisuals( &
					inv_dwobjects[li_cnt].s_id,  inv_dwobjects[li_cnt].s_type, &
					inv_dwobjects[li_cnt].s_value)
		End If
		Return li_rc
	End If
Next

// The ID has not been registered.
Return -1
end function

public function integer of_setbordertype (integer ai_bordertype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetBorderType
//
//	Access:  Public
//
//	Arguments:
//	ai_bordertype	The new default border type.
//	
//	Returns:  integer
//	1 if it succeeds and -1 if an error occurs.
//
//	Description:
//	Set the default border type for any *future* object.
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

// Check argument.
If IsNull(ai_bordertype) or ai_bordertype <0 or ai_bordertype >6 Then
	Return -1
End If

//	Set the default border type for any *future* object.
ii_bordertype = ai_bordertype
Return 1
end function

public function integer of_setgdi (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetGDI
//
//	Access:  Public
//
//	Arguments:	
//	ab_switch	True to have the setting on the Status Bar.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Sets the flag to indicate if GDI memory is to be reported on the Status Bar.
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

// Check arguments.
If IsNull(ab_switch) Then
	Return -1
End If

If ib_gdi = ab_switch Then
	// No change.
	Return 0
End If

// Set the flag.
ib_gdi = ab_switch

// Register or Unregister the Pre-Defined option.
If ib_gdi Then
	li_rc = of_RegisterPreDefined('pfc_gdi', ii_gdiwidth)
Else
	li_rc = of_UnRegisterPreDefined('pfc_gdi')
End If
Return li_rc
end function

public function integer of_setgdithreshold (long al_threshold);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetGDIThreshold
//
//	Access:  Public
//
//	Arguments:
//	al_threshold	The new Threshold.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Sets a new GDI Memory Threshold value.
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

// Check arguments.
If IsNull(al_threshold) or al_threshold < 0 Then
	Return -1
End If

il_gdithreshold = al_threshold
Return 1
end function

protected function integer of_calculatemicrohelpheight ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_CalculateMicroHelpHeight
//
//	Access:  Protected
//
//	Arguments:	None
//
//	Returns:  integer
//	The MicroHelpHeight to be used by the service.
//
//	Description:
//	Gets the Frame MicroHelp Height. 
// Takes into consideration the differences by Environment.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Updated check for Operating system.
// 5.0.04 Added more control to the calculation.
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

Integer	li_microhelpheight=61
w_frame	lw_framerequestor
string	ls_os

// Determine the "environment"
If ienv_object.ostype = Windows! Then
	If ienv_object.osMajorRevision <= 3 and ienv_object.osMinorRevision < 95 Then
		ls_os = 'windows3x'
	Else
		ls_os = 'windows95'
	End If
ElseIf ienv_object.ostype = WindowsNT! Then
	If ienv_object.osMajorRevision <= 3 Then
		ls_os = 'windowsnt3x'
	Else
		ls_os = 'windowsnt4x'
	End If
End If

// Default Micro Help Start Value Height.
li_microhelpheight = ii_microhelpstartvalue

// Get the Real Frame Micro Help Height.
lw_framerequestor = iw_requestor
If IsValid(lw_framerequestor) Then
	li_microhelpheight = lw_framerequestor.mdi_1.microhelpheight
End If

// Allow for the bottom border on MicroHelp.
li_microhelpheight = li_microhelpheight - ii_microhelpsubtractvalue

// Allow for the extra spacing on Win3x GUI.
If ls_os = 'windows3x' Then
	li_microhelpheight = li_microhelpheight - ii_microhelpwin3xsubtractvalue
ElseIf ls_os = 'windowsnt3x' Then
	li_microhelpheight = li_microhelpheight - ii_microhelpwinnt3xsubtractvalue
End If

Return li_microhelpheight
end function

public function integer of_setbar (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetBar
//
//	Access:		Public
//
//	Arguments:	
//	ab_switch	True to have the setting on the Status Bar.
//	
//	Returns:		Integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Sets the flag to indicate if a progress bar is to be shown on the Status Bar.
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

Integer li_rc

// Check arguments.
If IsNull(ab_switch) Then
	Return -1
End If

If ib_bar = ab_switch Then
	// No change.
	Return 0
End If

// Set the flag.
ib_bar = ab_switch

// Register or Unregister the Pre-Defined option.
If ib_bar Then
	li_rc = of_RegisterPreDefined('pfc_progress', ii_barwidth)
Else
	li_rc = of_UnRegisterPreDefined('pfc_progress')
End If
Return li_rc
end function

public function boolean of_getbar ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetBar
//
//	Access:		Public
//
//	Arguments:	None
//	
//	Returns:		boolean
//	True if bar is being displayed; otherwise false.
//
//	Description:
//	Reports True if bar is being displayed; otherwise false.
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

Return ib_bar
end function

public function integer of_setbarwidth (integer ai_width);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetBarWidth
//
//	Access:		Public
//
//	Arguments:
//	ai_width		The new Width.
//	
//	Returns:		Integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Sets a new bar Width value.
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

// Check arguments.
If IsNull(ai_width) or ai_width < 0 Then
	Return -1
End If

// Update the object width, if already registered.
of_UpdatePreDefined('pfc_progress', ai_width)

Return 1
end function

public function integer of_setbarstep (integer ai_step);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetBarStep
//
//	Access:		Public
//
//	Arguments:
//	ai_step	The new step/increment value of the bar.
//	
//	Returns:		Integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Sets a new step/increment value of the bar.
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

// Check arguments.
If IsNull(ai_step) or (ai_step <= 0) Then
	Return -1
End If

ii_barstep = ai_step

Return 1
end function

public function integer of_getbarwidth ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetBarWidth
//
//	Access:		Public
//
//	Arguments:	None
//	
//	Returns:		integer
//	The width of the progress bar area.
//
//	Description:
//	Reports the with of the progress bar area
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

Return ii_barwidth
end function

public function integer of_getbarstep ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetBarStep
//
//	Access:		Public
//
//	Arguments:	None
//	
//	Returns:		integer
//	The step value of the progress bar.
//
//	Description:
//	Reports the step value of the progress bar
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

Return ii_barstep
end function

public function integer of_modify (string as_modifyexp);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_Modify
//
//	Access:		Public
//
//	Arguments:
//	as_modify	The string to be used on the modification of the object.
//	
//	Returns:		integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Modifies the value of the User Defined object.
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

integer	li_rc = 1

// Check arguments.
If IsNull(as_modifyexp) or Len(trim(as_modifyexp))= 0  Then
	Return -1
End If

If IsValid(iw_statusbar) Then
	li_rc = iw_statusbar.of_modify(as_modifyexp)
Else
	Return -1
End If

Return li_rc
end function

public function integer of_setbaroffsetx (integer ai_offset);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetBarOffsetX
//
//	Access:		Public
//
//	Arguments:
//	ai_offset	The new offset for the bar.
//	
//	Returns:		Integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Sets the X offset of the bar.
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

// Check arguments.
If IsNull(ai_offset) or ai_offset < 0 Then
	Return -1
End If

ii_baroffsetx = ai_offset

// Notify the GUI of the change.
If IsValid(iw_statusbar) Then
	li_rc = iw_statusbar.of_CreateVisuals()
End If

Return li_rc
end function

public function integer of_setbaroffsety (integer ai_offset);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetBarOffsetY
//
//	Access:		Public
//
//	Arguments:
//	ai_offset	The new offset for the bar.
//	
//	Returns:		Integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Sets the Y offset of the bar.
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

// Check arguments.
If IsNull(ai_offset) or ai_offset < 0 Then
	Return -1
End If 

ii_baroffsety = ai_offset

// Notify the GUI of the change.
If IsValid(iw_statusbar) Then
	li_rc = iw_statusbar.of_CreateVisuals()
End If

Return li_rc
end function

public function integer of_setbarposition (integer ai_position);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetBarPosition
//
//	Access:		Public
//
//	Arguments:
//	ai_position	The new position of the bar.
//	
//	Returns:		Integer
//	SUCCESS = the current position of the progress bar
//	ERROR = -1
//
//	Description:
//	Sets the current position of the progress bar
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
decimal	ldc_completion
string	ls_modifyexp, ls_visible
integer	li_rc

// Check arguments.
If IsNull(ai_position) Then
	Return -1
End If

// If this is less than the minimum, the current position is set to the minimum
if ai_position < ii_barmin then
	ai_position = ii_barmin
end if

// If this is greater than the maximum, the current position is set to the maximum
if ai_position > ii_barmax then
	ai_position = ii_barmax
end if

ii_barposition = ai_position

// if maximum value is zero we are completed (prevents divide by zero)
// otherwise find our completion percentage
if (ii_barmax = 0) or (ii_barposition > ii_barmax) then
	ldc_completion = 1
else
	ls_visible = 'pfc_progress.visible="1" '
	ldc_completion = ii_barposition / ii_barmax
	ii_barpctcomplete = ldc_completion * 100
end if

ls_modifyexp = of_BarUpdateVisuals(ldc_completion)
li_rc = of_Modify(ls_visible + ls_modifyexp)

// turn off bar after it reaches 100%
if ldc_completion >= 1 and ib_barautoreset then
	this.post function of_barreset()
end if

if li_rc < 0 then
	Return li_rc
else
	Return ii_barposition
end if
end function

public function integer of_getbarposition ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetBarPosition
//
//	Access:		Public
//
//	Arguments:	None
//	
//	Returns:		integer
//	The current position of the progress bar.
//
//	Description:
//	Reports the current position of the progress bar
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

Return ii_barposition
end function

public function integer of_barreset ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_BarReset
//
//	Access:  	Public
//
//	Arguments:	None
//	
//	Returns:		Integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Turns the visible components of the progress bar off.
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
Integer	li_rc
	
// turn off the progress bar
li_rc = of_Modify('pfc_progress.visible="0"')
if li_rc < 0 then return -1
li_rc = of_Modify("pfc_progress_border.expression=~"' '~" ")
if li_rc < 0 then return -1

// reset the position of the progress bar
ii_barposition = ii_barmin
ii_barpctcomplete = 0

return li_rc
end function

public function integer of_getbarfillstyle ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetBarFillStyle
//
//	Access:  	Public
//
//	Arguments:	None
//	
//	Returns:  	the fill style of the progress bar.
//
//	Description:
//	Return the fill style of the progress bar.
// fill style
//	 LEFTRIGHT = 0
//	 RIGHTLEFT = 1
//	 TOPDOWN = 2
//	 BOTTOMUP = 3
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

return ii_barfillstyle


end function

public function integer of_setbarfillstyle (integer ai_fillstyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetBarFillStyle
//
//	Access:  	Public
//
//	Arguments:
//	ai_fillstyle		fill style of the progress bar.
//	
//	Returns:		Integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Set the fill style of the progress bar.
// fill style
//	 LEFTRIGHT = 0
//	 RIGHTLEFT = 1
//	 TOPDOWN = 2
//	 BOTTOMUP = 3
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

// Check arguments.
If IsNull(ai_fillstyle) Then
	Return -1
End If

if NOT ((ai_fillstyle = LEFTRIGHT) or (ai_fillstyle = RIGHTLEFT) or &
			(ai_fillstyle = TOPDOWN) or (ai_fillstyle = BOTTOMUP)) then 
	return -1
end if

ii_barfillstyle = ai_fillstyle

Return 1
end function

protected function integer of_updatepredefined (string as_id, integer ai_width);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_UpdatePreDefined
//
//	Access:  Protected
//
//	Arguments:
//	as_id			The ID of the Pre Defined object.
//	ai_width		The new desired width of the object.
//	
//	Returns:  integer
//	1 if it succeeds
//	0 if the ID is not registered.
// -1 if an error occurs.
//
//	Description:
//	Updates a Pre-Defined object information (if registered).
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0.03   Initial version
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

Integer 	li_upper
Integer	li_cnt
Integer	li_id=0

// Check arguments.
If IsNull(as_id) or Len(trim(as_id))= 0 or  &
	IsNull(ai_width) or ai_width < 0 Then
	Return -1
End If

// Check for a predefined ID.
If Not of_IsPredefined(Trim(as_id)) Then
	// Only valid for Pre-Defined IDs.
	Return -1
End If

// Get the number of Items currently registered.
li_upper = UpperBound (inv_dwobjects)

// Find the ID.
For li_cnt = 1 to li_upper
	If as_id = inv_dwobjects[li_cnt].s_id Then
		li_id = li_cnt
		Exit
	End If
Next

// Check if the ID was found.
If li_id = 0 Then
	Return 0
End If

// Update the object.
inv_dwobjects[li_id].i_width = ai_width

// Notify the GUI of the change.
If IsValid(iw_statusbar) Then
	iw_statusbar.of_CreateVisuals()
End If

Return 1
end function

public function integer of_barincrement (integer ai_inc);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_BarIncrement
//
//	Access:		Public
//
//	Arguments:	
//	ai_inc	the value to increment the progress bar.
//	
//	Returns:		integer
//	 the new position of the progress bar
//
//	Description:
//	Increments the progress bar by ai_inc
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

if (ai_inc <= 0) or isnull(ai_inc) then
	return -1
end if

// increment the position i = i+inc
ii_barposition += ai_inc

// display the change on the progress bar
return of_setbarposition(ii_barposition)

end function

public function long of_gettimerinterval ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetTimerInterval
//
//	Access:  Public
//
//	Arguments:	
//	al_milliseconds	The Timer Interval (in milliseconds) being used in updating the Timer
//							object.
//	
//	Returns:  long
//	The Timer Interval (in milliseconds) being used in updating the Timer object.
//	(if any has been requested or is later requested).
//
//	Description:
//	Gets the Timer Interval (in milliseconds) being used in updating the Timer
//	object (if any has been requested or is later requested).
//
//	Note: This only applies to the Pre-Defined Timer object.
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

Return il_timerinterval
end function

public function integer of_getbardisplaystyle ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetBarDisplayStyle
//
//	Access:  	Public
//
//	Arguments:	None
//	
//	Returns:  	the display style of the progress bar.
//
//	Description:
//	Return the display style of the progress bar.
// display style
//		BAR = 0
//		PCTCOMPLETE = 1
//		POSITION = 2
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

return ii_bardisplaystyle


end function

public function integer of_setbardisplaystyle (integer ai_displaystyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetBarDisplayStyle
//
//	Access:  	Public
//
//	Arguments:
//	ai_style		display style of the progress bar.
//	
//	Returns:	Integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Set the display style of the progress bar.
// display style
//		BAR = 0
//		PCTCOMPLETE = 1
//		POSITION = 2
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

// Check arguments.
If IsNull(ai_displaystyle) Then
	Return -1
End If

if NOT ((ai_displaystyle = BAR) or (ai_displaystyle = PCTCOMPLETE) or &
			(ai_displaystyle = POSITION)) then 
	return -1
end if

ii_bardisplaystyle = ai_displaystyle

Return 1
end function

public function boolean of_isbarautoreset ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_IsBarAutoReset
//
//	Access:		Public
//
//	Arguments:	None
//	
//	Returns:		boolean
//	True if bar is to be reset upon reaching 100%.
//
//	Description:
//	Reports True if bar is to be reset upon reaching 100%; otherwise false.
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

Return ib_barautoreset
end function

public function integer of_setbarautoreset (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetBarAutoReset
//
//	Access:		Public
//
//	Arguments:	
//	ab_switch	True to have the progress bar reset itself out at 100%.
//	
//	Returns:		Integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Sets the flag to indicate the progress bar should reset itself out at 100%.
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

// Check arguments.
If IsNull(ab_switch) Then
	Return -1
End If

// Set the flag.
ib_barautoreset = ab_switch

Return 1
end function

public function integer of_getbarpctcomplete ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetBarPctComplete
//
//	Access:		public
//
//	Arguments:	None
//
//	Returns:		integer
//	 the visual percent complete of the progress bar (1-100)
//
//	Description:
//	Returns the visual percent complete of the progress bar
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

return ii_barpctcomplete
end function

public function integer of_setbarfillcolor (long al_color);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetBarFillColor
//
//	Access:		Public
//
//	Arguments:
//	al_color		The new color value of the bar.
//	
//	Returns:		Integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Sets a new color value of the bar.
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

// Check arguments.
If IsNull(al_color) or al_color < 0 Then
	Return -1
End If

il_barfillcolor = al_color

// Notify the GUI of the change.
If IsValid(iw_statusbar) Then
	li_rc = iw_statusbar.of_CreateVisuals()
End If

Return li_rc
end function

public function long of_getbarfillcolor ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetBarFillColor
//
//	Access:		Public
//
//	Arguments:	None
//	
//	Returns:		long
//	The current color of the progress bar.
//
//	Description:
//	Reports the current color of the progress bar
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

Return il_barfillcolor
end function

public function integer of_getbarmaximum ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetBarMaximum
//
//	Access:		Public
//
//	Arguments:	None
//	
//	Returns:		integer
//	The maximum value of the progress bar.
//
//	Description:
//	Reports the maximum value of the progress bar
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

Return ii_barmax
end function

public function integer of_getbarminimum ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetBarMinimum
//
//	Access:		Public
//
//	Arguments:	None
//	
//	Returns:		integer
//	The minimum value of the progress bar.
//
//	Description:
//	Reports the minimum value of the progress bar
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

Return ii_barmin
end function

public function integer of_setbarmaximum (integer ai_maximum);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetBarMaximum
//
//	Access:		Public
//
//	Arguments:
//	ai_maximum	The new maximum value of the bar.
//	
//	Returns:		Integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Sets a new maximum value of the bar.
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

// Check arguments.
If IsNull(ai_maximum) or (ai_maximum <= 0) Then
	Return -1
End If

ii_barmax = ai_maximum

Return 1
end function

public function integer of_setbarminimum (integer ai_minimum);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetBarMinimum
//
//	Access:		Public
//
//	Arguments:
//	ai_minimum	The new minimum value of the bar.
//	
//	Returns:		Integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Sets a new minimum value of the bar.
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

// Check arguments.
If IsNull(ai_minimum) or (ai_minimum < 0) Then
	Return -1
End If

ii_barmin = ai_minimum

Return 1
end function

public function long of_getbartextcolor ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetBarTextColor
//
//	Access:		public
//
//	Arguments:	None
//
//	Returns:		long
//	 the color of the progress bar text
//
//	Description:
//	Returns the color of the progress bar text.
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

return il_bartextcolor
end function

public function integer of_setbartextcolor (long al_textcolor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetBarTextColor
//
//	Access:		public
//
//	Arguments:
//	al_textcolor   color the progress bar text will display
//
//	Returns:  integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Set the color the progress bar text
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

if isnull(al_textcolor) or (al_textcolor < 0) then
	return -1
end if

il_bartextcolor = al_textcolor

// Notify the GUI of the change.
If IsValid(iw_statusbar) Then
	li_rc = iw_statusbar.of_CreateVisuals()
End If

Return li_rc
end function

protected function string of_barupdatevisuals (decimal adc_completion);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_BarUpdateVisuals
//
//	Access:		protected
//
//	Arguments:	decimal
//	adc_completion	the completion value of the progress bar
//
//	Returns:		String
//	SUCCESS = modify string to use to set the progress bar visuals
//	ERROR = ""
//
//	Description:
//	 Create a string to size the progressbar to the completion size and set the display text
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

string	ls_fillstyle, ls_barstyle
integer	li_newwidth, li_newheight, li_newx, li_newy

if isnull(adc_completion) or (adc_completion < 0) then
	return ""
end if

CHOOSE Case ii_barfillstyle
	Case RIGHTLEFT
		// horizontal movement from right to left
		li_newwidth = integer(adc_completion * ii_barwidth)
		ls_fillstyle = 'pfc_progress.width="' + string(li_newwidth) + '" '
		li_newx = ii_barstartx + ii_barwidth - li_newwidth
		ls_fillstyle = ls_fillstyle + 'pfc_progress.x="' + string(li_newx) + '" '
	Case LEFTRIGHT
		// horizontal movement from left to right
		li_newwidth = integer(adc_completion * ii_barwidth)
		ls_fillstyle = 'pfc_progress.width="' + string(li_newwidth) + '" '
	Case TOPDOWN
		// vertical movement from top to bottom
		li_newheight = integer(adc_completion * ii_barheight)
		ls_fillstyle = 'pfc_progress.width="' + string(ii_barwidth) + '" '
		ls_fillstyle = ls_fillstyle + 'pfc_progress.height="' + string(li_newheight) + '" '
	Case BOTTOMUP
		// vertical movement from bottom to top
		li_newheight = integer(adc_completion * ii_barheight)
		li_newy = ii_barheight - li_newheight + ii_barstarty
		ls_fillstyle = 'pfc_progress.width="' + string(ii_barwidth) + '" '
		ls_fillstyle = ls_fillstyle + 'pfc_progress.height="' + string(li_newheight) + '" '
		ls_fillstyle = ls_fillstyle + 'pfc_progress.y="' + string(li_newy) + '" '
END CHOOSE

// Set percentages on screen
CHOOSE CASE ii_bardisplaystyle
	CASE BAR
		ls_barstyle = "pfc_progress_border.expression=~"' '~" "
	CASE PCTCOMPLETE
		ls_barstyle = "pfc_progress_border.expression=~"'" + string(adc_completion, "#%") + "'~" "
	CASE POSITION
		ls_barstyle = "pfc_progress_border.expression=~"'" + string(ii_barposition, "#") + "'~" "
END CHOOSE

return (ls_fillstyle + ls_barstyle)
end function

public function integer of_createdwobject (ref string as_createstmt, ref integer ai_width, ref integer ai_height);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_CreateDWObject
//
//	Access:  Public
//
//	Arguments:
//	as_createstmt	By ref.  Holds the validated Create String.
//	ai_width			By ref.  Holds the desired width of the object.
//	ai_height		by ref.  Holds the desired Height of the object.
//
//	Returns:  integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Builds and validates the String used to create the actual visual Status Bar.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.01 Modified script to use the calculated li_microhelpheight when setting
//			the header height instead of an arbitratry number. 
// 6.0	Added progress bar creation pfc_progress as predefined object
// 7.0	Updated datawindow syntax for current version
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

string	ls_newobject
string	ls_header
string	ls_line
string	ls_dwtimerinterval
string 	ls_dwdefinition
string	ls_errorbuffer
integer	li_rc
integer	li_xpoint
Integer	li_cnt
Integer	li_upper
Integer	li_currentwidth=0
Integer	li_microhelpheight=61
n_ds		lds_test

// Get the Micro Help Height.
li_microhelpheight = of_CalculateMicroHelpHeight()

// Create the desired DataWindow Timer Interval. 
If ib_timer Then
	// A timer event is defined. Use the appropriate value.
	ls_dwtimerinterval = 'timer_interval=' + string(il_timerinterval)
Else
	// No timer event is defined.
	ls_dwtimerinterval = 'timer_interval=0 '
End If

// Create the Header string.
ls_header = &
	'release 6; '+ &
	'datawindow(units=0 '+ &
		ls_dwtimerinterval + &
		'color=80263328 processing=0 HTMLDW=no print.documentname="" ' + &
		'print.orientation = 0 print.margin.left = 107 print.margin.right = 107 ' + & 
		'print.margin.top = 97 print.margin.bottom = 97 print.paper.source = 0 ' + &
		'print.paper.size = 0 print.prompt=no print.buttons=no print.preview.buttons=no) ' + &
	'header(height=' + string(li_microhelpheight) + ' color="536870912" ) ' + &
	'summary(height=1 color="536870912" ) ' + &
	'footer(height=1 color="536870912" ) ' + &
	'detail(height=1 color="536870912" ) ' + &
	'table(column=(type=char(20) updatewhereclause=no name=requiredcol dbname="requiredcol" ) ) '
ls_dwdefinition = ls_header

ls_line = 'line( ' + &
				'name=line_white band=header x1="1" y1="3" x2="1" y2="100" '+ &
				'pen.style="0" pen.width="4" pen.color="16777215"  background.mode="2" ' + &
				'background.color="16777215"' + &
			 ') ' + &
			 'htmltable(border="1" ) ' + &
			 'htmlgen() ' 
			 
// Add the left line.
ls_dwdefinition = ls_dwdefinition + ls_line

li_upper = UpperBound (inv_dwobjects)
For li_cnt = 1 to li_upper

	// Skip blank (unregistered) entries.
	If Len(Trim(inv_dwobjects[li_cnt].s_id)) = 0 Then
		Continue
	End If

	// Define the X point for the new object.
	li_xpoint = li_currentwidth + inv_dwobjects[li_cnt].i_gapwidth
	
	CHOOSE CASE Lower(inv_dwobjects[li_cnt].s_type)
		CASE TEXT
			ls_newobject = + &
				'compute( '+ &
					'name=' + inv_dwobjects[li_cnt].s_id + ' ' + &
					'expression="~'' + string(inv_dwobjects[li_cnt].s_value) + '~'" '+ &
					'border="' + string(inv_dwobjects[li_cnt].i_bordertype) +'" ' + &
					'x="' + string(li_xpoint) + '" ' + &
					'height="'+string(li_microhelpheight)+'" ' + &	
					'width="'+ string(inv_dwobjects[li_cnt].i_width) + '" ' + &
					'background.color="12632256" ' +&	
					'band=header alignment="0"  color="33554432" y="0" '+  &
					'font.face="MS Sans Serif" font.height="-8" font.weight="400" '+ &
					'font.family="2" font.pitch="2" font.charset="0" background.mode="2" ' +&
				') '

		CASE BITMAP
			ls_newobject = + &
				'compute( '+ &
					'name=' + inv_dwobjects[li_cnt].s_id + ' ' + &
					'expression="bitmap(~'' + string(inv_dwobjects[li_cnt].s_value) + '~')" '+ &
					'border="' + string(inv_dwobjects[li_cnt].i_bordertype) +'" ' + &
					'x="' + string(li_xpoint) + '" ' + &
					'width="'+ string(inv_dwobjects[li_cnt].i_width) + '" ' + &
					'height="'+string(li_microhelpheight)+'" ' + &	
					'background.color="12632256" ' +&	
					'band=header alignment="0"  color="33554432" y="0" '+  &
					'font.face="MS Sans Serif" font.height="-8" font.weight="400" '+ &
					'font.family="2" font.pitch="2" font.charset="0" background.mode="2" ' +&
				') '
				
		CASE PREDEFINED
			If inv_dwobjects[li_cnt].s_id = 'pfc_timer' Then
				ls_newobject = + &			
					'compute( '+ &
						'name=' + inv_dwobjects[li_cnt].s_id + ' ' + &
						'expression="Today()" '+ &					
						'format="'+is_timerformat+'" ' + &
						'border="' + string(inv_dwobjects[li_cnt].i_bordertype) +'" ' + &
						'x="' + string(li_xpoint) + '" ' + &
						'width="'+ string(inv_dwobjects[li_cnt].i_width) + '" ' + &
						'height="'+string(li_microhelpheight)+'" ' + &	
						'background.color="12632256" ' +&	
						'band=header alignment="0"  color="33554432" y="0" '+  &
						'font.face="MS Sans Serif" font.height="-8" font.weight="400" '+ &
						'font.family="2" font.pitch="2" font.charset="0" background.mode="2" ' +&
					') '			
			ElseIf inv_dwobjects[li_cnt].s_id = 'pfc_progress' Then
				ls_newobject = + &			
					'rectangle( '+ &
						'name=' + inv_dwobjects[li_cnt].s_id + ' ' + &
						'x="' + string(li_xpoint + ii_baroffsetx) + '" ' + &
						'width="'+ string(inv_dwobjects[li_cnt].i_width - ii_baroffsetx) + '" ' + &
						'height="'+string(li_microhelpheight - ii_baroffsety)+'" ' + &	
						'visible="1~t0" ' + &	
						'brush.color="'+string(il_barfillcolor)+'" brush.hatch="6" ' +&	
						'pen.color="553648127" pen.style="5" pen.width="1" ' +&	
						'background.color="12632256" background.mode="2" ' +&	
						'band=header y="'+string(ii_baroffsety)+'" '+  &
					') ' + &			
					'compute( '+ &
						'name=' + inv_dwobjects[li_cnt].s_id + '_border ' + &
						'expression="" '+ &					
						'border="' + string(inv_dwobjects[li_cnt].i_bordertype) +'" ' + &
						'x="' + string(li_xpoint) + '" ' + &
						'width="'+ string(inv_dwobjects[li_cnt].i_width) + '" ' + &
						'height="'+string(li_microhelpheight)+'" ' + &
						'color="'+string(il_bartextcolor)+'" ' + &
						'background.color="12632256" ' +&	
						'band=header alignment="2" y="0" '+  &
						'font.face="MS Sans Serif" font.height="-8" font.weight="400" '+ &
						'font.family="2" font.pitch="2" font.charset="0" background.mode="1" ' +&
					') '		
					ii_barwidth  = inv_dwobjects[li_cnt].i_width - ii_baroffsetx
					ii_barheight = li_microhelpheight - ii_baroffsety
					ii_barstartx = li_xpoint + ii_baroffsetx
					ii_barstarty = ii_baroffsety
			Else
				ls_newobject = + &			
					'compute( '+ &
						'name=' + inv_dwobjects[li_cnt].s_id + ' ' + &
						'expression="" '+ &					
						'border="' + string(inv_dwobjects[li_cnt].i_bordertype) +'" ' + &
						'x="' + string(li_xpoint) + '" ' + &
						'width="'+ string(inv_dwobjects[li_cnt].i_width) + '" ' + &
						'height="'+string(li_microhelpheight)+'" ' + &					
						'background.color="12632256" ' +&	
						'band=header alignment="0"  color="33554432" y="0" '+  &
						'font.face="MS Sans Serif" font.height="-8" font.weight="400" '+ &
						'font.family="2" font.pitch="2" font.charset="0" background.mode="2" ' +&
					') '							
			End IF
	END CHOOSE

	ls_dwdefinition = ls_dwdefinition + ls_newobject

	// Update the current object width.
	li_currentwidth = li_xpoint + inv_dwobjects[li_cnt].i_width
Next 

// Create a temporary Datastore to test the DataWindow Object.
lds_test = Create n_ds

// Test the datastore.
li_rc = lds_test.Create ( ls_dwdefinition, ls_errorbuffer)
 
// Destroy the temporary DataStore.
If IsValid(lds_test) Then
	Destroy lds_test
End If

// If OK, populate the reference variables.
If li_rc = 1 Then
	as_createstmt = ls_dwdefinition
	ai_width = li_currentwidth
	ai_height = li_microhelpheight
End If
Return li_rc


 

end function

public function integer of_barincrement ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_BarIncrement
//
//	Access:  	Public
//
//	Arguments:	None
//	
//	Returns:		integer
//	 the new position of the progress bar
//
//	Description:
//	Increments the progress bar by the default step value
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

return of_barincrement(ii_barstep)

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
//	passed in, then the focus point is passed in to the iw_requestor.
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
			// Not a valid object, set focus on the requestor.
			If IsValid(iw_requestor) Then
				li_rc = iw_requestor.SetFocus()
			Else
				li_rc = -1
			End If
		
	END CHOOSE

Else
	// By default, set focus on the parent frame.	
	If IsValid(iw_requestor) Then
		li_rc = iw_requestor.SetFocus()
	Else
		li_rc = -1
	End If
End If

Return li_rc
end function

public function longlong of_getmemthreshold ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetMemThreshold
//
//	Access:  Public
//
//	Arguments:	None
//	
//	Returns:  long
//	The current Computer Memory Threshold value.
//
//	Description:
//	Gets the current Computer Memory Threshold value.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 12.5	Modified to return LongLong
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

Return ill_memthreshold
end function

public function integer of_setmemthreshold (longlong all_threshold);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetMemThreshold
//
//	Access:  Public
//
//	Arguments:
//	all_threshold	The new Threshold.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Sets a new Computer Memory Threshold value.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	12.5   Initial version
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

// Check arguments.
If IsNull(all_threshold) or all_threshold < 0 Then
	Return -1
End If

ill_memthreshold = all_threshold
Return 1
end function

public function integer of_setmemthreshold (long al_threshold);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetMemThreshold
//
//	Access:  Public
//
//	Arguments:
//	al_threshold	The new Threshold.
//	
//	Returns:  Integer
//	1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:
//	Sets a new Computer Memory Threshold value.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 12.5	Memory is now stored in LongLong
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

// Check arguments.
If IsNull(al_threshold) or al_threshold < 0 Then
	Return -1
End If

ill_memthreshold = al_threshold
Return 1
end function

on pfc_n_cst_winsrv_statusbar.create
call super::create
end on

on pfc_n_cst_winsrv_statusbar.destroy
call super::destroy
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  pfc_n_cst_winsrv_statusbar
//
//	Description:  Status Bar service class
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

// Get the Environment.
GetEnvironment(ienv_object)
end event

