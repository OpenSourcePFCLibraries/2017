HA$PBExportHeader$n_cst_explorer.sru
$PBExportComments$Extension - The service for windows that need an "Explorer" style interface, with a Horizontal Split Bar between TreeView and ListView.
forward
global type n_cst_explorer from pfc_n_cst_explorer
end type
end forward

global type n_cst_explorer from pfc_n_cst_explorer
end type
global n_cst_explorer n_cst_explorer

on n_cst_explorer.create
TriggerEvent( this, "constructor" )
end on

on n_cst_explorer.destroy
TriggerEvent( this, "destructor" )
end on

