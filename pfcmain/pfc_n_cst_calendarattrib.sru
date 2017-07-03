HA$PBExportHeader$pfc_n_cst_calendarattrib.sru
$PBExportComments$PFC Calendar constructor attributes
forward
global type pfc_n_cst_calendarattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_calendarattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:

boolean 	ib_dropdown = False
end variables

on pfc_n_cst_calendarattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_calendarattrib.destroy
TriggerEvent( this, "destructor" )
end on

