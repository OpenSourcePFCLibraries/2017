HA$PBExportHeader$pfc_n_ir.sru
$PBExportComments$PFC InternetResult class
forward
global type pfc_n_ir from internetresult
end type
end forward

global type pfc_n_ir from internetresult
end type
global pfc_n_ir pfc_n_ir

type variables
Protected:
boolean		ib_IsObsolete
end variables

on pfc_n_ir.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_ir.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

