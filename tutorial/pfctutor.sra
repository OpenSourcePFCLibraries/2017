HA$PBExportHeader$pfctutor.sra
$PBExportComments$PowerBuilder Foundation Class Library Tutorial application object
forward
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
n_cst_appmanager   gnv_app   

end variables

global type pfctutor from application
 end type
global pfctutor pfctutor

on pfctutor.create
appname = "pfctutor"
message = create message
sqlca = create transaction
sqlda = create dynamicdescriptionarea
sqlsa = create dynamicstagingarea
error = create error
end on

on pfctutor.destroy
destroy( sqlca )
destroy( sqlda )
destroy( sqlsa )
destroy( error )
destroy( message )
end on

event close;gnv_app.Event pfc_Close()
DESTROY gnv_app
end event

event connectionbegin;ConnectPrivilege  lcp_privilege

lcp_privilege =  &
	gnv_app.Event pfc_ConnectionBegin(userid, password, connectstring)
Return lcp_privilege 
end event

event connectionend;gnv_app.Event pfc_ConnectionEnd()

end event

event idle;gnv_app.Event pfc_Idle()

end event

event systemerror;gnv_app.Event pfc_SystemError()

end event

