HA$PBExportHeader$w_treeview.srw
$PBExportComments$Linking a Tree View with DW
forward
global type w_treeview from w_main
end type
type tv_1 from u_tv within w_treeview
end type
type dw_1 from u_dw within w_treeview
end type
type st_level from u_st within w_treeview
end type
type sle_level from u_sle within w_treeview
end type
type cb_refreshlevel from u_cb within w_treeview
end type
type cb_refreshitem from u_cb within w_treeview
end type
type cb_refreshtree from u_cb within w_treeview
end type
type cb_insertrow from u_cb within w_treeview
end type
type cb_deleteitem from u_cb within w_treeview
end type
type cb_updatetree from u_cb within w_treeview
end type
type cb_close from u_cb within w_treeview
end type
end forward

global type w_treeview from w_main
integer x = 5
integer y = 4
integer width = 2921
integer height = 1044
string title = "PFC Example - (5.x) Basic Tree View"
long backcolor = 67108864
tv_1 tv_1
dw_1 dw_1
st_level st_level
sle_level sle_level
cb_refreshlevel cb_refreshlevel
cb_refreshitem cb_refreshitem
cb_refreshtree cb_refreshtree
cb_insertrow cb_insertrow
cb_deleteitem cb_deleteitem
cb_updatetree cb_updatetree
cb_close cb_close
end type
global w_treeview w_treeview

type variables
Long	il_DSRow
end variables

event open;call super::open;// enable the base dw service to repopulate dddws
dw_1.of_setbase(true)

tv_1.AddPicture("globals!")
tv_1.AddPicture("parameter!")
tv_1.AddPicture("library!")
tv_1.AddPicture("custom076!")
tv_1.AddPicture("scriptyes!")
tv_1.AddPicture("update!")
tv_1.AddPicture("custom050!")

// Register the datasource for each level of the tree
// Parameters are: level, datawindow object, transaction object, column to display as the label, 
// the retrieval arugments, and whether the DW object is to be used recursively.
// Optional parameters are:  picture indes, selected picture indes, state picture indes, and overlay picture index
tv_1.of_SetDatasource(1, "d_region", SQLCA, "region", "", False, 1, 7)
tv_1.of_SetDatasource(2, "d_regionstate", SQLCA, "states_state_name", ":parent.1.region", False, 2, 7)
tv_1.of_SetDatasource(3, "d_regionstatecust", SQLCA, "customer_company_name", ":parent.2.region, :parent.1.states_state_id", False, 3, 7)
tv_1.of_SetDatasource(4, "d_regionstatecustrep", SQLCA, "employee_emp_lname", &
										":parent.1.customer_id", False, 4, 7)
tv_1.of_SetDatasource(5, "d_regionstatecustrepord", SQLCA, "order_id_string", &
										":parent.2.customer_id, :parent.1.employee_emp_id", False, 5,  7)
tv_1.of_SetDatasource(6, "d_regionstatecustreporditm", SQLCA, "product_description", &
										":parent.1.sales_order_id", False, 6,  7)

tv_1.of_InitialRetrieve()

end event

on w_treeview.create
int iCurrent
call super::create
this.tv_1=create tv_1
this.dw_1=create dw_1
this.st_level=create st_level
this.sle_level=create sle_level
this.cb_refreshlevel=create cb_refreshlevel
this.cb_refreshitem=create cb_refreshitem
this.cb_refreshtree=create cb_refreshtree
this.cb_insertrow=create cb_insertrow
this.cb_deleteitem=create cb_deleteitem
this.cb_updatetree=create cb_updatetree
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tv_1
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.st_level
this.Control[iCurrent+4]=this.sle_level
this.Control[iCurrent+5]=this.cb_refreshlevel
this.Control[iCurrent+6]=this.cb_refreshitem
this.Control[iCurrent+7]=this.cb_refreshtree
this.Control[iCurrent+8]=this.cb_insertrow
this.Control[iCurrent+9]=this.cb_deleteitem
this.Control[iCurrent+10]=this.cb_updatetree
this.Control[iCurrent+11]=this.cb_close
end on

on w_treeview.destroy
call super::destroy
destroy(this.tv_1)
destroy(this.dw_1)
destroy(this.st_level)
destroy(this.sle_level)
destroy(this.cb_refreshlevel)
destroy(this.cb_refreshitem)
destroy(this.cb_refreshtree)
destroy(this.cb_insertrow)
destroy(this.cb_deleteitem)
destroy(this.cb_updatetree)
destroy(this.cb_close)
end on

type tv_1 from u_tv within w_treeview
integer x = 64
integer y = 56
integer width = 827
integer height = 812
integer taborder = 10
long textcolor = 41943040
long backcolor = 1080593568
boolean linesatroot = true
boolean hideselection = false
long picturemaskcolor = 12632256
long statepicturemaskcolor = 12632256
end type

event endlabeledit;call u_tv::endlabeledit;TreeViewItem		ltvi_Item

GetItem(handle, ltvi_Item)

If ltvi_Item.Level = 1 Or ltvi_Item.Level = 5 Then
	of_RefreshItem(handle, il_DSRow)
End If

Post Event SelectionChanged(handle, handle)

end event

event selectionchanging;n_ds					lds_DataStore
TreeViewItem		ltvi_New

SetPointer(HourGlass!)
dw_1.SetRedraw(False)

GetItem(newhandle, ltvi_New)

// Get the DataStore and row for the new item
If of_GetDataRow(newhandle, lds_DataStore, il_DSRow) = -1 Then
	MessageBox("Error", "Error in of_getdatarow", exclamation!)
	return
End If

// Set dw_1 to use the new DataStore
dw_1.Reset()
dw_1.DataObject = lds_DataStore.DataObject

// Copy only the row for the selected item in the DataStore
lds_DataStore.RowsCopy(il_DSRow, il_DSRow, Primary!, dw_1, 1, Primary!)

// Set status flag of new row
// The new row is copied as NewModified!
Choose Case lds_DataStore.GetItemStatus(il_DSRow, 0, Primary!)
	Case New!
		dw_1.SetItemStatus(1, 0, Primary!, NotModified!)
	Case DataModified!
		dw_1.SetItemStatus(1, 0, Primary!, DataModified!)
	Case NotModified!
		dw_1.SetItemStatus(1, 0, Primary!, DataModified!)
		dw_1.SetItemStatus(1, 0, Primary!, NotModified!)
End Choose

// refresh the dddws on the dw
dw_1.of_settransobject(SQLCA)
dw_1.inv_base.of_PopulateDDDW()

dw_1.SetRedraw(True)

sle_level.Text = string(ltvi_new.level)
end event

type dw_1 from u_dw within w_treeview
integer x = 919
integer y = 56
integer width = 1550
integer height = 812
integer taborder = 20
boolean hscrollbar = true
end type

event clicked;call u_dw::clicked;SelectRow(0, False)
SelectRow(row, True)

end event

event pfc_prermbmenu;call super::pfc_prermbmenu;// Set up the PopUp Menu.
am_dw.m_table.m_insert.enabled = False
am_dw.m_table.m_addrow.enabled = False
am_dw.m_table.m_delete.enabled = False

end event

type st_level from u_st within w_treeview
integer x = 2537
integer y = 60
integer width = 142
long textcolor = 41943040
long backcolor = 79219928
string text = "Level:"
end type

type sle_level from u_sle within w_treeview
integer x = 2697
integer y = 60
integer width = 82
integer height = 64
integer taborder = 30
long textcolor = 41943040
long backcolor = 79219928
string text = "1"
end type

type cb_refreshlevel from u_cb within w_treeview
integer x = 2514
integer y = 148
integer width = 325
integer taborder = 40
string text = "Refresh Level"
end type

event clicked;call u_cb::clicked;dw_1.Reset()
tv_1.of_RefreshLevel(Integer(sle_level.Text))

end event

type cb_refreshitem from u_cb within w_treeview
integer x = 2514
integer y = 252
integer width = 325
integer taborder = 50
boolean bringtotop = true
string text = "Refresh Item"
end type

event clicked;call u_cb::clicked;dw_1.Reset()
tv_1.of_RefreshItem(tv_1.FindItem(CurrentTreeItem!, 0), il_DSRow)
end event

type cb_refreshtree from u_cb within w_treeview
integer x = 2514
integer y = 356
integer width = 325
integer taborder = 60
boolean bringtotop = true
string text = "Refresh Tree"
end type

event clicked;call u_cb::clicked;dw_1.Reset()
tv_1.of_DiscardChildren(0)
tv_1.of_InitialRetrieve()

end event

type cb_insertrow from u_cb within w_treeview
integer x = 2514
integer y = 464
integer width = 325
integer taborder = 70
boolean bringtotop = true
string text = "Insert Row"
end type

event clicked;call u_cb::clicked;dw_1.RowsDiscard(1, 1, Primary!)

dw_1.InsertRow(0)
end event

type cb_deleteitem from u_cb within w_treeview
integer x = 2514
integer y = 568
integer width = 325
integer taborder = 80
boolean bringtotop = true
string text = "Delete Item"
end type

event clicked;Long					ll_Current

ll_Current = tv_1.FindItem(CurrentTreeItem!, 0)
If tv_1.of_DeleteItem(ll_Current) = -1 Then
	MessageBox("Error", "Error in of_deleteitem", Exclamation!)
	Return
End If
end event

type cb_updatetree from u_cb within w_treeview
integer x = 2514
integer y = 676
integer width = 325
integer taborder = 90
boolean bringtotop = true
string text = "Update Tree"
end type

event clicked;call super::clicked;Long					ll_Current
n_ds					lds_DataStore
TreeViewItem		ltvi_Current

ll_Current = tv_1.FindItem(CurrentTreeItem!, 0)
tv_1.GetItem(ll_Current, ltvi_Current)
If tv_1.of_GetDatastore(ltvi_Current.Level, lds_DataStore) = -1 Then
	MessageBox("Error", "Error in of_get_datastore", Exclamation!)
	Return
End If

Choose Case dw_1.GetItemStatus(1, 0, Primary!)
	Case New!, NewModified!
		// Add the new row
		dw_1.RowsCopy(1, 1, Primary!, lds_DataStore, 999999, Primary!)

		// Insert the item into the tree
		ll_Current = tv_1.of_InsertItem(tv_1.FindItem(ParentTreeItem!, ll_Current), lds_DataStore, lds_DataStore.RowCount(), "Last")
		If ll_Current = -1 Then
			MessageBox("Error", "Error in of_InsertItem", Exclamation!)
			Return
		End If
		tv_1.SelectItem(ll_Current)
		
	Case DataModified!
		// Discard the original row from the DataStore
		lds_DataStore.RowsDiscard(il_DSRow, il_DSRow, Primary!)
		
		// Add the new row
		dw_1.RowsCopy(1, 1, Primary!, lds_DataStore, il_DSRow, Primary!)
		
		// Reset the flag
		lds_DataStore.SetItemStatus(il_DSRow, 0, Primary!, DataModified!)

		// Refresh the item
		If tv_1.of_RefreshItem(ll_Current, il_DSRow) = -1 Then
			MessageBox("Error", "Error in of_RefreshItem", Exclamation!)
			Return
		End If
End Choose

end event

type cb_close from u_cb within w_treeview
integer x = 2514
integer y = 780
integer width = 325
integer taborder = 100
boolean bringtotop = true
string text = "Close"
end type

event clicked;call u_cb::clicked;parent.event pfc_close()
end event

