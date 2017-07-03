HA$PBExportHeader$n_dsa.sru
$PBExportComments$Extension DynamicStagingArea class
forward
global type n_dsa from pfc_n_dsa
end type
end forward

global type n_dsa from pfc_n_dsa
end type
global n_dsa n_dsa

on n_dsa.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_dsa.destroy
call super::destroy
TriggerEvent( this, "destructor" )
end on

