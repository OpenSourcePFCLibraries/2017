HA$PBExportHeader$n_pl.sru
$PBExportComments$Extension PIpeline class
forward
global type n_pl from pfc_n_pl
end type
end forward

global type n_pl from pfc_n_pl
end type
global n_pl n_pl

on n_pl.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_pl.destroy
call super::destroy
TriggerEvent( this, "destructor" )
end on

