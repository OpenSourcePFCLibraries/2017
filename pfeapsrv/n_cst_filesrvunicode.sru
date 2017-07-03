HA$PBExportHeader$n_cst_filesrvunicode.sru
$PBExportComments$Extension Unicode File handler service
forward
global type n_cst_filesrvunicode from pfc_n_cst_filesrvunicode
end type
end forward

global type n_cst_filesrvunicode from pfc_n_cst_filesrvunicode
end type
global n_cst_filesrvunicode n_cst_filesrvunicode

on n_cst_filesrvunicode.create
TriggerEvent( this, "constructor" )
end on

on n_cst_filesrvunicode.destroy
TriggerEvent( this, "destructor" )
end on

