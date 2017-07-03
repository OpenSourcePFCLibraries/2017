HA$PBExportHeader$pfc_n_cst_dwsrv_multitableattrib.sru
$PBExportComments$PFC DataWindow Multiple Table attributes
forward
global type pfc_n_cst_dwsrv_multitableattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_dwsrv_multitableattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
string		s_updatetable
integer		i_whereoption
boolean		b_keyupdateinplace
string		s_updatecolumns[]
string		s_keycolumns[]
end variables

on pfc_n_cst_dwsrv_multitableattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_dwsrv_multitableattrib.destroy
TriggerEvent( this, "destructor" )
end on

