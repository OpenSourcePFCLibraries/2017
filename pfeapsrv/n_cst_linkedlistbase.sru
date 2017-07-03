HA$PBExportHeader$n_cst_linkedlistbase.sru
$PBExportComments$Extension Linked List Base service
forward
global type n_cst_linkedlistbase from pfc_n_cst_linkedlistbase
end type
end forward

global type n_cst_linkedlistbase from pfc_n_cst_linkedlistbase
end type

on n_cst_linkedlistbase.create
TriggerEvent( this, "constructor" )
end on

on n_cst_linkedlistbase.destroy
TriggerEvent( this, "destructor" )
end on

