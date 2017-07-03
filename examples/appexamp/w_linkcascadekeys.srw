HA$PBExportHeader$w_linkcascadekeys.srw
$PBExportComments$NEW!  The 6.0 linkage service supports cascading keys.
forward
global type w_linkcascadekeys from w_main
end type
type cb_retrieve from u_cb within w_linkcascadekeys
end type
type cb_close from u_cb within w_linkcascadekeys
end type
type dw_cust from u_dw within w_linkcascadekeys
end type
type dw_sales from u_dw within w_linkcascadekeys
end type
type dw_lineitem from u_dw within w_linkcascadekeys
end type
type p_1 from u_p within w_linkcascadekeys
end type
type mle_note from u_mle within w_linkcascadekeys
end type
end forward

global type w_linkcascadekeys from w_main
integer x = 329
integer y = 100
integer width = 1687
integer height = 1544
string title = "PFC Example - Filter with Cascading Keys"
boolean resizable = false
cb_retrieve cb_retrieve
cb_close cb_close
dw_cust dw_cust
dw_sales dw_sales
dw_lineitem dw_lineitem
p_1 p_1
mle_note mle_note
end type
global w_linkcascadekeys w_linkcascadekeys

on w_linkcascadekeys.create
int iCurrent
call super::create
this.cb_retrieve=create cb_retrieve
this.cb_close=create cb_close
this.dw_cust=create dw_cust
this.dw_sales=create dw_sales
this.dw_lineitem=create dw_lineitem
this.p_1=create p_1
this.mle_note=create mle_note
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_retrieve
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.dw_cust
this.Control[iCurrent+4]=this.dw_sales
this.Control[iCurrent+5]=this.dw_lineitem
this.Control[iCurrent+6]=this.p_1
this.Control[iCurrent+7]=this.mle_note
end on

on w_linkcascadekeys.destroy
call super::destroy
destroy(this.cb_retrieve)
destroy(this.cb_close)
destroy(this.dw_cust)
destroy(this.dw_sales)
destroy(this.dw_lineitem)
destroy(this.p_1)
destroy(this.mle_note)
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

// Disable updates.
ib_disableclosequery = True

//  Set the Transaction Object for all the dws 
dw_cust.inv_linkage.of_SetTransObject(sqlca)

//  Call the retrieve on the top-level datawindow.  This 
//  will retrieve all the datawindows in the linked chain 
dw_cust.of_Retrieve()
end event

type cb_retrieve from u_cb within w_linkcascadekeys
string text = "&Retrieve"
integer x = 960
integer y = 1332
integer width = 320
integer height = 80
integer taborder = 50
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

type cb_close from u_cb within w_linkcascadekeys
string text = "Close"
boolean cancel = true
integer x = 1307
integer y = 1332
integer width = 320
integer height = 80
integer taborder = 60
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

type dw_cust from u_dw within w_linkcascadekeys
string dataobject = "d_customercascadekey"
boolean hscrollbar = true
integer x = 37
integer y = 164
integer width = 1586
integer height = 344
integer taborder = 10
string tag = "customers"
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

// Start the Linkage Service.
of_SetLinkage(true) 
inv_linkage.of_SetSyncOnKeyChange(true)

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

event pfc_prermbmenu;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_prermbmenu
//
//	Arguments:
//	m_dw   am_dw 	Reference to the menu object that was created
//						for the right mouse click.
//
//	Returns:
//	None
//
//	Description:
//	Disable the insert, add items, and delete on the right mouse menu. 
//
//////////////////////////////////////////////////////////////////////////////

// Set up the PopUp Menu.
am_dw.m_table.m_insert.enabled = false
am_dw.m_table.m_addrow.enabled = false
am_dw.m_table.m_delete.enabled = false
end event

type dw_sales from u_dw within w_linkcascadekeys
string dataobject = "d_salesforcustomerscascadekey"
integer x = 37
integer y = 532
integer width = 1586
integer height = 368
integer taborder = 30
string tag = "sales"
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

// Start the Linkage Service.
of_SetLinkage(true)
inv_linkage.of_SetMaster(dw_cust) 
inv_linkage.of_Register("cust_id", "cust_id") 
inv_linkage.of_SetStyle(inv_linkage.FILTER) 
inv_linkage.of_SetSyncOnKeyChange(true)

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

event pfc_prermbmenu;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_prermbmenu
//
//	Arguments:
//	m_dw   am_dw 	Reference to the menu object that was created
//						for the right mouse click.
//
//	Returns:
//	None
//
//	Description:
//	Disable the insert, add items, and delete on the right mouse menu. 
//
//////////////////////////////////////////////////////////////////////////////

// Set up the PopUp Menu.
am_dw.m_table.m_insert.enabled = false
am_dw.m_table.m_addrow.enabled = false
am_dw.m_table.m_delete.enabled = false
end event

type dw_lineitem from u_dw within w_linkcascadekeys
string dataobject = "d_lineitemscascadekey"
integer x = 37
integer y = 932
integer width = 1586
integer height = 368
integer taborder = 40
string tag = "lineitems"
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

// Start the Linkage Service.
of_SetLinkage(true)
inv_linkage.of_SetMaster(dw_sales) 
inv_linkage.of_Register("sales_id", "sales_id") 
inv_linkage.of_SetStyle(inv_linkage.FILTER) 


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

event pfc_prermbmenu;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_prermbmenu
//
//	Arguments:
//	m_dw   am_dw 	Reference to the menu object that was created
//						for the right mouse click.
//
//	Returns:
//	None
//
//	Description:
//	Disable the insert, add items, and delete on the right mouse menu. 
//
//////////////////////////////////////////////////////////////////////////////

// Set up the PopUp Menu.
am_dw.m_table.m_insert.enabled = false
am_dw.m_table.m_addrow.enabled = false
am_dw.m_table.m_delete.enabled = false
end event

type p_1 from u_p within w_linkcascadekeys
boolean originalsize = true
string picturename = "rowind.bmp"
integer x = 2062
integer y = 292
integer width = 73
integer height = 64
boolean bringtotop = true
end type

type mle_note from u_mle within w_linkcascadekeys
long backcolor = 80263328
string text = "The example uses   inv_linkage.of_SetSyncOnKeyChange(true).     Key fields are bolded."
boolean border = false
borderstyle borderstyle = stylebox!
integer x = 37
integer y = 16
integer width = 1527
integer height = 140
integer taborder = 20
boolean bringtotop = true
end type

