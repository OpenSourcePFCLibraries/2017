HA$PBExportHeader$pfc_n_oo.sru
$PBExportComments$PFC OLEObject class
forward
global type pfc_n_oo from oleobject
end type
end forward

global type pfc_n_oo from oleobject
end type
global pfc_n_oo pfc_n_oo

type variables
Protected:
boolean		ib_IsObsolete
end variables

on pfc_n_oo.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_oo.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

