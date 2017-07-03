HA$PBExportHeader$n_cst_itemattrib.sru
$PBExportComments$Extension Item attributes
forward
global type n_cst_itemattrib from pfc_n_cst_itemattrib
end type
end forward

global type n_cst_itemattrib from pfc_n_cst_itemattrib
end type

on n_cst_itemattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_itemattrib.destroy
TriggerEvent( this, "destructor" )
end on

