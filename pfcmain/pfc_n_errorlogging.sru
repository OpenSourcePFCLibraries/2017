HA$PBExportHeader$pfc_n_errorlogging.sru
forward
global type pfc_n_errorlogging from errorlogging
end type
end forward

global type pfc_n_errorlogging from errorlogging
end type
global pfc_n_errorlogging pfc_n_errorlogging

type variables
Protected:
boolean		ib_IsObsolete
end variables

on pfc_n_errorlogging.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_errorlogging.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

