HA$PBExportHeader$n_cst_luw.sru
$PBExportComments$Extension Logical Unit of Work Service
forward
global type n_cst_luw from pfc_n_cst_luw
end type
end forward

global type n_cst_luw from pfc_n_cst_luw
end type
global n_cst_luw n_cst_luw

on n_cst_luw.create
TriggerEvent( this, "constructor" )
end on

on n_cst_luw.destroy
TriggerEvent( this, "destructor" )
end on

