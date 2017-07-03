HA$PBExportHeader$pfc_w_debuglog.srw
$PBExportComments$PFC Display log utility window
forward
global type pfc_w_debuglog from w_main
end type
type dw_debuglog from u_dw within pfc_w_debuglog
end type
type cb_print from u_cb within pfc_w_debuglog
end type
type cb_clear from u_cb within pfc_w_debuglog
end type
type cb_close from u_cb within pfc_w_debuglog
end type
type cb_dlghelp from u_cb within pfc_w_debuglog
end type
end forward

global type pfc_w_debuglog from w_main
int X=23
int Y=400
int Width=2894
int Height=728
boolean TitleBar=true
string Title="Debugging Log"
long BackColor=80263328
dw_debuglog dw_debuglog
cb_print cb_print
cb_clear cb_clear
cb_close cb_close
cb_dlghelp cb_dlghelp
end type
global pfc_w_debuglog pfc_w_debuglog

type variables
Protected:
integer	ii_initcolwidth	//Initial column width
integer	ii_initdwwidth	//Initial datawindow widht

end variables

forward prototypes
public function integer of_DwScrollToRow (long al_row)
public function integer of_dwsetredraw (boolean ab_switch)
public function integer of_setalwaysontop (boolean ab_switch)
end prototypes

public function integer of_DwScrollToRow (long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_DwScrollToRow
//
//	Access:  		public
//
//	Arguments:		
//	al_row			Row to scroll to.
//
//	Returns:  		Integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Scroll dw_debuglog to the requested row.
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

Return dw_debuglog.ScrollToRow(al_row)
end function

public function integer of_dwsetredraw (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_DwSetRedraw
//
//	Access:  		public
//
//	Arguments:		
//	ab_switch		Switch to turn Redraw True or False.
//
//	Returns:  		Integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						If argument is NULL, function returns NULL.
//
//	Description:  	Set Redraw on dw_debuglog as requested.
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

Return dw_debuglog.SetRedraw(ab_switch)
end function

public function integer of_setalwaysontop (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetAlwaysOnTop
//
//	Access:  		public
//
//	ab_switch	True to have DebugLog window always be on top.
//					False not to have DebugLog window always be on top.
//
//	Returns:  	integer
//					1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//	Description:	Allow the DebugLog window to always be on top when TRUE.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0.02   Initial version
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

//Check arguments
If IsNull(ab_switch) Then
	Return -1
End If

If ab_switch Then
	this.SetPosition (TopMost!)
Else
	this.SetPosition (NoTopMost!)		
End If

Return 1

end function

on pfc_w_debuglog.create
int iCurrent
call super::create
this.dw_debuglog=create dw_debuglog
this.cb_print=create cb_print
this.cb_clear=create cb_clear
this.cb_close=create cb_close
this.cb_dlghelp=create cb_dlghelp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_debuglog
this.Control[iCurrent+2]=this.cb_print
this.Control[iCurrent+3]=this.cb_clear
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.cb_dlghelp
end on

on pfc_w_debuglog.destroy
call super::destroy
destroy(this.dw_debuglog)
destroy(this.cb_print)
destroy(this.cb_clear)
destroy(this.cb_close)
destroy(this.cb_dlghelp)
end on

event resize;call w_main::resize;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  resize
//
//	(Arguments: Standard
//	sizetype
//	newwidth
//	newheight)
//
//	(Returns:  None)
//
//	Description:	When the window is resized, the datawindow is rezized by the
//						resize service.  Properly resize the objects that are 
//						contained by the datawindow.
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
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

integer	li_sizedelta

li_sizedelta = dw_debuglog.Width - ii_initdwwidth
dw_debuglog.Object.msg.Width = ii_initcolwidth + li_sizedelta
dw_debuglog.Object.msg_t.Width = ii_initcolwidth + li_sizedelta

end event

event pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:	pfc_w_debuglog
//
//	Description:	A utility object used to display messages that are embedded
//						into an applicaiotn by the developer.
//						Use the n_cst_debug service to call this object.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Added code to appropriately force or not force this window to always
//		be on top.
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

//Start the resize service
of_SetResize(True)

//Set the minimum size of the window on the resize service
inv_resize.of_SetMinSize( 1500, (cb_clear.Height + 30) * 3)
	
//Register each control that needs to move or resize after the window resizes
inv_resize.of_Register (cb_print, inv_resize.FIXEDRIGHT)
inv_resize.of_Register (cb_clear, inv_resize.FIXEDRIGHT)
inv_resize.of_Register (cb_close, inv_resize.FIXEDRIGHT)
inv_resize.of_Register (dw_debuglog, inv_resize.SCALERIGHTBOTTOM)
inv_resize.of_register (cb_dlghelp, inv_resize.FIXEDRIGHT)

//Save off the initial widths of the datawindow and message column as
//they will be needed later.
ii_initcolwidth = integer(dw_debuglog.object.msg.width)
ii_initdwwidth = dw_debuglog.Width


//If information is available, start the Preference service.
If gnv_app.of_IsRegistryAvailable() Then
	If Len(gnv_app.of_GetUserKey())> 0 Then 
		of_SetPreference(True)
	End If
Else
	If Len(gnv_app.of_GetUserIniFile()) > 0 Then
		of_SetPreference(True)
	End If
End If

// Allow window to close without the CloseQuery checks being performed.
ib_disableclosequery = True

// If appropriate force this window to be on top.
of_SetAlwaysOnTop(gnv_app.inv_debug.of_GetAlwaysOnTop())

// Make sure that PFC does not report updates pending for this window.
dw_debuglog.of_SetUpdateable(false)
ib_disableclosequery = True

// The information displayed is kept on the Debug service.
li_rc = gnv_app.inv_debug.ids_debuglog.ShareData (dw_debuglog)
If li_rc <> 1 Then
	of_MessageBox ("pfc_debuglog_failedsharedata", "PowerBuilder Class Library", &
		"Open on pfc_w_debuglog event has received a ShareData() fail code.  "+ &
		"The ShareData() functionality is unable to be processed.", &
		Information!, OK!, 1)
End If

end event

type dw_debuglog from u_dw within pfc_w_debuglog
int X=18
int Y=20
int Width=2400
int Height=564
int TabOrder=10
string DataObject="d_debuglog"
end type

event constructor;call super::constructor;ib_rmbmenu = false
end event

type cb_print from u_cb within pfc_w_debuglog
int X=2464
int Y=24
int TabOrder=20
string Text="&Print"
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		Clicked	
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Print the contents of the datawindow.
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

gnv_app.inv_debug.of_PrintLog()

end event

type cb_clear from u_cb within pfc_w_debuglog
int X=2464
int Y=136
int TabOrder=30
string Text="&Clear"
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		Clicked	
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Clear the contents of the datawindow.
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

gnv_app.inv_debug.of_ClearLog()

end event

type cb_close from u_cb within pfc_w_debuglog
int X=2464
int Y=248
int TabOrder=40
string Text="Close"
boolean Cancel=true
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		Clicked	
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Close the window
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

close(parent)
end event

type cb_dlghelp from u_cb within pfc_w_debuglog
int X=2464
int Y=360
int TabOrder=50
string Text="&Help"
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

showHelp ("pfcdlg.hlp", topic!, 10000)
end event

