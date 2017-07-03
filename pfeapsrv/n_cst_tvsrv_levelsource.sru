HA$PBExportHeader$n_cst_tvsrv_levelsource.sru
$PBExportComments$Extension Treeview Level Based service
forward
global type n_cst_tvsrv_levelsource from pfc_n_cst_tvsrv_levelsource
end type
end forward

global type n_cst_tvsrv_levelsource from pfc_n_cst_tvsrv_levelsource
end type
global n_cst_tvsrv_levelsource n_cst_tvsrv_levelsource

on n_cst_tvsrv_levelsource.create
TriggerEvent( this, "constructor" )
end on

on n_cst_tvsrv_levelsource.destroy
TriggerEvent( this, "destructor" )
end on

