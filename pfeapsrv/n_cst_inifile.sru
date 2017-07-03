HA$PBExportHeader$n_cst_inifile.sru
$PBExportComments$Extension INIFile service
forward
global type n_cst_inifile from pfc_n_cst_inifile
end type
end forward

global type n_cst_inifile from pfc_n_cst_inifile
end type

on n_cst_inifile.create
TriggerEvent( this, "constructor" )
end on

on n_cst_inifile.destroy
TriggerEvent( this, "destructor" )
end on

