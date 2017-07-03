HA$PBExportHeader$pfc_n_cst_linkedlistnode.sru
$PBExportComments$PFC Linked List Node
forward
global type pfc_n_cst_linkedlistnode from n_cst_nodebase
end type
end forward

global type pfc_n_cst_linkedlistnode from n_cst_nodebase
end type
global pfc_n_cst_linkedlistnode pfc_n_cst_linkedlistnode

on pfc_n_cst_linkedlistnode.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_linkedlistnode.destroy
TriggerEvent( this, "destructor" )
end on

