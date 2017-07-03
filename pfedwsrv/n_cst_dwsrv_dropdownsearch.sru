HA$PBExportHeader$n_cst_dwsrv_dropdownsearch.sru
$PBExportComments$Extension DataWindow DropDownSearch service
forward
global type n_cst_dwsrv_dropdownsearch from pfc_n_cst_dwsrv_dropdownsearch
end type
end forward

global type n_cst_dwsrv_dropdownsearch from pfc_n_cst_dwsrv_dropdownsearch
end type
global n_cst_dwsrv_dropdownsearch n_cst_dwsrv_dropdownsearch

on n_cst_dwsrv_dropdownsearch.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsrv_dropdownsearch.destroy
TriggerEvent( this, "destructor" )
end on

