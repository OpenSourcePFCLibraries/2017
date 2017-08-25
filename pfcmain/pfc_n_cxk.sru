HA$PBExportHeader$pfc_n_cxk.sru
$PBExportComments$PFC ContextKeyword class
forward
global type pfc_n_cxk from contextkeyword
end type
end forward

global type pfc_n_cxk from contextkeyword
end type
global pfc_n_cxk pfc_n_cxk

type variables
Protected:
boolean		ib_IsObsolete
end variables

on pfc_n_cxk.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cxk.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

