HA$PBExportHeader$pfc_w_frame.srw
$PBExportComments$PFC Frame Window class
forward
global type pfc_w_frame from w_master
end type
type mdi_1 from mdiclient within pfc_w_frame
end type
end forward

global type pfc_w_frame from w_master
int X=107
int Y=100
WindowType WindowType=mdihelp!
string MenuName="m_frame"
event type integer pfc_toolbars ( )
event pfc_pretoolbar ( ref n_cst_toolbarattrib anv_toolbarattrib )
event type integer pfc_cascade ( )
event type integer pfc_tilehorizontal ( )
event type integer pfc_tilevertical ( )
event type integer pfc_minimizeall ( )
event type integer pfc_undoarrange ( )
event type integer pfc_layer ( )
mdi_1 mdi_1
end type
global pfc_w_frame pfc_w_frame

type variables
Public:
n_cst_winsrv_statusbar	inv_statusbar
n_cst_winsrv_sheetmanager	inv_sheetmanager
end variables

forward prototypes
public function integer of_setsheetmanager (boolean ab_switch)
public function integer of_setstatusbar (boolean ab_switch)
end prototypes

event pfc_toolbars;call w_master::pfc_toolbars;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_toolbars
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = User made modifications to toolbars
//	 0 = User cancelled
//	-1 = Error
//
//	Description:  Allow user to modify toolbar properties
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

n_cst_toolbarattrib lnv_toolbarattrib

// Populate toolbar window properties
this.event pfc_pretoolbar (lnv_toolbarattrib)

OpenWithParm (w_toolbars, lnv_toolbarattrib)
return message.DoubleParm
end event

event pfc_pretoolbar;call w_master::pfc_pretoolbar;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_pretoolbar
//
//	Arguments:
//	anv_toolbarattrib   toolbar object to pass to toolbar window
//
//	Returns:  none
//
//	Description:
//	Populate values before passing object to toolbar window
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

anv_toolbarattrib.iw_owner = this
anv_toolbarattrib.ib_visibleenabled = true
anv_toolbarattrib.ib_positionenabled = true
anv_toolbarattrib.ib_largebuttonsenabled = true
anv_toolbarattrib.ib_tooltipsenabled = true
end event

event pfc_cascade;call w_master::pfc_cascade;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_cascade
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:	Cascades windows
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

integer	li_rc

if IsValid (inv_sheetmanager) then
	li_rc = this.inv_sheetmanager.event pfc_cascade()
else
	li_rc = this.ArrangeSheets (cascade!)
end if

return li_rc
end event

event pfc_tilehorizontal;call w_master::pfc_tilehorizontal;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_tilehorizontal
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:	Tiles windows horizontally
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

integer	li_rc

if IsValid (inv_sheetmanager) then
	li_rc = this.inv_sheetmanager.event pfc_tilehorizontal()
else
	li_rc = this.ArrangeSheets (tilehorizontal!)
end if

return li_rc
end event

event pfc_tilevertical;call w_master::pfc_tilevertical;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_tilevertical
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:	Tiles windows vertically
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

integer	li_rc

if IsValid (inv_sheetmanager) then
	li_rc = this.inv_sheetmanager.event pfc_tilevertical()
else
	li_rc = this.ArrangeSheets (tile!)
end if

return li_rc
end event

event pfc_minimizeall;call w_master::pfc_minimizeall;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_minimizeall
//
//	Arguments:  none
//
//	Returns:  integer
//	 number of sheets minimized
//	-1 = error
//
//	Description:
//	Minimizes all open sheets
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

integer	li_rc

if IsValid (inv_sheetmanager) then
	li_rc = this.inv_sheetmanager.event pfc_minimizeall()
end if

return li_rc
end event

event pfc_undoarrange;call w_master::pfc_undoarrange;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_undoarrange
//
//	Arguments:  none
//
//	Returns:  integer
//	number of sheets affected by undo
//	-1 = error
//
//	Description:	Undo last window arrange
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

integer	li_rc

if IsValid (inv_sheetmanager) then
	li_rc = this.inv_sheetmanager.event pfc_undoarrange()
end if

return li_rc
end event

event pfc_layer;call w_master::pfc_layer;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_layer
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:	Layers windows
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

integer	li_rc

if IsValid (inv_sheetmanager) then
	li_rc = this.inv_sheetmanager.event pfc_layer()
else
	li_rc = this.ArrangeSheets (layer!)
end if

return li_rc
end event

public function integer of_setsheetmanager (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetSheetManager
//
//	Access:  public
//
//	Arguments:		
//	ab_switch   create/destroy the service
//
//	Returns:  integer
//	 1 = Successful operation.
//	 0 = No action taken.
//	-1 = An error was encountered.
//
//	Description:  Starts or stops the Sheet manager service
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

integer	li_rc

// Check arguments.
if IsNull (ab_switch) then return -1

if ab_switch then
	if IsNull(inv_sheetmanager) Or not IsValid (inv_sheetmanager) then
		inv_sheetmanager = create n_cst_winsrv_sheetmanager
		inv_sheetmanager.of_SetRequestor (this)
		li_rc = 1
	end if
else
	if IsValid (inv_sheetmanager) then
		destroy inv_sheetmanager
		li_rc = 1
	end if
end if

return li_rc
end function

public function integer of_setstatusbar (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetStatusBar
//
//	Access:  		public
//
//	Arguments:		
//	ab_switch		True - start (create) the service,
//						False - stop (destroy) the service
//
//	Returns:  		Integer
//	 1 - Successful operation.
//	 0 - No action taken.
//	-1 - An error was encountered.
//
//	Description:
//	Starts or stops the Statusbar service
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.02   Disable service for non-Windows platforms
//	5.0.03	Only let service work on MDI w/microhelp window types
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

environment	lenv_obj

// Check arguments
If IsNull(ab_switch) Then 
	Return -1
End If

If this.windowtype <> mdihelp! Then
	Return -1
End If 

// Check current platform to determine if statusbar service is supported
GetEnvironment (lenv_obj)
if IsValid (lenv_obj) then
	if lenv_obj.ostype <> windows! and lenv_obj.ostype <> windowsnt! then
		return -1
	end if
end if

if ab_switch then
	if IsNull(inv_statusbar) Or not IsValid (inv_statusbar) then
		inv_statusbar = create n_cst_winsrv_statusbar
		inv_statusbar.of_SetRequestor (this)
		Return 1
	end if
else
	if IsValid (inv_statusbar) then
		destroy inv_statusbar
		Return 1
	end if
end if

Return 0
end function

event move;call super::move;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  move	
//
//	Description:  
//	Notify statusbar that window has moved.
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

// Notify statusbar that window has moved.
if IsValid (inv_statusbar) then
	inv_statusbar.Event pfc_move (xpos, ypos)
end if

end event

event activate;call super::activate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Activate
//
//	Description:
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

// Set the active frame of the application manager object.
gnv_app.dynamic of_SetFrame (this)

end event

on pfc_w_frame.create
int iCurrent
call w_master::create
if this.MenuName = "m_frame" then this.MenuID = create m_frame
this.mdi_1=create mdi_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=mdi_1
end on

on pfc_w_frame.destroy
call w_master::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event resize;call super::resize;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  resize
//
//	Description:  
//	Notify statusbar that window has resized.
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

// Notify the service of the resize.
if IsValid (inv_statusbar) then
	inv_statusbar.Event pfc_resize (sizetype, newwidth, newheight)
end if

end event

event pfc_postopen;call super::pfc_postopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_postopen
//
//	Arguments:  none
//
//	Returns:  none
//
//	Description:  Post Open functionality.
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

// Notify statusbar service to open the StatusBar window.
if IsValid (inv_statusbar) then
	inv_statusbar.of_Open(True)
end if

end event

event pfc_microhelp;call w_master::pfc_microhelp;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_microhelp
//
//	Arguments:		
//	as_microhelp   string to be displayed as microhelp
//
//	Returns:  none
//
//	Description:  Displays specified microhelp
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

if gnv_app.of_GetMicrohelp() then
	this.SetMicroHelp (as_microhelp)
end if
end event

event close;call super::close;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  close
//
//	Description:
//	Destroy any instantiated services
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

of_SetSheetManager (false)
of_SetStatusbar (false)
end event

event hide;call super::hide;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  hide
//
//	Description:  
//	Notify statusbar that window has been hidden.
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

// Notify the service.
if IsValid (inv_statusbar) then
	inv_statusbar.Event pfc_hide()
end if

end event

event show;call super::show;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  show
//
//	Description:  
//	Notify statusbar that window has been shown.
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

// Notify the service.
if IsValid (inv_statusbar) then
	inv_statusbar.Event pfc_show()
end if

end event

type mdi_1 from mdiclient within pfc_w_frame
long BackColor=276856960
end type

