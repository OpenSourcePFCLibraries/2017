HA$PBExportHeader$n_cst_appmanager.sru
$PBExportComments$Extension Application Manager service
forward
global type n_cst_appmanager from pfc_n_cst_appmanager
end type
end forward

global type n_cst_appmanager from pfc_n_cst_appmanager
end type
global n_cst_appmanager n_cst_appmanager

on n_cst_appmanager.create
TriggerEvent( this, "constructor" )
end on

on n_cst_appmanager.destroy
TriggerEvent( this, "destructor" )
end on

