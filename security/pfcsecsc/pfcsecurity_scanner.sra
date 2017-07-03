HA$PBExportHeader$pfcsecurity_scanner.sra
$PBExportComments$PFC Security Scanner Application
forward
global type pfcsecurity_scanner from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
transaction inv_trans
constant string gs_displayname = 'PFC Security Scanner Utility'
end variables

global type pfcsecurity_scanner from application
string appname = "pfcsecurity_scanner"
end type
global pfcsecurity_scanner pfcsecurity_scanner

on pfcsecurity_scanner.create
appname="pfcsecurity_scanner"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on pfcsecurity_scanner.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;string ls_ini_file
integer	li_rc

// This script will read all the database values from the ini file
//   and store them in gnv_app.inv_trans.
ls_ini_file = "pfcsecad.ini"
inv_trans = create transaction

inv_trans.DBMS = ProfileString(ls_ini_file,"Database","DBMS", "NA")
if inv_trans.DBMS = 'NA' then
	messagebox('Scanner Startup','Unable to open '+ls_ini_file+'. Application halting.')
	halt close
	return
end if

inv_trans.Database		= ProfileString(ls_ini_file,"Database","DataBase",         " ")
inv_trans.LogID			= ProfileString(ls_ini_file,"Database","LogID",            " ")
inv_trans.LogPass			= ProfileString(ls_ini_file,"Database","LogPassword",      " ")
inv_trans.ServerName		= ProfileString(ls_ini_file,"Database","ServerName",       " ")
inv_trans.UserID			= ProfileString(ls_ini_file,"Database","UserID",           " ")
inv_trans.DBPass			= ProfileString(ls_ini_file,"Database","DatabasePassword", " ")
inv_trans.Lock				= ProfileString(ls_ini_file,"Database","Lock",             " ")
inv_trans.DbParm			= ProfileString(ls_ini_file,"Database","DbParm",           " ")

connect using inv_trans;
IF inv_trans.SQLCode <> 0 then
	messagebox('Database','Unable to connect')
	halt close
	return
end if

open(w_pfcsecurity_targetselection)
end event

event systemerror;string 	ls_message

ls_message = 'Error Number '+string(error.number) & 
	+'.~r~nError text = '+Error.text &
	+'.~r~nWindow/Menu/Object = '+error.windowmenu &
	+'.~r~nError Object/Control = '+Error.object &
	+'.~r~nScript = '+Error.objectevent &
	+'.~r~nLine in Script = '+string(Error.line) + '.'
	
messagebox('System Error',ls_message, StopSign!, Ok!)

halt close
end event

event close;disconnect using inv_trans;

If IsValid(inv_trans) Then
	destroy inv_trans
End If
end event

