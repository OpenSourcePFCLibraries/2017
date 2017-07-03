HA$PBExportHeader$w_linkautoupdate.srw
$PBExportComments$NEW!  Linkage with Retrieval Arguments now can be set to perform auto-updates.  Confirmation dialog boxes can be set up to prompt users to save changes and confirm deletes.
forward
global type w_linkautoupdate from w_main
end type
type cb_close from u_cb within w_linkautoupdate
end type
type dw_cust from u_dw within w_linkautoupdate
end type
type dw_sales from u_dw within w_linkautoupdate
end type
type dw_lineitem from u_dw within w_linkautoupdate
end type
type p_1 from u_p within w_linkautoupdate
end type
type gb_2 from groupbox within w_linkautoupdate
end type
type cbx_confirmationonrowchange from u_cbx within w_linkautoupdate
end type
type cb_1 from u_cb_sqlspy within w_linkautoupdate
end type
end forward

global type w_linkautoupdate from w_main
int X=457
int Y=148
int Width=1659
int Height=1712
boolean TitleBar=true
string Title="PFC Example - Retrieval with Auto-updates"
boolean Resizable=false
boolean ToolBarVisible=false
cb_close cb_close
dw_cust dw_cust
dw_sales dw_sales
dw_lineitem dw_lineitem
p_1 p_1
gb_2 gb_2
cbx_confirmationonrowchange cbx_confirmationonrowchange
cb_1 cb_1
end type
global w_linkautoupdate w_linkautoupdate

on w_linkautoupdate.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.dw_cust=create dw_cust
this.dw_sales=create dw_sales
this.dw_lineitem=create dw_lineitem
this.p_1=create p_1
this.gb_2=create gb_2
this.cbx_confirmationonrowchange=create cbx_confirmationonrowchange
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.dw_cust
this.Control[iCurrent+3]=this.dw_sales
this.Control[iCurrent+4]=this.dw_lineitem
this.Control[iCurrent+5]=this.p_1
this.Control[iCurrent+6]=this.gb_2
this.Control[iCurrent+7]=this.cbx_confirmationonrowchange
this.Control[iCurrent+8]=this.cb_1
end on

on w_linkautoupdate.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.dw_cust)
destroy(this.dw_sales)
destroy(this.dw_lineitem)
destroy(this.p_1)
destroy(this.gb_2)
destroy(this.cbx_confirmationonrowchange)
destroy(this.cb_1)
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

type cb_close from u_cb within w_linkautoupdate
int X=1303
int Y=1516
int Width=311
int Height=80
int TabOrder=60
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

type dw_cust from u_dw within w_linkautoupdate
int X=37
int Y=236
int Width=1573
int Height=364
int TabOrder=10
string Tag="custtag"
string DataObject="d_customerdetailupdatable"
boolean LiveScroll=false
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
inv_linkage.of_SetStyle(inv_linkage.RETRIEVE)
// Set up visual confirmation of saves and deletes.
// This will be the initial setting for the example.
inv_linkage.of_SetUpdateOnRowChange (True)
inv_linkage.of_SetConfirmOnRowChange (True)

of_SetReqColumn(True)

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

am_dw.m_table.m_insert.enabled = True
am_dw.m_table.m_addrow.enabled = True
am_dw.m_table.m_delete.enabled = false

end event

type dw_sales from u_dw within w_linkautoupdate
int X=37
int Y=616
int Width=1573
int Height=424
int TabOrder=30
string Tag="salestag"
string DataObject="d_salesforcustomersupdatable"
boolean LiveScroll=false
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
inv_linkage.of_SetStyle(inv_linkage.RETRIEVE) 
// Set up visual confirmation of saves and deletes.
// This will be the initial setting for the example.
inv_linkage.of_SetUpdateOnRowChange (True)
inv_linkage.of_SetConfirmOnRowChange (True)

of_SetReqColumn(True)

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

am_dw.m_table.m_insert.enabled = True
am_dw.m_table.m_addrow.enabled = True
am_dw.m_table.m_delete.enabled = false

end event

type dw_lineitem from u_dw within w_linkautoupdate
int X=37
int Y=1060
int Width=1573
int Height=420
int TabOrder=40
string Tag="linetag"
string DataObject="d_lineitemsupdatable"
boolean LiveScroll=false
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
inv_linkage.of_Register("sales_id","sales_id") 
inv_linkage.of_SetStyle(inv_linkage.RETRIEVE) 
// Set up visual confirmation of saves and deletes.
// This will be the initial setting for the example.
inv_linkage.of_SetUpdateOnRowChange (True)
inv_linkage.of_SetConfirmOnRowChange (True)

of_SetReqColumn(True)

SetRowFocusIndicator(p_1)
end event

type p_1 from u_p within w_linkautoupdate
int X=2121
int Y=360
int Width=73
int Height=64
string PictureName="rowind.bmp"
boolean OriginalSize=true
end type

type gb_2 from groupbox within w_linkautoupdate
int X=41
int Y=32
int Width=1559
int Height=188
int TabOrder=20
string Text="Example Options"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_confirmationonrowchange from u_cbx within w_linkautoupdate
int X=128
int Y=100
int Width=754
int Height=80
boolean BringToTop=true
string Text="Confirmation on &Row change"
boolean Checked=true
long BackColor=77571519
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Change the Confirmation behavior.
//
//////////////////////////////////////////////////////////////////////////////


dw_cust.inv_linkage.of_SetConfirmOnRowChange (this.Checked)
dw_sales.inv_linkage.of_SetConfirmOnRowChange (this.Checked)
dw_lineitem.inv_linkage.of_SetConfirmOnRowChange (this.Checked)

end event

type cb_1 from u_cb_sqlspy within w_linkautoupdate
int X=969
int Y=1516
int Width=311
int Height=80
int TabOrder=50
boolean BringToTop=true
string Text="SQL Spy"
end type

