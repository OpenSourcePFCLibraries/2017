HA$PBExportHeader$pfc_n_cst_tvsrvattrib.sru
$PBExportComments$PFC TreeView Datasource service attributes
forward
global type pfc_n_cst_tvsrvattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_tvsrvattrib from n_cst_baseattrib autoinstantiate
end type

type variables
boolean		ib_recursive = False

integer		ii_deletestyle = 0
string		is_filtercols

string		is_dataobject
string		is_labelcolumn
string		is_retrieveargs
string		is_method
string		is_picturecolumn
string		is_selectedcolumn
string		is_statecolumn
string		is_overlaycolumn

n_ds		ids_obj
n_tr		itr_obj
end variables

on pfc_n_cst_tvsrvattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_tvsrvattrib.destroy
TriggerEvent( this, "destructor" )
end on

