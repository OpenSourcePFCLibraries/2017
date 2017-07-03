HA$PBExportHeader$pfc_n_dda.sru
$PBExportComments$PFC DynamicDescriptionArea class
forward
global type pfc_n_dda from dynamicdescriptionarea
end type
end forward

global type pfc_n_dda from dynamicdescriptionarea
end type
global pfc_n_dda pfc_n_dda

on pfc_n_dda.create
call dynamicdescriptionarea::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_dda.destroy
call dynamicdescriptionarea::destroy
TriggerEvent( this, "destructor" )
end on

