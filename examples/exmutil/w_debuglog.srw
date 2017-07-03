HA$PBExportHeader$w_debuglog.srw
$PBExportComments$Extended for PFC Examples Application.
forward
global type w_debuglog from pfc_w_debuglog
end type
end forward

global type w_debuglog from pfc_w_debuglog
int X=5
int Y=1168
int Height=716
end type
global w_debuglog w_debuglog

on w_debuglog.create
call super::create
end on

on w_debuglog.destroy
call super::destroy
end on

event close;call super::close;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	close
//
//	Description:
//	Notifies the application's main window that the Debug Log window
// is closing.
//
//////////////////////////////////////////////////////////////////////////////

if IsValid(w_examplemain) then
	w_examplemain.event ue_notify('debuglogwin','close')
end if
end event

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	open
//
//	Description:
//	Notifies the application's main window that the Debug Log window
// is opening.
//
//////////////////////////////////////////////////////////////////////////////

if IsValid(w_examplemain) then
	w_examplemain.event ue_notify('debuglogwin', 'open')
end if
end event

