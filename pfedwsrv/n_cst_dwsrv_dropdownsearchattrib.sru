HA$PBExportHeader$n_cst_dwsrv_dropdownsearchattrib.sru
$PBExportComments$Extension DataWindow DropDownSearch attributes
forward
global type n_cst_dwsrv_dropdownsearchattrib from pfc_n_cst_dwsrv_dropdownsearchattrib
end type
end forward

global type n_cst_dwsrv_dropdownsearchattrib from pfc_n_cst_dwsrv_dropdownsearchattrib
end type

on n_cst_dwsrv_dropdownsearchattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsrv_dropdownsearchattrib.destroy
TriggerEvent( this, "destructor" )
end on

