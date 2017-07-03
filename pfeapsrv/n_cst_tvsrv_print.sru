HA$PBExportHeader$n_cst_tvsrv_print.sru
$PBExportComments$Extension TreeView Print service
forward
global type n_cst_tvsrv_print from pfc_n_cst_tvsrv_print
end type
end forward

global type n_cst_tvsrv_print from pfc_n_cst_tvsrv_print
end type
global n_cst_tvsrv_print n_cst_tvsrv_print

on n_cst_tvsrv_print.create
TriggerEvent( this, "constructor" )
end on

on n_cst_tvsrv_print.destroy
TriggerEvent( this, "destructor" )
end on

