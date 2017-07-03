HA$PBExportHeader$n_cst_baseattrib.sru
$PBExportComments$Extension attribute base class
forward
global type n_cst_baseattrib from pfc_n_cst_baseattrib
end type
end forward

global type n_cst_baseattrib from pfc_n_cst_baseattrib
end type
global n_cst_baseattrib n_cst_baseattrib

on n_cst_baseattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_baseattrib.destroy
TriggerEvent( this, "destructor" )
end on

