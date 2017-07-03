HA$PBExportHeader$n_cst_columnattrib.sru
$PBExportComments$Extension Column attributes
forward
global type n_cst_columnattrib from pfc_n_cst_columnattrib
end type
end forward

global type n_cst_columnattrib from pfc_n_cst_columnattrib
end type

on n_cst_columnattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_columnattrib.destroy
TriggerEvent( this, "destructor" )
end on

