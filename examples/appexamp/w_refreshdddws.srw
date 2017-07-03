HA$PBExportHeader$w_refreshdddws.srw
$PBExportComments$NEW!  Demonstrates how to  refresh  PFC drop-down DataWindows.
forward
global type w_refreshdddws from w_main
end type
type dw_1 from u_dw within w_refreshdddws
end type
type gb_2 from u_gb within w_refreshdddws
end type
type gb_1 from u_gb within w_refreshdddws
end type
type dw_2 from u_dw within w_refreshdddws
end type
type cb_1 from u_cb within w_refreshdddws
end type
type cb_2 from u_cb within w_refreshdddws
end type
type cb_3 from u_cb within w_refreshdddws
end type
type cb_5 from u_cb within w_refreshdddws
end type
type cb_6 from u_cb_sqlspy within w_refreshdddws
end type
end forward

global type w_refreshdddws from w_main
int X=146
int Y=80
int Width=2665
int Height=1740
boolean TitleBar=true
string Title="PFC Example - Refresh Drop-down DataWindows"
boolean Resizable=false
dw_1 dw_1
gb_2 gb_2
gb_1 gb_1
dw_2 dw_2
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_5 cb_5
cb_6 cb_6
end type
global w_refreshdddws w_refreshdddws

type variables
Protected:
boolean      ib_updated = false

end variables

on w_refreshdddws.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.dw_2=create dw_2
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_5=create cb_5
this.cb_6=create cb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.gb_2
this.Control[iCurrent+3]=this.gb_1
this.Control[iCurrent+4]=this.dw_2
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_3
this.Control[iCurrent+8]=this.cb_5
this.Control[iCurrent+9]=this.cb_6
end on

on w_refreshdddws.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.dw_2)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_5)
destroy(this.cb_6)
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
//
//////////////////////////////////////////////////////////////////////////////

ib_disableclosequery = true

dw_1.of_Retrieve()
dw_2.of_Retrieve()
end event

type dw_1 from u_dw within w_refreshdddws
int X=73
int Y=108
int Width=2002
int Height=456
int TabOrder=30
string DataObject="d_states"
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

type gb_2 from u_gb within w_refreshdddws
int X=37
int Y=652
int Width=2583
int Height=832
int TabOrder=0
string Text="View your changes in the city and state Drop-down DataWindows below"
end type

type gb_1 from u_gb within w_refreshdddws
int X=37
int Y=32
int Width=2583
int Height=568
int TabOrder=0
string Text="Edit a State Record"
end type

type dw_2 from u_dw within w_refreshdddws
int X=73
int Y=732
int Width=2002
int Height=712
int TabOrder=60
boolean BringToTop=true
string DataObject="d_custdddws"
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

// Start the base service.
of_SetBase(True)

of_SetUpdateable(false)

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

type cb_1 from u_cb within w_refreshdddws
int X=2149
int Y=116
int Width=439
int TabOrder=40
boolean BringToTop=true
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

type cb_2 from u_cb within w_refreshdddws
int X=2149
int Y=732
int Width=439
int TabOrder=50
boolean BringToTop=true
string Text="Refresh &DDDWs"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Refreshes the Drop-down DataWindows in the second DataWindow.
//
//////////////////////////////////////////////////////////////////////////////

dw_2.inv_base.of_RefreshDDDWs()

end event

type cb_3 from u_cb within w_refreshdddws
event clicked pbm_bnclicked
int X=2176
int Y=1516
int Width=439
int TabOrder=70
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

type cb_5 from u_cb within w_refreshdddws
int X=2149
int Y=224
int Width=439
int TabOrder=20
boolean BringToTop=true
string Text="&Retrieve"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Retrieve all DataWindows.
//
//////////////////////////////////////////////////////////////////////////////

dw_1.of_Retrieve() 

end event

type cb_6 from u_cb_sqlspy within w_refreshdddws
int X=2149
int Y=444
int Width=439
int TabOrder=10
end type

