HA$PBExportHeader$pfc_n_dsa.sru
$PBExportComments$PFC DynamicStagingArea
forward
global type pfc_n_dsa from dynamicstagingarea
end type
end forward

global type pfc_n_dsa from dynamicstagingarea
end type
global pfc_n_dsa pfc_n_dsa

type variables
Protected:
boolean		ib_IsObsolete
end variables

on pfc_n_dsa.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_dsa.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

