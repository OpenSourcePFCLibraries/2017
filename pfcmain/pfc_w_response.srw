HA$PBExportHeader$pfc_w_response.srw
$PBExportComments$PFC Response Window class
forward
global type pfc_w_response from w_master
end type
end forward

global type pfc_w_response from w_master
integer x = 215
integer y = 220
integer width = 2514
integer height = 1508
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean clientedge = true
event pfc_default ( )
event pfc_cancel ( )
event pfc_apply ( )
event ue_syscommand pbm_syscommand
end type
global pfc_w_response pfc_w_response

type variables
Protected:

	Boolean		#ControlMenu					= TRUE
	Boolean		#MinBox							= FALSE
	Boolean		#MaxBox							= FALSE
	Boolean		#CloseBox						= TRUE
	Boolean		#Resizable						= FALSE

Private:

	n_cst_platForm				invo_platForm
	n_cst_platFormAttrib		invo_constants
end variables

event pfc_cancel;call w_master::pfc_cancel;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_Cancel
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	This process disables the CloseQuery processing so that no
//						checks are done during the close process.
//
//		*Note:	The developer (on the descendant script) should code 
//					any specific actions prior to closing the window and then 
//					Close the window.
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

/* Allow window to close without the CloseQuery checks being performed */
ib_disableclosequery = True

end event

event ue_syscommand;/////////////////////////////////////////////////////////////////////////
//
//	Event:	  		ue_sysCommand
//
// Arguments:		unsignedLong	System command
// Arguments:		integer			X position of cursor
// Arguments:		integer			Y position of cursor
//
//	Returns:			Long
//
//	Description: 	Mapped to pbm_sysCommand.  The purpose here is to prevent
//						the window from being closed using Alt-F4 when the close
//						sysMenu option has been disabled.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version, prevent Alt-F4 is the
//											close button has been disabled.
//						12.5				11-Dec-2014, modified logic to check if
//											the developer has changed the default PFC
//											controlMenu setting.
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
// 
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

//	The default for the controlMenu property on pfc response windows is
//	FALSE.  Only do resize logic if developer has not changed the
//	controlMenu property.
IF NOT controlMenu THEN
	IF NOT #closeBox THEN
		IF commandType = invo_constants.SC_CLOSE THEN
			
			message.Processed		= TRUE
			message.ReturnValue	= 1
			
		END IF
	END IF
END IF
end event

on pfc_w_response.create
call super::create
end on

on pfc_w_response.destroy
call super::destroy
end on

event pfc_preopen;call super::pfc_preopen;/////////////////////////////////////////////////////////////////////////
//
//	Event:	  		pfc_preOpen
//
// Arguments:		None
//
//	Returns:			None
//
//	Description: 	Triggered from the top of the open event.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version, provide ability to
//											make a response window resizable.
//						12.5				Adjust size of window when resizable is
//											set to true.  Border is thicker for
//											resizable windows.
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
// 
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

//	The default for the controlMenu property on pfc response windows is
//	FALSE.  Only do resize logic if developer has not changed the
//	controlMenu property.
IF NOT controlMenu THEN
	
	unsignedLong				lul_hWnd
	lul_hWnd						= Handle(this)
	
	n_cst_winSrv_style		lnvo_style
	lnvo_style					= CREATE n_cst_winSrv_style
	
	f_setPlatForm(invo_platForm, TRUE)

	//	Window is resizable
	IF #Resizable THEN
		
		lnvo_style.of_style(lul_hWnd, invo_constants.WS_THICKFRAME, TRUE)
		lnvo_style.of_style_extended(lul_hWnd, invo_constants.WS_EX_DLGMODALFRAME, FALSE)
		
		//	Adjust window size to include new thicker border style
		Long						ll_xExpand
		ll_xExpand				= invo_platForm.of_getSystemMetrics(invo_constants.SM_CXSIZEFRAME)	&
									- invo_platForm.of_getSystemMetrics(invo_constants.SM_CXDLGFRAME) + 2

		Long						ll_yExpand
		ll_yExpand				= invo_platForm.of_getSystemMetrics(invo_constants.SM_CYSIZEFRAME)	&
									- invo_platForm.of_getSystemMetrics(invo_constants.SM_CYDLGFRAME)
									
		Width						= Width	+ PixelsToUnits(ll_xExpand * 2, XPixelsToUnits!)
		Height					= Height	+ PixelsToUnits(ll_yExpand * 2, YPixelsToUnits!)
		
	END IF
	
	//	Developer requested a controlMenu
	IF #controlMenu THEN
		
		//	Add the default system menu
		lnvo_style.of_style(lul_hWnd, invo_constants.WS_SYSMENU, TRUE)
	
		UnsignedLong			lul_Menu
		lul_menu					= invo_platForm.GetSystemMenu(lul_hWnd, FALSE)
	
		//	Minimize Box
		IF #minBox THEN
			lnvo_style.of_style(lul_hWnd, invo_constants.WS_MINIMIZEBOX, TRUE)
		ELSE
			invo_platForm.DeleteMenu(lul_Menu, invo_constants.SC_MINIMIZE, invo_constants.MF_BYCOMMAND)
		END IF
	
		//	Maximize Box
		IF #maxBox THEN
			lnvo_style.of_style(lul_hWnd, invo_constants.WS_MAXIMIZEBOX, TRUE)
		ELSE
			invo_platForm.DeleteMenu(lul_Menu, invo_constants.SC_MAXIMIZE, invo_constants.MF_BYCOMMAND)
		END IF
	
		//	Restore is not needed if there is no minimize nor maximize
		IF NOT (#maxBox OR #minBox) THEN
			invo_platForm.DeleteMenu(lul_Menu, invo_constants.SC_RESTORE, invo_constants.MF_BYCOMMAND)
		END IF

		//	Size is not needed if the window is not resizable
		IF NOT (#resizable) THEN
			invo_platForm.DeleteMenu(lul_Menu, invo_constants.SC_SIZE, invo_constants.MF_BYCOMMAND)
		END IF

		//	Turn off/disable the system menu's close.  There is also
		//	code in ue_sysCommand to prevent Alt-F4 from closing the
		//	window when the closeBox is not requested.
		IF NOT #closeBox THEN
			
			invo_platForm.DeleteMenu(lul_Menu, invo_constants.SC_CLOSE, invo_constants.MF_BYCOMMAND)
			invo_platForm.DeleteMenu(lul_menu, invo_platForm.GetMenuItemCount(lul_menu) - 1, invo_constants.MF_BYPOSITION)
		
		END IF
	
	END IF
	
	//	Force Redraw
	invo_platForm.SetWindowPos(lul_hWnd, 0, 0, 0, 0, 0, invo_constants.SWP_NOSIZE + invo_constants.SWP_NOMOVE + invo_constants.SWP_NOZORDER + invo_constants.SWP_FRAMECHANGED)
	invo_platForm.DrawMenuBar(lul_hWnd)
	
	DESTROY lnvo_style

END IF
end event

event close;call super::close;/////////////////////////////////////////////////////////////////////////
//
//	Event:	  		Close
//
// Arguments:		None
//
//	Returns:			Long
//
//	Description: 	Standard PowerBuilder close event.
//
/////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version			12.5				Initial version, cleanup of PFC objects.
//
/////////////////////////////////////////////////////////////////////////
//
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License
// 
// 
// https://opensource.org/licenses/MIT
// 
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
/////////////////////////////////////////////////////////////////////////

f_setPlatForm(invo_platForm, FALSE)
end event

