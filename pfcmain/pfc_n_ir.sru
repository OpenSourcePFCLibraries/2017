HA$PBExportHeader$pfc_n_ir.sru
$PBExportComments$PFC InternetResult class
forward
global type pfc_n_ir from internetresult
end type
end forward

global type pfc_n_ir from internetresult
end type
global pfc_n_ir pfc_n_ir

on pfc_n_ir.create
call internetresult::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_ir.destroy
call internetresult::destroy
TriggerEvent( this, "destructor" )
end on

