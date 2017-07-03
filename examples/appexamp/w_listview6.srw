HA$PBExportHeader$w_listview6.srw
$PBExportComments$NEW for 6.0!  Window showing a ListView Populated from a datawindow object
forward
global type w_listview6 from w_main
end type
type lv_1 from u_lvs within w_listview6
end type
type cb_close from u_cb within w_listview6
end type
end forward

global type w_listview6 from w_main
integer x = 594
integer y = 696
integer width = 2094
integer height = 1484
string title = "PFC Example - Basic Listview"
lv_1 lv_1
cb_close cb_close
end type
global w_listview6 w_listview6

event open;call super::open;// register the datasource to drive listview population
If lv_1.inv_datasource.of_Register("description", "d_products", SQLCA) < 0 Then
	MessageBox("Error", "Error in of_Register", Exclamation!)
End If

// register the column in the data source which holds the picture references
lv_1.inv_datasource.of_SetPictureColumn("picture_name")

// add all the visible columns in the datasource to the report view of the listview
lv_1.inv_datasource.of_RegisterReportColumn()

// populate the listview
lv_1.Post Event pfc_populate()

end event

on w_listview6.create
int iCurrent
call super::create
this.lv_1=create lv_1
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lv_1
this.Control[iCurrent+2]=this.cb_close
end on

on w_listview6.destroy
call super::destroy
destroy(this.lv_1)
destroy(this.cb_close)
end on

type lv_1 from u_lvs within w_listview6
long backcolor = 1086902488
boolean editlabels = true
integer largepicturewidth = 0
integer largepictureheight = 0
integer x = 59
integer y = 52
integer width = 1934
integer height = 1132
end type

event constructor;of_SetRMBMenu(True)
of_SetUpdateable(False)

of_SetDataSource(True)
of_SetSort(true)

inv_sort.of_setcolumnheader(true)
inv_datasource.of_setconfirmondelete(true)
end event

event pfc_populate;return this.of_populate()
end event

event pfc_retrieve;any	la_args[20]

Return this.of_retrieve(la_args, ads_data)
end event

type cb_close from u_cb within w_listview6
string text = "Close"
integer x = 1637
integer y = 1240
integer taborder = 2
end type

event clicked;call u_cb::clicked;parent.event pfc_close()
end event

