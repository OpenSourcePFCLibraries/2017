HA$PBExportHeader$pfc_n_cst_trregistrationattrib.sru
$PBExportComments$PFC Transaction Registration attributes
forward
global type pfc_n_cst_trregistrationattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_trregistrationattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
n_tr		tr_object
boolean		b_used
end variables

on pfc_n_cst_trregistrationattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_trregistrationattrib.destroy
TriggerEvent( this, "destructor" )
end on

