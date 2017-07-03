HA$PBExportHeader$w_linkageretrieve.srw
$PBExportComments$DW Linkage example using Retrieve option
forward
global type w_linkageretrieve from w_main
end type
type cb_close from u_cb within w_linkageretrieve
end type
type dw_cust from u_dw within w_linkageretrieve
end type
type dw_sales from u_dw within w_linkageretrieve
end type
type dw_lineitem from u_dw within w_linkageretrieve
end type
type p_1 from u_p within w_linkageretrieve
end type
end forward

global type w_linkageretrieve from w_main
int X=457
int Y=148
int Width=1650
int Height=1496
boolean TitleBar=true
string Title="PFC Example - Basic Retrieval Arguments"
boolean Resizable=false
boolean ToolBarVisible=false
cb_close cb_close
dw_cust dw_cust
dw_sales dw_sales
dw_lineitem dw_lineitem
p_1 p_1
end type
global w_linkageretrieve w_linkageretrieve

on w_linkageretrieve.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.dw_cust=create dw_cust
this.dw_sales=create dw_sales
this.dw_lineitem=create dw_lineitem
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.dw_cust
this.Control[iCurrent+3]=this.dw_sales
this.Control[iCurrent+4]=this.dw_lineitem
this.Control[iCurrent+5]=this.p_1
end on

on w_linkageretrieve.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.dw_cust)
destroy(this.dw_sales)
destroy(this.dw_lineitem)
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

type cb_close from u_cb within w_linkageretrieve
int X=1298
int Y=1308
int Width=311
int Height=80
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

type dw_cust from u_dw within w_linkageretrieve
int X=32
int Y=28
int Width=1573
int Height=364
int TabOrder=10
string Tag="custtag"
string DataObject="d_customerdetail"
boolean LiveScroll=false
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

// This is view only.
of_SetUpdateable(false)

// Start the Linkage Service.
of_SetLinkage(true)
// Specify how column links will be used...
// in the case, as retrieval arguments 
inv_linkage.of_SetStyle(inv_linkage.RETRIEVE)

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

type dw_sales from u_dw within w_linkageretrieve
int X=32
int Y=408
int Width=1573
int Height=424
int TabOrder=20
string Tag="salestag"
string DataObject="d_salesforcustomers"
boolean LiveScroll=false
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

// This is view only.
of_SetUpdateable(false)

// Start the Linkage Service.
of_SetLinkage(true)
// Link this detail datawindow to it's master.
inv_linkage.of_SetMaster(dw_cust) 
//  Specify the columns that link the two DataWindows.
//	 The values in these columns will be used as retrieval arguments. 
inv_linkage.of_Register("cust_id", "cust_id") 
//  Specify how column links will be used...
//  in the case, as retrieval arguments 
inv_linkage.of_SetStyle(inv_linkage.RETRIEVE) 

SetRowFocusIndicator(p_1)




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

type dw_lineitem from u_dw within w_linkageretrieve
int X=32
int Y=852
int Width=1573
int Height=420
int TabOrder=30
string Tag="linetag"
string DataObject="d_lineitems"
boolean LiveScroll=false
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

// This is view only.
of_SetUpdateable(false)

// Start the Linkage Service.
of_SetLinkage(true)
// Link this detail datawindow to it's master.
inv_linkage.of_SetMaster(dw_sales) 
// Specify the columns that link the two DataWindows.
//	The values in these columns will be used as retrieval arguments. 
inv_linkage.of_Register("sales_id","sales_id") 
// Specify how column links will be used...
// in the case, as retrieval arguments 
inv_linkage.of_SetStyle(inv_linkage.RETRIEVE) 

SetRowFocusIndicator(p_1)
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

type p_1 from u_p within w_linkageretrieve
int X=2121
int Y=360
int Width=73
int Height=64
string PictureName="rowind.bmp"
boolean OriginalSize=true
end type

