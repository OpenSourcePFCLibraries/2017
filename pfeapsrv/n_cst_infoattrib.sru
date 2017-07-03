HA$PBExportHeader$n_cst_infoattrib.sru
$PBExportComments$Extension Informational attributes
forward
global type n_cst_infoattrib from pfc_n_cst_infoattrib
end type
end forward

global type n_cst_infoattrib from pfc_n_cst_infoattrib
end type

on n_cst_infoattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_infoattrib.destroy
TriggerEvent( this, "destructor" )
end on

