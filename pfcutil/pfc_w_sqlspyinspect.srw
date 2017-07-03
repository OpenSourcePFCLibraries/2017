HA$PBExportHeader$pfc_w_sqlspyinspect.srw
$PBExportComments$PFC SQL Spy Inspect window
forward
global type pfc_w_sqlspyinspect from w_response
end type
type cb_step from u_cb within pfc_w_sqlspyinspect
end type
type cb_cancel from u_cb within pfc_w_sqlspyinspect
end type
type cb_cancelall from u_cb within pfc_w_sqlspyinspect
end type
type mle_currentheading from u_mle within pfc_w_sqlspyinspect
end type
type mle_currentsyntax from u_mle within pfc_w_sqlspyinspect
end type
type cb_resume from u_cb within pfc_w_sqlspyinspect
end type
type cb_dlghelp from u_cb within pfc_w_sqlspyinspect
end type
end forward

global type pfc_w_sqlspyinspect from w_response
integer width = 1673
integer height = 792
string title = "SQLSpy - Inspect Current SQL"
boolean controlmenu = false
long backcolor = 80263328
cb_step cb_step
cb_cancel cb_cancel
cb_cancelall cb_cancelall
mle_currentheading mle_currentheading
mle_currentsyntax mle_currentsyntax
cb_resume cb_resume
cb_dlghelp cb_dlghelp
end type
global pfc_w_sqlspyinspect pfc_w_sqlspyinspect

type variables

end variables

forward prototypes
protected subroutine of_populatebeforeclose (commandbutton acb_pressed)
end prototypes

protected subroutine of_populatebeforeclose (commandbutton acb_pressed);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_populatebeforeclose
//
//	Access:  		protected
//
//	Arguments:
//	acb_pressed		The command button pressed.
//
//	Returns:  		(None)
//	
//	Description:	Close this window after updating the SQLspy service of all
//						relevant information.
//
//		Note:			Close with return values-
//						0 caller's processing should continue as normal.
//						1 If functionality available, caller's proccessing should stop.
//						2 Caller's processing should skip this request and
//						  execute the next request (if available).
//						-1 if an error occurs.
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

integer li_rc = -1

//Notify the SQLSpy service of any updates
gnv_app.inv_debug.inv_sqlspy.of_SetCurrentHeading(mle_currentheading.Text)
gnv_app.inv_debug.inv_sqlspy.of_SetCurrentSyntax(mle_currentsyntax.Text)

//Set the return code.
If acb_pressed = cb_cancel Then
	li_rc = 2
ElseIf acb_pressed = cb_cancelall Then
	li_rc	= 1
ElseIf acb_pressed = cb_step Then
	li_rc = 0
ElseIf acb_pressed = cb_resume Then
	//Change the BatchMode in the SQLspy service.
	gnv_app.inv_debug.inv_sqlspy.of_SetBatchMode (True)
	li_rc	= 0
End If

//Close this window with the appropriate return code.
CloseWithReturn (this, li_rc)

Return
end subroutine

on pfc_w_sqlspyinspect.create
int iCurrent
call super::create
this.cb_step=create cb_step
this.cb_cancel=create cb_cancel
this.cb_cancelall=create cb_cancelall
this.mle_currentheading=create mle_currentheading
this.mle_currentsyntax=create mle_currentsyntax
this.cb_resume=create cb_resume
this.cb_dlghelp=create cb_dlghelp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_step
this.Control[iCurrent+2]=this.cb_cancel
this.Control[iCurrent+3]=this.cb_cancelall
this.Control[iCurrent+4]=this.mle_currentheading
this.Control[iCurrent+5]=this.mle_currentsyntax
this.Control[iCurrent+6]=this.cb_resume
this.Control[iCurrent+7]=this.cb_dlghelp
end on

on pfc_w_sqlspyinspect.destroy
call super::destroy
destroy(this.cb_step)
destroy(this.cb_cancel)
destroy(this.cb_cancelall)
destroy(this.mle_currentheading)
destroy(this.mle_currentsyntax)
destroy(this.cb_resume)
destroy(this.cb_dlghelp)
end on

event pfc_preopen;call super::pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_pre_open
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

// Allow window to close without the CloseQuery checks being performed.
ib_disableclosequery = True

//Set focus on the Current SQLSyntax detail
SetFocus(mle_currentsyntax)

//Prepare window for user interaction.
mle_currentheading.Text = gnv_app.inv_debug.inv_sqlspy.of_GetCurrentHeading()
mle_currentsyntax.Text = gnv_app.inv_debug.inv_sqlspy.of_GetCurrentSyntax()

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

type cb_step from u_cb within pfc_w_sqlspyinspect
integer x = 1202
integer y = 44
integer width = 393
integer taborder = 30
string text = "&Step"
boolean default = true
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked!
//
//	(Arguments: None)
//
//	(Returns:  None)
//
//	Description:	Call window function to Close this window after 
//						populating with the appropriate return values.
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

//Populate Communications object before closing the window.
of_populatebeforeclose(this)

end event

type cb_cancel from u_cb within pfc_w_sqlspyinspect
integer x = 1202
integer y = 280
integer width = 393
integer taborder = 50
string text = "&Cancel"
boolean cancel = true
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked!
//
//	(Arguments: None)
//
//	(Returns:  None)
//
//	Description:	Call window function to Close this window after 
//						populating with the appropriate return values.
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

//Populate Communications object before closing the window.
of_populatebeforeclose(this)

end event

type cb_cancelall from u_cb within pfc_w_sqlspyinspect
integer x = 1198
integer y = 388
integer width = 393
integer taborder = 60
string text = "Cancel &All"
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked!
//
//	(Arguments: None)
//
//	(Returns:  None)
//
//	Description:	Call window function to Close this window after 
//						populating with the appropriate return values.
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

//Populate Communications object before closing the window.
of_populatebeforeclose(this)

end event

type mle_currentheading from u_mle within pfc_w_sqlspyinspect
integer x = 32
integer y = 40
integer width = 1120
integer height = 84
integer taborder = 10
boolean autovscroll = false
boolean displayonly = true
boolean hideselection = false
end type

type mle_currentsyntax from u_mle within pfc_w_sqlspyinspect
integer x = 32
integer y = 148
integer width = 1120
integer height = 532
integer taborder = 20
boolean vscrollbar = true
end type

type cb_resume from u_cb within pfc_w_sqlspyinspect
integer x = 1202
integer y = 152
integer width = 393
integer taborder = 40
string text = "&Resume"
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked!
//
//	(Arguments: None)
//
//	(Returns:  None)
//
//	Description:	Call window function to Close this window after 
//						populating with the appropriate return values.
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

//Populate Communications object before closing the window.
of_populatebeforeclose(this)

end event

type cb_dlghelp from u_cb within pfc_w_sqlspyinspect
integer x = 1202
integer y = 516
integer width = 393
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

showHelp ("pfcdlg.hlp", topic!, 10600)
end event

