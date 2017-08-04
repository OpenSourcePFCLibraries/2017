HA$PBExportHeader$pfc_w_response.srw
$PBExportComments$PFC Response Window class
forward
global type pfc_w_response from w_master
end type
end forward

global type pfc_w_response from w_master
int X=214
int Y=221
int Width=2497
int Height=1492
WindowType WindowType=response!
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
event pfc_default ( )
event pfc_cancel ( )
event pfc_apply ( )
end type
global pfc_w_response pfc_w_response

type variables

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

on pfc_w_response.create
call w_master::create
end on

on pfc_w_response.destroy
call w_master::destroy
end on

