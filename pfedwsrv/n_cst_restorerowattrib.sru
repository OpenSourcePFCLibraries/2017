HA$PBExportHeader$n_cst_restorerowattrib.sru
$PBExportComments$Extension Attributes for DataWindow Undelete Window
forward
global type n_cst_restorerowattrib from pfc_n_cst_restorerowattrib
end type
end forward

global type n_cst_restorerowattrib from pfc_n_cst_restorerowattrib
end type

on n_cst_restorerowattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_restorerowattrib.destroy
TriggerEvent( this, "destructor" )
end on

