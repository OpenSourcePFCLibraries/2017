HA$PBExportHeader$pfc_n_cst_tvattrib.sru
$PBExportComments$PFC TreeView attributes
forward
global type pfc_n_cst_tvattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_tvattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
string		s_datawindow
n_ds		ds_obj
n_tr		tr_obj
string		s_labelcolumn
string		s_retrieveargs
boolean		b_recursive
integer		i_pictureindex
string		s_pictureindexcol
integer		i_selectedpictureindex
string		s_selectedpictureindexcol
integer		i_statepictureindex
string		s_statepictureindexcol
integer		i_overlaypictureindex
string		s_overlaypictureindexcol
end variables

on pfc_n_cst_tvattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_tvattrib.destroy
TriggerEvent( this, "destructor" )
end on

