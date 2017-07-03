HA$PBExportHeader$peat.sra
$PBExportComments$Project Estimating and Actuals Tracking
forward
global n_tr sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global n_err error
global n_msg message
end forward

global variables
//Application Attributes and Services
n_cst_peat	 gnv_app
end variables

global type peat from application
 end type
global peat peat

on peat.create
appname = "peat"
message = create n_msg
sqlca = create n_tr
sqlda = create dynamicdescriptionarea
sqlsa = create dynamicstagingarea
error = create n_err
end on

on peat.destroy
destroy( sqlca )
destroy( sqlda )
destroy( sqlsa )
destroy( error )
destroy( message )
end on

event open;/***
 *** Redirect the open message to the Application Manager
 ***/
gnv_app = CREATE n_cst_peat
 
gnv_app.Event Static Trigger pfc_open(CommandParm())
end event

event close;/***
 *** Redirect the close message to the Application Manager
 ***/
gnv_app.Event Static Trigger pfc_close()

DESTROY gnv_app
end event

event idle;/***
 *** Redirect the idle message to the Application Manager
 ***/
gnv_app.Event Static Trigger pfc_idle()
end event

event systemerror;/***
 *** Redirect the systemerror message to the Application Manager
 ***/
//gnv_app.Event Static Trigger pfc_systemerror()
end event

