HA$PBExportHeader$w_rowmanager.srw
$PBExportComments$Row Manager Service Example
forward
global type w_rowmanager from w_main
end type
type dw_1 from u_dw within w_rowmanager
end type
type cb_addtoend from u_cb within w_rowmanager
end type
type cb_insertbeforecurr from u_cb within w_rowmanager
end type
type cb_deletecurr from u_cb within w_rowmanager
end type
type cb_deleteall from u_cb within w_rowmanager
end type
type cb_close from u_cb within w_rowmanager
end type
type cb_retrieve from u_cb within w_rowmanager
end type
type cbx_confirmdeletes from u_cbx within w_rowmanager
end type
type gb_1 from u_gb within w_rowmanager
end type
end forward

global type w_rowmanager from w_main
int X=283
int Y=108
int Width=2373
int Height=1336
boolean TitleBar=true
string Title="PFC Example - Row Manager Service"
long BackColor=77571519
boolean Resizable=false
dw_1 dw_1
cb_addtoend cb_addtoend
cb_insertbeforecurr cb_insertbeforecurr
cb_deletecurr cb_deletecurr
cb_deleteall cb_deleteall
cb_close cb_close
cb_retrieve cb_retrieve
cbx_confirmdeletes cbx_confirmdeletes
gb_1 gb_1
end type
global w_rowmanager w_rowmanager

type variables
Protected:
integer      ii_maxid
end variables

forward prototypes
public function integer of_getmaxempid ()
end prototypes

public function integer of_getmaxempid ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_GetMaxEmpID
//
//	Access:
//	public
//
//	Arguments:
//	None
//
//	Returns:
//	Integer
//  1 SUCCESS
// -1 ERROR
//
//	Description:
// Retrieves the Maximum employee ID from the employee table
// to initialize an instance variable.  If an error occurs we
// will disable the inserting of new rows.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License
 * 
 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

string	ls_sql

// If the SQLSpy Window is open, pass it the proposed embedded sql statement.
if IsValid(gnv_app.inv_debug) then
	if IsValid(gnv_app.inv_debug.inv_sqlspy) then
		ls_sql = "SELECT 'employee'.'emp_id'~r~nINTO :ii_maxid~r~n"+& 
			"FROM 'employee'   ;"
		gnv_app.inv_debug.inv_sqlspy.of_SQLSyntax("Get Employee ID", ls_sql)
	end if
end if

  SELECT Max("employee"."emp_id"  )
  INTO :ii_maxid  
  FROM "employee";
  
if sqlca.sqlcode <> 0 then
	MessageBox('SQL Error', sqlca.sqlerrtext)
	cb_addtoend.enabled = false
	cb_insertbeforecurr.enabled = false
	return -1
end if

return 1
	 

end function

on w_rowmanager.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_addtoend=create cb_addtoend
this.cb_insertbeforecurr=create cb_insertbeforecurr
this.cb_deletecurr=create cb_deletecurr
this.cb_deleteall=create cb_deleteall
this.cb_close=create cb_close
this.cb_retrieve=create cb_retrieve
this.cbx_confirmdeletes=create cbx_confirmdeletes
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_addtoend
this.Control[iCurrent+3]=this.cb_insertbeforecurr
this.Control[iCurrent+4]=this.cb_deletecurr
this.Control[iCurrent+5]=this.cb_deleteall
this.Control[iCurrent+6]=this.cb_close
this.Control[iCurrent+7]=this.cb_retrieve
this.Control[iCurrent+8]=this.cbx_confirmdeletes
this.Control[iCurrent+9]=this.gb_1
end on

on w_rowmanager.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_addtoend)
destroy(this.cb_insertbeforecurr)
destroy(this.cb_deletecurr)
destroy(this.cb_deleteall)
destroy(this.cb_close)
destroy(this.cb_retrieve)
destroy(this.cbx_confirmdeletes)
destroy(this.gb_1)
end on

type dw_1 from u_dw within w_rowmanager
int X=55
int Y=76
int Width=1627
int Height=968
int TabOrder=10
string DataObject="d_empall"
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

of_SetTransObject(sqlca) 

// Start the Row Manager Service.
of_SetRowManager(true)

// Start the Row Selection Service.
of_SetRowSelect(true)

// Set the Row Selection Service to allow multiple
// record selection.
inv_rowselect.of_SetStyle(inv_rowselect.MULTIPLE)

// Set the Row Manager to display Confirmation
// MessageBoxes for all deletes.
inv_rowmanager.of_SetConfirmOnDelete(true)

// Retrieve the maximum employee ID so that we can
// create key values for newly created rows.
of_GetMaxEmpID()

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
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License
 * 
 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

return this.Retrieve()

end event

type cb_addtoend from u_cb within w_rowmanager
int X=1760
int Y=192
int Width=517
int TabOrder=40
string Text="Add to &End"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Adds a row after the last row in the DataWindow. 
//
//////////////////////////////////////////////////////////////////////////////

integer li_row
string ls_action 

// Add a row after the last row in the DataWindow.
li_row = dw_1.inv_rowmanager.of_InsertRow(0)

// Create a key value for the newly added row.
ii_maxid++
dw_1.SetItem(li_row, 'emp_id', ii_maxid)
end event

type cb_insertbeforecurr from u_cb within w_rowmanager
int X=1760
int Y=308
int Width=517
int TabOrder=50
string Text="&Insert Before Current"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Inserts a row before the row that has focus in the DataWindow. 
//
//////////////////////////////////////////////////////////////////////////////

integer li_row
string ls_action 

// Inserts a row before the row that has focus.
li_row = dw_1.inv_rowmanager.of_InsertRow(dw_1.GetRow()) 

// Create a key value for the newly added row.
ii_maxid++
dw_1.SetItem(li_row, 'emp_id', ii_maxid)

end event

type cb_deletecurr from u_cb within w_rowmanager
int X=1760
int Y=424
int Width=517
int TabOrder=60
string Text="&Delete Current"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Deletes the current row in the DataWindow. 
//
//////////////////////////////////////////////////////////////////////////////

dw_1.inv_rowmanager.of_DeleteRow(0) 

end event

type cb_deleteall from u_cb within w_rowmanager
int X=1760
int Y=540
int Width=517
int TabOrder=70
string Text="Delete all &Selected"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Deletes all rows that are selected in the DataWindow. 
//
//////////////////////////////////////////////////////////////////////////////

dw_1.inv_rowmanager.of_DeleteSelected() 

end event

type cb_close from u_cb within w_rowmanager
int X=1787
int Y=1108
int Width=517
int TabOrder=80
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

type cb_retrieve from u_cb within w_rowmanager
int X=1760
int Y=76
int Width=517
int TabOrder=30
boolean BringToTop=true
string Text="&Retrieve"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Calls the pfc_retrieve event to retrieve the DataWindow. 
//
//////////////////////////////////////////////////////////////////////////////

dw_1.event pfc_retrieve()
end event

type cbx_confirmdeletes from u_cbx within w_rowmanager
int X=1792
int Y=812
int Width=453
int TabOrder=20
string Text="Con&firm Deletes"
boolean Checked=true
long TextColor=41943040
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
// Enables and disables the displaying of confirmation message boxes
// when rows are deleted. 
//
//////////////////////////////////////////////////////////////////////////////

dw_1.inv_rowmanager.of_SetConfirmOnDelete(this.checked) 
end event

type gb_1 from u_gb within w_rowmanager
int X=23
int Y=20
int Width=2286
int Height=1056
int TabOrder=2
string Text=""
end type

