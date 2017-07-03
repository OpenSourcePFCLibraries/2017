HA$PBExportHeader$n_cst_mru.sru
$PBExportComments$Extension Most Recently Used service
forward
global type n_cst_mru from pfc_n_cst_mru
end type
end forward

global type n_cst_mru from pfc_n_cst_mru
end type
global n_cst_mru n_cst_mru

on n_cst_mru.create
TriggerEvent( this, "constructor" )
end on

on n_cst_mru.destroy
TriggerEvent( this, "destructor" )
end on

