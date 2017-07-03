HA$PBExportHeader$n_cst_stack.sru
$PBExportComments$Extension Stack List service
forward
global type n_cst_stack from pfc_n_cst_stack
end type
end forward

global type n_cst_stack from pfc_n_cst_stack
end type

on n_cst_stack.create
TriggerEvent( this, "constructor" )
end on

on n_cst_stack.destroy
TriggerEvent( this, "destructor" )
end on

