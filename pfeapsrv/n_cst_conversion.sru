HA$PBExportHeader$n_cst_conversion.sru
$PBExportComments$Extension Conversion service
forward
global type n_cst_conversion from pfc_n_cst_conversion
end type
end forward

global type n_cst_conversion from pfc_n_cst_conversion
end type

on n_cst_conversion.create
TriggerEvent( this, "constructor" )
end on

on n_cst_conversion.destroy
TriggerEvent( this, "destructor" )
end on

