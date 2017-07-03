HA$PBExportHeader$pfc_n_cst_lvsrvattrib.sru
$PBExportComments$PFC ListView attributes
forward
global type pfc_n_cst_lvsrvattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_lvsrvattrib from n_cst_baseattrib autoinstantiate
end type

type variables
string	is_DataObject
string	is_LabelColumn
string	is_PictureColumn
string	is_StateColumn
string	is_OverlayColumn
string	is_XPosColumn
string	is_YPosColumn
string	is_Method
string	is_KeyColumns[]

n_ds	ids_source
n_tr	itr_obj
end variables

on pfc_n_cst_lvsrvattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_lvsrvattrib.destroy
TriggerEvent( this, "destructor" )
end on

