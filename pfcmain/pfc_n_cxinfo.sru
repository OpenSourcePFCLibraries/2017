HA$PBExportHeader$pfc_n_cxinfo.sru
$PBExportComments$PFC ContextInformation class
forward
global type pfc_n_cxinfo from contextinformation
end type
end forward

global type pfc_n_cxinfo from contextinformation
end type
global pfc_n_cxinfo pfc_n_cxinfo

on pfc_n_cxinfo.create
call contextinformation::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cxinfo.destroy
call contextinformation::destroy
TriggerEvent( this, "destructor" )
end on

