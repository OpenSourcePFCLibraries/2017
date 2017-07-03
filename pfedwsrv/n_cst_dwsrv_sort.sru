HA$PBExportHeader$n_cst_dwsrv_sort.sru
$PBExportComments$Extension DataWindow Sort service
forward
global type n_cst_dwsrv_sort from pfc_n_cst_dwsrv_sort
end type
end forward

global type n_cst_dwsrv_sort from pfc_n_cst_dwsrv_sort
end type
global n_cst_dwsrv_sort n_cst_dwsrv_sort

on n_cst_dwsrv_sort.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsrv_sort.destroy
TriggerEvent( this, "destructor" )
end on

