HA$PBExportHeader$n_cst_dssrv_printpreview.sru
$PBExportComments$Extension DataStore PrintPreview service
forward
global type n_cst_dssrv_printpreview from pfc_n_cst_dssrv_printpreview
end type
end forward

global type n_cst_dssrv_printpreview from pfc_n_cst_dssrv_printpreview
end type
global n_cst_dssrv_printpreview n_cst_dssrv_printpreview

on n_cst_dssrv_printpreview.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dssrv_printpreview.destroy
TriggerEvent( this, "destructor" )
end on

