HA$PBExportHeader$pfc_n_cst_selectionattrib.sru
$PBExportComments$PFC Selection attributes
forward
global type pfc_n_cst_selectionattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_selectionattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
any	ia_returnval[]
any	ia_argument[20]
string	is_dataobject
string	is_columnreturn[]
string	is_title
n_tr		itr_object
powerobject	ipo_data[]


end variables

on pfc_n_cst_selectionattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_selectionattrib.destroy
TriggerEvent( this, "destructor" )
end on

