HA$PBExportHeader$w_treeviewupdate6.srw
$PBExportComments$Example of updating a 6.0 treeview
forward
global type w_treeviewupdate6 from w_main
end type
type st_directions from u_st within w_treeviewupdate6
end type
type tv_1 from u_tvs within w_treeviewupdate6
end type
type cb_update from u_cb within w_treeviewupdate6
end type
type cb_refresh from u_cb within w_treeviewupdate6
end type
type cb_close from u_cb within w_treeviewupdate6
end type
end forward

global type w_treeviewupdate6 from w_main
integer x = 23
integer y = 8
integer width = 1728
integer height = 1960
string title = "PFC Example - Update a Treeview"
boolean resizable = false
st_directions st_directions
tv_1 tv_1
cb_update cb_update
cb_refresh cb_refresh
cb_close cb_close
end type
global w_treeviewupdate6 w_treeviewupdate6

type variables
Boolean	ib_Changed
end variables

on w_treeviewupdate6.create
int iCurrent
call super::create
this.st_directions=create st_directions
this.tv_1=create tv_1
this.cb_update=create cb_update
this.cb_refresh=create cb_refresh
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_directions
this.Control[iCurrent+2]=this.tv_1
this.Control[iCurrent+3]=this.cb_update
this.Control[iCurrent+4]=this.cb_refresh
this.Control[iCurrent+5]=this.cb_close
end on

on w_treeviewupdate6.destroy
call super::destroy
destroy(this.st_directions)
destroy(this.tv_1)
destroy(this.cb_update)
destroy(this.cb_refresh)
destroy(this.cb_close)
end on

event open;call super::open;integer			li_rc
Long				ll_Root
TreeViewItem	ltvi_Root

tv_1.AddPicture("custom041!")
tv_1.AddPicture("custom048!")
tv_1.AddPicture("custom067!")
tv_1.AddPicture("custom075!")
tv_1.AddPicture("custom085!")
tv_1.AddPicture("library!")
tv_1.AddPicture("custom076!")
tv_1.AddPicture("custom050!")

// Register the datasource for each level of the tree
// Parameters are: level, column to display as the label, retrieval arguments (to find from another tree level), 
// datawindow object, transaction object, the filter columns (if not filtered through the retrieve mechanism).
li_rc = tv_1.inv_levelsource.of_Register(2, "dept_name", "", "d_DeptList", SQLCA, "")
li_rc = tv_1.inv_levelsource.of_SetPictureColumn(2, "dept_index")
li_rc = tv_1.inv_levelsource.of_SetSelectedPictureColumn(2, "8")

li_rc = tv_1.inv_levelsource.of_Register(3, "emp_fullname", ":parent.1.dept_id", "d_DeptEmp", SQLCA, "")
li_rc = tv_1.inv_levelsource.of_SetPictureColumn(3, "7")
li_rc = tv_1.inv_levelsource.of_SetSelectedPictureColumn(3, "7")


// Add the root item
ltvi_Root.Label = "Company"
ltvi_Root.PictureIndex = 6
ltvi_Root.SelectedPictureIndex = 6
ltvi_Root.Children = True
ll_Root = tv_1.InsertItemLast(0, ltvi_Root)

tv_1.Post Function ExpandItem(ll_Root)

end event

type st_directions from u_st within w_treeviewupdate6
long textcolor = 41943040
string text = "To perform a transfer, drag and drop an employee on the new department."
integer x = 59
integer y = 52
integer width = 1138
integer height = 132
end type

type tv_1 from u_tvs within w_treeviewupdate6
long textcolor = 41943040
long backcolor = 1080593568
boolean linesatroot = true
boolean disabledragdrop = false
integer x = 59
integer y = 244
integer width = 1138
integer height = 1540
integer taborder = 10
boolean dragauto = true
end type

event begindrag;call super::begindrag;TreeViewItem		ltvi_Source

// Make sure only employees are being dragged
GetItem(il_DragSource, ltvi_Source)

If ltvi_Source.Level <> 3 Then This.Drag(Cancel!)
end event

event dragdrop;call super::dragdrop;Integer				li_DeptID
Long					ll_Row, ll_NewItem
n_ds					lds_DataStore
TreeViewItem		ltvi_Target, ltvi_Source

If GetItem(il_DragTarget, ltvi_Target) = -1 Then Return
If GetItem(il_DragSource, ltvi_Source) = -1 Then Return

// Only allow dropping an employee on a department
If ltvi_Target.Level <> 2 Or ltvi_Source.Level <> 3 Then Return

// Get the new Department ID
If this.inv_levelsource.of_GetDataRow(il_DragTarget, lds_DataStore, ll_Row) < 0 Then Return
li_DeptID = lds_DataStore.Object.dept_id[ll_Row]

// Update the appropriate row.  change the department id
If this.inv_levelsource.of_GetDataRow(il_DragSource, lds_DataStore, ll_Row) < 0 Then Return
lds_DataStore.Object.dept_id[ll_Row] = li_DeptID

// Move the item
// First delete the first item from the TreeView
// Do not call the pfc_u_tvs of_deleteitem function because it would also
// delete the row from the DataStore
DeleteItem(il_DragSource)

// If the new Department is not expanded, 
// expand it before add the new item
If Not ltvi_Target.Expanded Then
	this.Event ItemExpanding(il_DragTarget)
End If

// Call the pfc_u_tvs function to insert the item under the proper parent
ll_NewItem = this.of_InsertItem(il_DragTarget, lds_DataStore, ll_Row, INSERT_SORT, 0)

// Select the new item
SelectItem(ll_NewItem)

//ib_Changed = True

end event

event dragwithin;TreeViewItem		ltvi_Over

GetItem(handle, ltvi_Over)

// highlight level 2 items as a drag target
If ltvi_Over.Level = 2 Then
	//	ltvi_over.drophighlighted = true
	SelectItem(handle)
Else
	//	ltvi_over.drophighlighted = false
	SelectItem(0)
End If

end event

event constructor;call super::constructor;of_setbase(True)
of_setlevelsource(true)
of_setupdateable(true)
end event

event pfc_retrieve;any la_args[20]
integer li_level

if isvalid(inv_levelsource) then
	li_level = of_getnextlevel(al_parent)
	inv_levelsource.of_getargs(al_parent, li_level, la_args)
end if

return of_retrieve(al_parent, la_args, ads_data)

end event

event pfc_populate;return of_populate(al_parent)

end event

type cb_update from u_cb within w_treeviewupdate6
string text = "Update"
integer x = 1280
integer y = 52
integer height = 84
integer taborder = 20
end type

event clicked;ib_Changed = False

// only level 3 items changed so we only perform update on level 3
parent.event pfc_save()
//tv_1.inv_levelsource.of_update(3, true, true)
end event

type cb_refresh from u_cb within w_treeviewupdate6
string text = "Refresh"
integer x = 1280
integer y = 152
integer height = 84
integer taborder = 30
boolean bringtotop = true
end type

event clicked;call super::clicked;Integer li_rc

// perform update if yes, no action if cancel, 
// refresh (move back to original state) if do not want to save changes
If ib_Changed Then
	li_rc = MessageBox("Warning", "You have made changes to the data.  " +&
			           "Do you which to save them before you refresh the Tree?", Question!, YesNoCancel!, 1)
	Choose Case li_rc
		Case 1
			cb_update.Trigger Event Clicked()
		Case 3
			Return
	End Choose
End If

// delete the children from the tree items and then re-add them as per the items in
// the datasource
tv_1.event pfc_RefreshLevel(2)
end event

type cb_close from u_cb within w_treeviewupdate6
string text = "Close"
boolean cancel = true
integer x = 1280
integer y = 256
integer height = 84
integer taborder = 40
boolean bringtotop = true
end type

event clicked;call super::clicked;Parent.event pfc_close()
end event

