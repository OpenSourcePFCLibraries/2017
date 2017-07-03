HA$PBExportHeader$n_cst_winsrv.sru
$PBExportComments$Extension Base Window Service class
forward
global type n_cst_winsrv from pfc_n_cst_winsrv
end type
end forward

global type n_cst_winsrv from pfc_n_cst_winsrv
end type
global n_cst_winsrv n_cst_winsrv

on n_cst_winsrv.create
TriggerEvent( this, "constructor" )
end on

on n_cst_winsrv.destroy
TriggerEvent( this, "destructor" )
end on

