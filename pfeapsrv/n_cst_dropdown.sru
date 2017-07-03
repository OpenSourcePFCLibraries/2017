HA$PBExportHeader$n_cst_dropdown.sru
$PBExportComments$Extension DropDown Service
forward
global type n_cst_dropdown from pfc_n_cst_dropdown
end type
end forward

global type n_cst_dropdown from pfc_n_cst_dropdown
end type
global n_cst_dropdown n_cst_dropdown

on n_cst_dropdown.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dropdown.destroy
TriggerEvent( this, "destructor" )
end on

