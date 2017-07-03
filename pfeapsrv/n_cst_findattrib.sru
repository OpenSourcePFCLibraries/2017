HA$PBExportHeader$n_cst_findattrib.sru
$PBExportComments$Extension Find/Replace attributes
forward
global type n_cst_findattrib from pfc_n_cst_findattrib
end type
end forward

global type n_cst_findattrib from pfc_n_cst_findattrib
end type

on n_cst_findattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_findattrib.destroy
TriggerEvent( this, "destructor" )
end on

