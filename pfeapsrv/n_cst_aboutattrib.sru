HA$PBExportHeader$n_cst_aboutattrib.sru
$PBExportComments$Extension About window attributes
forward
global type n_cst_aboutattrib from pfc_n_cst_aboutattrib
end type
end forward

global type n_cst_aboutattrib from pfc_n_cst_aboutattrib
end type

on n_cst_aboutattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_aboutattrib.destroy
TriggerEvent( this, "destructor" )
end on

