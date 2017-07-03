HA$PBExportHeader$pfc_n_cst_returnattrib.sru
$PBExportComments$PFC Simple return attributes
forward
global type pfc_n_cst_returnattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_returnattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:

integer	ii_rc=-99	// Return code
string	is_rs=''	// Return string
end variables

on pfc_n_cst_returnattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_returnattrib.destroy
TriggerEvent( this, "destructor" )
end on

