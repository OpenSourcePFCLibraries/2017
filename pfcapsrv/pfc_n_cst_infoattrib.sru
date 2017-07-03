HA$PBExportHeader$pfc_n_cst_infoattrib.sru
$PBExportComments$PFC Informational attributes
forward
global type pfc_n_cst_infoattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_infoattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:

string	is_name
string	is_description

end variables

on pfc_n_cst_infoattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_infoattrib.destroy
TriggerEvent( this, "destructor" )
end on

