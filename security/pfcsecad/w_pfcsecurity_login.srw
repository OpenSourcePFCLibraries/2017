HA$PBExportHeader$w_pfcsecurity_login.srw
$PBExportComments$Display database settings and allow user to change
forward
global type w_pfcsecurity_login from w_response
end type
type dw_info from u_dw within w_pfcsecurity_login
end type
type cb_ok from u_cb within w_pfcsecurity_login
end type
type cb_cancel from u_cb within w_pfcsecurity_login
end type
end forward

global type w_pfcsecurity_login from w_response
integer x = 1431
integer y = 884
integer width = 1120
integer height = 1244
string title = "Database Login"
long backcolor = 77956459
boolean center = true
dw_info dw_info
cb_ok cb_ok
cb_cancel cb_cancel
end type
global w_pfcsecurity_login w_pfcsecurity_login

type variables
Protected:
string is_ini_file
end variables

event open;call super::open;string ls_test
is_ini_file = gnv_app.of_getappinifile ( )

dw_info.reset()
dw_info.insertrow(0)
ls_test = ProfileString(is_ini_file,"Database","DBMS", "not found")
if ls_test = "not found" then
	messagebox(gnv_app.iapp_object.displayname,'Unable to open INI file "'+is_ini_file+'".~r~nHalting.',stopsign!)
	halt close
	return
end if

dw_info.object.DBMS[1]       =ls_test
dw_info.object.Database[1]   =ProfileString(is_ini_file,"Database","DataBase",         " ")
dw_info.object.LogID[1]      =ProfileString(is_ini_file,"Database","LogID",            " ")
dw_info.object.LogPass[1]    =ProfileString(is_ini_file,"Database","LogPass",      " ")
dw_info.object.ServerName[1] =ProfileString(is_ini_file,"Database","ServerName",       " ")
dw_info.object.UserID[1]     =ProfileString(is_ini_file,"Database","UserID",           " ")
dw_info.object.DBPass[1]    =ProfileString(is_ini_file,"Database","DbPass", " ")
dw_info.object.Lock[1]       =ProfileString(is_ini_file,"Database","Lock",             " ")
dw_info.object.DbParm[1]     =ProfileString(is_ini_file,"Database","DbParm",           " ")

this.of_setbase(true)
inv_base.of_center()

end event

on w_pfcsecurity_login.create
int iCurrent
call super::create
this.dw_info=create dw_info
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_info
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.cb_cancel
end on

on w_pfcsecurity_login.destroy
call super::destroy
destroy(this.dw_info)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

type dw_info from u_dw within w_pfcsecurity_login
integer width = 1088
integer height = 988
integer taborder = 30
string dataobject = "d_pfcsecurity_login_info"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
end type

event pfc_prermbmenu;call super::pfc_prermbmenu;// Set up the PopUp Menu.
am_dw.m_table.m_dash11.visible = false
am_dw.m_table.m_insert.visible = False
am_dw.m_table.m_addrow.visible = False
am_dw.m_table.m_delete.visible = False

end event

event constructor;call super::constructor;of_setupdateable(false)
end event

type cb_ok from u_cb within w_pfcsecurity_login
integer x = 151
integer y = 1036
integer taborder = 10
string text = "OK"
boolean default = true
end type

event clicked;call super::clicked;if dw_info.accepttext() = -1 then return


gnv_app.inv_trans.DBMS       =dw_info.object.DBMS[1]
gnv_app.inv_trans.Database   =dw_info.object.DataBase[1]
gnv_app.inv_trans.LogID      =dw_info.object.Logid[1]
gnv_app.inv_trans.LogPass    =dw_info.object.LogPass[1]
gnv_app.inv_trans.ServerName =dw_info.object.ServerName[1]
gnv_app.inv_trans.UserID     =dw_info.object.UserID[1]
gnv_app.inv_trans.DBPass     =dw_info.object.DbPass[1]
gnv_app.inv_trans.Lock       =dw_info.object.Lock[1]
gnv_app.inv_trans.DbParm     =dw_info.object.DbParm[1]

connect using gnv_app.inv_trans;

if gnv_app.inv_trans.sqlcode <> 0 then
	// error on connect
	return
end if

if dw_info.modifiedcount() > 0 then
	setprofilestring(is_ini_file,'Database','DBMS',gnv_app.inv_trans.dbms)
	setprofilestring(is_ini_file,'Database','Database',gnv_app.inv_trans.database)
	setprofilestring(is_ini_file,'Database','logid',gnv_app.inv_trans.logid)
	setprofilestring(is_ini_file,'Database','logpass',gnv_app.inv_trans.logpass)
	setprofilestring(is_ini_file,'Database','servername',gnv_app.inv_trans.servername)
	setprofilestring(is_ini_file,'Database','userid',gnv_app.inv_trans.userid)
	setprofilestring(is_ini_file,'Database','DBPass',gnv_app.inv_trans.DBPass)
	setprofilestring(is_ini_file,'Database','lock',gnv_app.inv_trans.lock)
	setprofilestring(is_ini_file,'Database','DBparm',gnv_app.inv_trans.dbparm)
end if

close(parent)

end event

type cb_cancel from u_cb within w_pfcsecurity_login
integer x = 594
integer y = 1036
integer taborder = 20
string text = "Cancel"
boolean cancel = true
end type

event clicked;call super::clicked;close(parent)
end event

