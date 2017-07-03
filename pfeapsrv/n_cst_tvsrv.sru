HA$PBExportHeader$n_cst_tvsrv.sru
$PBExportComments$Extension TreeView Base service
forward
global type n_cst_tvsrv from pfc_n_cst_tvsrv
end type
end forward

global type n_cst_tvsrv from pfc_n_cst_tvsrv
end type
global n_cst_tvsrv n_cst_tvsrv

on n_cst_tvsrv.create
TriggerEvent( this, "constructor" )
end on

on n_cst_tvsrv.destroy
TriggerEvent( this, "destructor" )
end on

