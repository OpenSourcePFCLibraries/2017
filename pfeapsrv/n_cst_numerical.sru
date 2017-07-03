HA$PBExportHeader$n_cst_numerical.sru
$PBExportComments$Extension Numerical service
forward
global type n_cst_numerical from pfc_n_cst_numerical
end type
end forward

global type n_cst_numerical from pfc_n_cst_numerical
end type

on n_cst_numerical.create
TriggerEvent( this, "constructor" )
end on

on n_cst_numerical.destroy
TriggerEvent( this, "destructor" )
end on

