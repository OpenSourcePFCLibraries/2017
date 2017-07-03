HA$PBExportHeader$n_cst_explorerattrib.sru
forward
global type n_cst_explorerattrib from n_cst_baseattrib
end type
end forward

global type n_cst_explorerattrib from n_cst_baseattrib autoinstantiate
end type

type variables
public:

long		il_datastorerow
long		il_selectedhandle
treeviewitem	itvi_selecteditem
n_ds		ids_datastore

end variables

on n_cst_explorerattrib.create
TriggerEvent( this, "constructor" )
end on

on n_cst_explorerattrib.destroy
TriggerEvent( this, "destructor" )
end on

