HA$PBExportHeader$n_cst_dwsrv_linkage.sru
$PBExportComments$Extension DataWindow Linkage service
forward
global type n_cst_dwsrv_linkage from pfc_n_cst_dwsrv_linkage
end type
end forward

global type n_cst_dwsrv_linkage from pfc_n_cst_dwsrv_linkage
end type
global n_cst_dwsrv_linkage n_cst_dwsrv_linkage

on n_cst_dwsrv_linkage.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsrv_linkage.destroy
TriggerEvent( this, "destructor" )
end on

