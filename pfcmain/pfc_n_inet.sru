HA$PBExportHeader$pfc_n_inet.sru
$PBExportComments$PFC inet class
forward
global type pfc_n_inet from inet
end type
end forward

global type pfc_n_inet from inet
end type
global pfc_n_inet pfc_n_inet

on pfc_n_inet.create
call inet::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_inet.destroy
call inet::destroy
TriggerEvent( this, "destructor" )
end on

