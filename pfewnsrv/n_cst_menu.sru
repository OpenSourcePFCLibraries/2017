HA$PBExportHeader$n_cst_menu.sru
$PBExportComments$Extension Menu service
forward
global type n_cst_menu from pfc_n_cst_menu
end type
end forward

global type n_cst_menu from pfc_n_cst_menu
end type

on n_cst_menu.create
TriggerEvent( this, "constructor" )
end on

on n_cst_menu.destroy
TriggerEvent( this, "destructor" )
end on

