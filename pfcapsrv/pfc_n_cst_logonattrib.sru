HA$PBExportHeader$pfc_n_cst_logonattrib.sru
$PBExportComments$PFC Logon window attributes
forward
global type pfc_n_cst_logonattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_logonattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
integer	ii_rc = -99
integer	ii_logonattempts = 1
string	is_userid
string	is_password
string	is_logo
string	is_appname
powerobject	ipo_source

end variables

on pfc_n_cst_logonattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_logonattrib.destroy
TriggerEvent( this, "destructor" )
end on

