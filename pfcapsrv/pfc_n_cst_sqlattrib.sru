HA$PBExportHeader$pfc_n_cst_sqlattrib.sru
$PBExportComments$PFC parsed SQL syntax for SQL Parser attributes
forward
global type pfc_n_cst_sqlattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_sqlattrib from n_cst_baseattrib autoinstantiate
end type

type variables
string s_verb	
string s_tables	
string s_columns	
string s_values	
string s_where	
string s_order	
string s_group	
string s_having	

end variables

on pfc_n_cst_sqlattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_sqlattrib.destroy
TriggerEvent( this, "destructor" )
end on

