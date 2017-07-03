HA$PBExportHeader$n_cst_mruattrib.sru
$PBExportComments$Extension Most Recently Used service attributes
forward
global type n_cst_mruattrib from pfc_n_cst_mruattrib
end type
end forward

global type n_cst_mruattrib from pfc_n_cst_mruattrib
end type

on n_cst_mruattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_mruattrib.destroy
TriggerEvent( this, "destructor" )
end on

