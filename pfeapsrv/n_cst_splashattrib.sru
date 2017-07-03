HA$PBExportHeader$n_cst_splashattrib.sru
$PBExportComments$Extension Splash attributes
forward
global type n_cst_splashattrib from pfc_n_cst_splashattrib
end type
end forward

global type n_cst_splashattrib from pfc_n_cst_splashattrib
end type

on n_cst_splashattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_splashattrib.destroy
TriggerEvent( this, "destructor" )
end on

