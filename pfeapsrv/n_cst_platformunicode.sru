HA$PBExportHeader$n_cst_platformunicode.sru
$PBExportComments$Extension Unicode Cross Platform service
forward
global type n_cst_platformunicode from pfc_n_cst_platformunicode
end type
end forward

global type n_cst_platformunicode from pfc_n_cst_platformunicode
end type
global n_cst_platformunicode n_cst_platformunicode

on n_cst_platformunicode.create
TriggerEvent( this, "constructor" )
end on

on n_cst_platformunicode.destroy
TriggerEvent( this, "destructor" )
end on

