HA$PBExportHeader$pfc_n_ostg.sru
$PBExportComments$PFC OLEStorage class
forward
global type pfc_n_ostg from olestorage
end type
end forward

global type pfc_n_ostg from olestorage
end type
global pfc_n_ostg pfc_n_ostg

type variables
Protected:
boolean		ib_IsObsolete
end variables

on pfc_n_ostg.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_ostg.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

