HA$PBExportHeader$n_cst_tmgregisterattrib.sru
$PBExportComments$Extension timing register attributes
forward
global type n_cst_tmgregisterattrib from pfc_n_cst_tmgregisterattrib
end type
end forward

global type n_cst_tmgregisterattrib from pfc_n_cst_tmgregisterattrib
end type

on n_cst_tmgregisterattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_tmgregisterattrib.destroy
TriggerEvent( this, "destructor" )
end on

