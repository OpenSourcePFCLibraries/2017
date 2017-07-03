HA$PBExportHeader$n_cst_textstyleattrib.sru
$PBExportComments$Extension Text Style attributes
forward
global type n_cst_textstyleattrib from pfc_n_cst_textstyleattrib
end type
end forward

global type n_cst_textstyleattrib from pfc_n_cst_textstyleattrib
end type

on n_cst_textstyleattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_textstyleattrib.destroy
TriggerEvent( this, "destructor" )
end on

