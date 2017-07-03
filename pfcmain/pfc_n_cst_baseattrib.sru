HA$PBExportHeader$pfc_n_cst_baseattrib.sru
$PBExportComments$PFC attribute base class
forward
global type pfc_n_cst_baseattrib from n_base
end type
end forward

global type pfc_n_cst_baseattrib from n_base
end type
global pfc_n_cst_baseattrib pfc_n_cst_baseattrib

on pfc_n_cst_baseattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_baseattrib.destroy
TriggerEvent( this, "destructor" )
end on

