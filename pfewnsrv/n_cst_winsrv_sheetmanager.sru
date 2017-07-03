HA$PBExportHeader$n_cst_winsrv_sheetmanager.sru
$PBExportComments$Extension Window Sheet Manager service
forward
global type n_cst_winsrv_sheetmanager from pfc_n_cst_winsrv_sheetmanager
end type
end forward

global type n_cst_winsrv_sheetmanager from pfc_n_cst_winsrv_sheetmanager
end type
global n_cst_winsrv_sheetmanager n_cst_winsrv_sheetmanager

on n_cst_winsrv_sheetmanager.create
TriggerEvent( this, "constructor" )
end on

on n_cst_winsrv_sheetmanager.destroy
TriggerEvent( this, "destructor" )
end on

