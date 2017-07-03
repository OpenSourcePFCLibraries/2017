HA$PBExportHeader$w_dw3types.srw
$PBExportComments$ENHANCED FOR 6.0!  Example demonstrates the PFC 6.0 save process using linked PFC DataWindows, an unlinked PFC DataWindow, and a native PowerBuilder DataWindow.
forward
global type w_dw3types from w_main
end type
type dw_link1 from u_dw within w_dw3types
end type
type dw_link2 from u_dw within w_dw3types
end type
type dw_link3 from u_dw within w_dw3types
end type
type dw_pfc_nolink from u_dw within w_dw3types
end type
type dw_nonpfc from datawindow within w_dw3types
end type
type cb_update from u_cb within w_dw3types
end type
type cb_retrieve from u_cb within w_dw3types
end type
type cb_close from u_cb within w_dw3types
end type
type gb_linkedpfcdw from groupbox within w_dw3types
end type
type gb_nonpfcdw from groupbox within w_dw3types
end type
type gb_unlinkedpfcdw from groupbox within w_dw3types
end type
type cb_1 from u_cb_sqlspy within w_dw3types
end type
type p_1 from u_p within w_dw3types
end type
end forward

global type w_dw3types from w_main
integer x = 5
integer y = 68
integer width = 2921
integer height = 1728
string title = "PFC Example - Save Process: All DW Scenarios"
boolean resizable = false
boolean toolbarvisible = false
event type integer ue_sqlspy ( )
dw_link1 dw_link1
dw_link2 dw_link2
dw_link3 dw_link3
dw_pfc_nolink dw_pfc_nolink
dw_nonpfc dw_nonpfc
cb_update cb_update
cb_retrieve cb_retrieve
cb_close cb_close
gb_linkedpfcdw gb_linkedpfcdw
gb_nonpfcdw gb_nonpfcdw
gb_unlinkedpfcdw gb_unlinkedpfcdw
cb_1 cb_1
p_1 p_1
end type
global w_dw3types w_dw3types

event ue_sqlspy;call super::ue_sqlspy;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	ue_sqlspy
//
//	Arguments:
//	None
//
//	Returns:
//	integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	This script turns the SQL Spy Utility on or off.
// Note that the SQL Spy window cannot be opened unless the Debug
// service has been started.
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

integer li_return

// If debug is not on, turn it on.
if IsNull(gnv_app.inv_debug) or not IsValid(gnv_app.inv_debug) then
	li_return = gnv_app.of_SetDebug(true)
end if

if li_return < 0 then return -1

if IsNull(gnv_app.inv_debug.inv_sqlspy) or not &
	IsValid(gnv_app.inv_debug.inv_sqlspy) then
	// Start the SQLSpy Service.
	li_return = gnv_app.inv_debug.of_SetSQLSpy(true)
	if li_return < 0 then return -1
	// Allow for the inspect option.
	li_return = gnv_app.inv_debug.inv_sqlspy.of_SetAllowInspect(true)
	if li_return < 0 then return -1
	// Open the SQLSpy Window.
	li_return = gnv_app.inv_debug.inv_sqlspy.of_OpenSQLSpy(true)
else
	if IsValid(gnv_app.inv_debug.inv_sqlspy) then
		// Close the SQLSpy Window.
		li_return = gnv_app.inv_debug.of_SetSQLSpy(false)
	end if
end if
return li_return	
	
end event

on w_dw3types.create
int iCurrent
call super::create
this.dw_link1=create dw_link1
this.dw_link2=create dw_link2
this.dw_link3=create dw_link3
this.dw_pfc_nolink=create dw_pfc_nolink
this.dw_nonpfc=create dw_nonpfc
this.cb_update=create cb_update
this.cb_retrieve=create cb_retrieve
this.cb_close=create cb_close
this.gb_linkedpfcdw=create gb_linkedpfcdw
this.gb_nonpfcdw=create gb_nonpfcdw
this.gb_unlinkedpfcdw=create gb_unlinkedpfcdw
this.cb_1=create cb_1
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_link1
this.Control[iCurrent+2]=this.dw_link2
this.Control[iCurrent+3]=this.dw_link3
this.Control[iCurrent+4]=this.dw_pfc_nolink
this.Control[iCurrent+5]=this.dw_nonpfc
this.Control[iCurrent+6]=this.cb_update
this.Control[iCurrent+7]=this.cb_retrieve
this.Control[iCurrent+8]=this.cb_close
this.Control[iCurrent+9]=this.gb_linkedpfcdw
this.Control[iCurrent+10]=this.gb_nonpfcdw
this.Control[iCurrent+11]=this.gb_unlinkedpfcdw
this.Control[iCurrent+12]=this.cb_1
this.Control[iCurrent+13]=this.p_1
end on

on w_dw3types.destroy
call super::destroy
destroy(this.dw_link1)
destroy(this.dw_link2)
destroy(this.dw_link3)
destroy(this.dw_pfc_nolink)
destroy(this.dw_nonpfc)
destroy(this.cb_update)
destroy(this.cb_retrieve)
destroy(this.cb_close)
destroy(this.gb_linkedpfcdw)
destroy(this.gb_nonpfcdw)
destroy(this.gb_unlinkedpfcdw)
destroy(this.cb_1)
destroy(this.p_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	open
//
//	Description:
//	Set the transaction object and retrieve the linked DataWindows.
//
//////////////////////////////////////////////////////////////////////////////

//  Set the Transaction Object for all the dws 
dw_link1.inv_linkage.of_SetTransObject(sqlca)

//  Call the retrieve on the top-level datawindow.  This 
//  will retrieve all the datawindows in the linked chain 
dw_link1.of_Retrieve()




end event

type dw_link1 from u_dw within w_dw3types
string dataobject = "d_customerdetailupdatable"
boolean livescroll = false
integer x = 46
integer y = 100
integer width = 1399
integer height = 512
integer taborder = 10
string tag = "linkedmaster"
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

// Turn on the linkage service
of_SetLinkage(true) 

//  Specify how column links will be used...
//  in this case, as retrieval arguments 
inv_linkage.of_SetStyle(inv_linkage.RETRIEVE)


SetRowFocusIndicator(p_1)  






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

type dw_link2 from u_dw within w_dw3types
string dataobject = "d_salesforcustomersupdatable2"
boolean livescroll = false
integer x = 46
integer y = 628
integer width = 1399
integer height = 452
integer taborder = 20
string tag = "linkedchild1"
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

// Turn on the linkage service 
of_SetLinkage(true) 

// Link this detail datawindow to it's master. 
inv_linkage.of_SetMaster(dw_link1) 

// Specify the columns that link the two DataWindows.
//	The values in these columns will be used as retrieval arguments. 
inv_linkage.of_Register("cust_id","cust_id") 

// Specify how column links will be used...
// in this case, as retrieval arguments 
inv_linkage.of_SetStyle(inv_linkage.RETRIEVE)

SetRowFocusIndicator(p_1) 

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

type dw_link3 from u_dw within w_dw3types
string dataobject = "d_lineitemsupdatable2"
boolean livescroll = false
integer x = 46
integer y = 1092
integer width = 1399
integer height = 348
integer taborder = 30
string tag = "linkedchild2"
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

// Turn on the linkage service.
of_SetLinkage(true) 

// Link this detail datawindow to it's master. 
inv_linkage.of_SetMaster(dw_link2) 

//  Specify the columns that link the two DataWindows.
//	 The values in these columns will be used as retrieval arguments. 
inv_linkage.of_Register("sales_id", "sales_id") 

//  Specify how column links will be used...
//  in the case, as retrieval arguments 
inv_linkage.of_SetStyle(inv_linkage.RETRIEVE) 

SetRowFocusIndicator(p_1) 




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

type dw_pfc_nolink from u_dw within w_dw3types
string dataobject = "d_empnamesupdateable"
boolean hscrollbar = true
boolean livescroll = false
integer x = 1559
integer y = 96
integer width = 1266
integer height = 604
integer taborder = 40
string tag = "unlinkedpfc"
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

type dw_nonpfc from datawindow within w_dw3types
string dataobject = "d_deptsfreeform"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
integer x = 1559
integer y = 912
integer width = 1266
integer height = 528
integer taborder = 50
string tag = "regulardw"
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

dw_nonpfc.SetTransObject(sqlca)
dw_nonpfc.Retrieve() 
end event

type cb_update from u_cb within w_dw3types
event clicked pbm_bnclicked
string text = "&Update"
integer x = 2103
integer y = 1508
integer width = 370
integer taborder = 70
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Save all DataWindows.
//
//////////////////////////////////////////////////////////////////////////////

//Save the PFC linked and non-linked DataWindows.
parent.event pfc_save()
end event

type cb_retrieve from u_cb within w_dw3types
string text = "&Retrieve"
integer x = 1719
integer y = 1508
integer width = 370
integer taborder = 60
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Retrieve all DataWindows.
//
//////////////////////////////////////////////////////////////////////////////

// Call the of_retrieve() on the top-level datawindow.  This 
// will retrieve all the datawindows in the linked chain 
dw_link1.of_Retrieve()

// Retrieve the Non-linked PFC DataWindow
dw_pfc_nolink.of_Retrieve()

// Retrieve the Non-PFC DataWindow.
dw_nonpfc.Retrieve()
end event

type cb_close from u_cb within w_dw3types
string text = "Close"
boolean cancel = true
integer x = 2487
integer y = 1508
integer width = 370
integer taborder = 80
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

type gb_linkedpfcdw from groupbox within w_dw3types
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
string text = "Linked PFC DataWindows with Auto-update"
integer x = 18
integer y = 16
integer width = 1458
integer height = 1452
end type

type gb_nonpfcdw from groupbox within w_dw3types
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
string text = "Non-PFC DataWindow"
integer x = 1531
integer y = 800
integer width = 1326
integer height = 668
end type

type gb_unlinkedpfcdw from groupbox within w_dw3types
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
string text = "Unlinked PFC DataWindow"
integer x = 1531
integer y = 16
integer width = 1326
integer height = 728
end type

type cb_1 from u_cb_sqlspy within w_dw3types
integer x = 1335
integer y = 1508
integer taborder = 2
end type

type p_1 from u_p within w_dw3types
boolean originalsize = true
string picturename = "rowind.bmp"
integer x = 3269
integer y = 312
integer width = 73
integer height = 64
end type

