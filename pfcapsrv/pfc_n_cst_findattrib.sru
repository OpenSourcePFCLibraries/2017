HA$PBExportHeader$pfc_n_cst_findattrib.sru
$PBExportComments$PFC Find/Replace window attributes
forward
global type pfc_n_cst_findattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_findattrib from n_cst_baseattrib autoinstantiate
end type

type variables
powerobject	ipo_requestor

string 		is_find=''
string 		is_replacewith=''

boolean 		ib_wholewordvisible=True
boolean 		ib_wholewordenabled=True
boolean 		ib_wholeword=False

boolean 		ib_matchcasevisible=True
boolean 		ib_matchcaseenabled=True
boolean 		ib_matchcase=False

boolean 		ib_directionvisible=True
boolean 		ib_directionenabled=True
string 		is_direction=''

boolean 		ib_lookvisible=True
boolean 		ib_lookenabled=True
integer 		ii_lookindex
string 		is_lookdata[]
string 		is_lookdisplay[]

end variables

on pfc_n_cst_findattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_findattrib.destroy
TriggerEvent( this, "destructor" )
end on

