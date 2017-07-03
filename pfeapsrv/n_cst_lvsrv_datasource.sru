HA$PBExportHeader$n_cst_lvsrv_datasource.sru
$PBExportComments$Extension ListView Datasource service
forward
global type n_cst_lvsrv_datasource from pfc_n_cst_lvsrv_datasource
end type
end forward

global type n_cst_lvsrv_datasource from pfc_n_cst_lvsrv_datasource
end type
global n_cst_lvsrv_datasource n_cst_lvsrv_datasource

on n_cst_lvsrv_datasource.create
TriggerEvent( this, "constructor" )
end on

on n_cst_lvsrv_datasource.destroy
TriggerEvent( this, "destructor" )
end on

