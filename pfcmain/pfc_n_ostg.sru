HA$PBExportHeader$pfc_n_ostg.sru
$PBExportComments$PFC OLEStorage class
forward
global type pfc_n_ostg from olestorage
end type
end forward

global type pfc_n_ostg from olestorage
end type
global pfc_n_ostg pfc_n_ostg

on pfc_n_ostg.create
call olestorage::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_ostg.destroy
call olestorage::destroy
TriggerEvent( this, "destructor" )
end on

