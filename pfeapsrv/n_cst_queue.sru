HA$PBExportHeader$n_cst_queue.sru
$PBExportComments$Extension Queue List service
forward
global type n_cst_queue from pfc_n_cst_queue
end type
end forward

global type n_cst_queue from pfc_n_cst_queue
end type

on n_cst_queue.create
TriggerEvent( this, "constructor" )
end on

on n_cst_queue.destroy
TriggerEvent( this, "destructor" )
end on

