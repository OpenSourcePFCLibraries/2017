HA$PBExportHeader$pfc_n_cst_zoomattrib.sru
$PBExportComments$PFC Attributes for DataWindow Zoom service
forward
global type pfc_n_cst_zoomattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_zoomattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
integer	ii_zoom
datawindow	idw_obj
datastore		ids_obj
end variables

on pfc_n_cst_zoomattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_zoomattrib.destroy
TriggerEvent( this, "destructor" )
end on

