HA$PBExportHeader$w_resizefind.srw
$PBExportComments$Demonstrates the window resize service.  Uses the service defined constants.
forward
global type w_resizefind from w_main
end type
type st_named from u_st within w_resizefind
end type
type st_lookin from u_st within w_resizefind
end type
type sle_text from u_sle within w_resizefind
end type
type ddlb_look from u_ddlb within w_resizefind
end type
type cb_browse from u_cb within w_resizefind
end type
type cb_findnow from u_cb within w_resizefind
end type
type cb_stop from u_cb within w_resizefind
end type
type cb_newsearch from u_cb within w_resizefind
end type
type gb_box from u_gb within w_resizefind
end type
end forward

global type w_resizefind from w_main
int X=5
int Y=4
int Width=2121
int Height=620
boolean TitleBar=true
string Title="PFC Example - Window Resize Service"
long BackColor=77571519
st_named st_named
st_lookin st_lookin
sle_text sle_text
ddlb_look ddlb_look
cb_browse cb_browse
cb_findnow cb_findnow
cb_stop cb_stop
cb_newsearch cb_newsearch
gb_box gb_box
end type
global w_resizefind w_resizefind

on w_resizefind.create
int iCurrent
call super::create
this.st_named=create st_named
this.st_lookin=create st_lookin
this.sle_text=create sle_text
this.ddlb_look=create ddlb_look
this.cb_browse=create cb_browse
this.cb_findnow=create cb_findnow
this.cb_stop=create cb_stop
this.cb_newsearch=create cb_newsearch
this.gb_box=create gb_box
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_named
this.Control[iCurrent+2]=this.st_lookin
this.Control[iCurrent+3]=this.sle_text
this.Control[iCurrent+4]=this.ddlb_look
this.Control[iCurrent+5]=this.cb_browse
this.Control[iCurrent+6]=this.cb_findnow
this.Control[iCurrent+7]=this.cb_stop
this.Control[iCurrent+8]=this.cb_newsearch
this.Control[iCurrent+9]=this.gb_box
end on

on w_resizefind.destroy
call super::destroy
destroy(this.st_named)
destroy(this.st_lookin)
destroy(this.sle_text)
destroy(this.ddlb_look)
destroy(this.cb_browse)
destroy(this.cb_findnow)
destroy(this.cb_stop)
destroy(this.cb_newsearch)
destroy(this.gb_box)
end on

event pfc_preopen;// Start the Resize service.
of_SetResize(True)

//Set the MinSize of the main object.
inv_resize.of_SetMinSize(1300, 400)

//Set the behavior of each object.
inv_resize.of_Register (sle_text, inv_resize.SCALERIGHT)
inv_resize.of_Register (ddlb_look, inv_resize.SCALERIGHTBOTTOM)
inv_resize.of_Register (cb_browse, inv_resize.FIXEDRIGHT)
inv_resize.of_Register (gb_box, inv_resize.SCALERIGHTBOTTOM)
inv_resize.of_Register (cb_findnow, inv_resize.FIXEDRIGHT)
inv_resize.of_Register (cb_newsearch, inv_resize.FIXEDRIGHT)
inv_resize.of_Register (cb_stop, inv_resize.FIXEDRIGHT)
end event

type st_named from u_st within w_resizefind
int X=87
int Y=132
int Width=215
string Text="&Named:"
long TextColor=41943040
long BackColor=79219928
end type

type st_lookin from u_st within w_resizefind
int X=87
int Y=244
int Width=210
boolean BringToTop=true
string Text="&Look in:"
long TextColor=41943040
long BackColor=79219928
end type

type sle_text from u_sle within w_resizefind
int X=329
int Y=120
int Width=1262
int TabOrder=10
long TextColor=41943040
long BackColor=1080593568
end type

type ddlb_look from u_ddlb within w_resizefind
int X=325
int Y=228
int Width=864
int Height=188
int TabOrder=20
long TextColor=41943040
long BackColor=1080593568
end type

type cb_browse from u_cb within w_resizefind
int X=1239
int Y=228
int Height=80
int TabOrder=0
boolean Enabled=false
string Text="&Browse"
end type

type cb_findnow from u_cb within w_resizefind
int X=1682
int Y=84
int Height=80
int TabOrder=0
boolean Enabled=false
boolean BringToTop=true
string Text="F&ind Now"
end type

type cb_stop from u_cb within w_resizefind
int X=1682
int Y=284
int Height=80
int TabOrder=30
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

type cb_newsearch from u_cb within w_resizefind
int X=1682
int Y=184
int Height=80
int TabOrder=0
boolean Enabled=false
boolean BringToTop=true
string Text="Ne&w Search"
end type

type gb_box from u_gb within w_resizefind
int X=59
int Y=52
int Width=1577
int Height=388
int TabOrder=0
string Text=""
long TextColor=41943040
long BackColor=79219928
end type

