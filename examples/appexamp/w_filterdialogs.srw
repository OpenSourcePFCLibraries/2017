HA$PBExportHeader$w_filterdialogs.srw
$PBExportComments$ENHANCED FOR 6.0!  A demonstration of the various Filter Dialog Styles.
forward
global type w_filterdialogs from w_main
end type
type dw_1 from u_dw within w_filterdialogs
end type
type cb_close from u_cb within w_filterdialogs
end type
type gb_3 from u_gb within w_filterdialogs
end type
type rb_1 from u_rb within w_filterdialogs
end type
type rb_2 from u_rb within w_filterdialogs
end type
type rb_3 from u_rb within w_filterdialogs
end type
type cb_retrieve from u_cb within w_filterdialogs
end type
type cb_1 from u_cb within w_filterdialogs
end type
end forward

global type w_filterdialogs from w_main
integer x = 375
integer y = 80
integer width = 2107
integer height = 1408
string title = "PFC Example - Filter Service Dialogs"
boolean resizable = false
dw_1 dw_1
cb_close cb_close
gb_3 gb_3
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
cb_retrieve cb_retrieve
cb_1 cb_1
end type
global w_filterdialogs w_filterdialogs

type variables

end variables

on w_filterdialogs.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_close=create cb_close
this.gb_3=create gb_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.cb_retrieve=create cb_retrieve
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.gb_3
this.Control[iCurrent+4]=this.rb_1
this.Control[iCurrent+5]=this.rb_2
this.Control[iCurrent+6]=this.rb_3
this.Control[iCurrent+7]=this.cb_retrieve
this.Control[iCurrent+8]=this.cb_1
end on

on w_filterdialogs.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_close)
destroy(this.gb_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.cb_retrieve)
destroy(this.cb_1)
end on

event open;call super::open;dw_1.inv_filter.of_SetStyle(dw_1.inv_filter.SIMPLE)
end event

type dw_1 from u_dw within w_filterdialogs
string dataobject = "d_customerlist"
integer x = 37
integer y = 244
integer width = 2011
integer height = 900
integer taborder = 0
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

// Start the DataWindow Filter Service.
of_SetFilter(true) 

of_Retrieve()

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

type cb_close from u_cb within w_filterdialogs
string text = "Close"
boolean cancel = true
integer x = 1696
integer y = 1188
integer taborder = 40
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

type gb_3 from u_gb within w_filterdialogs
long textcolor = 41943040
long backcolor = 79219928
string text = "Select Filter Dialog Style"
integer x = 37
integer y = 32
integer width = 2011
integer height = 160
integer taborder = 10
end type

type rb_1 from u_rb within w_filterdialogs
string text = "&Simple (a=b) Style"
boolean checked = true
integer x = 78
integer y = 104
integer width = 480
boolean bringtotop = true
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Sets the filter dialog style on the Filter Service.
//
//////////////////////////////////////////////////////////////////////////////

dw_1.inv_filter.of_SetStyle(dw_1.inv_filter.SIMPLE)
end event

type rb_2 from u_rb within w_filterdialogs
string text = "PFC &Extended Wizard"
integer x = 722
integer y = 104
integer width = 581
boolean bringtotop = true
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Sets the filter dialog style on the Filter Service.
//
//////////////////////////////////////////////////////////////////////////////

dw_1.inv_filter.of_SetStyle(dw_1.inv_filter.EXTENDED)
end event

type rb_3 from u_rb within w_filterdialogs
string text = "&PowerBuilder Default"
integer x = 1463
integer y = 104
integer width = 558
boolean bringtotop = true
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Sets the filter dialog style on the Filter Service.
//
//////////////////////////////////////////////////////////////////////////////

dw_1.inv_filter.of_SetStyle(dw_1.inv_filter.DEFAULT)
end event

type cb_retrieve from u_cb within w_filterdialogs
event clicked pbm_bnclicked
string text = "&Reset Filter"
integer x = 1326
integer y = 1188
integer taborder = 30
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Sets the filter on the service and filters the DataWindow.
//
//////////////////////////////////////////////////////////////////////////////

dw_1.inv_filter.of_SetFilter("")
dw_1.Filter()

end event

type cb_1 from u_cb within w_filterdialogs
string text = "Set &Filter"
integer x = 951
integer y = 1188
integer taborder = 20
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Calls the pfc_filterdlg event on the DataWindow to invoke the selected
// filter dialog box.
//
//////////////////////////////////////////////////////////////////////////////

dw_1.event pfc_filterdlg()
end event

