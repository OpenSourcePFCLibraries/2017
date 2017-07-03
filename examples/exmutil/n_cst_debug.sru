HA$PBExportHeader$n_cst_debug.sru
$PBExportComments$Extended for PFC Examples Application.
forward
global type n_cst_debug from pfc_n_cst_debug
end type
end forward

global type n_cst_debug from pfc_n_cst_debug
end type
global n_cst_debug n_cst_debug

on n_cst_debug.create
TriggerEvent( this, "constructor" )
end on

on n_cst_debug.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Notifies the application's main window that the Debug Service
// has been constructed.
//
//////////////////////////////////////////////////////////////////////////////

if IsValid(w_examplemain) then
	w_examplemain.event ue_notify('debugsrv','open')
end if
end event

event destructor;call super::destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	destructor
//
//	Description:
//	Notifies the application's main window that the SQL Spy Service
// has been destructed.
//
//////////////////////////////////////////////////////////////////////////////

if IsValid(w_examplemain) then
	w_examplemain.event ue_notify('debugsrv','close')
end if
end event

