HA$PBExportHeader$n_cst_security.sru
$PBExportComments$Extension Security Service
forward
global type n_cst_security from pfc_n_cst_security
end type
end forward

global type n_cst_security from pfc_n_cst_security
end type
global n_cst_security n_cst_security

on n_cst_security.create
TriggerEvent( this, "constructor" )
end on

on n_cst_security.destroy
TriggerEvent( this, "destructor" )
end on

