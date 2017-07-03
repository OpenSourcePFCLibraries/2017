HA$PBExportHeader$w_tabresize.srw
$PBExportComments$NEW!  Resizing PFC tab pages with create on demand.
forward
global type w_tabresize from w_main
end type
type cb_1 from u_cb within w_tabresize
end type
type cb_2 from u_cb within w_tabresize
end type
type tab_1 from u_tabresize within w_tabresize
end type
type cb_3 from u_cb within w_tabresize
end type
type cb_4 from u_cb within w_tabresize
end type
type tab_1 from u_tabresize within w_tabresize
end type
end forward

global type w_tabresize from w_main
int X=5
int Y=4
int Width=2048
int Height=936
boolean TitleBar=true
string Title="PFC Example - Resize Dynamic Tab Pages"
cb_1 cb_1
cb_2 cb_2
tab_1 tab_1
cb_3 cb_3
cb_4 cb_4
end type
global w_tabresize w_tabresize

on w_tabresize.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_2=create cb_2
this.tab_1=create tab_1
this.cb_3=create cb_3
this.cb_4=create cb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.tab_1
this.Control[iCurrent+4]=this.cb_3
this.Control[iCurrent+5]=this.cb_4
end on

on w_tabresize.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.tab_1)
destroy(this.cb_3)
destroy(this.cb_4)
end on

event pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_preopen
//
//	Arguments:
//	None
//
//	Returns:
// None
//
//	Description:
// Register controls with the window resize service.
//
//////////////////////////////////////////////////////////////////////////////

integer			li_index
listviewitem	llvi_1

// Start the Resize Service.
of_SetResize(true)

// Set the Minimum size of the main object.
inv_resize.of_SetMinSize(1569, 813)

// Set the behavior of each object.
inv_resize.of_Register(cb_1, inv_resize.FIXEDRIGHT)
inv_resize.of_Register(cb_2, inv_resize.FIXEDRIGHT)
inv_resize.of_Register(cb_3, inv_resize.FIXEDRIGHT)
inv_resize.of_Register(cb_4, inv_resize.FIXEDRIGHT)
inv_resize.of_Register(tab_1, inv_resize.SCALERIGHTBOTTOM)


end event

type cb_1 from u_cb within w_tabresize
int X=1627
int Y=124
int TabOrder=50
boolean Enabled=false
string Text="F&ind Now"
end type

type cb_2 from u_cb within w_tabresize
int X=1627
int Y=236
int TabOrder=40
boolean Enabled=false
boolean BringToTop=true
string Text="Sto&p"
end type

type tab_1 from u_tabresize within w_tabresize
int X=32
int Y=28
int Height=732
int TabOrder=30
end type

type cb_3 from u_cb within w_tabresize
int X=1627
int Y=348
int TabOrder=20
boolean Enabled=false
boolean BringToTop=true
string Text="Ne&w Search"
end type

type cb_4 from u_cb within w_tabresize
int X=1627
int Y=460
int TabOrder=10
boolean BringToTop=true
string Text="Close"
boolean Cancel=true
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Calls the pfc_close event on the window.
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

parent.event pfc_close()
end event

