HA$PBExportHeader$n_cst_logonattrib.sru
$PBExportComments$Extension Long attributes
forward
global type n_cst_logonattrib from pfc_n_cst_logonattrib
end type
end forward

global type n_cst_logonattrib from pfc_n_cst_logonattrib
end type

on n_cst_logonattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_logonattrib.destroy
TriggerEvent( this, "destructor" )
end on

