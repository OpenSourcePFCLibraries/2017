HA$PBExportHeader$n_pfcsecurity_appmanager.sru
$PBExportComments$PFC Security Application manager object
forward
global type n_pfcsecurity_appmanager from n_cst_appmanager
end type
end forward

global type n_pfcsecurity_appmanager from n_cst_appmanager
end type
global n_pfcsecurity_appmanager n_pfcsecurity_appmanager

type variables
n_tr inv_trans
end variables

event constructor;call super::constructor;ContextInformation lcx_key
int li_major, li_minor
date ld_now

ld_now = Today ( )

/*  Get PB Version.    */
GetContextService ( "ContextInformation", lcx_key)
lcx_key.GetMajorVersion ( li_major )
lcx_key.GetMinorVersion ( li_minor )

iapp_object.displayname = 'PFC Security Administration Utility'

// The file name of the application INI file
of_SetAppIniFile ('pfcsecad.ini')

// The application version
of_SetVersion ("Version " + String ( li_major ) + "." + String ( li_minor ) + ".00")

// The application bitmap name
of_SetLogo ("key.bmp")

// The application bitmap name
of_SetHelpFile ( "pbpfc" + String ( li_major ) + String ( li_minor ) + ".hlp")


// The application's copyright message
this.of_SetCopyright("Copyright (c) 2004-" + String ( Year ( ld_now ), "0000" ) + " Open Source PowerBuilder Foundation Class Libraries, All rights reserved.")

inv_trans = create n_tr
end event

event destructor;If IsValid(inv_trans) Then 
	destroy inv_trans
End If
end event

on n_pfcsecurity_appmanager.create
call super::create
end on

on n_pfcsecurity_appmanager.destroy
call super::destroy
end on

