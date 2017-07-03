HA$PBExportHeader$pfc_w_sqlspy.srw
$PBExportComments$PFC SQL Spy window
forward
global type pfc_w_sqlspy from w_main
end type
type cb_print from u_cb within pfc_w_sqlspy
end type
type cb_save from u_cb within pfc_w_sqlspy
end type
type cbx_batchmode from u_cbx within pfc_w_sqlspy
end type
type mle_history from u_mle within pfc_w_sqlspy
end type
type cb_clear from u_cb within pfc_w_sqlspy
end type
type cb_dlghelp from u_cb within pfc_w_sqlspy
end type
type cb_close from u_cb within pfc_w_sqlspy
end type
type gb_sqlhistory from u_gb within pfc_w_sqlspy
end type
type st_history from u_st within pfc_w_sqlspy
end type
end forward

global type pfc_w_sqlspy from w_main
integer x = 640
integer y = 364
integer width = 1998
integer height = 1556
string title = "SQLSpy"
long backcolor = 80263328
cb_print cb_print
cb_save cb_save
cbx_batchmode cbx_batchmode
mle_history mle_history
cb_clear cb_clear
cb_dlghelp cb_dlghelp
cb_close cb_close
gb_sqlhistory gb_sqlhistory
st_history st_history
end type
global pfc_w_sqlspy pfc_w_sqlspy

type variables



end variables

forward prototypes
public function integer of_updatebatchmode ()
public function integer of_updatehistory ()
public function integer of_SetAlwaysOnTop (boolean ab_switch)
end prototypes

public function integer of_updatebatchmode ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_updatebatchmode
//
//	Access:  		public
//
//	Arguments:		<None>
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Determine what the BatchMode should be and set it visually
//						on this window.
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

boolean lb_inspecteachSQL

//Get the current BatchMode from the SQLspy service.
lb_inspecteachSQL = Not gnv_app.inv_debug.inv_sqlspy.of_GetBatchmode()

//If it doesn't match the visual setting, update it.
If lb_inspecteachSQL <> cbx_batchmode.Checked Then
	cbx_batchmode.Checked = lb_inspecteachSQL
End If

Return 1

end function

public function integer of_updatehistory ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_updatehistory
//
//	Access:  		public
//
//	Arguments:		<None>
//
//	Returns:  		integer
//						Returns 1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						
//	Description:  	Determine what the current history should be and set it 
//						visually on this window.
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

//Prevent flickering
mle_history.SetRedraw(False)

//Get the current History from the SQLspy service.
mle_history.text = gnv_app.inv_debug.inv_sqlspy.of_GetHistory()

//Scroll to the bottom
mle_history.Scroll (999999) 

mle_history.SetRedraw(True)

Return 1

end function

public function integer of_SetAlwaysOnTop (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetAlwaysOnTop
//
//	Access:  		public
//
//	ab_switch	True to have SQLSpy window always on top.
//					False not to have SQLSpy window always on top.
//
//	Returns:  	integer
//					1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//
//
//	Description:	Allow the SQLSpy window to always be on top when TRUE.
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

on pfc_w_sqlspy.destroy
call super::destroy
destroy(this.cb_print)
destroy(this.cb_save)
destroy(this.cbx_batchmode)
destroy(this.mle_history)
destroy(this.cb_clear)
destroy(this.cb_dlghelp)
destroy(this.cb_close)
destroy(this.gb_sqlhistory)
destroy(this.st_history)
end on

on pfc_w_sqlspy.create
int iCurrent
call super::create
this.cb_print=create cb_print
this.cb_save=create cb_save
this.cbx_batchmode=create cbx_batchmode
this.mle_history=create mle_history
this.cb_clear=create cb_clear
this.cb_dlghelp=create cb_dlghelp
this.cb_close=create cb_close
this.gb_sqlhistory=create gb_sqlhistory
this.st_history=create st_history
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print
this.Control[iCurrent+2]=this.cb_save
this.Control[iCurrent+3]=this.cbx_batchmode
this.Control[iCurrent+4]=this.mle_history
this.Control[iCurrent+5]=this.cb_clear
this.Control[iCurrent+6]=this.cb_dlghelp
this.Control[iCurrent+7]=this.cb_close
this.Control[iCurrent+8]=this.gb_sqlhistory
this.Control[iCurrent+9]=this.st_history
end on

event pfc_preopen;call super::pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_preopen
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Handle processing that occurs before the open event.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Added code to appropriately force or not force this window to always
//		be on top.
//	6.0	Added groupbox, close and help buttons.  Adjust minimum size & resize 
//		of window to accomodate controls.  Made st_history not visible.  
//		Removed all code relating to st_history.
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

//Allow window to close without the CloseQuery checks being performed.
ib_disableclosequery = True

// If appropriate force this window to be on top.
of_SetAlwaysOnTop(gnv_app.inv_debug.inv_sqlspy.of_GetAlwaysOnTop())

//Determine what controls should be visible/enabled
If Not gnv_app.inv_debug.inv_sqlspy.of_GetAllowInspect() Then
	//Hide all controls that relate to the default functionality.
	cbx_batchmode.Visible = False
	
	//Move the History controls to fill up the entire window.
	//The window's resize event will then take take of resizing them correctly.
	gb_sqlhistory.Move (gb_sqlhistory.X, gb_sqlhistory.Y - 100)
	gb_sqlhistory.Resize (gb_sqlhistory.Width, gb_sqlhistory.Height + 100)
	mle_history.Move (mle_history.X, mle_history.Y - 100)
	mle_history.Resize (mle_history.Width, mle_history.Height + 100)
Else
	//Syncronize the visual BatchMode checkbox.
	of_updatebatchmode()
End If

//Get the current history
of_updatehistory()

//Start the resize service
of_SetResize(True)

//Set the minimum size of the window
inv_resize.of_SetMinSize( cbx_batchmode.X + cb_clear.Width *3 + 145, &
								  mle_history.Y + cb_clear.Height *3 + 90)
	
//Register each control that needs to move or resize after the window resizes
inv_resize.of_Register (cb_clear, inv_resize.FIXEDRIGHTBOTTOM)
inv_resize.of_Register (cb_save, inv_resize.FIXEDRIGHTBOTTOM)
inv_resize.of_Register (cb_print, inv_resize.FIXEDRIGHTBOTTOM)
inv_resize.of_Register (gb_sqlhistory, inv_resize.SCALERIGHTBOTTOM)
inv_resize.of_Register (mle_history, inv_resize.SCALERIGHTBOTTOM)
inv_resize.of_register (cb_close, inv_resize.FIXEDRIGHTBOTTOM)
inv_resize.of_register (cb_dlghelp, inv_resize.FIXEDRIGHTBOTTOM)

//If appropriate, start the Preference service.
If gnv_app.of_IsRegistryAvailable() Then
	If Len(gnv_app.of_GetUserKey())> 0 Then 
		of_SetPreference(True)
	End If
Else
	If Len(gnv_app.of_GetUserIniFile()) > 0 Then
		of_SetPreference(True)
	End If
End If

end event

type cb_print from u_cb within pfc_w_sqlspy
integer x = 1499
integer y = 1144
integer width = 375
integer taborder = 50
string text = "&Print"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked!
//
//	(Arguments: None)
//
//	(Returns:  None)
//
//	Description:	Prints the SQL history.
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

//Notify the service to Print the history
gnv_app.inv_debug.inv_sqlspy.of_PrintHistory ()

end event

type cb_save from u_cb within pfc_w_sqlspy
integer x = 1111
integer y = 1144
integer width = 375
integer taborder = 40
string text = "&Save"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked!
//
//	(Arguments: None)
//
//	(Returns:  None)
//
//	Description:	Notify the servie the user wants to save the current history.
//						Service opens the GetFileSaveName dialog window, gets a 
//						filename, and allows for the saving of the SQL history to 
//						the file.
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

//Notify the service to Save the history to a file
gnv_app.inv_debug.inv_sqlspy.of_SaveHistoryToFile ()

end event

type cbx_batchmode from u_cbx within pfc_w_sqlspy
integer x = 73
integer y = 36
integer width = 1856
integer height = 68
integer taborder = 10
string text = "&Inspect each SQL statement before it is executed"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked
//
//	(Arguments:
//	<None>)
//
//	(Returns:  <data type>
//	<description of possible return values>)
//
//	Description:  Notify the service the current status of the BatchMode
//						checkbox
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

gnv_app.inv_debug.inv_sqlspy.of_SetBatchMode (not this.Checked)

end event

type mle_history from u_mle within pfc_w_sqlspy
integer x = 69
integer y = 212
integer width = 1806
integer height = 904
integer taborder = 20
boolean vscrollbar = true
boolean displayonly = true
end type

type cb_clear from u_cb within pfc_w_sqlspy
integer x = 722
integer y = 1144
integer width = 375
integer taborder = 30
string text = "C&lear"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked
//
//	(Arguments:	<None>)
//
//	(Returns:  <None>)
//
//	Description:	Notify the service the user has elected to clear all the 
//						visual history. 
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

//Notify the servie to clear the history
gnv_app.inv_debug.inv_sqlspy.of_ClearHistory ()

end event

type cb_dlghelp from u_cb within pfc_w_sqlspy
integer x = 1499
integer y = 1312
integer width = 375
integer taborder = 70
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

showHelp ("pfcdlg.hlp", topic!, 10500)
end event

type cb_close from u_cb within pfc_w_sqlspy
integer x = 1111
integer y = 1312
integer width = 375
integer taborder = 60
string text = "&Close"
boolean cancel = true
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Close the SQLSpy.
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

Parent.Event pfc_close()
end event

type gb_sqlhistory from u_gb within pfc_w_sqlspy
integer x = 14
integer y = 136
integer width = 1920
integer height = 1140
integer taborder = 0
string text = "SQL History"
end type

type st_history from u_st within pfc_w_sqlspy
boolean visible = false
integer x = 23
integer y = 136
integer width = 343
string text = "st_history"
end type

