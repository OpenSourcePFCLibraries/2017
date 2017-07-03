HA$PBExportHeader$n_cst_sqlattrib.sru
$PBExportComments$Extension SQL attributes
forward
global type n_cst_sqlattrib from pfc_n_cst_sqlattrib
end type
end forward

global type n_cst_sqlattrib from pfc_n_cst_sqlattrib
end type

on n_cst_sqlattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_sqlattrib.destroy
TriggerEvent( this, "destructor" )
end on

