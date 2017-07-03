HA$PBExportHeader$pfc_n_ostm.sru
$PBExportComments$PFC OLEStream class
forward
global type pfc_n_ostm from olestream
end type
end forward

global type pfc_n_ostm from olestream
end type
global pfc_n_ostm pfc_n_ostm

on pfc_n_ostm.create
call olestream::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_ostm.destroy
call olestream::destroy
TriggerEvent( this, "destructor" )
end on

