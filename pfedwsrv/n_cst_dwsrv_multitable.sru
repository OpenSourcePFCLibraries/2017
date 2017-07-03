HA$PBExportHeader$n_cst_dwsrv_multitable.sru
$PBExportComments$Extension DataWindow Multiple Table service
forward
global type n_cst_dwsrv_multitable from pfc_n_cst_dwsrv_multitable
end type
end forward

global type n_cst_dwsrv_multitable from pfc_n_cst_dwsrv_multitable
end type
global n_cst_dwsrv_multitable n_cst_dwsrv_multitable

on n_cst_dwsrv_multitable.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsrv_multitable.destroy
TriggerEvent( this, "destructor" )
end on

