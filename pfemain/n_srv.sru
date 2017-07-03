HA$PBExportHeader$n_srv.sru
$PBExportComments$Extension Service class
forward
global type n_srv from pfc_n_srv
end type
end forward

global type n_srv from pfc_n_srv
end type
global n_srv n_srv

on n_srv.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_srv.destroy
call super::destroy
TriggerEvent( this, "destructor" )
end on

