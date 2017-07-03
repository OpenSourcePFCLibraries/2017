HA$PBExportHeader$w_multiupdate.srw
$PBExportComments$ENHANCED FOR 6.0!  Example using Multiple Table Update service.
forward
global type w_multiupdate from w_main
end type
type dw_1 from u_dw within w_multiupdate
end type
type st_2 from u_st within w_multiupdate
end type
type cb_close from u_cb within w_multiupdate
end type
type cb_update from u_cb within w_multiupdate
end type
type cb_retrieve from u_cb within w_multiupdate
end type
type gb_1 from u_gb within w_multiupdate
end type
type st_1 from u_st within w_multiupdate
end type
type st_3 from u_st within w_multiupdate
end type
type st_4 from u_st within w_multiupdate
end type
type st_5 from u_st within w_multiupdate
end type
type st_6 from u_st within w_multiupdate
end type
type st_7 from u_st within w_multiupdate
end type
type st_8 from u_st within w_multiupdate
end type
type gb_2 from u_gb within w_multiupdate
end type
end forward

global type w_multiupdate from w_main
int X=37
int Y=128
int Width=2843
int Height=1660
boolean TitleBar=true
string Title="PFC Example - Multiple Table Update"
boolean Resizable=false
dw_1 dw_1
st_2 st_2
cb_close cb_close
cb_update cb_update
cb_retrieve cb_retrieve
gb_1 gb_1
st_1 st_1
st_3 st_3
st_4 st_4
st_5 st_5
st_6 st_6
st_7 st_7
st_8 st_8
gb_2 gb_2
end type
global w_multiupdate w_multiupdate

on w_multiupdate.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.st_2=create st_2
this.cb_close=create cb_close
this.cb_update=create cb_update
this.cb_retrieve=create cb_retrieve
this.gb_1=create gb_1
this.st_1=create st_1
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.st_7=create st_7
this.st_8=create st_8
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.cb_close
this.Control[iCurrent+4]=this.cb_update
this.Control[iCurrent+5]=this.cb_retrieve
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.st_5
this.Control[iCurrent+11]=this.st_6
this.Control[iCurrent+12]=this.st_7
this.Control[iCurrent+13]=this.st_8
this.Control[iCurrent+14]=this.gb_2
end on

on w_multiupdate.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.st_2)
destroy(this.cb_close)
destroy(this.cb_update)
destroy(this.cb_retrieve)
destroy(this.gb_1)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.gb_2)
end on

type dw_1 from u_dw within w_multiupdate
int X=32
int Y=316
int Width=2761
int Height=1004
int TabOrder=10
string DataObject="d_multiupdate"
end type

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Initializes the DataWindow.  Register all tables that can be updated
// with the Multiple Table Update Service.
//
//////////////////////////////////////////////////////////////////////////////

string	ls_tablename
string	ls_keycols[]

of_SetTransObject(sqlca) 

// Start the Multi-Table Update Service.
of_SetMultiTable(true)

// Register the "customer" table and its key columns.
ls_tablename = "customer"
ls_keycols[1] = "customer_id"
inv_multitable.of_AddToUpdate(ls_tablename, ls_keycols) 

// Register the "sales_order" table and its key columns.
ls_tablename = "sales_order"
ls_keycols[1] = "sales_order_id"
inv_multitable.of_AddToUpdate(ls_tablename, ls_keycols) 

// Register the "sales_order_items" table and its key columns.
ls_tablename = "sales_order_items"
ls_keycols[1] = "sales_order_items_id"
ls_keycols[2] = "sales_order_items_line_id"
inv_multitable.of_AddToUpdate(ls_tablename, ls_keycols) 

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

type st_2 from u_st within w_multiupdate
int X=78
int Y=164
int Width=2674
int Height=68
string Text="This DataWindow joins three tables on ~"Customer ID~".   See the legend below for table reference colors."
Alignment Alignment=Center!
long TextColor=33554432
long BackColor=82889382
end type

type cb_close from u_cb within w_multiupdate
int X=2437
int Y=1432
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

type cb_update from u_cb within w_multiupdate
int X=2057
int Y=1432
int TabOrder=30
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

type cb_retrieve from u_cb within w_multiupdate
int X=1678
int Y=1432
int TabOrder=20
string Text="&Retrieve"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
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

dw_1.of_Retrieve()
end event

type gb_1 from u_gb within w_multiupdate
int X=59
int Y=1344
int Width=1339
int Height=180
int TabOrder=0
string Text="Table Legend"
end type

type st_1 from u_st within w_multiupdate
int X=91
int Y=1408
int Width=91
int Height=76
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text=""
long BackColor=128
end type

type st_3 from u_st within w_multiupdate
int X=187
int Y=1420
int Width=233
int Height=76
boolean BringToTop=true
string Text="Customer"
end type

type st_4 from u_st within w_multiupdate
int X=434
int Y=1408
int Width=91
int Height=76
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text=""
long BackColor=32768
end type

type st_5 from u_st within w_multiupdate
int X=535
int Y=1420
int Width=434
int Height=76
boolean BringToTop=true
string Text="Sales_Order_Items"
end type

type st_6 from u_st within w_multiupdate
int X=992
int Y=1408
int Width=91
int Height=76
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text=""
long BackColor=8388736
end type

type st_7 from u_st within w_multiupdate
int X=1088
int Y=1420
int Width=274
int Height=76
boolean BringToTop=true
string Text="Sales_Order"
end type

type st_8 from u_st within w_multiupdate
int X=78
int Y=100
int Width=2674
boolean BringToTop=true
string Text="The Multiple Table Update Service will enable you to update several tables through one DataWindow."
Alignment Alignment=Center!
long TextColor=33554432
long BackColor=79741120
end type

type gb_2 from u_gb within w_multiupdate
int X=37
int Y=28
int Width=2752
int TabOrder=0
string Text=""
end type

