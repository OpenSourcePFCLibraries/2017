HA$PBExportHeader$n_cst_dwsrv_filter.sru
$PBExportComments$Extension DataWindow Filter service
forward
global type n_cst_dwsrv_filter from pfc_n_cst_dwsrv_filter
end type
end forward

global type n_cst_dwsrv_filter from pfc_n_cst_dwsrv_filter
end type
global n_cst_dwsrv_filter n_cst_dwsrv_filter

on n_cst_dwsrv_filter.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsrv_filter.destroy
TriggerEvent( this, "destructor" )
end on

