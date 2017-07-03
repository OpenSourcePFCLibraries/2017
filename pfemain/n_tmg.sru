HA$PBExportHeader$n_tmg.sru
$PBExportComments$Extension Timing Class
forward
global type n_tmg from pfc_n_tmg
end type
end forward

global type n_tmg from pfc_n_tmg
end type
global n_tmg n_tmg

on n_tmg.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_tmg.destroy
call super::destroy
TriggerEvent( this, "destructor" )
end on

