HA$PBExportHeader$n_cst_string.sru
$PBExportComments$Extension String service
forward
global type n_cst_string from pfc_n_cst_string
end type
end forward

global type n_cst_string from pfc_n_cst_string
end type

on n_cst_string.create
TriggerEvent( this, "constructor" )
end on

on n_cst_string.destroy
TriggerEvent( this, "destructor" )
end on

