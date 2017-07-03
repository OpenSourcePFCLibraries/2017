HA$PBExportHeader$pfc_n_cst_splashattrib.sru
$PBExportComments$PFC Base Splash window attributes
forward
global type pfc_n_cst_splashattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_splashattrib from n_cst_baseattrib autoinstantiate
end type

type variables
integer	ii_secondsvisible	//Seconds the splah window should be visible
string	is_application	//The application name
string	is_logo		//The logo
string	is_version		//The application version
string	is_copyright	//A copyright message
end variables

on pfc_n_cst_splashattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_splashattrib.destroy
TriggerEvent( this, "destructor" )
end on

