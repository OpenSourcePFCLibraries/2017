HA$PBExportHeader$pfc_n_cst_winsrv_sheetmanagerattrib.sru
$PBExportComments$PFC Window  Sheet Manager attributes
forward
global type pfc_n_cst_winsrv_sheetmanagerattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_winsrv_sheetmanagerattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
window		w_obj
windowstate		e_state
integer		i_width
integer		i_height
integer		i_x
integer		i_y
end variables

on pfc_n_cst_winsrv_sheetmanagerattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_winsrv_sheetmanagerattrib.destroy
TriggerEvent( this, "destructor" )
end on

