HA$PBExportHeader$pfc_n_cst_dwobjectattrib.sru
$PBExportComments$PFC Attributes for the Modify / Describe functionality
forward
global type pfc_n_cst_dwobjectattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_dwobjectattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
string 	is_column
string	is_datatype
string 	is_value
end variables

on pfc_n_cst_dwobjectattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_dwobjectattrib.destroy
TriggerEvent( this, "destructor" )
end on

