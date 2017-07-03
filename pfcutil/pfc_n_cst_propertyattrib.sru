HA$PBExportHeader$pfc_n_cst_propertyattrib.sru
$PBExportComments$PFC Property - attributes
forward
global type pfc_n_cst_propertyattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_propertyattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:

// Note:  Not all attributes will be used by all objects.
string	is_name
string	is_description
string	is_propertypage[]
string	is_propertytabtext
boolean	ib_switchbuttons
end variables

on pfc_n_cst_propertyattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_propertyattrib.destroy
TriggerEvent( this, "destructor" )
end on

