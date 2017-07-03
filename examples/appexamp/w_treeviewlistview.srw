HA$PBExportHeader$w_treeviewlistview.srw
$PBExportComments$Example of linking a TreeView with a ListView (5.0)
forward
global type w_treeviewlistview from w_main
end type
type tv_1 from u_tv within w_treeviewlistview
end type
type lv_1 from u_lv within w_treeviewlistview
end type
type cb_close from u_cb within w_treeviewlistview
end type
end forward

global type w_treeviewlistview from w_main
int X=14
int Y=4
int Height=1032
boolean TitleBar=true
string Title="PFC Example - (5.x) Treeview and a Listview"
boolean Resizable=false
tv_1 tv_1
lv_1 lv_1
cb_close cb_close
end type
global w_treeviewlistview w_treeviewlistview

event open;call super::open;tv_1.AddPicture("globals!")
tv_1.AddPicture("parameter!")
tv_1.AddPicture("library!")
tv_1.AddPicture("custom076!")
tv_1.AddPicture("scriptyes!")
tv_1.AddPicture("update!")
tv_1.AddPicture("custom050!")

lv_1.AddLargePicture("globals!")
lv_1.AddLargePicture("parameter!")
lv_1.AddLargePicture("library!")
lv_1.AddLargePicture("custom076!")
lv_1.AddLargePicture("scriptyes!")
lv_1.AddLargePicture("update!")
lv_1.AddSmallPicture("globals!")
lv_1.AddSmallPicture("parameter!")
lv_1.AddSmallPicture("library!")
lv_1.AddSmallPicture("custom076!")
lv_1.AddSmallPicture("scriptyes!")
lv_1.AddSmallPicture("update!")

// Register the datasource for each level of the tree
// Parameters are: level, datawindow object, transaction object, column to display as the label, 
// the retrieval arugments, and whether the DW object is to be used recursively.
// Optional parameters are:  picture indes, selected picture indes, state picture indes, and overlay picture index
tv_1.of_SetDatasource(1, "d_region", SQLCA, "sales_regions_region", "", False, 1, 7)
tv_1.of_SetDatasource(2, "d_regionstate", SQLCA, "states_state_name", ":parent.1.sales_regions_region", False, 2, 7)
tv_1.of_SetDatasource(3, "d_regionstatecust", SQLCA, "customer_company_name", &
	":parent.2.sales_regions_region, :parent.1.states_state_id", False, 3, 7)
tv_1.of_SetDatasource(4, "d_regionstatecustrep", SQLCA, "employee_emp_lname", &
	":parent.1.customer_id", False, 4, 7)
tv_1.of_SetDatasource(5, "d_regionstatecustrepord", SQLCA, "order_id_string", &
	":parent.2.customer_id, :parent.1.employee_emp_id", False, 5,  7)

tv_1.of_InitialRetrieve()

end event

on w_treeviewlistview.create
int iCurrent
call super::create
this.tv_1=create tv_1
this.lv_1=create lv_1
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tv_1
this.Control[iCurrent+2]=this.lv_1
this.Control[iCurrent+3]=this.cb_close
end on

on w_treeviewlistview.destroy
call super::destroy
destroy(this.tv_1)
destroy(this.lv_1)
destroy(this.cb_close)
end on

type tv_1 from u_tv within w_treeviewlistview
int X=27
int Y=24
int Width=1175
int Height=740
int TabOrder=10
boolean LinesAtRoot=true
boolean HideSelection=false
long PictureMaskColor=12632256
long StatePictureMaskColor=12632256
long BackColor=1090519039
FontCharSet FontCharSet=Ansi!
end type

event selectionchanged;//String				ls_DataObject, ls_LabelCol, ls_PictureCol
Long					ll_Parent, ll_Row
Integer				li_RC
Any					la_Args[20]
TreeViewItem		ltvi_New, ltvi_Parent

SetPointer(HourGlass!)
lv_1.SetRedraw(False)

GetItem(newhandle, ltvi_New)

// Set the ListView items
Choose Case ltvi_New.Level
	Case 1
		li_RC = lv_1.of_SetDatasource("d_regionstate", SQLCA, "states_state_name", "2")
	Case 2
		li_RC = lv_1.of_SetDatasource("d_regionstatecust", SQLCA, "customer_company_name", "3")
	Case 3
		li_RC = lv_1.of_SetDatasource("d_regionstatecustrep", SQLCA, "employee_emp_lname", "4")
	Case 4
		li_RC = lv_1.of_SetDatasource("d_regionstatecustrepord", SQLCA, "order_id_string", "5")
	Case 5
		li_RC = lv_1.of_SetDatasource("d_regionstatecustreporditm", SQLCA, "product_description", "product_picture_name")
End Choose

If li_RC < 0 Then
	MessageBox("Error", "Error in of_SetDatasource", Exclamation!)
	Return
End If
lv_1.of_AddColumns()

If ltvi_New.Level < 5 Then
	of_GetArgs(newhandle, (ltvi_New.Level + 1), la_Args)
Else
	la_Args[1] = Integer(ltvi_New.Label)
End If
lv_1.of_populate(la_Args)

lv_1.SetRedraw(True)

end event

type lv_1 from u_lv within w_treeviewlistview
int X=1221
int Y=24
int Width=1408
int Height=740
int TabOrder=20
int LargePictureWidth=0
int LargePictureHeight=0
long LargePictureMaskColor=12632256
long SmallPictureMaskColor=12632256
long StatePictureMaskColor=12632256
long TextColor=33554432
long BackColor=1080593568
end type

event constructor;call u_lv::constructor;ib_RMBMenu = True
end event

event doubleclicked;integer		 	li_level
long			 	ll_currenttvitem, ll_selectedtreehandle
string			ls_lvlabel
listviewitem 	llvi_selectedlvitem
treeviewitem 	ltvi_newtreeitem, ltvi_startingtreeitem

// Get the listview item that was doubleclicked.
this.GetItem(index, llvi_selectedlvitem)
ls_lvlabel = llvi_selectedlvitem.label

// Determine which treeview item is currently selected and get it
ll_currenttvitem = tv_1.FindItem(currenttreeitem!, 0)
tv_1.GetItem(ll_currenttvitem, ltvi_startingtreeitem)

// Set a local variable to the level of the currently selected treeview item.
li_level = ltvi_startingtreeitem.level

// Determine if the currently selected treeview item has been expanded.  
// If it hasn't, expand it. (expanding also populates)
// This loads the treeview with the listview information
if ltvi_startingtreeitem.expanded = false then
	tv_1.ExpandItem(ll_currenttvitem)
end if

// Get the handle of the treeview item that corresponds to the list view item that was doubleclicked.
ll_selectedtreehandle = tv_1.of_FindItem("label", ls_lvlabel, ll_currenttvitem,&
	(li_level + 1), true, true)

// Get the state information of the treeview item that corresponds to the list view item that was doubleclicked.
If tv_1.GetItem(ll_selectedtreehandle, ltvi_newtreeitem) < 1 Then Return -1

// Select and Expand the selected treeview item.
if ltvi_newtreeitem.expanded = false then
	tv_1.SelectItem(ll_selectedtreehandle)
	tv_1.ExpandItem(ll_selectedtreehandle)
end if

end event

type cb_close from u_cb within w_treeviewlistview
int X=2272
int Y=792
int TabOrder=30
string Text="Close"
boolean Cancel=true
end type

event clicked;call u_cb::clicked;Parent.event pfc_close()
end event

