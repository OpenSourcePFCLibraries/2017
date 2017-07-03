HA$PBExportHeader$n_cxk.sru
$PBExportComments$Extension ContextKeyword class
forward
global type n_cxk from pfc_n_cxk
end type
end forward

global type n_cxk from pfc_n_cxk
end type
global n_cxk n_cxk

on n_cxk.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cxk.destroy
call super::destroy
TriggerEvent( this, "destructor" )
end on

