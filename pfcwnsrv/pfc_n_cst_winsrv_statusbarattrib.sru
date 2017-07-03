HA$PBExportHeader$pfc_n_cst_winsrv_statusbarattrib.sru
$PBExportComments$PFC Widow Statusbar attributes
forward
global type pfc_n_cst_winsrv_statusbarattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_winsrv_statusbarattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
string		s_id
string		s_type
string		s_value
integer		i_width
integer		i_bordertype
integer		i_gapwidth
end variables

on pfc_n_cst_winsrv_statusbarattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_winsrv_statusbarattrib.destroy
TriggerEvent( this, "destructor" )
end on

