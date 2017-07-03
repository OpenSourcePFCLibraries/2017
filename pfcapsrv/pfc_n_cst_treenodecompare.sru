HA$PBExportHeader$pfc_n_cst_treenodecompare.sru
$PBExportComments$PFC tree node compare class
forward
global type pfc_n_cst_treenodecompare from n_cst_nodecomparebase
end type
end forward

global type pfc_n_cst_treenodecompare from n_cst_nodecomparebase
end type
global pfc_n_cst_treenodecompare pfc_n_cst_treenodecompare

on pfc_n_cst_treenodecompare.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_treenodecompare.destroy
TriggerEvent( this, "destructor" )
end on

