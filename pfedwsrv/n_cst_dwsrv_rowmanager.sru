HA$PBExportHeader$n_cst_dwsrv_rowmanager.sru
$PBExportComments$Extension DataWindow RowManager service
forward
global type n_cst_dwsrv_rowmanager from pfc_n_cst_dwsrv_rowmanager
end type
end forward

global type n_cst_dwsrv_rowmanager from pfc_n_cst_dwsrv_rowmanager
end type
global n_cst_dwsrv_rowmanager n_cst_dwsrv_rowmanager

on n_cst_dwsrv_rowmanager.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsrv_rowmanager.destroy
TriggerEvent( this, "destructor" )
end on

