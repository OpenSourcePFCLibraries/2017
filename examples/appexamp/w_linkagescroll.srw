HA$PBExportHeader$w_linkagescroll.srw
$PBExportComments$DW Linkage example using Scroll option
forward
global type w_linkagescroll from w_main
end type
type cb_retrieve from u_cb within w_linkagescroll
end type
type cb_close from u_cb within w_linkagescroll
end type
type dw_emp from u_dw within w_linkagescroll
end type
type dw_detail from u_dw within w_linkagescroll
end type
type cb_update from u_cb within w_linkagescroll
end type
type p_1 from u_p within w_linkagescroll
end type
end forward

global type w_linkagescroll from w_main
int X=233
int Y=248
int Width=2373
int Height=1188
boolean TitleBar=true
string Title="PFC Example - Basic Scrolling"
boolean Resizable=false
cb_retrieve cb_retrieve
cb_close cb_close
dw_emp dw_emp
dw_detail dw_detail
cb_update cb_update
p_1 p_1
end type
global w_linkagescroll w_linkagescroll

on w_linkagescroll.create
int iCurrent
call super::create
this.cb_retrieve=create cb_retrieve
this.cb_close=create cb_close
this.dw_emp=create dw_emp
this.dw_detail=create dw_detail
this.cb_update=create cb_update
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_retrieve
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.dw_emp
this.Control[iCurrent+4]=this.dw_detail
this.Control[iCurrent+5]=this.cb_update
this.Control[iCurrent+6]=this.p_1
end on

on w_linkagescroll.destroy
call super::destroy
destroy(this.cb_retrieve)
destroy(this.cb_close)
destroy(this.dw_emp)
destroy(this.dw_detail)
destroy(this.cb_update)
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
dw_emp.inv_linkage.of_SetTransObject(sqlca)

//  Call the retrieve on the top-level datawindow.  This 
//  will retrieve all the datawindows in the linked chain 
dw_emp.of_Retrieve()
end event

type cb_retrieve from u_cb within w_linkagescroll
int X=1979
int Y=28
int TabOrder=30
string Text="&Retrieve"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	open
//
//	Description:
//  Calls the retrieve on the top-level datawindow.  This 
//  will retrieve all the datawindows in the linked chain. 
//
//////////////////////////////////////////////////////////////////////////////

dw_emp.of_Retrieve()
dw_emp.SelectRow(1, true)

end event

type cb_close from u_cb within w_linkagescroll
int X=1979
int Y=264
int TabOrder=50
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

type dw_emp from u_dw within w_linkagescroll
int X=32
int Y=28
int Width=1906
int Height=300
int TabOrder=10
string DataObject="d_empnames"
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Initializes the DataWindow.
//
//////////////////////////////////////////////////////////////////////////////

// This view is for Browse only.
of_SetUpdateable(false)

// Start the Linkage Service.
of_SetLinkage(true)

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

am_dw.m_table.m_insert.enabled = false
am_dw.m_table.m_addrow.enabled = false
am_dw.m_table.m_delete.enabled = false

end event

type dw_detail from u_dw within w_linkagescroll
int X=32
int Y=348
int Width=1906
int Height=732
int TabOrder=20
string DataObject="d_empfreeform"
boolean VScrollBar=false
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
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
// Link this dw to its master.
inv_linkage.of_SetMaster(dw_emp) 
// Specify the columns that link the dws.
inv_linkage.of_Register("emp_id", "emp_id") 
// Specify how column links will be used.
// In this case, as filter arguments.
inv_linkage.of_SetStyle(inv_linkage.SCROLL) 

SetRowFocusIndicator(focusrect!)
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

am_dw.m_table.m_insert.enabled = false
am_dw.m_table.m_addrow.enabled = false
am_dw.m_table.m_delete.enabled = false

end event

type cb_update from u_cb within w_linkagescroll
int X=1979
int Y=148
int TabOrder=40
string Text="&Update"
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

type p_1 from u_p within w_linkagescroll
int X=1801
int Y=412
int Width=73
int Height=64
boolean Visible=false
boolean BringToTop=true
string PictureName="rowind.bmp"
boolean OriginalSize=true
end type

