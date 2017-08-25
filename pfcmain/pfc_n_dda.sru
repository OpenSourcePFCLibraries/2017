HA$PBExportHeader$pfc_n_dda.sru
$PBExportComments$PFC DynamicDescriptionArea class
forward
global type pfc_n_dda from dynamicdescriptionarea
end type
end forward

global type pfc_n_dda from dynamicdescriptionarea
end type
global pfc_n_dda pfc_n_dda

type variables
Protected:
boolean		ib_IsObsolete
end variables

on pfc_n_dda.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_dda.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

