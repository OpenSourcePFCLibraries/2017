HA$PBExportHeader$n_cst_debug.sru
$PBExportComments$Extension Debug service
forward
global type n_cst_debug from pfc_n_cst_debug
end type
end forward

global type n_cst_debug from pfc_n_cst_debug
end type
global n_cst_debug n_cst_debug

on n_cst_debug.create
TriggerEvent( this, "constructor" )
end on

on n_cst_debug.destroy
TriggerEvent( this, "destructor" )
end on

