HA$PBExportHeader$n_cst_treenodecompare.sru
$PBExportComments$Extension tree node compare class
forward
global type n_cst_treenodecompare from pfc_n_cst_treenodecompare
end type
end forward

global type n_cst_treenodecompare from pfc_n_cst_treenodecompare
end type
global n_cst_treenodecompare n_cst_treenodecompare

on n_cst_treenodecompare.create
TriggerEvent( this, "constructor" )
end on

on n_cst_treenodecompare.destroy
TriggerEvent( this, "destructor" )
end on

