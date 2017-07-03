HA$PBExportHeader$pfc_n_cst_dwpropertyattrib.sru
$PBExportComments$PFC DataWindow Property - attributes
forward
global type pfc_n_cst_dwpropertyattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_dwpropertyattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:

datawindow	idw_requestor	//Datawindow requesting functionality.

// The dataobjects are optional.  Only used if a different view of the data is desired.
string		is_dataobjectbuffer	//Buffer pg - Object capable of DwSharing to idw_obj.
string		is_dataobjectstatus	//Status pg - Object capable of DwSharing to idw_obj.

string		is_objectname
string		is_tabpages	//The tab pages that should be created (tab delimited)

window		iw_main
end variables

on pfc_n_cst_dwpropertyattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_dwpropertyattrib.destroy
TriggerEvent( this, "destructor" )
end on

