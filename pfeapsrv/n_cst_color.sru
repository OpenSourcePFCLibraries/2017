HA$PBExportHeader$n_cst_color.sru
$PBExportComments$Extension Color service
forward
global type n_cst_color from pfc_n_cst_color
end type
end forward

global type n_cst_color from pfc_n_cst_color
end type

on n_cst_color.create
TriggerEvent( this, "constructor" )
end on

on n_cst_color.destroy
TriggerEvent( this, "destructor" )
end on

