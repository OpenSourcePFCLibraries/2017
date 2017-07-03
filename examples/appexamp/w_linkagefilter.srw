HA$PBExportHeader$w_linkagefilter.srw
$PBExportComments$DW Linkage example using Filter option
forward
global type w_linkagefilter from w_main
end type
type cb_retrieve from u_cb within w_linkagefilter
end type
type cb_close from u_cb within w_linkagefilter
end type
type dw_cust from u_dw within w_linkagefilter
end type
type dw_sales from u_dw within w_linkagefilter
end type
type dw_lineitem from u_dw within w_linkagefilter
end type
type cb_update from u_cb within w_linkagefilter
end type
type p_1 from u_p within w_linkagefilter
end type
end forward

global type w_linkagefilter from w_main
integer x = 329
integer y = 100
integer width = 1659
integer height = 1392
string title = "PFC Example - Basic Filters"
boolean resizable = false
cb_retrieve cb_retrieve
cb_close cb_close
dw_cust dw_cust
dw_sales dw_sales
dw_lineitem dw_lineitem
cb_update cb_update
p_1 p_1
end type
global w_linkagefilter w_linkagefilter

on w_linkagefilter.create
int iCurrent
call super::create
this.cb_retrieve=create cb_retrieve
this.cb_close=create cb_close
this.dw_cust=create dw_cust
this.dw_sales=create dw_sales
this.dw_lineitem=create dw_lineitem
this.cb_update=create cb_update
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_retrieve
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.dw_cust
this.Control[iCurrent+4]=this.dw_sales
this.Control[iCurrent+5]=this.dw_lineitem
this.Control[iCurrent+6]=this.cb_update
this.Control[iCurrent+7]=this.p_1
end on

on w_linkagefilter.destroy
call super::destroy
destroy(this.cb_retrieve)
destroy(this.cb_close)
destroy(this.dw_cust)
destroy(this.dw_sales)
destroy(this.dw_lineitem)
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
dw_cust.inv_linkage.of_SetTransObject(sqlca)

//  Call the retrieve on the top-level datawindow.  This 
//  will retrieve all the datawindows in the linked chain 
dw_cust.of_Retrieve()
end event

type cb_retrieve from u_cb within w_linkagefilter
integer x = 613
integer y = 1196
integer width = 320
integer height = 80
integer taborder = 40
string text = "&Retrieve"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//  Calls the retrieve on the top-level datawindow.  This 
//  will retrieve all the datawindows in the linked chain. 
//
//////////////////////////////////////////////////////////////////////////////

dw_cust.of_Retrieve()

end event

type cb_close from u_cb within w_linkagefilter
integer x = 1298
integer y = 1196
integer width = 320
integer height = 80
integer taborder = 60
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

type dw_cust from u_dw within w_linkagefilter
string tag = "customers"
integer x = 27
integer y = 24
integer width = 1586
integer height = 344
integer taborder = 10
string dataobject = "d_customerdetailupdatable"
boolean hscrollbar = true
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

// Start the Linkage Service.
of_SetLinkage(true) 

//Start the Row Manager Service.
of_SetRowManager(true)

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

type dw_sales from u_dw within w_linkagefilter
string tag = "sales"
integer x = 27
integer y = 392
integer width = 1586
integer height = 368
integer taborder = 20
string dataobject = "d_salesforcustomersall"
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

// Start the Linkage Service.
of_SetLinkage(true)
// Link this dw to its master.
inv_linkage.of_SetMaster(dw_cust) 
// Specify the columns that link the dws.
inv_linkage.of_Register("cust_id", "cust_id") 
// Specify how column links will be used.
// In this case, as filter arguments.
inv_linkage.of_SetStyle(inv_linkage.FILTER) 

// Start the Row Manager Service.
of_SetRowManager(true)

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

type dw_lineitem from u_dw within w_linkagefilter
string tag = "lineitems"
integer x = 27
integer y = 792
integer width = 1586
integer height = 368
integer taborder = 30
string dataobject = "d_lineitemsall"
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

// Start the Linkage Service.
of_SetLinkage(true)
// Link this dw to its master.
inv_linkage.of_SetMaster(dw_sales) 
// Specify the columns that link the dws.
inv_linkage.of_Register("sales_id", "sales_id") 
// Specify how column links will be used.
// In this case, as filter arguments.
inv_linkage.of_SetStyle(inv_linkage.FILTER) 

// Start the Row Manager Service.
of_SetRowManager(true)

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

type cb_update from u_cb within w_linkagefilter
integer x = 955
integer y = 1196
integer width = 320
integer height = 80
integer taborder = 50
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

type p_1 from u_p within w_linkagefilter
integer x = 2062
integer y = 292
integer width = 73
integer height = 64
boolean bringtotop = true
boolean originalsize = true
string picturename = "rowind.bmp"
end type

