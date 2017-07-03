HA$PBExportHeader$pfc_n_cst_restorerowattrib.sru
$PBExportComments$PFC Attributes for DataWindow Undelete Window
forward
global type pfc_n_cst_restorerowattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_restorerowattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
datawindow 	idw_active
string		is_filter
string		is_sort
end variables

on pfc_n_cst_restorerowattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_restorerowattrib.destroy
TriggerEvent( this, "destructor" )
end on

