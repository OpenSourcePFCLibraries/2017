HA$PBExportHeader$n_cst_dwsrv_resize.sru
$PBExportComments$Extension DataWindow Resize service
forward
global type n_cst_dwsrv_resize from pfc_n_cst_dwsrv_resize
end type
end forward

global type n_cst_dwsrv_resize from pfc_n_cst_dwsrv_resize
end type
global n_cst_dwsrv_resize n_cst_dwsrv_resize

on n_cst_dwsrv_resize.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsrv_resize.destroy
TriggerEvent( this, "destructor" )
end on

