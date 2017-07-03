HA$PBExportHeader$generic_pfc_app.sra
$PBExportComments$PFC-Based Application
forward
global n_tr sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global n_msg message
end forward

global variables
/*  Application Manager  */
n_cst_appmanager gnv_app 
end variables

global type generic_pfc_app from application
 end type
global generic_pfc_app generic_pfc_app

on generic_pfc_app.create
appname = "generic_pfc_app"
message = create n_msg
sqlca = create n_tr
sqlda = create dynamicdescriptionarea
sqlsa = create dynamicstagingarea
error = create error
end on

on generic_pfc_app.destroy
destroy( sqlca )
destroy( sqlda )
destroy( sqlsa )
destroy( error )
destroy( message )
end on

event open;gnv_app = create n_cst_appmanager

gnv_app.TriggerEvent ( "pfc_open" )
end event

event close;gnv_app.TriggerEvent ( "pfc_close" )

If IsValid ( gnv_app ) Then Destroy gnv_app
end event

event systemerror;gnv_app.Event pfc_systemerror ( )
end event

event connectionbegin;Return gnv_app.Event pfc_connectionbegin ( userid, password, connectstring )
end event

event connectionend;gnv_app.Event pfc_connectionend (  )
end event

event idle;gnv_app.Event pfc_idle (  )
end event

