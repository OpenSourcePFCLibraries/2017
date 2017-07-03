HA$PBExportHeader$n_cst_winsrv_sheetmanagerattrib.sru
$PBExportComments$Extension Window  Sheet Manager attributes
forward
global type n_cst_winsrv_sheetmanagerattrib from pfc_n_cst_winsrv_sheetmanagerattrib
end type
end forward

global type n_cst_winsrv_sheetmanagerattrib from pfc_n_cst_winsrv_sheetmanagerattrib
end type

on n_cst_winsrv_sheetmanagerattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_winsrv_sheetmanagerattrib.destroy
TriggerEvent( this, "destructor" )
end on

