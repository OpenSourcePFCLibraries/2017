HA$PBExportHeader$w_dropdownsearchdw.srw
$PBExportComments$Example using DropDown Search DW Service with DW
forward
global type w_dropdownsearchdw from w_main
end type
type cb_close from u_cb within w_dropdownsearchdw
end type
type dw_customer from u_dw within w_dropdownsearchdw
end type
end forward

global type w_dropdownsearchdw from w_main
int X=146
int Y=452
int Width=2523
int Height=996
boolean TitleBar=true
string Title="PFC Example - Drop-down Search Service"
boolean Resizable=false
cb_close cb_close
dw_customer dw_customer
end type
global w_dropdownsearchdw w_dropdownsearchdw

on w_dropdownsearchdw.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.dw_customer=create dw_customer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.dw_customer
end on

on w_dropdownsearchdw.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.dw_customer)
end on

type cb_close from u_cb within w_dropdownsearchdw
int X=2117
int Y=776
int TabOrder=20
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

type dw_customer from u_dw within w_dropdownsearchdw
int X=23
int Y=20
int Width=2446
int Height=720
int TabOrder=10
string DataObject="d_customer"
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

of_SetDropDownSearch(true)
inv_dropdownsearch.of_Register()

of_Retrieve()
end event

event editchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	editchanged
//
//	Description:
//	Calls the pfc_editchanged event on the Drop-down Search Service.
//
//////////////////////////////////////////////////////////////////////////////

If IsValid(inv_dropdownsearch) Then
	inv_dropdownsearch.event pfc_editchanged(row, dwo, data)
End If	
end event

event itemfocuschanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	itemfocuschanged
//
//	Description:
//	Calls the pfc_itemfocuschanged event on the Drop-down Search Service.
//
//////////////////////////////////////////////////////////////////////////////

if IsValid(inv_dropdownsearch) then
	inv_dropdownsearch.event pfc_itemfocuschanged(row, dwo)
end if
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

