HA$PBExportHeader$pfc_n_cst_linkedlistnodecompare.sru
$PBExportComments$PFC Linked List Node compare
forward
global type pfc_n_cst_linkedlistnodecompare from n_cst_nodecomparebase
end type
end forward

global type pfc_n_cst_linkedlistnodecompare from n_cst_nodecomparebase
end type
global pfc_n_cst_linkedlistnodecompare pfc_n_cst_linkedlistnodecompare

on pfc_n_cst_linkedlistnodecompare.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_linkedlistnodecompare.destroy
TriggerEvent( this, "destructor" )
end on

