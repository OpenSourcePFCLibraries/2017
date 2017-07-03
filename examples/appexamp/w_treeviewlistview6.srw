HA$PBExportHeader$w_treeviewlistview6.srw
$PBExportComments$Example of linking a 6.0 treeview and a 6.0 listview
forward
global type w_treeviewlistview6 from w_main
end type
type tv_1 from u_tvs within w_treeviewlistview6
end type
type lv_1 from u_lvs within w_treeviewlistview6
end type
type cb_close from u_cb within w_treeviewlistview6
end type
end forward

global type w_treeviewlistview6 from w_main
integer x = 14
integer y = 4
integer width = 2734
integer height = 1044
string title = "PFC Example - Treeview Linked to a Listview"
long backcolor = 67108864
tv_1 tv_1
lv_1 lv_1
cb_close cb_close
end type
global w_treeviewlistview6 w_treeviewlistview6

type variables

end variables

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
// Parameters are: level, column to display as the label, retrieval arguments (to find from another tree level), 
// datawindow object, transaction object, the filter columns (if not filtered through the retrieve mechanism).

tv_1.inv_levelsource.of_Register(1, "sales_regions_region", "", "d_region", SQLCA, "")
tv_1.inv_levelsource.of_SetPictureColumn(1, "1")
tv_1.inv_levelsource.of_SetSelectedPictureColumn(1, "7")

tv_1.inv_levelsource.of_Register(2, "states_state_name", ":parent.1.sales_regions_region", &
												"d_regionstate", SQLCA, "")
tv_1.inv_levelsource.of_SetPictureColumn(2, "2")
tv_1.inv_levelsource.of_SetSelectedPictureColumn(2, "7")

tv_1.inv_levelsource.of_Register(3, "customer_company_name", ":parent.2.sales_regions_region, :parent.1.states_state_id",&
												"d_regionstatecust", SQLCA, "")
tv_1.inv_levelsource.of_SetPictureColumn(3, "3")
tv_1.inv_levelsource.of_SetSelectedPictureColumn(3, "7")

tv_1.inv_levelsource.of_Register(4, "employee_emp_lname", ":parent.1.customer_id", &
												"d_regionstatecustrep", SQLCA, "")
tv_1.inv_levelsource.of_SetPictureColumn(4, "4")
tv_1.inv_levelsource.of_SetSelectedPictureColumn(4, "7")

tv_1.inv_levelsource.of_Register(5, "order_id_string", ":parent.2.customer_id, :parent.1.employee_emp_id", &
												"d_regionstatecustrepord", SQLCA, "")
tv_1.inv_levelsource.of_SetPictureColumn(5, "5")
tv_1.inv_levelsource.of_SetSelectedPictureColumn(5, "7")

tv_1.event pfc_populate(0)

end event

on w_treeviewlistview6.create
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

on w_treeviewlistview6.destroy
call super::destroy
destroy(this.tv_1)
destroy(this.lv_1)
destroy(this.cb_close)
end on

type tv_1 from u_tvs within w_treeviewlistview6
integer x = 27
integer y = 24
integer width = 1175
integer height = 740
integer taborder = 10
long backcolor = 1080593568
boolean linesatroot = true
boolean hideselection = false
end type

event constructor;call super::constructor;of_setbase(true)
of_setlevelsource(true)
end event

event selectionchanged;// populate the listview to reflect the item changing
lv_1.event pfc_populate()

Return 1 
end event

event pfc_populate;return of_populate(al_parent)
end event

event pfc_retrieve;any la_args[20]
integer li_level

if isvalid(inv_levelsource) then
	li_level = of_getnextlevel(al_parent)
	inv_levelsource.of_getargs(al_parent, li_level, la_args)
end if

return of_retrieve(al_parent, la_args, ads_data)

end event

type lv_1 from u_lvs within w_treeviewlistview6
integer x = 1221
integer y = 24
integer width = 1408
integer height = 740
integer taborder = 20
long backcolor = 1080593568
integer largepicturewidth = 0
integer largepictureheight = 0
end type

event constructor;call super::constructor;of_setbase(true)
of_setdatasource(true)
of_setsort(true)
inv_sort.of_setcolumnheader(true)

of_setRMBMenu(True)

end event

event pfc_populate;// demonstrate two ways of getting level information from the tree

Integer				li_RC, li_level
long					ll_handle
string				ls_dataobject, ls_labelcolumn, ls_picturecolumn
treeviewitem		ltvi_selecteditem
n_tr					ltr_obj
n_cst_tvsrvattrib	lnv_tvattrib

//If ltvi_selecteditem.Level > 5 Then
//	Return NO_ACTION
//End If

// the current tree item children should be displayed on the listview
ll_handle = tv_1.FindItem(currenttreeitem!, 0)
tv_1.GetItem(ll_handle, ltvi_selecteditem)

li_level = ltvi_selecteditem.Level + 1

// used for normal registration
ls_dataobject = tv_1.inv_levelsource.of_getdataobject(li_level)
ls_labelcolumn = tv_1.inv_levelsource.of_getlabelcolumn(li_level)
ls_picturecolumn = tv_1.inv_levelsource.of_getpicturecolumn(li_level)
tv_1.inv_levelsource.of_gettransobject(li_level, ltr_obj)

// use for level 3 registration
tv_1.inv_levelsource.of_getlevelattributes(li_level, lnv_tvattrib)

// Set the ListView items
Choose Case ltvi_selecteditem.Level
	Case 1
		li_RC = lv_1.inv_datasource.of_register(ls_labelcolumn, ls_dataobject, ltr_obj)
		li_RC = lv_1.inv_datasource.of_SetPictureColumn(ls_picturecolumn)
	Case 2
		li_RC = lv_1.inv_datasource.of_register(ls_labelcolumn, ls_dataobject, ltr_obj)
		li_RC = lv_1.inv_datasource.of_SetPictureColumn(ls_picturecolumn)
	Case 3
		li_RC = lv_1.inv_datasource.of_register(lnv_tvattrib.is_labelcolumn, &
															lnv_tvattrib.is_dataobject, &
															lnv_tvattrib.itr_obj)
		li_RC = lv_1.inv_datasource.of_SetPictureColumn(lnv_tvattrib.is_picturecolumn)
	Case 4
		li_RC = lv_1.inv_datasource.of_register(ls_labelcolumn, ls_dataobject, ltr_obj)
		li_RC = lv_1.inv_datasource.of_SetPictureColumn(ls_picturecolumn)
	Case 5
		// not on the tree so register normally
		li_RC = lv_1.inv_datasource.of_register("product_description", "d_regionstatecustreporditm", SQLCA)
		li_RC = lv_1.inv_datasource.of_SetPictureColumn("product_picture_name")
End Choose

// add all the visible columns of the datasource to the report view
lv_1.inv_datasource.of_RegisterReportColumn()

Return of_populate()
end event

event pfc_retrieve;// load the retrieval arguments

long					ll_handle
any					la_args[20]
TreeViewItem		ltvi_item

ll_handle = tv_1.FindItem(currenttreeitem!, 0)
tv_1.GetItem(ll_handle, ltvi_item)

If ltvi_item.Level < 5 Then
	tv_1.inv_levelsource.of_GetArgs(ll_handle, (ltvi_item.Level + 1), la_Args)
Else
	la_Args[1] = Integer(ltvi_item.Label)
End If

Return of_retrieve(la_args, ads_data)
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
ll_selectedtreehandle = tv_1.inv_base.of_FindItem("label", ls_lvlabel, ll_currenttvitem,&
	(li_level + 1), true, true)

// Get the state information of the treeview item that corresponds to the list view item that was doubleclicked.
tv_1.GetItem(ll_selectedtreehandle, ltvi_newtreeitem)

// Select and Expand the selected treeview item.
if ltvi_newtreeitem.expanded = false then
	tv_1.SelectItem(ll_selectedtreehandle)
	tv_1.ExpandItem(ll_selectedtreehandle)
end if

end event

type cb_close from u_cb within w_treeviewlistview6
integer x = 2272
integer y = 792
integer taborder = 30
string text = "Close"
end type

event clicked;call super::clicked;Parent.event pfc_close()
end event

