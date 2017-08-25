HA$PBExportHeader$pfc_n_srv.sru
$PBExportComments$PFC Service class
forward
global type pfc_n_srv from service
end type
end forward

global type pfc_n_srv from service
end type
global pfc_n_srv pfc_n_srv

type variables
Protected:
boolean		ib_IsObsolete
end variables

on pfc_n_srv.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_srv.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

