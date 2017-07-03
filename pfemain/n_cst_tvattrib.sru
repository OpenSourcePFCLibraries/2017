HA$PBExportHeader$n_cst_tvattrib.sru
$PBExportComments$Extension TreeView attributes
forward
global type n_cst_tvattrib from pfc_n_cst_tvattrib
end type
end forward

global type n_cst_tvattrib from pfc_n_cst_tvattrib
end type

on n_cst_tvattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_tvattrib.destroy
TriggerEvent( this, "destructor" )
end on

