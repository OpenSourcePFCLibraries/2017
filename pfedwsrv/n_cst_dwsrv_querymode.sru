HA$PBExportHeader$n_cst_dwsrv_querymode.sru
$PBExportComments$Extension DataWindow QueryMode service
forward
global type n_cst_dwsrv_querymode from pfc_n_cst_dwsrv_querymode
end type
end forward

global type n_cst_dwsrv_querymode from pfc_n_cst_dwsrv_querymode
end type
global n_cst_dwsrv_querymode n_cst_dwsrv_querymode

on n_cst_dwsrv_querymode.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsrv_querymode.destroy
TriggerEvent( this, "destructor" )
end on

