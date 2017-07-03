HA$PBExportHeader$pfc_n_cst_columnattrib.sru
$PBExportComments$PFC Column attributes
forward
global type pfc_n_cst_columnattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_columnattrib from n_cst_baseattrib autoinstantiate
end type

type variables
string	is_Columns
string	is_ColFormat
string	is_ColType
end variables

on pfc_n_cst_columnattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_columnattrib.destroy
TriggerEvent( this, "destructor" )
end on

