HA$PBExportHeader$w_progbarproperties.srw
$PBExportComments$NEW!  Window to display the progress bar properties in the w_progbarsampler example.
forward
global type w_progbarproperties from w_response
end type
type tab_1 from u_pbarproperties within w_progbarproperties
end type
type cb_ok from u_cb within w_progbarproperties
end type
type cb_2 from u_cb within w_progbarproperties
end type
type cb_3 from u_cb within w_progbarproperties
end type
type cb_4 from u_cb within w_progbarproperties
end type
type tab_1 from u_pbarproperties within w_progbarproperties
end type
end forward

global type w_progbarproperties from w_response
int X=1330
int Y=4
int Width=1595
int Height=1896
boolean TitleBar=true
string Title="Progress Bar Properties"
long BackColor=77636800
tab_1 tab_1
cb_ok cb_ok
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
end type
global w_progbarproperties w_progbarproperties

type variables
integer                 ii_rc = -99
u_progressbar     iuo_progressbar
end variables

on w_progbarproperties.create
int iCurrent
call w_response::create
this.tab_1=create tab_1
this.cb_ok=create cb_ok
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=tab_1
this.Control[iCurrent+2]=cb_ok
this.Control[iCurrent+3]=cb_2
this.Control[iCurrent+4]=cb_3
this.Control[iCurrent+5]=cb_4
end on

on w_progbarproperties.destroy
call w_response::destroy
destroy(this.tab_1)
destroy(this.cb_ok)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
end on

event pfc_apply;call super::pfc_apply;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_apply
//
//	Arguments:
//	None
//
//	Returns:
//	None
//
//	Description:
// Apply any changes that were made through the various settings on the
// response window.  This response window contains three tab pages, so
// pfc_apply will trigger the individual user events on each of the tabpages
// where the apply logic is coded.
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

ii_rc = 1
tab_1.tabpage_1.event ue_apply()
tab_1.tabpage_2.event ue_apply()
tab_1.tabpage_3.event ue_apply()
end event

event pfc_default;call super::pfc_default;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_default
//
//	Arguments:
//	None
//
//	Returns:
//	None
//
//	Description:
//	Performs the default operations for the response window which are 
// to apply any changes that were made, then close the window.
// This script issues a CloseWithReturn to tell the calling window
// that the user may have applied changes.
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

event pfc_apply()
CloseWithReturn(this, ii_rc)

end event

event pfc_cancel;call super::pfc_cancel;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_cancel
//
//	Arguments:
//	None
//
//	Returns:
//	None
//
//	Description:
// Closes the response window.  The ancestor script sets ib_disableclosequery
// to true.  This script issues a CloseWithReturn to tell the calling window
// that the user cancelled.
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

ii_rc = 0
CloseWithReturn(this, ii_rc)

end event

event close;call super::close;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	close
//
//	Description:
//	Determines if changes were made to the window that were not applied.
// If so, pfc_cancel will be triggered and the appropriate return code
// will be passed back to the calling window.
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

if ii_rc = -99 then
	event pfc_cancel()
end if
end event

type tab_1 from u_pbarproperties within w_progbarproperties
int X=46
int Y=48
int Width=1486
int Height=1580
int TabOrder=10
end type

type cb_ok from u_cb within w_progbarproperties
int X=55
int Y=1656
int TabOrder=20
string Text="OK"
boolean Default=true
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Calls the pfc_default event on the window.  This 
// will apply all changes, then close the window. 
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

parent.event pfc_default()

end event

type cb_2 from u_cb within w_progbarproperties
int X=430
int Y=1656
int TabOrder=30
boolean BringToTop=true
string Text="Cancel"
boolean Cancel=true
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Calls the pfc_cancel event on the window.
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

parent.event pfc_cancel()
end event

type cb_3 from u_cb within w_progbarproperties
int X=814
int Y=1656
int TabOrder=40
boolean BringToTop=true
string Text="&Apply"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Calls the pfc_apply event on the window.  This 
// will apply all changes. 
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

parent.event pfc_apply()
end event

type cb_4 from u_cb within w_progbarproperties
int X=1184
int Y=1656
int TabOrder=50
boolean Enabled=false
boolean BringToTop=true
string Text="&Help"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Calls the pfc_help event on the window.
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

parent.event pfc_help()
end event

