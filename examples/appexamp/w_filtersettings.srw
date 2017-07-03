HA$PBExportHeader$w_filtersettings.srw
$PBExportComments$NEW!  The DataWindow Filter Service is configurable.  This example shows how to expand or restrict the column names that are visible in the filter dialogs using service functions.
forward
global type w_filtersettings from w_main
end type
type dw_1 from u_dw within w_filtersettings
end type
type cb_filter from u_cb within w_filtersettings
end type
type cb_reset from u_cb within w_filtersettings
end type
type cb_close from u_cb within w_filtersettings
end type
type cbx_visible from u_cbx within w_filtersettings
end type
type st_1 from u_st within w_filtersettings
end type
type lb_1 from u_lb within w_filtersettings
end type
type gb_1 from u_gb within w_filtersettings
end type
end forward

global type w_filtersettings from w_main
int X=402
int Y=120
int Width=2089
int Height=1488
boolean TitleBar=true
string Title="PFC Example - Filter Service Settings"
boolean Resizable=false
dw_1 dw_1
cb_filter cb_filter
cb_reset cb_reset
cb_close cb_close
cbx_visible cbx_visible
st_1 st_1
lb_1 lb_1
gb_1 gb_1
end type
global w_filtersettings w_filtersettings

on w_filtersettings.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_filter=create cb_filter
this.cb_reset=create cb_reset
this.cb_close=create cb_close
this.cbx_visible=create cbx_visible
this.st_1=create st_1
this.lb_1=create lb_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_filter
this.Control[iCurrent+3]=this.cb_reset
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.cbx_visible
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.lb_1
this.Control[iCurrent+8]=this.gb_1
end on

on w_filtersettings.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_filter)
destroy(this.cb_reset)
destroy(this.cb_close)
destroy(this.cbx_visible)
destroy(this.st_1)
destroy(this.lb_1)
destroy(this.gb_1)
end on

type dw_1 from u_dw within w_filtersettings
int X=37
int Y=612
int Width=1998
int Height=600
int TabOrder=0
string DataObject="d_customerlist"
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

//  Start the filter service and set the default
//  dialog style to SIMPLE.
of_SetFilter(true)
inv_filter.of_SetStyle(inv_filter.SIMPLE)

//  Set the example's default settings.
dw_1.inv_filter.of_SetVisibleOnly(false)

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

type cb_filter from u_cb within w_filtersettings
int X=1056
int Y=1268
int Width=311
int TabOrder=30
string Text="&Filter"
boolean Default=true
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// calls the pfc_filterdlg event on the DataWindow to invoke the filter
// dialog.
//
//////////////////////////////////////////////////////////////////////////////


integer	li_count
integer  li_upperbound
string	ls_excludedcolumns[]

//	Calls of_SetVisibleOnly() on the filter service.  If true, the filter
// dialog will only display the names of visible columns. If false, the 
// filter dialog will display all column names that were selected from 
// the database by the DataWindow select statement.
dw_1.inv_filter.of_SetVisibleOnly(cbx_visible.checked)

//	Creates an array containing all column names that the user selects to be
// excluded from the filter dialog box.  It then passes that array to the
// of_SetExclude() on the Filter Service.
for li_count = 1 to UpperBound(lb_1.item[])
	if lb_1.State(li_count) = 1 then
		li_upperbound = UpperBound(ls_excludedcolumns[])
		ls_excludedcolumns[li_upperbound + 1] = lb_1.item[li_count]
	end if
next
dw_1.inv_filter.of_SetExclude(ls_excludedcolumns)

dw_1.event pfc_filterdlg()
end event

type cb_reset from u_cb within w_filtersettings
int X=1394
int Y=1268
int Width=311
int TabOrder=40
boolean BringToTop=true
string Text="&Reset"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Resets the DataWindow by clearing out the filter criteria and
// reapplying the filter.
//
//////////////////////////////////////////////////////////////////////////////

dw_1.inv_filter.of_SetFilter("")
dw_1.Filter()
end event

type cb_close from u_cb within w_filtersettings
int X=1733
int Y=1268
int Width=311
int TabOrder=50
boolean BringToTop=true
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

type cbx_visible from u_cbx within w_filtersettings
int X=1321
int Y=196
int Width=512
int TabOrder=20
boolean BringToTop=true
string Text="List &visible columns"
end type

type st_1 from u_st within w_filtersettings
int X=87
int Y=124
int Width=617
string Text="&Select columns to exclude:"
end type

type lb_1 from u_lb within w_filtersettings
int X=82
int Y=196
int Width=1120
int Height=332
int TabOrder=10
boolean Sorted=false
boolean MultiSelect=true
int Accelerator=115
string Item[]={"cust_id",&
"first_name",&
"last_name",&
"address",&
"city",&
"state",&
"zip",&
"phone",&
"company_name"}
end type

type gb_1 from u_gb within w_filtersettings
int X=37
int Y=32
int Width=1998
int Height=540
int TabOrder=0
string Text="Example Options"
end type

