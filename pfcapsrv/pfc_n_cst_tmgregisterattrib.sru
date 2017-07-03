HA$PBExportHeader$pfc_n_cst_tmgregisterattrib.sru
$PBExportComments$PFC timing register attributes
forward
global type pfc_n_cst_tmgregisterattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_tmgregisterattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
powerobject	ipo_notify
string 		is_notifyevent
long 		il_notifyinterval
integer		ii_notifystyle
end variables

on pfc_n_cst_tmgregisterattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_tmgregisterattrib.destroy
TriggerEvent( this, "destructor" )
end on

