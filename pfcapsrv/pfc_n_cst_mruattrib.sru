HA$PBExportHeader$pfc_n_cst_mruattrib.sru
$PBExportComments$PFC Most Recently Used service attributes
forward
global type pfc_n_cst_mruattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_mruattrib from n_cst_baseattrib autoinstantiate
end type

type variables
// Data saved in MRU service
string	is_classname
string	is_menuitemname
string	is_menuitemkey
string	is_menuitemmhelp

// Data used for Register
integer	ii_itemcount

// Data used in both
string	is_id

end variables

on pfc_n_cst_mruattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_mruattrib.destroy
TriggerEvent( this, "destructor" )
end on

