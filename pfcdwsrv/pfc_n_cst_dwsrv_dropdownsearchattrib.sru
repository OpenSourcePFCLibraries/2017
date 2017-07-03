HA$PBExportHeader$pfc_n_cst_dwsrv_dropdownsearchattrib.sru
$PBExportComments$PFC DataWindow DropDownSearch attributes
forward
global type pfc_n_cst_dwsrv_dropdownsearchattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_dwsrv_dropdownsearchattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
string		s_columnname
string		s_editstyle
datawindowchild		dwc_object
end variables

on pfc_n_cst_dwsrv_dropdownsearchattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_dwsrv_dropdownsearchattrib.destroy
TriggerEvent( this, "destructor" )
end on

