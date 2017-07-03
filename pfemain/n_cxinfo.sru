HA$PBExportHeader$n_cxinfo.sru
$PBExportComments$Extension ContextInformation class
forward
global type n_cxinfo from pfc_n_cxinfo
end type
end forward

global type n_cxinfo from pfc_n_cxinfo
end type
global n_cxinfo n_cxinfo

on n_cxinfo.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cxinfo.destroy
call super::destroy
TriggerEvent( this, "destructor" )
end on

