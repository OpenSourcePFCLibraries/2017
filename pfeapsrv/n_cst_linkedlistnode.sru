HA$PBExportHeader$n_cst_linkedlistnode.sru
$PBExportComments$Extension Linked List Node
forward
global type n_cst_linkedlistnode from pfc_n_cst_linkedlistnode
end type
end forward

global type n_cst_linkedlistnode from pfc_n_cst_linkedlistnode
end type
global n_cst_linkedlistnode n_cst_linkedlistnode

on n_cst_linkedlistnode.create
TriggerEvent( this, "constructor" )
end on

on n_cst_linkedlistnode.destroy
TriggerEvent( this, "destructor" )
end on

