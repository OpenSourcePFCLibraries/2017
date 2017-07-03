HA$PBExportHeader$w_dwprintpreview.srw
$PBExportComments$Example using the  Print Preview DW Service.
forward
global type w_dwprintpreview from w_main
end type
type dw_1 from u_dw within w_dwprintpreview
end type
type cb_close from u_cb within w_dwprintpreview
end type
type cb_setzoom from u_cb within w_dwprintpreview
end type
type cbx_printpreview from u_cbx within w_dwprintpreview
end type
type cbx_1 from u_cbx within w_dwprintpreview
end type
type gb_1 from u_gb within w_dwprintpreview
end type
end forward

global type w_dwprintpreview from w_main
int X=402
int Y=128
int Width=2080
int Height=1508
boolean TitleBar=true
string Title="PFC Example - Print Preview Service"
boolean Resizable=false
dw_1 dw_1
cb_close cb_close
cb_setzoom cb_setzoom
cbx_printpreview cbx_printpreview
cbx_1 cbx_1
gb_1 gb_1
end type
global w_dwprintpreview w_dwprintpreview

on w_dwprintpreview.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_close=create cb_close
this.cb_setzoom=create cb_setzoom
this.cbx_printpreview=create cbx_printpreview
this.cbx_1=create cbx_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_setzoom
this.Control[iCurrent+4]=this.cbx_printpreview
this.Control[iCurrent+5]=this.cbx_1
this.Control[iCurrent+6]=this.gb_1
end on

on w_dwprintpreview.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_close)
destroy(this.cb_setzoom)
destroy(this.cbx_printpreview)
destroy(this.cbx_1)
destroy(this.gb_1)
end on

type dw_1 from u_dw within w_dwprintpreview
int X=32
int Y=272
int Width=1989
int Height=960
int TabOrder=0
string DataObject="d_customerlist"
boolean HScrollBar=true
end type

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Initializes the DataWindow.
//
//////////////////////////////////////////////////////////////////////////////

of_SetTransObject(sqlca) 

//Modify the DataWindow Object Properties to disallow editing of data.
Modify("first_name.background.color='78682240'")
Modify("last_name.background.color='78682240'")
Modify("company_name.background.color='78682240'")
SetTabOrder("first_name", 0)
SetTabOrder("last_name", 0)
SetTabOrder("company_name", 0)
of_SetUpdateable(False)

of_SetPrintPreview(true)

of_Retrieve()
end event

event pfc_prermbmenu;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_prermbmenu
//
//	Arguments:
//	am_dw   	the menu that will be displayed when the DataWindow
//				is right clicked.
//
//	Returns:
//	None
//
//	Description:
// Initialize the Right Mouse Menu for the DataWindow.
//
//////////////////////////////////////////////////////////////////////////////

am_dw.m_table.m_insert.enabled = false
am_dw.m_table.m_addrow.enabled = false
am_dw.m_table.m_delete.enabled = false

end event

event pfc_retrieve;call super::pfc_retrieve;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_retrieve
//
//	Arguments:
//	None
//
//	Returns:
//	long
//	The number of rows retrieved from the database
// -1 if it fails
// If any argument's value is NULL, pfc_retrieve returns NULL
//
//	Description:
//	Retrieves data into the DataWindow.
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

return this.Retrieve()

end event

type cb_close from u_cb within w_dwprintpreview
int X=1669
int Y=1276
int TabOrder=40
string Text="Close"
boolean Cancel=true
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Calls the pfc_close event on the window.
//
//////////////////////////////////////////////////////////////////////////////

parent.event pfc_close()

end event

type cb_setzoom from u_cb within w_dwprintpreview
int X=1294
int Y=1276
int TabOrder=30
string Text="Set &Zoom"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Calls of_SetZoom() on the Print Preview Service.
//
//////////////////////////////////////////////////////////////////////////////

dw_1.inv_printpreview.of_SetZoom()
end event

type cbx_printpreview from u_cbx within w_dwprintpreview
int X=73
int Y=116
int Width=384
int TabOrder=10
string Text="Print &Preview"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Calls the pfc_printpreview event on the DataWindow.
//
//////////////////////////////////////////////////////////////////////////////

dw_1.event pfc_printpreview()
end event

type cbx_1 from u_cbx within w_dwprintpreview
int X=608
int Y=116
int Width=366
int TabOrder=20
boolean BringToTop=true
string Text="&Show Ruler"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Calls of_SetRuler() on the Print Preview Service to show and hide
// the ruler.
//
//////////////////////////////////////////////////////////////////////////////

dw_1.inv_printpreview.of_SetRuler(this.checked)

end event

type gb_1 from u_gb within w_dwprintpreview
int X=41
int Y=32
int Width=1984
int Height=188
int TabOrder=0
string Text="Example Options"
end type

