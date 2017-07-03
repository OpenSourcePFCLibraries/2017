HA$PBExportHeader$n_base.sru
$PBExportComments$Extension NonVisual Base class
forward
global type n_base from pfc_n_base
end type
end forward

global type n_base from pfc_n_base
end type
global n_base n_base

on n_base.create
TriggerEvent( this, "constructor" )
end on

on n_base.destroy
TriggerEvent( this, "destructor" )
end on

