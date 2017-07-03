HA$PBExportHeader$w_tablink.srw
$PBExportComments$NEW!  All three types of DataWindow linkage are utilized in one window across tab pages.  We have one master linked to three details and using each of the three different linkage styles.
forward
global type w_tablink from w_main
end type
type dw_1 from u_dw within w_tablink
end type
type cb_1 from u_cb within w_tablink
end type
type cb_3 from u_cb within w_tablink
end type
type cb_4 from u_cb within w_tablink
end type
type tab_1 from u_tablink within w_tablink
end type
type tab_1 from u_tablink within w_tablink
end type
type cb_2 from u_cb_sqlspy within w_tablink
end type
type p_1 from u_p within w_tablink
end type
end forward

global type w_tablink from w_main
integer x = 5
integer y = 4
integer width = 2729
integer height = 1556
string title = "PFC Example - Across Tab Pages"
boolean resizable = false
dw_1 dw_1
cb_1 cb_1
cb_3 cb_3
cb_4 cb_4
tab_1 tab_1
cb_2 cb_2
p_1 p_1
end type
global w_tablink w_tablink

on w_tablink.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_1=create cb_1
this.cb_3=create cb_3
this.cb_4=create cb_4
this.tab_1=create tab_1
this.cb_2=create cb_2
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.cb_4
this.Control[iCurrent+5]=this.tab_1
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.p_1
end on

on w_tablink.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.cb_3)
destroy(this.cb_4)
destroy(this.tab_1)
destroy(this.cb_2)
destroy(this.p_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	open
//
//	Description:
//	Retrieves the master's data, then retrieves the detail's data.
//
//////////////////////////////////////////////////////////////////////////////

dw_1.inv_linkage.of_SetTransObject(sqlca)

//Retrieve the master datawindow.
dw_1.of_retrieve()
end event

type dw_1 from u_dw within w_tablink
event constructor pbm_constructor
integer x = 37
integer y = 32
integer width = 2185
integer height = 604
integer taborder = 10
string dataobject = "d_salesforcustomersall"
end type

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Initializes the master for linkage.
//
//////////////////////////////////////////////////////////////////////////////

//Start the linkage service.
of_SetLinkage(true)

//  Specify how column links will be used...
//  in this case, as retrieval arguments. 
inv_linkage.of_SetStyle(inv_linkage.RETRIEVE)

//  Set up visual confirmation of saves and deletes.
//  This will be the initial setting for the example.
inv_linkage.of_SetUpdateOnRowChange(true)
inv_linkage.of_SetConfirmOnRowChange(false)

SetRowFocusIndicator(p_1)


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

event pfc_prermbmenu;call super::pfc_prermbmenu;//////////////////////////////////////////////////////////////////////////////
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

am_dw.m_table.m_insert.enabled = false
am_dw.m_table.m_addrow.enabled = false
am_dw.m_table.m_delete.enabled = false

end event

type cb_1 from u_cb within w_tablink
integer x = 2277
integer y = 384
integer width = 370
integer taborder = 50
string text = "Close"
boolean cancel = true
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

type cb_3 from u_cb within w_tablink
integer x = 2277
integer y = 32
integer width = 370
integer taborder = 30
string text = "&Update"
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

parent.event pfc_save()
end event

type cb_4 from u_cb within w_tablink
integer x = 2277
integer y = 144
integer width = 370
integer taborder = 40
string text = "&Retrieve"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	open
//
//	Description:
// Calls the of_Retrieve function on the master DataWindow.  This 
// will retrieve all the datawindows linked to it. 
//
//////////////////////////////////////////////////////////////////////////////

dw_1.of_Retrieve()
end event

type tab_1 from u_tablink within w_tablink
integer x = 32
integer y = 684
integer width = 2610
integer taborder = 20
long backcolor = 77571519
end type

type cb_2 from u_cb_sqlspy within w_tablink
integer x = 2277
integer y = 260
integer taborder = 2
end type

type p_1 from u_p within w_tablink
boolean visible = false
integer x = 2427
integer y = 540
integer width = 73
integer height = 64
boolean originalsize = true
string picturename = "rowind.bmp"
end type

