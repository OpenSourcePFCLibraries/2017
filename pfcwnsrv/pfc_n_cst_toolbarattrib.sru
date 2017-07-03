HA$PBExportHeader$pfc_n_cst_toolbarattrib.sru
$PBExportComments$PFC Toolbar attributes used by the Toolbar window
forward
global type pfc_n_cst_toolbarattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_toolbarattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
window	iw_owner
boolean	ib_visibleenabled
boolean	ib_positionenabled
boolean	ib_largebuttonsenabled
boolean	ib_tooltipsenabled
integer		i_barindex
boolean		b_visible
toolbaralignment		e_alignment
string		s_title
string		s_displayname
end variables

on pfc_n_cst_toolbarattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_toolbarattrib.destroy
TriggerEvent( this, "destructor" )
end on

