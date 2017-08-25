HA$PBExportHeader$pfc_n_cxinfo.sru
$PBExportComments$PFC ContextInformation class
forward
global type pfc_n_cxinfo from contextinformation
end type
end forward

global type pfc_n_cxinfo from contextinformation
end type
global pfc_n_cxinfo pfc_n_cxinfo

type variables
Protected:
boolean		ib_IsObsolete
end variables

on pfc_n_cxinfo.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cxinfo.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

