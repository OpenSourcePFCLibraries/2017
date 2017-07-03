HA$PBExportHeader$n_cst_error.sru
$PBExportComments$Extension Message (error) service
forward
global type n_cst_error from pfc_n_cst_error
end type
end forward

global type n_cst_error from pfc_n_cst_error
end type
global n_cst_error n_cst_error

on n_cst_error.create
TriggerEvent( this, "constructor" )
end on

on n_cst_error.destroy
TriggerEvent( this, "destructor" )
end on

