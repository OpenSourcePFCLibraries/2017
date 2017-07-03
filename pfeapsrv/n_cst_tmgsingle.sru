HA$PBExportHeader$n_cst_tmgsingle.sru
$PBExportComments$Extension timing single object service
forward
global type n_cst_tmgsingle from pfc_n_cst_tmgsingle
end type
end forward

global type n_cst_tmgsingle from pfc_n_cst_tmgsingle
end type
global n_cst_tmgsingle n_cst_tmgsingle

on n_cst_tmgsingle.create
TriggerEvent( this, "constructor" )
end on

on n_cst_tmgsingle.destroy
TriggerEvent( this, "destructor" )
end on

