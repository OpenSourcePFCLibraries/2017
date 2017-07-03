HA$PBExportHeader$pfc_n_dsa.sru
$PBExportComments$PFC DynamicStagingArea
forward
global type pfc_n_dsa from dynamicstagingarea
end type
end forward

global type pfc_n_dsa from dynamicstagingarea
end type
global pfc_n_dsa pfc_n_dsa

on pfc_n_dsa.create
call dynamicstagingarea::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_dsa.destroy
call dynamicstagingarea::destroy
TriggerEvent( this, "destructor" )
end on

