HA$PBExportHeader$w_linkcascadedeletes.srw
$PBExportComments$NEW!  PFC 6.0's linkage service has been extended to manage cascading deletes among linked DataWindows.
forward
global type w_linkcascadedeletes from w_main
end type
type cb_retrieve from u_cb within w_linkcascadedeletes
end type
type cb_close from u_cb within w_linkcascadedeletes
end type
type dw_cust from u_dw within w_linkcascadedeletes
end type
type dw_sales from u_dw within w_linkcascadedeletes
end type
type dw_lineitem from u_dw within w_linkcascadedeletes
end type
type cb_update from u_cb within w_linkcascadedeletes
end type
type p_1 from u_p within w_linkcascadedeletes
end type
type cb_sqlspy from u_cb_sqlspy within w_linkcascadedeletes
end type
type mle_note from u_mle within w_linkcascadedeletes
end type
end forward

global type w_linkcascadedeletes from w_main
int X=329
int Y=100
int Width=1687
int Height=1644
boolean TitleBar=true
string Title="PFC Example - Filter with Cascading Deletes"
boolean Resizable=false
cb_retrieve cb_retrieve
cb_close cb_close
dw_cust dw_cust
dw_sales dw_sales
dw_lineitem dw_lineitem
cb_update cb_update
p_1 p_1
cb_sqlspy cb_sqlspy
mle_note mle_note
end type
global w_linkcascadedeletes w_linkcascadedeletes

on w_linkcascadedeletes.create
int iCurrent
call super::create
this.cb_retrieve=create cb_retrieve
this.cb_close=create cb_close
this.dw_cust=create dw_cust
this.dw_sales=create dw_sales
this.dw_lineitem=create dw_lineitem
this.cb_update=create cb_update
this.p_1=create p_1
this.cb_sqlspy=create cb_sqlspy
this.mle_note=create mle_note
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_retrieve
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.dw_cust
this.Control[iCurrent+4]=this.dw_sales
this.Control[iCurrent+5]=this.dw_lineitem
this.Control[iCurrent+6]=this.cb_update
this.Control[iCurrent+7]=this.p_1
this.Control[iCurrent+8]=this.cb_sqlspy
this.Control[iCurrent+9]=this.mle_note
end on

on w_linkcascadedeletes.destroy
call super::destroy
destroy(this.cb_retrieve)
destroy(this.cb_close)
destroy(this.dw_cust)
destroy(this.dw_sales)
destroy(this.dw_lineitem)
destroy(this.cb_update)
destroy(this.p_1)
destroy(this.cb_sqlspy)
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

//  Set the Transaction Object for all the dws 
dw_cust.inv_linkage.of_SetTransObject(sqlca)

//  Call the retrieve on the top-level datawindow.  This 
//  will retrieve all the datawindows in the linked chain 
dw_cust.of_Retrieve()
end event

type cb_retrieve from u_cb within w_linkcascadedeletes
int X=622
int Y=1432
int Width=320
int Height=80
int TabOrder=50
string Text="&Retrieve"
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

type cb_close from u_cb within w_linkcascadedeletes
int X=1307
int Y=1432
int Width=320
int Height=80
int TabOrder=70
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

type dw_cust from u_dw within w_linkcascadedeletes
int X=37
int Y=264
int Width=1586
int Height=344
int TabOrder=10
string Tag="customers"
string DataObject="d_customerdetailupdatable"
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

// Start the Linkage Service.
of_SetLinkage(true) 
inv_linkage.of_SetDeleteStyle (inv_linkage.DELETE_ROWS)
inv_linkage.of_SetUpdateStyle (inv_linkage.TOPDOWN_BOTTOMUP)

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
//	Disable the insert and add items on the right mouse menu. 
// Enable the delete item on the right mouse menu.
//
//////////////////////////////////////////////////////////////////////////////

// Set up the PopUp Menu.
am_dw.m_table.m_insert.enabled = false
am_dw.m_table.m_addrow.enabled = false
am_dw.m_table.m_delete.enabled = true
end event

type dw_sales from u_dw within w_linkcascadedeletes
int X=37
int Y=632
int Width=1586
int Height=368
int TabOrder=30
string Tag="sales"
string DataObject="d_salesforcustomersall"
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
inv_linkage.of_SetDeleteStyle (inv_linkage.DELETE_ROWS)
inv_linkage.of_SetUpdateStyle (inv_linkage.TOPDOWN_BOTTOMUP)

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
//	Disable the insert and add items on the right mouse menu. 
// Enable the delete item on the right mouse menu.
//
//////////////////////////////////////////////////////////////////////////////

// Set up the PopUp Menu.
am_dw.m_table.m_insert.enabled = false
am_dw.m_table.m_addrow.enabled = false
am_dw.m_table.m_delete.enabled = true
end event

type dw_lineitem from u_dw within w_linkcascadedeletes
int X=37
int Y=1032
int Width=1586
int Height=368
int TabOrder=40
string Tag="lineitems"
string DataObject="d_lineitemsall"
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
//	Disable the insert and add items on the right mouse menu. 
// Enable the delete item on the right mouse menu.
//
//////////////////////////////////////////////////////////////////////////////

// Set up the PopUp Menu.
am_dw.m_table.m_insert.enabled = false
am_dw.m_table.m_addrow.enabled = false
am_dw.m_table.m_delete.enabled = true
end event

type cb_update from u_cb within w_linkcascadedeletes
int X=965
int Y=1432
int Width=320
int Height=80
int TabOrder=60
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

type p_1 from u_p within w_linkcascadedeletes
int X=2062
int Y=292
int Width=73
int Height=64
boolean BringToTop=true
string PictureName="rowind.bmp"
boolean OriginalSize=true
end type

type cb_sqlspy from u_cb_sqlspy within w_linkcascadedeletes
int X=279
int Y=1432
int Height=80
int TabOrder=20
boolean BringToTop=true
end type

type mle_note from u_mle within w_linkcascadedeletes
int X=37
int Y=16
int Width=1586
int Height=236
int TabOrder=10
boolean BringToTop=true
boolean Border=false
BorderStyle BorderStyle=StyleBox!
string Text="The example uses inv_linkage.of_DeleteStyle(inv_linkage.DELETE_ROWS)   and inv_linkage.of_SetUpdateStyle (inv_linkage.TOPDOWN_BOTTOMUP)"
long BackColor=80263328
end type

