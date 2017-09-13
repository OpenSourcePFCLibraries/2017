HA$PBExportHeader$pfc_n_ostm.sru
$PBExportComments$PFC OLEStream class
forward
global type pfc_n_ostm from olestream
end type
end forward

global type pfc_n_ostm from olestream
end type
global pfc_n_ostm pfc_n_ostm

type variables
Protected:
boolean		ib_IsObsolete
end variables

on pfc_n_ostm.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_ostm.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

