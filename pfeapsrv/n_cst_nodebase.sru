HA$PBExportHeader$n_cst_nodebase.sru
$PBExportComments$Extension Node Base class
forward
global type n_cst_nodebase from pfc_n_cst_nodebase
end type
end forward

global type n_cst_nodebase from pfc_n_cst_nodebase
end type
global n_cst_nodebase n_cst_nodebase

on n_cst_nodebase.create
TriggerEvent( this, "constructor" )
end on

on n_cst_nodebase.destroy
TriggerEvent( this, "destructor" )
end on

