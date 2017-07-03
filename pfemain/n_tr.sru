HA$PBExportHeader$n_tr.sru
$PBExportComments$Extension Transaction class
forward
global type n_tr from pfc_n_tr
end type
end forward

global type n_tr from pfc_n_tr
end type
global n_tr n_tr

on n_tr.create
TriggerEvent( this, "constructor" )
end on

on n_tr.destroy
TriggerEvent( this, "destructor" )
end on

