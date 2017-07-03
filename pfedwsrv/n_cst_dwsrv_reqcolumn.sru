HA$PBExportHeader$n_cst_dwsrv_reqcolumn.sru
$PBExportComments$Extension DataWindow Required Column service
forward
global type n_cst_dwsrv_reqcolumn from pfc_n_cst_dwsrv_reqcolumn
end type
end forward

global type n_cst_dwsrv_reqcolumn from pfc_n_cst_dwsrv_reqcolumn
end type
global n_cst_dwsrv_reqcolumn n_cst_dwsrv_reqcolumn

on n_cst_dwsrv_reqcolumn.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsrv_reqcolumn.destroy
TriggerEvent( this, "destructor" )
end on

