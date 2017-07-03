HA$PBExportHeader$n_cst_dwsrv_rowselection.sru
$PBExportComments$Extension DataWindow Row Selection service
forward
global type n_cst_dwsrv_rowselection from pfc_n_cst_dwsrv_rowselection
end type
end forward

global type n_cst_dwsrv_rowselection from pfc_n_cst_dwsrv_rowselection
end type
global n_cst_dwsrv_rowselection n_cst_dwsrv_rowselection

on n_cst_dwsrv_rowselection.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsrv_rowselection.destroy
TriggerEvent( this, "destructor" )
end on

