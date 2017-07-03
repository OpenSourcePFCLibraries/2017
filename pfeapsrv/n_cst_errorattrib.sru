HA$PBExportHeader$n_cst_errorattrib.sru
$PBExportComments$Extension Message (error) attributes
forward
global type n_cst_errorattrib from pfc_n_cst_errorattrib
end type
end forward

global type n_cst_errorattrib from pfc_n_cst_errorattrib
end type

on n_cst_errorattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_errorattrib.destroy
TriggerEvent( this, "destructor" )
end on

