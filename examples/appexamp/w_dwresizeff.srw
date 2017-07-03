HA$PBExportHeader$w_dwresizeff.srw
$PBExportComments$NEW!  Demonstrates the new PFC DataWindow Resize Service using a freeform DataWindow.
forward
global type w_dwresizeff from w_main
end type
type dw_1 from u_dw within w_dwresizeff
end type
type cb_2 from u_cb within w_dwresizeff
end type
end forward

global type w_dwresizeff from w_main
int X=5
int Y=4
int Width=2414
int Height=1372
boolean TitleBar=true
string Title="PFC Example - Resize Freeform DataWindow"
dw_1 dw_1
cb_2 cb_2
end type
global w_dwresizeff w_dwresizeff

on w_dwresizeff.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_2
end on

on w_dwresizeff.destroy
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

//Initialize the Window Resize Functionality
of_SetResize(true)
inv_resize.of_SetMinSize(1884, 873)
inv_resize.of_Register(cb_2, inv_resize.FIXEDRIGHTBOTTOM)
inv_resize.of_Register(dw_1, inv_resize.SCALERIGHTBOTTOM)



end event

type dw_1 from u_dw within w_dwresizeff
int X=27
int Y=32
int Width=2313
int Height=1068
int TabOrder=10
string DataObject="d_exteditemp"
boolean VScrollBar=false
end type

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Initializes the DataWindow.  Starts the DataWindow Resize Service and
// registers the objects.
//
//////////////////////////////////////////////////////////////////////////////

of_SetTransObject(sqlca)

of_SetResize(true)
// Args - PercentageX, PercentageY, PercentageWidth, PercentageHeight
inv_resize.of_Register('emp_id', 0, 0, 25, 0)
inv_resize.of_Register('emp_fname', 0, 0, 35, 0)
inv_resize.of_Register('emp_lname', 0, 0, 35, 0)
inv_resize.of_Register('dept_id', 0, 0, 25, 0)
inv_resize.of_Register('street', 35, 0, 65, 0)
inv_resize.of_Register('city', 35, 0, 65, 0)
inv_resize.of_Register('state', 35, 0, 25, 0)
inv_resize.of_Register('zip_code', 35, 0, 25, 0)
inv_resize.of_Register('job_desc', inv_resize.SCALERIGHTBOTTOM)
inv_resize.of_Register('street_t', 35, 0, 0, 0)
inv_resize.of_Register('city_t', 35, 0, 0, 0)
inv_resize.of_Register('state_t', 35, 0, 0, 0)
inv_resize.of_Register('zip_code_t', 35, 0, 0, 0)
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

type cb_2 from u_cb within w_dwresizeff
int X=1993
int Y=1132
int TabOrder=20
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

