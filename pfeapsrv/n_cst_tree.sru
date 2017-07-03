HA$PBExportHeader$n_cst_tree.sru
$PBExportComments$Extension Tree List service
forward
global type n_cst_tree from pfc_n_cst_tree
end type
end forward

global type n_cst_tree from pfc_n_cst_tree
end type

on n_cst_tree.create
TriggerEvent( this, "constructor" )
end on

on n_cst_tree.destroy
TriggerEvent( this, "destructor" )
end on

