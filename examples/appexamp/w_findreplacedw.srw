HA$PBExportHeader$w_findreplacedw.srw
$PBExportComments$Example using Find/Replace Service on a DW
forward
global type w_findreplacedw from w_main
end type
type dw_customer from u_dw within w_findreplacedw
end type
type cb_find from u_cb within w_findreplacedw
end type
type cb_replace from u_cb within w_findreplacedw
end type
type cb_close from u_cb within w_findreplacedw
end type
end forward

global type w_findreplacedw from w_main
int X=434
int Y=268
int Width=2528
int Height=1144
boolean TitleBar=true
string Title="PFC Example - Find and Replace Service"
boolean Resizable=false
dw_customer dw_customer
cb_find cb_find
cb_replace cb_replace
cb_close cb_close
end type
global w_findreplacedw w_findreplacedw

on w_findreplacedw.create
int iCurrent
call super::create
this.dw_customer=create dw_customer
this.cb_find=create cb_find
this.cb_replace=create cb_replace
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_customer
this.Control[iCurrent+2]=this.cb_find
this.Control[iCurrent+3]=this.cb_replace
this.Control[iCurrent+4]=this.cb_close
end on

on w_findreplacedw.destroy
call super::destroy
destroy(this.dw_customer)
destroy(this.cb_find)
destroy(this.cb_replace)
destroy(this.cb_close)
end on

type dw_customer from u_dw within w_findreplacedw
int X=32
int Y=32
int Width=2441
int Height=856
int TabOrder=10
string DataObject="d_employee"
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

SetTransObject(sqlca)
of_SetFind(true)
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

type cb_find from u_cb within w_findreplacedw
int X=1376
int Y=924
int TabOrder=20
string Text="&Find"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Calls the pfc_finddlg event on the DataWindow to invoke the find
// dialog.
//
//////////////////////////////////////////////////////////////////////////////

dw_customer.event pfc_finddlg()
end event

type cb_replace from u_cb within w_findreplacedw
int X=1746
int Y=924
int TabOrder=30
boolean BringToTop=true
string Text="&Replace"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Calls the pfc_replacedlg event on the DataWindow to invoke the replace
// dialog.
//
//////////////////////////////////////////////////////////////////////////////

dw_customer.event pfc_replacedlg()
end event

type cb_close from u_cb within w_findreplacedw
int X=2121
int Y=924
int TabOrder=40
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

