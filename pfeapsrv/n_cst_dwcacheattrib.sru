HA$PBExportHeader$n_cst_dwcacheattrib.sru
$PBExportComments$Extension Caching attributes
forward
global type n_cst_dwcacheattrib from pfc_n_cst_dwcacheattrib
end type
end forward

global type n_cst_dwcacheattrib from pfc_n_cst_dwcacheattrib
end type

on n_cst_dwcacheattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dwcacheattrib.destroy
TriggerEvent( this, "destructor" )
end on

