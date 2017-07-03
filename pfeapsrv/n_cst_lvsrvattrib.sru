HA$PBExportHeader$n_cst_lvsrvattrib.sru
$PBExportComments$Extension ListView attributes
forward
global type n_cst_lvsrvattrib from pfc_n_cst_lvsrvattrib
end type
end forward

global type n_cst_lvsrvattrib from pfc_n_cst_lvsrvattrib
end type

on n_cst_lvsrvattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_lvsrvattrib.destroy
TriggerEvent( this, "destructor" )
end on

