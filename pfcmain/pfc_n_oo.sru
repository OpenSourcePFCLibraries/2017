HA$PBExportHeader$pfc_n_oo.sru
$PBExportComments$PFC OLEObject class
forward
global type pfc_n_oo from oleobject
end type
end forward

global type pfc_n_oo from oleobject
end type
global pfc_n_oo pfc_n_oo

on pfc_n_oo.create
call oleobject::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_oo.destroy
call oleobject::destroy
TriggerEvent( this, "destructor" )
end on

