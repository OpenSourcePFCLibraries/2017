HA$PBExportHeader$w_requiredfields.srw
$PBExportComments$DataWindow Required Columns Service Example
forward
global type w_requiredfields from w_main
end type
type dw_1 from u_dw within w_requiredfields
end type
type st_2 from u_st within w_requiredfields
end type
type cb_checkrequired from u_cb within w_requiredfields
end type
type cb_close from u_cb within w_requiredfields
end type
type cbx_required from u_cbx within w_requiredfields
end type
end forward

global type w_requiredfields from w_main
int X=640
int Y=140
int Width=1477
int Height=1512
boolean TitleBar=true
string Title="PFC Example - Required Columns Service"
boolean Resizable=false
dw_1 dw_1
st_2 st_2
cb_checkrequired cb_checkrequired
cb_close cb_close
cbx_required cbx_required
end type
global w_requiredfields w_requiredfields

on w_requiredfields.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.st_2=create st_2
this.cb_checkrequired=create cb_checkrequired
this.cb_close=create cb_close
this.cbx_required=create cbx_required
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.cb_checkrequired
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.cbx_required
end on

on w_requiredfields.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.st_2)
destroy(this.cb_checkrequired)
destroy(this.cb_close)
destroy(this.cbx_required)
end on

type dw_1 from u_dw within w_requiredfields
int X=37
int Y=456
int Width=1381
int Height=800
int TabOrder=10
string DataObject="d_depts"
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

// Starts the DataWindow Required Column Service.
of_SetReqColumn(true)

of_Retrieve()
end event

event pfc_retrieve;//////////////////////////////////////////////////////////////////////////////
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

return this.Retrieve()


end event

type st_2 from u_st within w_requiredfields
int X=37
int Y=32
int Width=1381
int Height=224
string Text="Delete some of the values in the editable columns.  When the DataWindow Required Columns Service is on, there will be no required fields validation messages until you click the  ~"Check Required~" button. "
long TextColor=33554432
long BackColor=77571519
end type

type cb_checkrequired from u_cb within w_requiredfields
int X=539
int Y=1292
int Width=439
int TabOrder=30
string Text="&Check Required "
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Explicitly calls AcceptText() then checks for required fields.
//
//////////////////////////////////////////////////////////////////////////////

integer	li_column
long 		ll_row
string 	ls_columnname

li_column = 0
ll_row = 0
ls_columnname = ''

if dw_1.AcceptText() < 0 then return

dw_1.of_CheckRequired(primary!, ll_row, li_column, ls_columnname, true)

end event

type cb_close from u_cb within w_requiredfields
int X=1001
int Y=1292
int Width=416
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

type cbx_required from u_cbx within w_requiredfields
int X=155
int Y=344
int Width=1161
int TabOrder=20
string Text="&Start the DataWindow Required Column Service"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Starts and stops the DataWindow Required Column Service.
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

if this.checked then
	dw_1.of_SetReqColumn(true) 
	cb_checkrequired.enabled = true
else
	dw_1.of_SetReqColumn(false) 
	cb_checkrequired.enabled = false
end if

end event

event constructor;call u_cbx::constructor;IF IsValid (dw_1.inv_reqcolumn) THEN 
	this.Checked = TRUE
else
	this.Checked = FALSE
end if
end event

