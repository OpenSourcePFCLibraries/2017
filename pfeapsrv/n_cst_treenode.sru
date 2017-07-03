HA$PBExportHeader$n_cst_treenode.sru
$PBExportComments$Extension tree node
forward
global type n_cst_treenode from pfc_n_cst_treenode
end type
end forward

global type n_cst_treenode from pfc_n_cst_treenode
end type
global n_cst_treenode n_cst_treenode

on n_cst_treenode.create
TriggerEvent( this, "constructor" )
end on

on n_cst_treenode.destroy
TriggerEvent( this, "destructor" )
end on

