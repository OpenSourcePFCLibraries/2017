HA$PBExportHeader$w_dwresizegrid.srw
$PBExportComments$NEW!  Demonstrates the new PFC DataWindow Resize Service using a grid style DataWindow.
forward
global type w_dwresizegrid from w_main
end type
type dw_1 from u_dw within w_dwresizegrid
end type
type cb_2 from u_cb within w_dwresizegrid
end type
end forward

global type w_dwresizegrid from w_main
int X=233
int Y=652
int Width=2423
int Height=844
boolean TitleBar=true
string Title="PFC Example - Resize Grid DataWindow"
dw_1 dw_1
cb_2 cb_2
end type
global w_dwresizegrid w_dwresizegrid

on w_dwresizegrid.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_2
end on

on w_dwresizegrid.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_2)
end on

event pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_preopen
//
//	Arguments:
//	None
//
//	Returns:
// None
//
//	Description:
// Initialize the Window Resize Service.
//
//////////////////////////////////////////////////////////////////////////////

this.of_SetResize(true)
this.inv_resize.of_Register(cb_2, inv_resize.FIXEDRIGHTBOTTOM)
this.inv_resize.of_Register(dw_1, inv_resize.SCALERIGHTBOTTOM)


end event

type dw_1 from u_dw within w_dwresizegrid
int X=27
int Y=32
int Width=2309
int Height=532
int TabOrder=20
string DataObject="d_ddobjsamp"
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

of_SetResize(true)
// Args - PercentageX, PercentageY, PercentageWidth, PercentageHeight
inv_resize.of_Register('sales_order_order_date', 0, 0, 20, 0)
inv_resize.of_Register('customer_lname', 0, 0, 20, 0)
inv_resize.of_Register('customer_phone', 0, 0, 20, 0)
inv_resize.of_Register('sales_order_items_quantity', 0, 0, 20, 0)
inv_resize.of_Register('sales_order_items_prod_id', 0, 0, 20, 0)

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

type cb_2 from u_cb within w_dwresizegrid
int X=1989
int Y=600
int TabOrder=10
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

