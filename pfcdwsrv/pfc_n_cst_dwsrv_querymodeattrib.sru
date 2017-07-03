HA$PBExportHeader$pfc_n_cst_dwsrv_querymodeattrib.sru
$PBExportComments$PFC DataWindow QueryMode attributes
forward
global type pfc_n_cst_dwsrv_querymodeattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_dwsrv_querymodeattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
string		s_col
string		s_protect
boolean		b_state
end variables

on pfc_n_cst_dwsrv_querymodeattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_dwsrv_querymodeattrib.destroy
TriggerEvent( this, "destructor" )
end on

