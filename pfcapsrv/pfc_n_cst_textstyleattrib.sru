HA$PBExportHeader$pfc_n_cst_textstyleattrib.sru
$PBExportComments$PFC Text Style attributes
forward
global type pfc_n_cst_textstyleattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_textstyleattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
boolean	ib_bold
boolean	ib_italic
boolean	ib_strikeout
boolean	ib_subscript
boolean	ib_superscript
boolean	ib_underlined

end variables

on pfc_n_cst_textstyleattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_textstyleattrib.destroy
TriggerEvent( this, "destructor" )
end on

