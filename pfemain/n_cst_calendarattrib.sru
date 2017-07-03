HA$PBExportHeader$n_cst_calendarattrib.sru
$PBExportComments$Extension Calendar constructor attributes
forward
global type n_cst_calendarattrib from pfc_n_cst_calendarattrib
end type
end forward

global type n_cst_calendarattrib from pfc_n_cst_calendarattrib
end type

on n_cst_calendarattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_calendarattrib.destroy
TriggerEvent( this, "destructor" )
end on

