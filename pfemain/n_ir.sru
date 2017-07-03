HA$PBExportHeader$n_ir.sru
$PBExportComments$Extension InternetResult class
forward
global type n_ir from pfc_n_ir
end type
end forward

global type n_ir from pfc_n_ir
end type
global n_ir n_ir

on n_ir.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_ir.destroy
call super::destroy
TriggerEvent( this, "destructor" )
end on

