HA$PBExportHeader$w_rowselection.srw
$PBExportComments$Row Selection Service example
forward
global type w_rowselection from w_main
end type
type st_1 from u_st within w_rowselection
end type
type st_2 from u_st within w_rowselection
end type
type dw_1 from u_dw within w_rowselection
end type
type st_3 from u_st within w_rowselection
end type
type rb_single from u_rb within w_rowselection
end type
type rb_multiselect from u_rb within w_rowselection
end type
type rb_extended from u_rb within w_rowselection
end type
type cb_invert from u_cb within w_rowselection
end type
type cb_close from u_cb within w_rowselection
end type
end forward

global type w_rowselection from w_main
int X=0
int Y=4
int Width=2885
int Height=1404
boolean TitleBar=true
string Title="PFC Example - Row Selection Service"
long BackColor=77571519
boolean Resizable=false
st_1 st_1
st_2 st_2
dw_1 dw_1
st_3 st_3
rb_single rb_single
rb_multiselect rb_multiselect
rb_extended rb_extended
cb_invert cb_invert
cb_close cb_close
end type
global w_rowselection w_rowselection

on w_rowselection.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.dw_1=create dw_1
this.st_3=create st_3
this.rb_single=create rb_single
this.rb_multiselect=create rb_multiselect
this.rb_extended=create rb_extended
this.cb_invert=create cb_invert
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.rb_single
this.Control[iCurrent+6]=this.rb_multiselect
this.Control[iCurrent+7]=this.rb_extended
this.Control[iCurrent+8]=this.cb_invert
this.Control[iCurrent+9]=this.cb_close
end on

on w_rowselection.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.dw_1)
destroy(this.st_3)
destroy(this.rb_single)
destroy(this.rb_multiselect)
destroy(this.rb_extended)
destroy(this.cb_invert)
destroy(this.cb_close)
end on

type st_1 from u_st within w_rowselection
int X=2062
int Y=28
int Width=727
int Height=132
string Text="Select/Highlight the clicked row and deselect all other rows."
long TextColor=33554687
long BackColor=82889382
end type

type st_2 from u_st within w_rowselection
int X=2062
int Y=716
int Width=727
int Height=172
string Text="Extended supports Shift/Click, Cntl/Click, and Shift/Cntl/Click  ~"File Manager~"-style selection."
long TextColor=41943040
long BackColor=82889382
end type

type dw_1 from u_dw within w_rowselection
int X=37
int Y=28
int Width=1984
int Height=1228
int TabOrder=10
string DataObject="d_customerlistreadonly"
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

// Start the Row Selection Service.
of_SetRowSelect(true)

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

type st_3 from u_st within w_rowselection
int X=2062
int Y=364
int Width=727
int Height=160
string Text="Select/Highlight the clicked row and do not deselect any other rows."
long TextColor=41943040
long BackColor=82889382
end type

type rb_single from u_rb within w_rowselection
int X=2062
int Y=188
int TabOrder=20
string Text="&Single Select"
boolean Checked=true
long TextColor=41943040
long BackColor=82889382
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Unselects any previously selected rows and changes the
// selection style to SINGLE.
//
//////////////////////////////////////////////////////////////////////////////

dw_1.SelectRow(0, false) 

dw_1.inv_rowselect.of_SetStyle(dw_1.inv_rowselect.SINGLE) 
end event

type rb_multiselect from u_rb within w_rowselection
int X=2062
int Y=536
int TabOrder=30
boolean BringToTop=true
string Text="&Multi-Select"
long TextColor=41943040
long BackColor=82889382
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Unselects any previously selected rows and changes the
// selection style to MULTIPLE.
//
//////////////////////////////////////////////////////////////////////////////

dw_1.SelectRow(0, false) 

dw_1.inv_rowselect.of_SetStyle(dw_1.inv_rowselect.MULTIPLE) 
end event

type rb_extended from u_rb within w_rowselection
int X=2062
int Y=892
int Width=485
int TabOrder=40
boolean BringToTop=true
string Text="&Extended Select"
long TextColor=41943040
long BackColor=82889382
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Unselects any previously selected rows and changes the
// selection style to EXTENDED.
//
//////////////////////////////////////////////////////////////////////////////


dw_1.SelectRow(0, false) 

dw_1.inv_rowselect.of_SetStyle(dw_1.inv_rowselect.EXTENDED) 
end event

type cb_invert from u_cb within w_rowselection
int X=2071
int Y=1164
int TabOrder=50
string Text="&Invert"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Unselects all rows that are currently selected and selects all
// rows that currently not selected.
//
//////////////////////////////////////////////////////////////////////////////

dw_1.inv_rowselect.of_InvertSelection() 
end event

type cb_close from u_cb within w_rowselection
int X=2446
int Y=1164
int TabOrder=60
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

