HA$PBExportHeader$u_cb_sqlspy.sru
forward
global type u_cb_sqlspy from u_cb
end type
end forward

global type u_cb_sqlspy from u_cb
int Width=320
int Height=72
string Text="&SQL Spy"
end type
global u_cb_sqlspy u_cb_sqlspy

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
// clicked
//
//	Arguments:
//	None
//
//	Returns:
//	integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	This script turns the SQL Spy Utility on.
// Note that the SQL Spy window cannot be opened unless the Debug
// service has been started.
////////////////////////////////////////////////////////////////////////////////

integer li_return

// If debug is not on, turn it on.
if IsNull(gnv_app.inv_debug) or not IsValid(gnv_app.inv_debug) then
	li_return = gnv_app.of_SetDebug(true)
end if

if li_return < 0 then return -1

if IsNull(gnv_app.inv_debug.inv_sqlspy) or not &
	IsValid(gnv_app.inv_debug.inv_sqlspy) then
	// Start the SQLSpy Service.
	li_return = gnv_app.inv_debug.of_SetSQLSpy(true)
	if li_return < 0 then return -1
end if

// Open the SQLSpy Window.
li_return = gnv_app.inv_debug.inv_sqlspy.of_OpenSQLSpy(true)

return li_return	
	
end event

