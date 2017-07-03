HA$PBExportHeader$n_cst_trregistration.sru
$PBExportComments$Extension Transaction Registration service
forward
global type n_cst_trregistration from pfc_n_cst_trregistration
end type
end forward

global type n_cst_trregistration from pfc_n_cst_trregistration
end type
global n_cst_trregistration n_cst_trregistration

on n_cst_trregistration.create
TriggerEvent( this, "constructor" )
end on

on n_cst_trregistration.destroy
TriggerEvent( this, "destructor" )
end on

