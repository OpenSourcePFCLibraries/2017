HA$PBExportHeader$n_cst_dwsrv.sru
$PBExportComments$Extension Base DataWindow service
forward
global type n_cst_dwsrv from pfc_n_cst_dwsrv
end type
end forward

global type n_cst_dwsrv from pfc_n_cst_dwsrv
end type
global n_cst_dwsrv n_cst_dwsrv

on n_cst_dwsrv.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsrv.destroy
TriggerEvent( this, "destructor" )
end on

