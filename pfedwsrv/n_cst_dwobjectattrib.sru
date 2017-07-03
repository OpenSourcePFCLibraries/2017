HA$PBExportHeader$n_cst_dwobjectattrib.sru
$PBExportComments$Extension Attributes for the Modify / Describe service
forward
global type n_cst_dwobjectattrib from pfc_n_cst_dwobjectattrib
end type
end forward

global type n_cst_dwobjectattrib from pfc_n_cst_dwobjectattrib
end type

on n_cst_dwobjectattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwobjectattrib.destroy
TriggerEvent( this, "destructor" )
end on

