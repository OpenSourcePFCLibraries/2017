HA$PBExportHeader$n_cst_toolbarattrib.sru
$PBExportComments$Extension Toolbar attributes used by the Toolbar window.
forward
global type n_cst_toolbarattrib from pfc_n_cst_toolbarattrib
end type
end forward

global type n_cst_toolbarattrib from pfc_n_cst_toolbarattrib
end type

on n_cst_toolbarattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_toolbarattrib.destroy
TriggerEvent( this, "destructor" )
end on

