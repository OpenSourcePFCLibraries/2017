HA$PBExportHeader$n_cst_propertyattrib.sru
$PBExportComments$Extension Property - attributes
forward
global type n_cst_propertyattrib from pfc_n_cst_propertyattrib
end type
end forward

global type n_cst_propertyattrib from pfc_n_cst_propertyattrib
end type

on n_cst_propertyattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_propertyattrib.destroy
TriggerEvent( this, "destructor" )
end on

