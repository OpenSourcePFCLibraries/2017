HA$PBExportHeader$pfc_n_cst_dwcacheattrib.sru
$PBExportComments$PFC Caching attributes
forward
global type pfc_n_cst_dwcacheattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_dwcacheattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
string		s_id
n_ds		ds_obj
n_tr		tr_obj
any		a_args[]
string		s_method
string		s_filename
datawindow		dw_originalcontrol
datastore		ds_originalcontrol
powerobject		po_originaldata[]
string		s_originaldataobject
end variables

on pfc_n_cst_dwcacheattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_dwcacheattrib.destroy
TriggerEvent( this, "destructor" )
end on

