HA$PBExportHeader$n_cst_dssrv.sru
$PBExportComments$Extension Datastore Base service
forward
global type n_cst_dssrv from pfc_n_cst_dssrv
end type
end forward

global type n_cst_dssrv from pfc_n_cst_dssrv
end type
global n_cst_dssrv n_cst_dssrv

on n_cst_dssrv.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dssrv.destroy
TriggerEvent( this, "destructor" )
end on

