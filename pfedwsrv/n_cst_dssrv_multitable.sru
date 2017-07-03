HA$PBExportHeader$n_cst_dssrv_multitable.sru
$PBExportComments$Extension DataStore Multiple Table service
forward
global type n_cst_dssrv_multitable from pfc_n_cst_dssrv_multitable
end type
end forward

global type n_cst_dssrv_multitable from pfc_n_cst_dssrv_multitable
end type
global n_cst_dssrv_multitable n_cst_dssrv_multitable

on n_cst_dssrv_multitable.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dssrv_multitable.destroy
TriggerEvent( this, "destructor" )
end on

