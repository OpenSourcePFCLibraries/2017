HA$PBExportHeader$pfc_n_cxk.sru
$PBExportComments$PFC ContextKeyword class
forward
global type pfc_n_cxk from contextkeyword
end type
end forward

global type pfc_n_cxk from contextkeyword
end type
global pfc_n_cxk pfc_n_cxk

on pfc_n_cxk.create
call contextkeyword::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cxk.destroy
call contextkeyword::destroy
TriggerEvent( this, "destructor" )
end on

