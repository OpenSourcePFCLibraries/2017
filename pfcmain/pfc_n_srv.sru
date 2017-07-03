HA$PBExportHeader$pfc_n_srv.sru
$PBExportComments$PFC Service class
forward
global type pfc_n_srv from service
end type
end forward

global type pfc_n_srv from service
end type
global pfc_n_srv pfc_n_srv

on pfc_n_srv.create
call service::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_srv.destroy
call service::destroy
TriggerEvent( this, "destructor" )
end on

