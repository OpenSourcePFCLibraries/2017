HA$PBExportHeader$n_exampleappmanager.sru
$PBExportComments$Application Manager for the PFC Examples Application.
forward
global type n_exampleappmanager from n_cst_appmanager
end type
end forward

global type n_exampleappmanager from n_cst_appmanager
end type
global n_exampleappmanager n_exampleappmanager

type variables
end variables

forward prototypes
public function boolean of_isregistryavailable ()
end prototypes

public function boolean of_isregistryavailable ();Return True
end function

on n_exampleappmanager.create
call super::create
end on

on n_exampleappmanager.destroy
call super::destroy
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//	Event:			constructor
//	Description:		Initializes the Application Manager and starts application level services.
//////////////////////////////////////////////////////////////////////////////
ContextInformation lcx_key
int li_major, li_minor
date ld_now

ld_now = Today ( )

/*  Get PB Version.    */
GetContextService ( "ContextInformation", lcx_key )
lcx_key.GetMajorVersion ( li_major )
lcx_key.GetMinorVersion ( li_minor )

// Name of the application
iapp_object.displayname = "PFC Examples"

// Microhelp functionality
of_SetMicroHelp ( True )

// Application registry key
of_SetAppKey ( "HKEY_LOCAL_MACHINE\Software\Appeon\PowerBuilder\" + &
	String ( li_major ) + "." + String ( li_minor ) + "\PFC Examples" )

// User registry key
of_SetUserKey ( "HKEY_CURRENT_USER\Software\Appeon\PowerBuilder\" + &
	String ( li_major ) + "." + String ( li_minor ) + "\PFC Examples" )
	
// The file name of the application's online help file
of_SetHelpFile ( "pfcexamp.hlp" )

// The application version
of_SetVersion ( "Version " + String ( li_major ) + "." + String ( li_minor ) + ".00" )

// The application logo (bitmap file name)
of_SetLogo ( "pfcexamp.bmp" )

// Application copyright message
of_SetCopyRight ( "Copyright (c) 2004-" + String ( Year ( ld_now ), "0000" ) + " Open Source PowerBuilder Foundation Class Libraries" )

//Start the Application's MRU service
of_SetMRU ( True )

//Set MRU service defaults
If IsValid ( inv_mru ) Then
	inv_mru.of_SetUseRegistry ( True )
	inv_mru.of_SetUserKey ( of_GetUserKey (  ) )
End If

//Start the Application's Preference service
of_SetAppPreference ( True )

//Set Application Preferences service defaults
If IsValid ( inv_apppref ) Then
	inv_apppref.of_SetRestoreApp ( False )
	inv_apppref.of_SetRestoreUser ( True )
	inv_apppref.of_SetUserKey ( of_GetUserKey (  ) )
End If
end event

event pfc_close;call super::pfc_close;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_close
//	Arguments:		None
//	Returns:			None
//	Description:		Destroys application level service objects.
//////////////////////////////////////////////////////////////////////////////
If IsValid ( sqlca ) Then Destroy sqlca
If IsValid ( inv_trregistration ) Then Destroy inv_trregistration
If IsValid ( inv_error ) Then Destroy inv_error
If IsValid ( inv_dwcache ) Then Destroy inv_dwcache
end event

event pfc_open;call super::pfc_open;//////////////////////////////////////////////////////////////////////////////
//	Event:		pfc_open
//	Arguments:	as_commandline   	Any Command Line parameter that was supplied
//											when application was launched.
//	Returns:		None
//////////////////////////////////////////////////////////////////////////////
integer		li_rc
long    		ll_return
string			ls_initpath
string			ls_regkey
string			ls_temp

// Initialize SQLCA
SQLCA.DBMS 		= "ODBC"
SQLCA.DBParm 	= "ConnectString='DSN=EAS Demo DB V120;UID=dba;PWD=sql',DelimitIdentifier='Yes'"

//Connect to application database.
If SQLCA.of_connect (  ) <> 0 Then
	MessageBox ( "Cannot Connect to Database", SQLCA.sqlerrtext, stopsign! )
	Halt Close
	Return
End If

//Give the transaction a name.
SQLCA.of_SetName ( "Main-Trans" )

//Enable the Error service.
of_SetError ( True )

//Set the data source for loading predefined messages.
inv_error.of_SetPredefinedSource ( SQLCA )

// Display the Splash window
of_Splash ( 1 )

// Start application services.
of_SetTrRegistration ( True )
of_SetDebug ( True )
inv_debug.of_SetDWProperty ( True )

//Open Front End GUI window object.
Open ( w_examplemain )
end event

event pfc_systemerror;call super::pfc_systemerror;halt close
end event

