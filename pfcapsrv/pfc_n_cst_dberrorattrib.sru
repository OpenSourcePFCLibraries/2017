HA$PBExportHeader$pfc_n_cst_dberrorattrib.sru
$PBExportComments$PFC dberror attributes
forward
global type pfc_n_cst_dberrorattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_dberrorattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:

long	il_sqldbcode
long	il_row
dwbuffer	idwb_buffer
string	is_sqlsyntax
string	is_sqlerrtext
string	is_errormsg
powerobject	ipo_inerror
end variables

on pfc_n_cst_dberrorattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_dberrorattrib.destroy
TriggerEvent( this, "destructor" )
end on

