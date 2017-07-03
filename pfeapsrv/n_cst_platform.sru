HA$PBExportHeader$n_cst_platform.sru
$PBExportComments$Extension Cross Platform service
forward
global type n_cst_platform from pfc_n_cst_platform
end type
end forward

global type n_cst_platform from pfc_n_cst_platform
end type
global n_cst_platform n_cst_platform

on n_cst_platform.create
TriggerEvent( this, "constructor" )
end on

on n_cst_platform.destroy
TriggerEvent( this, "destructor" )
end on

