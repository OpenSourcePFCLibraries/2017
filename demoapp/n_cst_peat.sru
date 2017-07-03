HA$PBExportHeader$n_cst_peat.sru
$PBExportComments$PEAT Application Manager class
forward
global type n_cst_peat from n_cst_appmanager
end type
end forward

global type n_cst_peat from n_cst_appmanager
end type
global n_cst_peat n_cst_peat

forward prototypes
public function integer of_refreshprojects ()
end prototypes

public function integer of_refreshprojects ();// This function will find the active sheet and refresh the projects listed there.
// This function is called whenever a change has been made to the current project,
// a new project added, or the current project deleted.

w_s_projectlist	w_active

w_active = this.of_getframe().GetActiveSheet()
IF IsValid(w_active) THEN
	Return w_s_projectlist.of_refresh()
END IF

Return 0
end function

on n_cst_peat.create
call super::create
end on

on n_cst_peat.destroy
call super::destroy
end on

event pfc_open;call super::pfc_open;integer	li_return
string	ls_inifile

// Display the Splash window
this.of_Splash(1)

// Initialize the various functionality of this service
this.of_SetTrRegistration(TRUE)
this.of_SetError(TRUE)
inv_error.of_SetPredefinedSource(SQLCA)

// Connect to database
ls_inifile = gnv_app.of_GetAppIniFile()
IF SQLCA.of_Init(ls_inifile, "Database") = -1 THEN
	this.inv_error.of_message(gnv_app.iapp_object.DisplayName, + &
			"Error initializing connection information, .INI file not found.")
ELSE
	IF SQLCA.of_Connect() = -1 THEN
		this.inv_error.of_message(gnv_app.iapp_object.DisplayName, + &
				"Error connecting to Database.", StopSign!, OK!)
	ELSE
		Open(w_f_peat)
	END IF 
END IF
end event

event constructor;call super::constructor;ContextInformation lcx_key
int li_major, li_minor
date ld_now

ld_now = Today ( )

/*  Get PB Version.    */
GetContextService ( "ContextInformation", lcx_key)
lcx_key.GetMajorVersion ( li_major )
lcx_key.GetMinorVersion ( li_minor )

// Set the default information needed for this application
iapp_object.DisplayName = "PEAT - Project Estimation and Actuals Tracker"
this.of_SetCopyright("Copyright (c) 2004-" + String ( Year ( ld_now ), "0000" ) + " Open Source PowerBuilder Foundation Class Libraries, All rights reserved.")
this.of_SetLogo("peat.bmp")
this.of_SetVersion("Version " + String ( li_major ) + "." + String ( li_minor ) + ".00")
this.of_SetAppIniFile("peat.ini")



end event

