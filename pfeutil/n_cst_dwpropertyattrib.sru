HA$PBExportHeader$n_cst_dwpropertyattrib.sru
$PBExportComments$Extension DataWindow Property - attributes
forward
global type n_cst_dwpropertyattrib from pfc_n_cst_dwpropertyattrib
end type
end forward

global type n_cst_dwpropertyattrib from pfc_n_cst_dwpropertyattrib
end type

on n_cst_dwpropertyattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwpropertyattrib.destroy
TriggerEvent( this, "destructor" )
end on

