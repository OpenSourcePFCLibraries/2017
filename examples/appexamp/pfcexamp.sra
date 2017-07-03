HA$PBExportHeader$pfcexamp.sra
forward
global n_tr sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global n_msg message
end forward

global variables
n_ExampleAppManager gnv_app 
end variables

global type pfcexamp from application
 end type
global pfcexamp pfcexamp

on pfcexamp.create
appname = "pfcexamp"
message = create n_msg
sqlca = create n_tr
sqlda = create dynamicdescriptionarea
sqlsa = create dynamicstagingarea
error = create error
end on

on pfcexamp.destroy
destroy( sqlca )
destroy( sqlda )
destroy( sqlsa )
destroy( error )
destroy( message )
end on

event open;//////////////////////////////////////////////////////////////////////////////
//	Event:			open
//	Arguments:		None
//	Returns:			None
//	Description:		Creates the Application Manager, n_exampleappmanager, as gnv_app,
// 						then triggers its pfc_open event.
//////////////////////////////////////////////////////////////////////////////
gnv_app = create n_exampleappmanager

gnv_app.TriggerEvent ( "pfc_open" )
end event

event close;//////////////////////////////////////////////////////////////////////////////
//	Event:			close
//	Arguments:		None
//	Returns:			None
//	Description:		Triggers the pfc_close event on gnv_app, then destroys the Application Manager.
//////////////////////////////////////////////////////////////////////////////
gnv_app.TriggerEvent ( "pfc_close" )
If IsValid ( gnv_app ) Then Destroy gnv_app
end event

event systemerror;//////////////////////////////////////////////////////////////////////////////
//	Event:			systemerror
//	Arguments:		None
//	Returns:			None
//	Description:		Triggers the pfc_systemerror event on the Application Manager (gnv_app).
//////////////////////////////////////////////////////////////////////////////
gnv_app.event pfc_systemerror ( )
end event

