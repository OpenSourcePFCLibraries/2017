HA$PBExportHeader$w_listview.srw
$PBExportComments$Window showing a ListView Populated from a datawindow object
forward
global type w_listview from w_main
end type
type lv_1 from u_lv within w_listview
end type
type cb_close from u_cb within w_listview
end type
end forward

global type w_listview from w_main
integer x = 594
integer y = 696
integer width = 2094
integer height = 1484
string title = "PFC Example - (5.x) Basic Listview"
lv_1 lv_1
cb_close cb_close
end type
global w_listview w_listview

event open;call super::open;If lv_1.of_SetDatasource("d_products", SQLCA, "description", "picture_name") < 0 Then
	MessageBox("Error", "Error in of_setdatasource", Exclamation!)
End If

lv_1.of_AddColumns()

lv_1.Post of_populate()

end event

on w_listview.create
int iCurrent
call super::create
this.lv_1=create lv_1
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lv_1
this.Control[iCurrent+2]=this.cb_close
end on

on w_listview.destroy
call super::destroy
destroy(this.lv_1)
destroy(this.cb_close)
end on

type lv_1 from u_lv within w_listview
long textcolor = 33554432
long backcolor = 1086902488
boolean editlabels = true
integer largepicturewidth = 0
integer largepictureheight = 0
long largepicturemaskcolor = 12632256
long smallpicturemaskcolor = 12632256
integer x = 59
integer y = 52
integer width = 1934
integer height = 1132
end type

event constructor;call u_lv::constructor;ib_RMBMenu = True
end event

type cb_close from u_cb within w_listview
string text = "Close"
integer x = 1637
integer y = 1240
integer taborder = 2
end type

event clicked;call u_cb::clicked;parent.event pfc_close()
end event

