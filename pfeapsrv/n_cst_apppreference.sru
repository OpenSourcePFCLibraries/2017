HA$PBExportHeader$n_cst_apppreference.sru
$PBExportComments$Extension Application Preference service
forward
global type n_cst_apppreference from pfc_n_cst_apppreference
end type
end forward

global type n_cst_apppreference from pfc_n_cst_apppreference
end type
global n_cst_apppreference n_cst_apppreference

on n_cst_apppreference.create
TriggerEvent( this, "constructor" )
end on

on n_cst_apppreference.destroy
TriggerEvent( this, "destructor" )
end on

