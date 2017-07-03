HA$PBExportHeader$n_ds.sru
$PBExportComments$Extension Datastore class
forward
global type n_ds from pfc_n_ds
end type
end forward

global type n_ds from pfc_n_ds
end type
global n_ds n_ds

on n_ds.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_ds.destroy
call super::destroy
TriggerEvent( this, "destructor" )
end on

