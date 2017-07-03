HA$PBExportHeader$n_cst_winsrv_statusbarattrib.sru
$PBExportComments$Extension Widow Statusbar attributes
forward
global type n_cst_winsrv_statusbarattrib from pfc_n_cst_winsrv_statusbarattrib
end type
end forward

global type n_cst_winsrv_statusbarattrib from pfc_n_cst_winsrv_statusbarattrib
end type

on n_cst_winsrv_statusbarattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_winsrv_statusbarattrib.destroy
TriggerEvent( this, "destructor" )
end on

