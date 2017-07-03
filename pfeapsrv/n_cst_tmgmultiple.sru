HA$PBExportHeader$n_cst_tmgmultiple.sru
$PBExportComments$Extension timing multiple object service
forward
global type n_cst_tmgmultiple from pfc_n_cst_tmgmultiple
end type
end forward

global type n_cst_tmgmultiple from pfc_n_cst_tmgmultiple
end type
global n_cst_tmgmultiple n_cst_tmgmultiple

on n_cst_tmgmultiple.create
TriggerEvent( this, "constructor" )
end on

on n_cst_tmgmultiple.destroy
TriggerEvent( this, "destructor" )
end on

