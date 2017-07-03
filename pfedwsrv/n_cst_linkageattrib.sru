HA$PBExportHeader$n_cst_linkageattrib.sru
$PBExportComments$Extension Attributes for the Linkage service
forward
global type n_cst_linkageattrib from pfc_n_cst_linkageattrib
end type
end forward

global type n_cst_linkageattrib from pfc_n_cst_linkageattrib
end type

on n_cst_linkageattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_linkageattrib.destroy
TriggerEvent( this, "destructor" )
end on

