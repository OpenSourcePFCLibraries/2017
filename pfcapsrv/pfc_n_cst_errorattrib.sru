HA$PBExportHeader$pfc_n_cst_errorattrib.sru
$PBExportComments$PFC Message Service Attributes
forward
global type pfc_n_cst_errorattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_errorattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
// Return info  from PFC Message Window.
integer		ii_rc=-99
integer		ii_buttonclicked

// Standard PB MessageBox information.
string		is_title
string		is_text
icon		ie_icon
button		ie_buttonstyle
integer		ii_default

// Other attributes for Message Window.
integer		ii_severity
boolean		ib_print
boolean		ib_userinput
string		is_usertext
integer		ii_timeout

// Other attributes for service.
datetime		idt_date
string		is_user


end variables

on pfc_n_cst_errorattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_errorattrib.destroy
TriggerEvent( this, "destructor" )
end on

