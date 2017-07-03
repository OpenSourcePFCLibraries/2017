HA$PBExportHeader$n_cst_resizeattrib.sru
$PBExportComments$Extension Resize attributes
forward
global type n_cst_resizeattrib from pfc_n_cst_resizeattrib
end type
end forward

global type n_cst_resizeattrib from pfc_n_cst_resizeattrib autoinstantiate
end type

on n_cst_resizeattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_resizeattrib.destroy
TriggerEvent( this, "destructor" )
end on

