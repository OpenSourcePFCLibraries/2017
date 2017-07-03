HA$PBExportHeader$w_treeviewupdate.srw
$PBExportComments$Example of updating a TreeView linked to DataStores
forward
global type w_treeviewupdate from w_main
end type
type st_directions from u_st within w_treeviewupdate
end type
type tv_1 from u_tv within w_treeviewupdate
end type
type cb_update from u_cb within w_treeviewupdate
end type
type cb_refresh from u_cb within w_treeviewupdate
end type
type cb_close from u_cb within w_treeviewupdate
end type
end forward

global type w_treeviewupdate from w_main
int X=23
int Y=8
int Width=1728
int Height=1960
boolean TitleBar=true
string Title="PFC Example - (5.x) Update a Treeview"
boolean Resizable=false
st_directions st_directions
tv_1 tv_1
cb_update cb_update
cb_refresh cb_refresh
cb_close cb_close
end type
global w_treeviewupdate w_treeviewupdate

type variables
Boolean	ib_Changed
end variables

on w_treeviewupdate.create
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

on w_treeviewupdate.destroy
call super::destroy
destroy(this.st_directions)
destroy(this.tv_1)
destroy(this.cb_update)
destroy(this.cb_refresh)
destroy(this.cb_close)
end on

event open;call super::open;Long					ll_Root
TreeViewItem		ltvi_Root

tv_1.AddPicture("custom041!")
tv_1.AddPicture("custom048!")
tv_1.AddPicture("custom067!")
tv_1.AddPicture("custom075!")
tv_1.AddPicture("custom085!")
tv_1.AddPicture("library!")
tv_1.AddPicture("custom076!")
tv_1.AddPicture("custom050!")

// Register the datasource for each level of the tree
// Parameters are: level, datawindow object, transaction object, column to display as the label, 
// the retrieval arugments, and whether the DW object is to be used recursively.
// Optional parameters are:  picture index, selected picture index, state picture index, and overlay picture index
tv_1.of_SetDatasource(2, "d_DeptList", SQLCA, "dept_name", "", False, 0, 8)
tv_1.of_SetPictureColumn(2, "dept_index", "PictureIndex")

tv_1.of_SetDatasource(3, "d_DeptEmp", SQLCA, "emp_fullname", ":parent.1.dept_id", False, 7, 7)

// Add the root item
ltvi_Root.Label = "Company"
ltvi_Root.PictureIndex = 6
ltvi_Root.SelectedPictureIndex = 6
ltvi_Root.Children = True
ll_Root = tv_1.InsertItemLast(0, ltvi_Root)

tv_1.Post Function ExpandItem(ll_Root)

end event

type st_directions from u_st within w_treeviewupdate
int X=59
int Y=52
int Width=1138
int Height=132
string Text="To perform a transfer, drag and drop an employee on the new department."
long TextColor=41943040
end type

type tv_1 from u_tv within w_treeviewupdate
int X=59
int Y=244
int Width=1138
int Height=1540
int TabOrder=10
boolean DragAuto=true
boolean DisableDragDrop=false
boolean LinesAtRoot=true
long PictureMaskColor=12632256
long StatePictureMaskColor=12632256
long TextColor=41943040
long BackColor=1080593568
end type

event begindrag;call u_tv::begindrag;TreeViewItem		ltvi_Source

// Make sure only employees are being dragged
GetItem(il_DragSource, ltvi_Source)
If ltvi_Source.Level <> 3 Then This.Drag(Cancel!)
end event

event dragdrop;call u_tv::dragdrop;Integer				li_DeptID
Long					ll_Row, ll_NewItem
n_ds					lds_DataStore
TreeViewItem		ltvi_Target, ltvi_Source

If GetItem(il_DragTarget, ltvi_Target) = -1 Then Return
If GetItem(il_DragSource, ltvi_Source) = -1 Then Return

// Only allow dropping an employee on a department
If ltvi_Target.Level <> 2 Or ltvi_Source.Level <> 3 Then Return

// Get the new Department ID
If of_GetDataRow(il_DragTarget, lds_DataStore, ll_Row) < 0 Then Return
li_DeptID = lds_DataStore.Object.dept_id[ll_Row]

// Update the appropriate row
If of_GetDataRow(il_DragSource, lds_DataStore, ll_Row) < 0 Then Return
lds_DataStore.Object.dept_id[ll_Row] = li_DeptID

// Move the item
// First delete the first item from the TreeView
// Do not call the pfc_u_tv of_delete_item function because it would also
// delete the row from the DataStore
DeleteItem(il_DragSource)

// If the new Department is not expanded, 
// expand it before add the new item
If Not ltvi_Target.Expanded Then
	Trigger Event ItemExpanding(il_DragTarget)
End If

// Call the pfc_u_tv function to insert the item under the proper parent
ll_NewItem = of_InsertItem(il_DragTarget, lds_DataStore, ll_Row, "sort")

// Select the new item
SelectItem(ll_NewItem)

ib_Changed = True

end event

event dragwithin;call u_tv::dragwithin;TreeViewItem		ltvi_Over

GetItem(handle, ltvi_Over)
If ltvi_Over.Level = 2 Then
	SelectItem(handle)
Else
	SelectItem(0)
End If

end event

type cb_update from u_cb within w_treeviewupdate
int X=1280
int Y=52
int Height=84
int TabOrder=20
string Text="Update"
end type

event clicked;call u_cb::clicked;ib_Changed = False

tv_1.of_update(3)
end event

type cb_refresh from u_cb within w_treeviewupdate
int X=1280
int Y=152
int Height=84
int TabOrder=30
boolean BringToTop=true
string Text="Refresh"
end type

event clicked;call super::clicked;Integer li_rc

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

tv_1.of_RefreshLevel(2)
end event

type cb_close from u_cb within w_treeviewupdate
int X=1280
int Y=256
int Height=84
int TabOrder=40
boolean BringToTop=true
string Text="Close"
boolean Cancel=true
end type

event clicked;call u_cb::clicked;Parent.event pfc_close()
end event

