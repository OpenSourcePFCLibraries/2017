HA$PBExportHeader$n_cst_dwsrv_property.sru
$PBExportComments$Extension DataWindow Property - The service
forward
global type n_cst_dwsrv_property from pfc_n_cst_dwsrv_property
end type
end forward

global type n_cst_dwsrv_property from pfc_n_cst_dwsrv_property
end type
global n_cst_dwsrv_property n_cst_dwsrv_property

on n_cst_dwsrv_property.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwsrv_property.destroy
TriggerEvent( this, "destructor" )
end on

