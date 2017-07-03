HA$PBExportHeader$u_calendar.sru
forward
global type u_calendar from pfc_u_calendar
end type
end forward

global type u_calendar from pfc_u_calendar
end type
global u_calendar u_calendar

on u_calendar.create
call super::create
end on

on u_calendar.destroy
call super::destroy
end on

type dw_cal from pfc_u_calendar`dw_cal within u_calendar
end type

event dw_cal::clicked;call super::clicked;idrg_requestor.Dynamic Event ue_changed ( )
end event

event dw_cal::buttonclicked;call super::buttonclicked;idrg_requestor.Dynamic Event ue_changed ( )
end event

