HA$PBExportHeader$pfc_n_cst_tvsrv_levelsource.sru
$PBExportComments$PFC Treeview Levelsource Service
forward
global type pfc_n_cst_tvsrv_levelsource from n_cst_tvsrv
end type
end forward

global type pfc_n_cst_tvsrv_levelsource from n_cst_tvsrv
event type long pfc_endlabeledit ( long al_handle,  string as_newtext )
event type integer pfc_undo ( )
event type integer pfc_undodelete ( )
event type integer pfc_undoinsert ( )
event type integer pfc_undoedit ( )
event type long pfc_deleteitem ( long al_handle )
event type long pfc_insertitem ( long al_parent,  n_ds ads_source,  long al_row,  treeviewitem atvi_item,  string as_position,  long al_handle )
event type long pfc_itemexpanding ( long al_handle )
event type long pfc_setitemattributes ( n_ds ads_obj,  long al_row,  ref treeviewitem atvi_item )
event type integer pfc_refreshitem ( long al_handle )
event type integer pfc_refreshlevel ( integer ai_level )
end type
global pfc_n_cst_tvsrv_levelsource pfc_n_cst_tvsrv_levelsource

type variables
Public:
//- UpdateStyle Constants:
  constant  integer TOPDOWN =1
  constant  integer BOTTOMUP =2
  constant  integer TOPDOWN_BOTTOMUP =3
  constant  integer BOTTOMUP_TOPDOWN =4
  constant  integer CUSTOM =101
//- Delete Style Constants:
Constant Integer DELETE_ROWS  = 0
Constant Integer DISCARD_ROWS = 1
//- Undo Style Constants
Constant String UNDO_EDIT = "Edit"
Constant String UNDO_INSERT = "Insert"
Constant String UNDO_DELETE = "Delete"
Constant String CACHE_ID = "level"

Protected:

// undo functionality
boolean		ib_undo
long		il_undodeletehandle
long		il_undodeleteparenthandle
long		il_undoinserthandle
long		il_undoedithandle
string		is_undoeditlabeltext
string		is_undotype
treeviewitem	itvi_undodeleteitem

boolean		ib_isrefreshing = False
boolean		ib_isundoing = False
boolean		ib_confirmondelete = False
integer		ii_updatestyle
integer		ii_customupdate
string		is_pfckey = "pfc_tvi_key"

n_cst_dwcache	inv_cache
n_cst_tvsrvattrib	inv_attrib[]

end variables

forward prototypes
public function integer of_getargs (long al_parent, integer ai_level, ref any aa_arg[20])
public function integer of_getdatarow (long al_handle, ref n_ds ads_obj, ref long al_row)
public function integer of_resetupdate (integer ai_level)
public function boolean of_isconfirmondelete ()
public function integer of_setconfirmondelete (boolean ab_switch)
public function integer of_register (integer ai_level, string as_labelcolumn, string as_retrieveargs, datawindow adw_control, string as_filtercols)
public function integer of_register (integer ai_level, string as_labelcolumn, string as_retrieveargs, datastore ads_control, string as_filtercols)
public function integer of_register (integer ai_level, string as_labelcolumn, string as_retrieveargs, string as_dwobjectname, string as_importfile, string as_filtercols)
public function integer of_register (integer ai_level, string as_labelcolumn, string as_retrieveargs, string as_dwobjectname, n_tr atr_obj, string as_filtercols)
public function integer of_register (integer ai_level, string as_labelcolumn, string as_retrieveargs, n_tr atr_obj, string as_sql, string as_filtercols)
public function integer of_register (integer ai_level, string as_labelcolumn, string as_retrieveargs, string as_dwobjectname, string as_filtercols)
public function integer of_register (integer ai_level, string as_labelcolumn, string as_retrieveargs, string as_dwobjectname, powerobject apo_data[], string as_filtercols)
public function integer of_register (integer ai_level, string as_labelcolumn, string as_retrieveargs, string as_dwobjectname, n_tr atr_obj, string as_filtercols, string as_method, string as_sql, powerobject apo_data[], datawindow adw_control, datastore ads_control, string as_importfile)
protected function integer of_registerdatasource (integer ai_level, string as_method, string as_dataobject, n_tr atr_obj, string as_sql, powerobject apo_data[], datawindow adw_control, datastore ads_control, string as_importfile)
public function integer of_resettree ()
public function integer of_reset (integer ai_level)
public function integer of_getobjects (ref powerobject apo_objects[])
public function integer of_converttorow (long al_parent, string aa_columnvalues[], ref n_ds ads_obj, ref long al_row)
public function integer of_getlevel (long al_handle)
public function integer of_confirmdelete (long al_amount)
public function integer of_getlevel (n_ds ads_obj)
public function boolean of_isrecursivelevel (integer ai_level)
public function boolean of_canundo (ref string as_undotype)
protected function integer of_setcache (boolean ab_switch)
public function integer of_removechildren (long al_handle)
public function string of_getlabelcolumn (integer ai_level)
public function string of_getmethod (integer ai_level)
public function string of_getoverlaypicturecolumn (integer ai_level)
public function string of_getpicturecolumn (integer ai_level)
public function string of_getstatepicturecolumn (integer ai_level)
public function string of_getselectedpicturecolumn (integer ai_level)
public function string of_getdataobject (integer ai_level)
public function integer of_setoverlaypicturecolumn (integer ai_level, string as_column)
public function integer of_setpicturecolumn (integer ai_level, string as_column)
public function integer of_setstatepicturecolumn (integer ai_level, string as_column)
public function integer of_setselectedpicturecolumn (integer ai_level, string as_column)
public function string of_getretrieveargs (integer ai_level)
public function integer of_getlevelattributes (integer ai_level, ref n_cst_tvsrvattrib anv_attrib)
public function integer of_reset ()
public function integer of_resetupdate ()
public function integer of_setitemattributes (ref n_ds ads_source, long al_row, ref treeviewitem atvi_item)
public function integer of_getlevelcount ()
public function integer of_unregister (integer ai_level)
public function integer of_gettransobject (integer ai_level, ref n_tr atr_obj)
protected function integer of_clearundo ()
protected function integer of_parseargs (string as_args, integer ai_level, ref integer ai_arglevel[], ref string as_argcolumn[])
public function integer of_setundo (boolean ab_switch)
public function integer of_setrecursive (integer ai_level, boolean ab_switch)
public function integer of_deleteitem (long al_handle)
protected function boolean of_confirmondelete ()
public function long of_gethandle (ref n_ds ads_obj, long al_row, integer ai_level)
public function long of_gethandle (ref n_ds ads_obj, long al_row)
public function integer of_setdeletestyle (integer ai_level, integer ai_style)
public function integer of_getdeletestyle (integer ai_level)
public function integer of_setupdatestyle (integer ai_style)
public function integer of_getupdatestyle ()
public function integer of_update (boolean ab_accepttext, boolean ab_resetflags)
public function integer of_update (integer ai_level, boolean ab_accepttext, boolean ab_resetflags)
public function integer of_updatecustom (integer ai_custom)
public function integer of_getcustomupdate ()
public function integer of_setcustomupdate (integer ai_custom)
public function integer of_getdatasource (integer ai_level, ref n_ds ads_obj)
public function string of_decodekey (string as_decodekey)
public function string of_encodekey (n_ds ads_source, long al_row)
protected function integer of_parsecols (string as_cols, ref string as_operators[], ref string as_column[])
public function long of_insertitem (long al_parent, n_ds ads_obj, long al_row, treeviewitem atvi_item, string as_position, long al_after)
protected function integer of_update (ref n_ds ads_updatearray[], integer ai_direction, boolean ab_insert, boolean ab_update, boolean ab_delete)
public function integer of_discardchildren (long al_handle)
public function boolean of_canundo ()
public function long of_retrieve (integer ai_level, any aa_arg[20], ref n_ds ads_data)
end prototypes

event pfc_endlabeledit;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Pfc_EndLabelEdit
//
//	Arguments:	
//	al_handle		Handle of the treeview item being used
//	as_newtext		Text to become the new label of the treeview item
//
//	Return:		Long
//		CONTINUE_ACTION	Allow the new text to become the item's label
//		PREVENT_ACTION		Prevent the new text from becoming the item's label
//
//	Description:	Change the label column in the appropriate DataStore to
//						be the new label text.  This only works if the label column
//						is updatable.  If a computed column is being used for the
//						label, override this script with appropriate code.
//
//						NOTE:  Update() is NOT called for the DataStore.  This is
//						left to the user to perform.  If the label column is also part
//						of the key, or is used as a retrieval argument for any of its
//						children, this item should be refreshed with pfc_RefreshItem.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Integer				li_Index
Long					ll_Row
n_ds					lds_obj
TreeViewItem		ltvi_Item

// check reference variables
If IsNull(itv_requestor) or Not IsValid(itv_requestor) Then Return -1

// check arguments
if itv_requestor.GetItem(al_handle, ltvi_Item) = FAILURE then
	return PREVENT_ACTION
end if

// Make sure the label did change
If as_newtext = ltvi_Item.Label Then Return PREVENT_ACTION

// Get the row in the DataStore
If of_GetDataRow(al_handle, lds_obj, ll_Row) = FAILURE Then
	Return PREVENT_ACTION
End If

// Get the label column for the level
li_Index = of_GetLevel(al_handle)
If li_index < 1 then Return PREVENT_ACTION

// Change the value of the label column
If lds_obj.SetItem(ll_Row, inv_attrib[li_Index].is_LabelColumn, as_newtext) < 1 Then Return PREVENT_ACTION

// set the undo values
if ib_undo then
	il_UndoEditHandle = al_handle
	is_UndoEditLabelText = ltvi_Item.Label
	is_UndoType = UNDO_EDIT
End If

Return CONTINUE_ACTION

end event

event pfc_undo;call super::pfc_undo;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_Undo
//
//	Arguments:	None
//
//	Returns:		integer
//	 1 = success; 
//	 0 = nothing to undo
//	-1 = error
//
//	Description:	Restore the last treeview change.  
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
String	ls_undotype

// do not undo if undo is not set
If Not ib_undo Then Return -1

// determine the undo we are performing
If of_CanUndo(ls_undotype) then
	Choose Case ls_UndoType
		Case UNDO_DELETE
			return this.event pfc_undodelete()
		Case UNDO_INSERT
			return this.event pfc_undoinsert()
		Case UNDO_EDIT
			return this.event pfc_undoedit()
	End Choose
End If


Return 0
end event

event pfc_undodelete;call super::pfc_undodelete;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_UndoDelete
//
//	Arguments:	None
//
//	Returns:		integer
//	 1 = success; last delete was undone
//	 0 = nothing to undo
//	-1 = error
//
//	Description:	Restore the last deleted item of the treeview.  Will not undelete children
//		items deleted in the delete process. 
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
integer			li_undolevel
long				ll_row, ll_rowcount
long				ll_undoparenthandle, ll_undoafterhandle, ll_newhandle, ll_deleterowid
string			ls_undokey, ls_key
treeviewitem	ltvi_undo, ltvi_empty
n_ds				lds_undo

// check reference variables
If IsNull(itv_requestor) or Not IsValid(itv_requestor) Then Return -1

// do not undo if undo is not set
If Not ib_undo Then Return -1

// Check to see if we have an delete to undo
If il_UndoDeleteParentHandle < 1 then Return 0

itv_requestor.SetRedraw(False)

ll_undoparenthandle = il_UndoDeleteParentHandle
ll_undoafterhandle = il_UndoDeleteHandle
//ls_undokey = string( itvi_UndoDeleteItem.Data )
li_undolevel = itvi_UndoDeleteItem.Level
ltvi_undo = itvi_UndoDeleteItem
	
// Reset the undo delete variables (here if there are problems so we don't try to undelete the wrong thing)
il_UndoDeleteParentHandle = 0
il_UndoDeleteHandle = 0
itvi_UndoDeleteItem = ltvi_empty
is_UndoType = ""

lds_undo = inv_attrib[li_undolevel].ids_obj

// The last row in the DataStore Delete! buffer is the one last deleted.
ll_row = lds_undo.DeletedCount()
If ll_row < 1 Then Return -1

// Compare the keys to see if we really have the right row
ll_deleterowid = lds_undo.GetRowIDFromRow(ll_row, Delete!)
ls_undokey = of_DecodeKey( string(ltvi_undo.data) )
If ll_deleterowid = long(ls_undokey) Then
	// Move row back to primary buffer
	ll_rowcount = lds_undo.RowCount()
	lds_undo.RowsMove(ll_row, ll_row, Delete!, lds_undo, (ll_rowcount + 1), Primary!)
Else
	Return 0
End If

// Insert row back under parent
ltvi_undo.selected = False
ll_newhandle = itv_requestor.InsertItem(ll_undoparenthandle, ll_undoafterhandle, ltvi_undo)
if ll_newhandle < 1 then Return -1

// reset again so inserteditem is not current undo
is_UndoType = ""

itv_requestor.SetRedraw(True)

return 1
end event

event pfc_undoinsert;call super::pfc_undoinsert;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_UndoInsert
//
//	Arguments:	None
//
//	Returns:		integer
//	 1 = success; last Insert was undone
//	 0 = nothing to undo
//	-1 = error
//
//	Description:	Process to Remove the last inserted item from the treeview
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
long		ll_undohandle

// check reference variables
If IsNull(itv_requestor) or Not IsValid(itv_requestor) Then Return -1

// do not undo if undo is not set
If Not ib_undo Then Return -1

// check to see if we have something to undo
If il_UndoInsertHandle < 1 Then Return 0

ll_undohandle = il_UndoInsertHandle
	
// Reset the undo insert variables (here if there are problems so we don't try to uninsert the wrong thing)
il_UndoInsertHandle = 0
is_UndoType = ""
	
// pfc undo process running - do not display confirmation messages
ib_isundoing = True

If of_deleteitem(ll_undohandle) < 1 Then Return -1

// pfc undo process not running - ok to display confirmation messages
ib_isundoing = False

// reset again so deleteditem is not current undo
is_UndoType = ""

return 1
end event

event pfc_undoedit;call super::pfc_undoedit;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_UndoEdit
//
//	Arguments:	None
//
//	Returns:		integer
//	 1 = success; last change was undone
//	 0 = nothing to undo
//	-1 = error
//
//	Description:	Change the label column in the appropriate DataStore to
//						be the prior label text.  This only works if the label column
//						is updatable.  If a computed column is being used for the
//						label, override this script with appropriate code.
//
//						NOTE:  Update() is NOT called for the DataStore.  This is
//						left to the user to perform.  If the label column is also part
//						of the key, or is used as a retrieval argument for any of its
//						children, this item should be refreshed with of_RefreshItem.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Integer				li_Index
Long					ll_Row, ll_undohandle
string				ls_undotext
n_ds					lds_DataStore
TreeViewItem		ltvi_Item

// check reference variables
If IsNull(itv_requestor) or Not IsValid(itv_requestor) Then Return -1

// do not undo if undo is not set
If Not ib_undo Then Return -1

// check to see if we have something to undo
If il_UndoEditHandle < 1 Then Return 0

ll_undohandle = il_UndoEditHandle
ls_undotext = is_UndoEditLabelText
	
// reset the undo values here.  If an error occurs do not want undo hanging around
il_UndoEditHandle = 0
is_UndoEditLabelText = ""
is_UndoType = ""

if itv_requestor.GetItem(ll_undohandle, ltvi_Item) < 1 Then Return -1

// Get the row in the DataStore
If of_GetDataRow(ll_undohandle, lds_DataStore, ll_Row) = -1 Then
	Return -1
End If

// Get the label column for the level
li_Index = UpperBound(inv_attrib)
If ltvi_Item.Level < li_Index Then
	li_Index = ltvi_Item.Level
End If

// Change the value of the label column
lds_DataStore.SetItem(ll_Row, inv_attrib[li_Index].is_LabelColumn, ls_undotext)

// Reset the label on the treeivew item
ltvi_Item.Label = ls_undotext
If itv_requestor.SetItem(ll_undohandle, ltvi_item) < 1 Then Return -1

Return 1

end event

event pfc_deleteitem;call super::pfc_deleteitem;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_deleteitem
//
//	Arguments:	
//	al_handle	handle of the item to be deleted
//
//	Returns:		Integer
//			 1	- the item was deleted successfuliy
//			 0 - no item was deleted
//			-1 = error
//
//	Description:
//	Deletes the selected item of the treeview and syncs the datastore
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Return this.of_deleteitem(al_handle)
end event

event pfc_insertitem;call super::pfc_insertitem;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_InsertItem
//
//	Arguments:	
//	al_parent	The handle to the Treeview item to place retrieved data under
//	ads_source	The DataStore containing the data to be used for the new item.
//						This can be the same DataStore that was created for the treeview, or
//						another maintained by the user.  If the latter, the row will be added
//						to the treeviews DataStore. 
//	al_Row		The row in the DataStore pointing to the data.
//	atvi_item	The Item to be added to the treeview
//	as_Position	The position under the parent where the new item will be inserted:
//						"First" - before the first child of the parent 
//						"Last" - after the last child (default)
//						"Sort" - in the sorted position based on the item's label
//						"After" - after the item with handle al_handle
//	al_handle	The handle to the item after which the new item will be inserted.
//						Ignored unless as_Position = "After".
//
//	Returns:		long
//					 handle of item added successfully  
//					-1 = an error occurred
//
//	Description:	Set the item attributes and place into the treeview.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Return of_insertitem(al_parent, ads_source, al_row, atvi_item, as_position, al_handle)
end event

event pfc_itemexpanding;call super::pfc_itemexpanding;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_ItemExpanding
//
//	Arguments:
//	al_handle	handle of the item being expanded
//
//	Returns:		Long
//					 1 = success
//					-1 = failure
//
//	Description:	If this is the first time the item is expanded, 
//						call pfc_PopulateLevel to populate it with its children.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
Integer			li_rc
TreeViewItem	ltvi_This

If IsNull(itv_requestor) or Not Isvalid(itv_requestor) then Return -1

If itv_requestor.FindItem(ChildTreeItem!, al_handle) = -1 Then
	// No children, so populate
	if itv_requestor.GetItem(al_handle, ltvi_This) = 1 then
		li_rc = itv_requestor.event pfc_Populate(al_handle)
		If li_rc < 1 Then
			// nothing populated, so we have no children on this item
			ltvi_This.Children = False
			itv_requestor.SetItem(al_handle, ltvi_This)
		End if
	End if
End If

Return 1
end event

event pfc_setitemattributes;call super::pfc_setitemattributes;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_SetItemAttributes
//
//	Arguments:	
//	ads_obj		Datastore holding treeview item information
//	al_row		Row in datastore pointing to treeview Item
//	atvi_item	treeview item about to be inserted.  
//						Passed by Reference
//
//	Returns:		Integer
//	 1 = Success 
//	-1 = Failure 
//
//	Description:	Set the default attributes for the treeview item.  
//
//		Note:		Extend this event to change item attributes before it is inserted 
//					into the treeview
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Return of_setitemattributes(ads_obj, al_row, atvi_item)

end event

event pfc_refreshitem;//////////////////////////////////////////////////////////////////////////////
//
//	Event:	pfc_RefreshItem
//
//	Arguments:
//	al_handle	The handle of the item to be refreshed.
//
//	Returns:		Integer
//					 1 if successfull
//					-1 if an error occurred
//
//	Description:	Refresh an item in the treeview.  Reset all its attributes to the 
//						default values based on the data in the DataStore.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
any				la_data
Integer			li_rc
Long				ll_Row
treeviewItem	ltvi_Item
n_ds				lds_Source

// check reference variables
If IsNull(itv_requestor) or Not IsValid(itv_requestor) Then Return -1
If (al_handle < 0) or IsNull(al_handle) Then Return -1

// Get the item
If itv_requestor.GetItem(al_handle, ltvi_Item) <> 1 Then Return -1

// Collapse the item
If ltvi_Item.Expanded Then
	itv_requestor.CollapseItem(al_Handle)
	itv_requestor.GetItem(al_Handle, ltvi_Item)
End If

// Get the corresponding row in the DataStore
If this.of_GetDataRow(al_handle, lds_Source, ll_Row) <> 1 Then 
	Return -1
End If
// Discard its child items
If this.of_DiscardChildren(al_Handle) = -1 Then Return -1

// remember the data attribute - it is set only at insert item
la_data = ltvi_item.data

// Set the item's attributes
itv_requestor.event pfc_SetItemAttributes(al_handle, lds_source, ll_row, ltvi_item)

// Perform the Prerefreshitem logic if needed
itv_requestor.event pfc_prerefreshitem(al_handle, lds_source, ll_row, ltvi_item)

// replace the data attribute
ltvi_item.data = la_data

// Refresh the item
li_rc = itv_requestor.SetItem(al_handle, ltvi_Item)

Return li_rc
end event

event pfc_refreshlevel;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		pfc_RefreshLevel
//
//	Arguments:	
//	ai_level		The treeview level to refresh
//
//	Returns:		integer
//					 1 = treeview level refreshed successfully  
//					-1 = an error occurred
//
//	Description:	Refresh the treeview level with items from the data source.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
Integer	li_rc
long		ll_handle, ll_row, ll_rowcount
n_ds		lds_source

// check reference variables
If IsNull(itv_requestor) or Not IsValid(itv_requestor) Then Return -1
If IsNull(ai_level) or (ai_level < 1) Then Return -1

Setpointer(hourglass!)

// perform application specific processing if needed
itv_requestor.event pfc_prerefreshlevel(ai_level) 

// Refresh all items at this level
this.of_GetDataSource(ai_level, lds_source)
ll_rowcount = lds_source.RowCount()
For ll_row = 1 to ll_rowcount
	ll_handle = this.of_GetHandle(lds_source, ll_row, ai_level)
	If ll_handle < 1 Then Continue
	If itv_requestor.event pfc_RefreshItem(ll_Handle) = -1 Then Return -1
Next

Return 1

end event

public function integer of_getargs (long al_parent, integer ai_level, ref any aa_arg[20]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetArgs
//
//	Access:		public
//
//	Arguments:
//	al_Parent	The handle of the parent of the current TreeView item
//	ai_Level		The current TreeView level.
//	aa_Arg[20]	An array of type Any that will contain the retrieval
//						argument values.  Passed by reference.
//
//	Returns:		Integer
//					Returns 1 if the for success, -1 if an error occurrs.
//
//	Description:	Get the values for the retrieval arguments for a level of the TreeView
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Integer				li_Limit, li_Cnt, li_Cnt2, li_ArgItem, li_Index, li_ArgIndex
Integer				li_RetrieveArgLevel[]
String				ls_ArgCol, ls_Arg, ls_key
String				ls_RetrieveArgColumn[]
Long					ll_Arg, ll_row
Double				ldb_Arg
Decimal				ldc_Arg
Date					ld_Arg
DateTime				ldt_Arg
Time					lt_Arg
TreeViewItem		ltvi_Item

// check reference variables
If IsNull(itv_requestor) or Not IsValid(itv_requestor) Then Return -1

// check arguments
If (al_parent < 0) or IsNull(al_parent) Then Return -1
If (ai_level < 1) or IsNull(ai_level) Then Return -1

// Determine if the level is recursive
li_Index = UpperBound(inv_attrib)
If ai_Level > li_Index Then
	// Allow for recursion
	If Not inv_attrib[li_Index].ib_Recursive Then Return -1
Else
	li_Index = ai_Level
End If

of_ParseArgs(inv_attrib[li_Index].is_RetrieveArgs, ai_Level, li_RetrieveArgLevel, ls_RetrieveArgColumn)

li_Limit = UpperBound(li_RetrieveArgLevel)

For li_Cnt = (ai_Level - 1) To 1 Step - 1
	If itv_requestor.GetItem(al_Parent, ltvi_Item) = -1 Then Return -1
	
	// Determine if there an argument is needed from this level
	For li_Cnt2 = 1 To li_Limit
		If li_RetrieveArgLevel[li_Cnt2] = li_Cnt Then
			li_ArgItem = li_Cnt2
		
			// Determine the proper DataStore to use (in case the level is recursive)
			If li_Cnt > li_Index Then
				li_ArgIndex = li_Index
			Else
				li_ArgIndex = li_Cnt
			End If
		
			ls_ArgCol = ls_RetrieveArgColumn[li_ArgItem]
			
			// Find proper row in datastore
			ls_key = of_decodekey( string(ltvi_item.data) )
			ll_row = inv_attrib[li_ArgIndex].ids_obj.GetRowFromRowID( long(ls_key) )
//			ll_row = inv_attrib[li_ArgIndex].ids_obj.Find("pfc_tvi_key = '" + String(ltvi_Item.Data) + "'", &
//																		1, inv_attrib[li_ArgIndex].ids_obj.RowCount())
			If ll_row <= 0 Then Return -1
			
			// Cast the value into the proper data type
			Choose Case Left(inv_attrib[li_ArgIndex].ids_obj.Describe(ls_ArgCol + ".coltype"), 7)
				Case "integer", "long"
					ll_Arg = inv_attrib[li_ArgIndex].ids_obj.GetItemNumber(ll_row, ls_ArgCol)
					aa_Arg[li_ArgItem] = ll_Arg
				Case "double", "number"
					ldb_Arg = inv_attrib[li_ArgIndex].ids_obj.GetItemNumber(ll_row, ls_ArgCol)
					aa_Arg[li_ArgItem] = ldb_Arg
				Case "decimal"
					ldc_Arg = inv_attrib[li_ArgIndex].ids_obj.GetItemDecimal(ll_row, ls_ArgCol)
					aa_Arg[li_ArgItem] = ldc_Arg
				Case "date"
					ld_Arg = inv_attrib[li_ArgIndex].ids_obj.GetItemDate(ll_row, ls_ArgCol)
					aa_Arg[li_ArgItem] = ld_Arg
				Case "time"
					lt_Arg = inv_attrib[li_ArgIndex].ids_obj.GetItemTime(ll_row, ls_ArgCol)
					aa_Arg[li_ArgItem] = lt_Arg
				Case "datetim"
					ldt_Arg = inv_attrib[li_ArgIndex].ids_obj.GetItemDateTime(ll_row, ls_ArgCol)
					aa_Arg[li_ArgItem] = ldt_Arg
				Case Else
					ls_Arg = inv_attrib[li_ArgIndex].ids_obj.GetItemString(ll_row, ls_ArgCol)
					aa_Arg[li_ArgItem] = ls_Arg
			End Choose
		End If
	Next
	
	If li_Cnt > 1 Then
		// Move up one level
		al_Parent = itv_requestor.FindItem(ParentTreeItem!, al_Parent)
		If al_Parent = -1 Then Return -1
	End If
Next

Return 1

end function

public function integer of_getdatarow (long al_handle, ref n_ds ads_obj, ref long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetDataRow
//
//	Access:		public
//
//	Arguments:
//	al_Handle		The handle to the TreeView item for which data is desired.
//	ads_obj			The handle to the DataStore (of type n_ds) for the item's
//							level.  Passed by reference.
//	al_Row			The row in the DataStore that the item points to.  Passed by
//							reference.
//
//	Returns:		Integer
//					 1	- the item's data was found
//					-1	- the item or row was not found
//
//	Description:	Return the DataStore and row a particular item in the TreeView points
//						to.  This allows the user to update this row any way they wish.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Integer				li_Level
Long					ll_Row
String				ls_key
TreeViewItem		ltvi_Item

// check reference variables
If IsNull(itv_requestor) or Not IsValid(itv_requestor) Then Return -1
If itv_requestor.GetItem(al_Handle, ltvi_Item) = -1 Then Return -1

// determine level
li_level = of_getlevel(al_handle)
If li_level < 1 then Return -1

ads_obj = inv_attrib[li_Level].ids_obj

if IsNull(inv_attrib[li_level].ids_obj) Or not IsValid (inv_attrib[li_level].ids_obj) then
	return -1
end if

// find the row
ls_key = of_decodekey( of_getdatastring(al_handle) )
ll_row = ads_obj.GetRowFromRowID( long(ls_key) )
//ll_Row = ads_obj.Find("pfc_tvi_key = '" + String(ltvi_Item.Data) + "'", &
//											1, ads_obj.RowCount())

If ll_Row <= 0 Then
	Return -1
Else
	al_Row = ll_Row
	Return 1
End If

end function

public function integer of_resetupdate (integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_ResetUpdate
//
//	Access:		public
//
//	Arguments:
//	ai_Level		The level for which to reset the update flags of its 
//						DataStore.  If ai_Level is 0, all DataStores will be updated.
//						NOTE:  There is only one DataStore for all 
//						recursive levels.  So if ai_Level is a recursive level, 
//						all levels using that DataStore will be updated.
//
//	Returns:		Integer
//					 1	- the flags were reset successfully
//					-1	- an error occurred
//
//	Description:	Reset the update flags for a DataStore associated with a level of the TreeView.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Integer	li_Index, li_Start, li_Cnt

// check arguments
If isNull(ai_level) or (ai_level < 0) Then Return -1

li_Index = UpperBound(inv_attrib)
If ai_Level = 0 Then
	// Update all DataStores
	li_Start = 1
Else
	If ai_Level > li_Index Then
		// If level > li_Index then inv_attrib[li_Index] must be recursive
		If Not inv_attrib[li_Index].ib_Recursive Then Return -1
		ai_Level = li_Index
	End If
	
	li_Start = ai_Level
End If

li_Index = UpperBound(inv_attrib)

If ai_Level = 0 Then
	// Update all DataStores
	li_Start = 1
Else
	If ai_Level > li_Index Then
		// If level > li_Index then inv_attrib[li_Index] must be recursive
		If Not inv_attrib[li_Index].ib_Recursive Then Return -1
		ai_Level = li_Index
	End If
	
	li_Start = ai_Level
End If

// Reset the Update flags(s)
For li_Cnt = li_Start To li_Index
	If IsValid(inv_attrib[li_Cnt].ids_obj) Then
		If inv_attrib[li_Cnt].ids_obj.ResetUpdate() = -1 Then Return -1
	End If
Next

Return 1

end function

public function boolean of_isconfirmondelete ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_IsConfirmOnDelete
//
//	Access:		Public
//
//	Arguments:	none
//
//	Returns:		boolean
//
//	Description:
//	Returns whether deletions will be confirmed first
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Return ib_confirmondelete

end function

public function integer of_setconfirmondelete (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetConfirmOnDelete
//
//	Access:		Public
//
//	Arguments:
//	ab_switch	specifies whether deletions will be confirmed first
//
//	Returns:		integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets whether deletions will be confirmed by user first
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// Validate arguments
if IsNull (ab_switch) then return -1

ib_confirmondelete = ab_switch

return 1
end function

public function integer of_register (integer ai_level, string as_labelcolumn, string as_retrieveargs, datawindow adw_control, string as_filtercols);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_register
//
//	Access:		public
//
//	Arguments:
//	ai_Level				The TreeView level to associate the data source with.
//	as_LabelColumn		The column in the DataWindow object to display. 
//	as_RetrieveArgs	Retrieval/filter arguments for the level.  These should
//								be separated by commas in the format:
//										:keyword.n.column
//								where column is the name of a column in another level's
//								data source.  If keyword is 'level', n is an absolute level 
//								number.  If keyword is 'parent', n is a number relative to
//								the current level (i.e. :parent.2.c1 would be column c1 in
//								the DataWindow for the level 2 levels above this one).
//	adw_control			The DataWindow control to be used for the data source.
//	as_FilterCols		Columns on the datastore object used for filtering the datastore.
//							This type of datasource does a retrieve once and uses the 
//							retrieval arguments to to filter out those records which do not
//							match.  The column names should be separated by commas.
//								ex:  "colname.NA, Col2name.NO, col3name"
//								means "Not (Colname=xxx) And Not (col2name=xxx) Or col3name=xxx"
//								ex:  "colname.A, Col2name"
//								means "Colname=xxx And col2name=xxx"
//									xxx is the values provided by the retrieval args
//							The columns will be the left side of the filter statement and the
//							retrieval arguments are the right side (i.e. filtercol='retrieval args')
//
//	Returns:  integer
//	 1 = the data source was added successfully
//	-1 = argument validation error
//	-2 = the DataWindow object did not have any key columns assigned
//	-3 = a previous level had already been marked as recursive (there can be no more)
//
//
//	Description:	Register a datawindow control as a data source for a level of the TreeView.  
//						The data source will be linked to the TreeView level and used
//						to populate.
//
//						This function overloads the real of_register function to allow the
//						parameters to be optional.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

n_tr			ltr_obj
string		ls_dwobjectname
string		ls_retrieveargs
string		ls_sql
powerobject lpo_obj[]
datawindow	ldw_control
datastore	lds_control
string		ls_importfile

If IsNull(adw_control) or Not IsValid(adw_control) Then Return -1
If Len(adw_control.DataObject) = 0 Then Return -1
	
SetNull(ls_sql)
SetNull(ldw_control)
SetNull(lds_control)
SetNull(ls_importfile)

// Populate the argument with the desired DataObject.
ls_dwobjectname = adw_control.DataObject

Return of_register(ai_Level, as_LabelColumn, as_retrieveargs, ls_dwobjectname, ltr_obj, as_filtercols, &
		inv_cache.DATAWINDOWCONTROL, ls_sql, lpo_obj, adw_control, lds_control, ls_importfile)

end function

public function integer of_register (integer ai_level, string as_labelcolumn, string as_retrieveargs, datastore ads_control, string as_filtercols);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_register
//
//	Access:		public
//
//	Arguments:
//	ai_Level				The TreeView level to associate the data source with.
//	as_LabelColumn		The column in the DataWindow object to display. 
//	as_RetrieveArgs	Retrieval/filter arguments for the level.  These should
//								be separated by commas in the format:
//										:keyword.n.column
//								where column is the name of a column in another level's
//								data source.  If keyword is 'level', n is an absolute level 
//								number.  If keyword is 'parent', n is a number relative to
//								the current level (i.e. :parent.2.c1 would be column c1 in
//								the DataWindow for the level 2 levels above this one).
//	ads_control			The DataStore control to be used for the data source.
//	as_FilterCols		Columns on the datastore object used for filtering the datastore.
//							This type of datasource does a retrieve once and uses the 
//							retrieval arguments to to filter out those records which do not
//							match.  The column names should be separated by commas.
//								ex:  "colname.NA, Col2name.NO, col3name"
//								means "Not (Colname=xxx) And Not (col2name=xxx) Or col3name=xxx"
//								ex:  "colname.A, Col2name"
//								means "Colname=xxx And col2name=xxx"
//									xxx is the values provided by the retrieval args
//							The columns will be the left side of the filter statement and the
//							retrieval arguments are the right side (i.e. filtercol='retrieval args')
//
//	Returns:  integer
//	 1 = the data source was added successfully
//	-1 = argument validation error
//	-2 = the DataWindow object did not have any key columns assigned
//	-3 = a previous level had already been marked as recursive (there can be no more)
//
//
//	Description:	Register a datastore control as a data source for a level of the TreeView.  
//						The data source will be linked to the TreeView level and used
//						to populate.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

n_tr			ltr_obj
string		ls_dwobjectname
string		ls_retrieveargs
string		ls_sql
powerobject lpo_obj[]
datawindow	ldw_control
datastore	lds_control
string		ls_importfile

// Check Arguments
If IsNull(ads_control) or Not IsValid(ads_control) Then Return -1
If Len(ads_control.DataObject) = 0 Then Return -1

SetNull(ls_sql)
SetNull(ldw_control)
SetNull(lds_control)
SetNull(ls_importfile)

// Populate the argument with the desired DataObject.
ls_dwobjectname = ads_control.DataObject

Return of_register(ai_Level, as_LabelColumn, as_retrieveargs, ls_dwobjectname, ltr_obj, as_filtercols, &
						inv_cache.DATASTORECONTROL, ls_sql, lpo_obj, ldw_control, ads_control, ls_importfile)

end function

public function integer of_register (integer ai_level, string as_labelcolumn, string as_retrieveargs, string as_dwobjectname, string as_importfile, string as_filtercols);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_register
//
//	Access:		public
//
//	Arguments:
//	ai_Level				The TreeView level to associate the data source with.
//	as_LabelColumn		The column in the DataWindow object to display. 
//	as_RetrieveArgs	Retrieval/filter arguments for the level.  These should
//								be separated by commas in the format:
//										:keyword.n.column
//								where column is the name of a column in another level's
//								data source.  If keyword is 'level', n is an absolute level 
//								number.  If keyword is 'parent', n is a number relative to
//								the current level (i.e. :parent.2.c1 would be column c1 in
//								the DataWindow for the level 2 levels above this one).
//	as_dwobjectname	The data object to be used for the data source datastore.
//	as_importfile		The filename to be used for the data source.
//	as_FilterCols		Columns on the datastore object used for filtering the datastore.
//							This type of datasource does a retrieve once and uses the 
//							retrieval arguments to to filter out those records which do not
//							match.  The column names should be separated by commas.
//								ex:  "colname.NA, Col2name.NO, col3name"
//								means "Not (Colname=xxx) And Not (col2name=xxx) Or col3name=xxx"
//								ex:  "colname.A, Col2name"
//								means "Colname=xxx And col2name=xxx"
//									xxx is the values provided by the retrieval args
//							The columns will be the left side of the filter statement and the
//							retrieval arguments are the right side (i.e. filtercol='retrieval args')
//
//	Returns:  integer
//	 1 = the data source was added successfully
//	-1 = argument validation error
//	-2 = the DataWindow object did not have any key columns assigned
//	-3 = a previous level had already been marked as recursive (there can be no more)
//
//
//	Description:	Register a disk file as a data source for a level of the TreeView.  
//						The data source will be linked to the TreeView level and used
//						to populate.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

n_tr			ltr_obj
string		ls_dwobjectname
string		ls_retrieveargs
string		ls_sql
powerobject lpo_obj[]
datawindow	ldw_control
datastore	lds_control
string		ls_importfile

//	Check Arguments
If IsNull(as_dwobjectname) or Len(Trim(as_dwobjectname))= 0 Then Return -1
If IsNull(as_importfile) or Not FileExists(as_importfile) Then Return -1

SetNull(ls_sql)
SetNull(ldw_control)
SetNull(lds_control)
SetNull(ls_importfile)

Return of_register(ai_Level, as_LabelColumn, as_retrieveargs, as_dwobjectname, ltr_obj, as_filtercols, &
					inv_cache.IMPORTFILE, ls_sql, lpo_obj, ldw_control, lds_control, as_importfile)

end function

public function integer of_register (integer ai_level, string as_labelcolumn, string as_retrieveargs, string as_dwobjectname, n_tr atr_obj, string as_filtercols);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_register
//
//	Access:		public
//
//	Arguments:
//	ai_Level				The TreeView level to associate the data source with.
//	as_LabelColumn		The column in the DataWindow object to display. 
//	as_RetrieveArgs	Retrieval/filter arguments for the level.  These should
//								be separated by commas in the format:
//										:keyword.n.column
//								where column is the name of a column in another level's
//								data source.  If keyword is 'level', n is an absolute level 
//								number.  If keyword is 'parent', n is a number relative to
//								the current level (i.e. :parent.2.c1 would be column c1 in
//								the DataWindow for the level 2 levels above this one).
//	as_dwobjectname	The datawindow object to be used for the data source.
//	atr_obj				The transaction object to be used for the data source.
//	as_FilterCols		Columns on the datastore object used for filtering the datastore.
//							This type of datasource does a retrieve once and uses the 
//							retrieval arguments to to filter out those records which do not
//							match.  The column names should be separated by commas.
//								ex:  "N.colname, AN.Col2name, O.col3name"
//								means "Not (Colname=xxx) And Not (col2name=xxx) Or col3name=xxx"
//								ex:  ".colname, A.Col2name"
//								means "Colname=xxx And col2name=xxx"
//									xxx is the values provided by the retrieval args
//							The columns will be the left side of the filter statement and the
//							retrieval arguments are the right side (i.e. filtercol='retrieval args')
//
//	Returns:  integer
//	 1 = the data source was added successfully
//	-1 = argument validation error
//	-2 = the DataWindow object did not have any key columns assigned
//	-3 = a previous level had already been marked as recursive (there can be no more)
//
//
//	Description:	Register a datawindow as a data source for a level of the TreeView.  
//						The data source will be linked to the TreeView level and used
//						to populate.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

n_tr			ltr_obj
string		ls_dwobjectname
string		ls_retrieveargs
string		ls_sql
powerobject lpo_obj[]
datawindow	ldw_control
datastore	lds_control
string		ls_importfile

// Check Arguments
If IsNull(as_dwobjectname) or Len(Trim(as_dwobjectname))= 0 Then Return -1
If IsNull(atr_obj) Or Not IsValid(atr_obj) Then Return -1
If Not atr_obj.of_IsConnected() Then Return -1

SetNull(ls_sql)
SetNull(ldw_control)
SetNull(lds_control)
SetNull(ls_importfile)

Return of_register(ai_Level, as_LabelColumn, as_retrieveargs, as_DWobjectname, atr_obj, as_filtercols, &
					inv_cache.RETRIEVE, ls_sql, lpo_obj, ldw_control, lds_control, ls_importfile)

end function

public function integer of_register (integer ai_level, string as_labelcolumn, string as_retrieveargs, n_tr atr_obj, string as_sql, string as_filtercols);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_register
//
//	Access:		public
//
//	Arguments:
//	ai_Level				The TreeView level to associate the data source with.
//	as_LabelColumn		The column in the SQL to display. 
//	as_RetrieveArgs	Retrieval/filter arguments for the level.  These should
//								be separated by commas in the format:
//										:keyword.n.column
//								where column is the name of a column in another level's
//								data source.  If keyword is 'level', n is an absolute level 
//								number.  If keyword is 'parent', n is a number relative to
//								the current level (i.e. :parent.2.c1 would be column c1 in
//								the DataWindow for the level 2 levels above this one).
//	atr_obj				The transaction object to be used for the data source.
//	as_sql				The SQL Statement to be used for the data source.
//	as_FilterCols		Columns on the datastore object used for filtering the datastore.
//							This type of datasource does a retrieve once and uses the 
//							retrieval arguments to to filter out those records which do not
//							match.  The column names should be separated by commas.
//								ex:  "colname.NA, Col2name.NO, col3name"
//								means "Not (Colname=xxx) And Not (col2name=xxx) Or col3name=xxx"
//								ex:  "colname.A, Col2name"
//								means "Colname=xxx And col2name=xxx"
//									xxx is the values provided by the retrieval args
//							The columns will be the left side of the filter statement and the
//							retrieval arguments are the right side (i.e. filtercol='retrieval args')
//
//	Returns:  integer
//	 1 = the data source was added successfully
//	-1 = argument validation error
//	-2 = the DataWindow object did not have any key columns assigned
//	-3 = a previous level had already been marked as recursive (there can be no more)
//
//
//	Description:	Register a SQL Statement as a data source for a level of the TreeView.  
//						The data source will be linked to the TreeView level and used
//						to populate.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

n_tr			ltr_obj
string		ls_dwobjectname
string		ls_retrieveargs
string		ls_sql
powerobject lpo_obj[]
datawindow	ldw_control
datastore	lds_control
string		ls_importfile
string		ls_dwsyntax, ls_sqlerr

// check transaction objects
If IsNull(atr_obj) Or Not IsValid(atr_obj) Then Return -1
If Not atr_obj.of_IsConnected() Then Return -1

// check sql statement
If IsNull(as_sql) or ( len(as_sql) = 0 ) Then Return -1
	
SetNull(ls_sql)
SetNull(ldw_control)
SetNull(lds_control)
SetNull(ls_importfile)

// get sql statement for object creation
ls_dwsyntax = atr_obj.SyntaxFromSQL ( as_sql, '', ls_sqlerr )	
If Len(ls_sqlerr) > 0 Then Return -1
		
Return of_register(ai_Level, as_LabelColumn, as_retrieveargs, ls_dwsyntax, atr_obj, as_filtercols, &
					inv_cache.SQL, as_sql, lpo_obj, ldw_control, lds_control, ls_importfile)

end function

public function integer of_register (integer ai_level, string as_labelcolumn, string as_retrieveargs, string as_dwobjectname, string as_filtercols);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_register
//
//	Access:		public
//
//	Arguments:
//	ai_Level				The TreeView level to associate the data source with.
//	as_LabelColumn		The column in the DataWindow object to display. 
//	as_RetrieveArgs	Retrieval/filter arguments for the level.  These should
//								be separated by commas in the format:
//										:keyword.n.column
//								where column is the name of a column in another level's
//								data source.  If keyword is 'level', n is an absolute level 
//								number.  If keyword is 'parent', n is a number relative to
//								the current level (i.e. :parent.2.c1 would be column c1 in
//								the DataWindow for the level 2 levels above this one).
//	as_dwobjectname	The datawindow object to be used for the data source.
//	as_FilterCols		Columns on the datastore object used for filtering the datastore.
//							This type of datasource does a retrieve once and uses the 
//							retrieval arguments to to filter out those records which do not
//							match.  The column names should be separated by commas.
//								ex:  "colname.NA, Col2name.NO, col3name"
//								means "Not (Colname=xxx) And Not (col2name=xxx) Or col3name=xxx"
//								ex:  "colname.A, Col2name"
//								means "Colname=xxx And col2name=xxx"
//									xxx is the values provided by the retrieval args
//							The columns will be the left side of the filter statement and the
//							retrieval arguments are the right side (i.e. filtercol='retrieval args')
//
//	Returns:  integer
//	 1 = the data source was added successfully
//	-1 = argument validation error
//	-2 = the DataWindow object did not have any key columns assigned
//	-3 = a previous level had already been marked as recursive (there can be no more)
//
//
//	Description:	Register a datawindow object as a data source for a level of the TreeView.  
//						The data source will be linked to the TreeView level and used
//						to populate.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

n_tr			ltr_obj
string		ls_dwobjectname
string		ls_retrieveargs
string		ls_sql
powerobject lpo_obj[]
datawindow	ldw_control
datastore	lds_control
string		ls_importfile

// Check Arguments
If IsNull(as_dwobjectname) or Len(Trim(as_dwobjectname))= 0 Then Return -1

SetNull(ls_sql)
SetNull(ldw_control)
SetNull(lds_control)
SetNull(ls_importfile)

Return of_register(ai_Level, as_LabelColumn, as_retrieveargs, as_dwobjectname, ltr_obj, as_filtercols, &
			inv_cache.DATAOBJECTDATA, ls_sql, lpo_obj, ldw_control, lds_control, ls_importfile)

end function

public function integer of_register (integer ai_level, string as_labelcolumn, string as_retrieveargs, string as_dwobjectname, powerobject apo_data[], string as_filtercols);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_register
//
//	Access:		public
//
//	Arguments:
//	ai_Level				The TreeView level to associate the data source with.
//	as_LabelColumn		The column in the DataWindow object to display. 
//	as_RetrieveArgs	Retrieval/filter arguments for the level.  These should
//								be separated by commas in the format:
//										:keyword.n.column
//								where column is the name of a column in another level's
//								data source.  If keyword is 'level', n is an absolute level 
//								number.  If keyword is 'parent', n is a number relative to
//								the current level (i.e. :parent.2.c1 would be column c1 in
//								the DataWindow for the level 2 levels above this one).
//	as_dwobjectname	The datawindow object to be used for the data source.
//	apo_data				The powerobject object to be used for the data source.
//	as_FilterCols		Columns on the datastore object used for filtering the datastore.
//							This type of datasource does a retrieve once and uses the 
//							retrieval arguments to to filter out those records which do not
//							match.  The column names should be separated by commas.
//								ex:  "colname.NA, Col2name.NO, col3name"
//								means "Not (Colname=xxx) And Not (col2name=xxx) Or col3name=xxx"
//								ex:  "colname.A, Col2name"
//								means "Colname=xxx And col2name=xxx"
//									xxx is the values provided by the retrieval args
//							The columns will be the left side of the filter statement and the
//							retrieval arguments are the right side (i.e. filtercol='retrieval args')
//
//	Returns:  integer
//	 1 = the data source was added successfully
//	-1 = argument validation error
//	-2 = the DataWindow object did not have any key columns assigned
//	-3 = a previous level had already been marked as recursive (there can be no more)
//
//
//	Description:	Register a powerobject (usually an array) as a data source for a level of the TreeView.  
//						The data source will be linked to the TreeView level and used
//						to populate.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

n_tr			ltr_obj
string		ls_dwobjectname
string		ls_retrieveargs
string		ls_sql
powerobject lpo_obj[]
datawindow	ldw_control
datastore	lds_control
string		ls_importfile

// Check Arguments
If IsNull(as_dwobjectname) or Len(Trim(as_dwobjectname))= 0 Then Return -1
If IsNull(apo_data) Then Return -1
If UpperBound(apo_data) = 0 Then Return -1

SetNull(ls_sql)
SetNull(ldw_control)
SetNull(lds_control)
SetNull(ls_importfile)

Return of_register(ai_Level, as_LabelColumn, as_retrieveargs, as_DWobjectname, ltr_obj, as_filtercols, &
				inv_cache.POWEROBJECT, ls_sql, apo_data, ldw_control, lds_control, ls_importfile)

end function

public function integer of_register (integer ai_level, string as_labelcolumn, string as_retrieveargs, string as_dwobjectname, n_tr atr_obj, string as_filtercols, string as_method, string as_sql, powerobject apo_data[], datawindow adw_control, datastore ads_control, string as_importfile);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_register
//
//	Access:		public
//
//	Arguments:
//	ai_Level					The TreeView level to associate the data source with.
//	as_LabelColumn			The column in the DataWindow object to display. 
//	as_RetrieveArgs		Retrieval/filter arguments for the level.  These should
//									be separated by commas in the format:
//										:keyword.n.column
//									where column is the name of a column in another level's
//									data source.  If keyword is 'level', n is an absolute level 
//									number.  If keyword is 'parent', n is a number relative to
//									the current level (i.e. :parent.2.c1 would be column c1 in
//									the DataWindow for the level 2 levels above this one).
//	as_DWobjectname		The DataWindow object to be used for the data source.
//	atr_obj					The transaction object for this data source (can be
//									different for each level).
//	as_FilterCols		Columns on the datastore object used for filtering the datastore.
//								This type of datasource does a retrieve once and uses the 
//								retrieval arguments to to filter out those records which do not
//								match.  The column names should be separated by commas.
//									ex:  "colname.NA, Col2name.NO, col3name"
//									means "Not (Colname=xxx) And Not (col2name=xxx) Or col3name=xxx"
//									ex:  "colname.A, Col2name"
//									means "Colname=xxx And col2name=xxx"
//									xxx is the values provided by the retrieval args
//								The columns will be the left side of the filter statement and the
//								retrieval arguments are the right side (i.e. filtercol='retrieval args')
//	as_method			The Method we will use to populate the data source
//	as_sql				The SQL Statement to be used for the data source (if specified).
//	apo_data[]			The data to be used for the data source (if specified).
//	adw_control			The datawindow control to be used for the data source (if specified).
//	ads_control			The datastore control to be used for the data source (if specified).
//	as_importfile		The import file from which to be used for the data source (if specified).
//
//	Returns:  integer
//	 1 = the data source was added successfully
//	-1 = argument validation error
//	-3 = a previous level had already been marked as recursive (there can be no more)
//	-4 = column label datatype was not in the data source
//	-5 = SetTransObject failed for the data source
// -7 = Error from Cache Registration 
//
//	Description:	Register a data source for a level of the TreeView.  The data source is a
//						DataWindow object that will be linked to the TreeView level and used
//						to populate.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Integer	li_NumDS, li_Cnt, li_rc
String	ls_rc, ls_columncount, ls_sqlerr
window	lw_parentwindow
n_ds		lds_test

// Check arguments
if IsNull (ai_level) or ai_level <= 0 or &
	Len (as_labelcolumn) = 0 or IsNull (as_labelcolumn) or &
	Len (as_DWobjectname) = 0 or IsNull (as_DWobjectname) or &
	Len (as_method) = 0 or IsNull (as_method) then
	return -1
end if

// Check if recurrsive is being used
li_NumDS = UpperBound(inv_attrib)
If li_NumDS > 0 Then
	If inv_attrib[li_NumDS].ib_Recursive Then
		// If the last one is recursive, there can be no more
		Return -3
	End if
End if

// create temporary datastore 
lds_test = Create n_ds
If as_method = inv_cache.SQL then
	lds_test.Create( as_DWobjectname, ls_sqlerr )
	If Len(ls_sqlerr) > 0 Then
		Destroy lds_test
		Return -1		
	End If 	
Else
	lds_test.DataObject = as_DWobjectname
End If

// label column must be in the datawindow
If lds_test.Describe(as_LabelColumn + ".Band") = "!" Then 
	Destroy lds_test
	Return -4
End if
	
// don't need this anymore
Destroy lds_test

// Create a DataStore to use as the data source
// level does not exist and neither does datasource - so create it
If li_NumDS < ai_Level Then
	inv_attrib[ai_Level].ids_obj = Create n_ds
	If as_method = inv_cache.SQL Then
		inv_attrib[ai_Level].ids_obj.Create( as_DWobjectname, ls_sqlerr )
	Else
		inv_attrib[ai_Level].ids_obj.DataObject = as_DWobjectname
	End If
End If

If IsNull(inv_attrib[ai_Level].ids_obj) Or Not IsValid(inv_attrib[ai_Level].ids_obj) Then
	// level exists, but no datastore defined for it
	inv_attrib[ai_Level].ids_obj = Create n_ds
End if
// create a new dataobject for the level
If as_method = inv_cache.SQL Then
	inv_attrib[ai_Level].ids_obj.Create( as_DWobjectname, ls_sqlerr )
Else
	inv_attrib[ai_Level].ids_obj.DataObject = as_DWobjectname
End If

// Set values in the structure array
inv_attrib[ai_Level].is_Dataobject = as_DWobjectname
inv_attrib[ai_Level].is_LabelColumn = as_LabelColumn
inv_attrib[ai_Level].is_RetrieveArgs = as_RetrieveArgs
inv_attrib[ai_Level].is_FilterCols = as_filtercols
inv_attrib[ai_Level].itr_obj = atr_obj
inv_attrib[ai_Level].is_Method = as_Method

// Set parameters for the DataStore
inv_attrib[ai_Level].ids_obj.of_SetBase(true)
inv_attrib[ai_Level].ids_obj.of_SetAppend(true)

// datastore needs parent window reference to perform updates
itv_requestor.of_Getparentwindow(lw_parentwindow)
inv_attrib[ai_Level].ids_obj.of_SetParentWindow(lw_parentwindow)

// make sure transaction object is valid
If IsValid(atr_obj) Then
	If inv_attrib[ai_Level].ids_obj.of_SetTransObject(atr_obj) <> 1 Then 
		inv_attrib[ai_Level].is_Dataobject = ""
		Destroy inv_attrib[ai_Level].ids_obj
		Return -5
	End If
End If

// register with cache service
li_rc = of_registerdatasource(ai_level, as_method, as_DWobjectname, atr_obj, &
										as_sql, apo_data, adw_control, ads_control, as_importfile)
If li_rc < 1 Then 
	inv_attrib[ai_Level].is_Dataobject = ""
	Destroy inv_attrib[ai_Level].ids_obj
	Return -7
End If

Return 1

end function

protected function integer of_registerdatasource (integer ai_level, string as_method, string as_dataobject, n_tr atr_obj, string as_sql, powerobject apo_data[], datawindow adw_control, datastore ads_control, string as_importfile);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_RegisterDataSource
//
//	Access:		protected
//
//	Arguments:  
//	ai_Level				The TreeView level to associate the data source with.
//	as_method			The Method we will use to populate the data source
//	as_dataobject		The DataWindow object to be used for the data source.
//	atr_obj				The transaction object for this data source (can be
//								different for each level).
//	as_sql				The SQL Statement to be used for the data source (if specified).
//	apo_data[]			The data to be used for the data source (if specified).
//	adw_control			The datawindow control to be used for the data source (if specified).
//	ads_control			The datastore control to be used for the data source (if specified).
//	as_importfile		The import file from which to be used for the data source (if specified).
//
//	Returns:  Integer
//	 1 if it succeeds
//	-1 if an error occurs.
//	
//	Description:
//	Register the datasource definition with the cache service.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Integer	li_rc
string	ls_cacheid

// create the cache id
ls_cacheid = CACHE_ID + string(ai_level)

CHOOSE CASE as_method
	CASE inv_cache.DATASTORECONTROL
		// register a datastore control
		If IsValid(ads_control) Then
			If inv_cache.of_IsRegistered(ls_cacheid) > 0 Then
				// already registered so unregister and re-register
				li_rc = inv_cache.of_unregister(ls_cacheid)
			End If				
			li_rc = inv_cache.of_register(ls_cacheid, ads_control, TRUE)
		Else
			li_rc = -1
		End If
		Return li_rc
	CASE inv_cache.DATAWINDOWCONTROL
		// register a datawindow control
		If IsValid(adw_control) Then
			If inv_cache.of_IsRegistered(ls_cacheid) > 0 Then
				// already registered so unregister and re-register
				li_rc = inv_cache.of_unregister(ls_cacheid)
			End If				
			li_rc = inv_cache.of_register(ls_cacheid, adw_control, TRUE)
		Else
			li_rc = -1
		End If
		Return li_rc
	CASE inv_cache.POWEROBJECT
		// register a powerobject 
		If (UpperBound(apo_data) <> 0) and Not IsNull(apo_data) Then
			If inv_cache.of_IsRegistered(ls_cacheid) > 0 Then
				// already registered so unregister and re-register
				li_rc = inv_cache.of_unregister(ls_cacheid)
			End If				
			li_rc = inv_cache.of_register(ls_cacheid, as_dataobject, apo_data)
		Else
			li_rc = -1
		End If
		Return li_rc
	CASE inv_cache.IMPORTFILE
		// register a file from disk
		If Len(as_importfile) <> 0 and Not IsNull(as_importfile) Then
			If inv_cache.of_IsRegistered(ls_cacheid) > 0 Then
				// already registered so unregister and re-register
				li_rc = inv_cache.of_unregister(ls_cacheid)
			End If				
			li_rc = inv_cache.of_register(ls_cacheid, as_dataobject, as_importfile, TRUE)
		Else
			li_rc = -1
		End If
		Return li_rc
	CASE inv_cache.RETRIEVE
		// register a Retrieve
		If Len(as_dataobject) <> 0 and Not IsNull(as_dataobject) and &
			IsValid(atr_obj) and Not IsNull(atr_obj) Then
				If inv_cache.of_IsRegistered(ls_cacheid) > 0 Then
					// already registered so unregister and re-register
					li_rc = inv_cache.of_unregister(ls_cacheid)
				End If				
				li_rc = inv_cache.of_register(ls_cacheid, as_dataobject, atr_obj, FALSE)
		Else
			li_rc = -1
		End If
		Return li_rc
	CASE inv_cache.SQL
		// register a SQL statement
		If Len(as_sql) <> 0 and Not IsNull(as_sql) and &
			IsValid(atr_obj) and Not IsNull(atr_obj) Then
				If inv_cache.of_IsRegistered(ls_cacheid) > 0 Then
					// already registered so unregister and re-register
					li_rc = inv_cache.of_unregister(ls_cacheid)
				End If				
				li_rc = inv_cache.of_register(ls_cacheid, atr_obj, as_sql, FALSE)
		Else
			li_rc = -1
		End If
		Return li_rc
	CASE inv_cache.DATAOBJECTDATA
		// register a dataobject
		If Len(as_dataobject) <> 0 and Not IsNull(as_dataobject) Then
			If inv_cache.of_IsRegistered(ls_cacheid) > 0 Then
				// already registered so unregister and re-register
				li_rc = inv_cache.of_unregister(ls_cacheid)
			End If				
			li_rc = inv_cache.of_register(ls_cacheid, as_dataobject)
		Else
			li_rc = -1
		End If
		Return li_rc
	CASE ELSE
		// didn't register anything
		Return -1
END CHOOSE

// didn't register anything
return -1

end function

public function integer of_resettree ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_ResetTree
//
//	Access:		public
//
//	Arguments:  None
//
//	Returns:  Integer
//	 1 if it succeeds
//	-1 if an error occurs.
//	
//	Description:
//	Reset the entire treeview datastores and clear the undo fields.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
long 		ll_rootitem
integer	li_index, li_level

// reset all datastores
If this.of_reset() <> 1 Then Return -1

this.of_clearundo()

Return 1
end function

public function integer of_reset (integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_Reset
//
//	Access:		public
//
//	Arguments:  
//	ai_Level		The level for which to reset the DataStore.  If ai_Level is 0, 
//						all DataStores will be updated.
//						NOTE:  There is only one DataStore for all 
//						recursive levels.  So if ai_Level is a recursive level, 
//						all levels using that DataStore will be updated.
//
//
//	Returns:  Integer
//	 1 if it succeeds
//	-1 if an error occurs.
//	
//	Description:
//	Reset the treeview datastores.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
integer	li_index, li_start, li_cnt


// check arguments
If isNull(ai_level) or (ai_level < 0) Then Return -1

li_Index = UpperBound(inv_attrib)
If ai_Level = 0 Then
	// Update all DataStores
	li_Start = 1
Else
	If ai_Level < li_Index Then
		li_Index = ai_Level
	End If
	
	li_Start = li_Index
End If

// reset the datastores
For li_Cnt = li_start to li_index
	If IsValid(inv_attrib[li_Cnt].ids_obj) Then
		If inv_attrib[li_Cnt].ids_obj.Reset() <> 1 Then Return -1
	End If
End For

Return 1
end function

public function integer of_getobjects (ref powerobject apo_objects[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetObjects
//
//	Access:		public
//
//	Arguments:  
//	apo_objects[]	array holding objects which are updateable.  Passed by reference
//
//	Returns:		Integer
//					# of objects returned 
//	
//	Description:
//	Return the objects on the service which are updateable (ie datastores).  Used as part
//	of the SUO process
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

powerobject	lpo_empty[]
Integer		li_NumDS, li_Cnt

apo_objects = lpo_empty

// Determine the appropriate array.
li_NumDS = UpperBound(inv_attrib)
For li_Cnt = 1 To li_NumDS
	If IsValid(inv_attrib[li_Cnt].ids_obj) Then
		apo_objects[li_cnt] = inv_attrib[li_Cnt].ids_obj
	End If
End For

Return upperbound(apo_objects)
end function

public function integer of_converttorow (long al_parent, string aa_columnvalues[], ref n_ds ads_obj, ref long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_converttorow
//
//	Access:		public
//
//	Arguments:
//	al_Parent			The handle to the parent we want to add the item to
//	aa_ColumnValues[]	The array containing the data to be used for the new row.
//	ads_obj				The datastore to place the new row in (the dataobjects should have
//								the same column types).  Passed by reference
//	al_Row				The new row of the array in the datastore.  Passed by reference
//
//	Returns:		Integer
//					 1 if successful
//					-1 if an error occurrs.
//
//	Description:	Convert an array of values which corresponded to columns in the 
//						source dataobject to a row in a datastore.  A row does not have to
//						be added to the data source first using this method
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
Integer				li_columns, li_cnt, li_newlevel, li_index
string				ls_Sqlerr
window				lw_parentwindow
treeviewitem		ltvi_parent

// check reference variables
If IsNull(itv_requestor) or Not IsValid(itv_requestor) Then Return -1

// check arguments
If (al_parent < 0) or IsNull(al_parent) then Return -1
li_columns = UpperBound(aa_columnvalues)
If (li_columns < 1) or IsNull(li_columns) then Return -1

// Find the Treeview Level to insert the item on
If al_Parent <> 0 Then
	If itv_requestor.GetItem(al_Parent, ltvi_Parent) = -1 Then Return -1
	li_NewLevel = ltvi_Parent.Level + 1
Else
	li_NewLevel = 1
End If

// Get index into the data source array
li_Index = UpperBound(inv_attrib)
If li_NewLevel <= li_Index Then
	li_Index = li_NewLevel
Else
	// If new item is being added to a level > li_Index then
	// inv_attrib[li_Index] must be recursive
	If Not inv_attrib[li_Index].ib_Recursive Then Return -1
End If

// Populate the storage datastore
If inv_attrib[li_Index].is_method = inv_cache.SQL then
	ads_obj.Create( inv_attrib[li_Index].is_dataobject, ls_sqlerr )
	If Len(ls_sqlerr) > 0 Then
		Return -1		
	End If 	
Else
	ads_obj.DataObject = inv_attrib[li_Index].is_dataobject
End If
ads_obj.of_SetBase(true)
itv_requestor.of_GetParentWindow(lw_parentwindow)
ads_obj.of_SetParentWindow(lw_parentwindow)

al_row = ads_obj.InsertRow(0)
If al_row < 1 Then 
	Return -1
End If

// copy the argument array to the datastore column by column
For li_cnt = 1 to li_columns
	ads_obj.object.data[al_row, li_cnt] = aa_columnvalues[li_cnt]
End For

return 1

end function

public function integer of_getlevel (long al_handle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetLevel
//
//	Access:		public
//
//	Arguments:
//	al_handle		The handle of the treeview item.
//
//	Returns:		Integer
//					 # of the level the treeview item is on if successful
//					-1	if an error occurs
//
//	Description:	Find the level a treeview item resides on.  This function takes 
//						the recursive natrue of the treeview into account.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
Integer				li_Index, li_Limit
TreeViewItem		ltvi_Item

// check reference variables
If IsNull(itv_requestor) or Not IsValid(itv_requestor) Then Return -1

If itv_requestor.GetItem(al_Handle, ltvi_Item) = -1 Then Return -1

// Determine proper element in the data source structure
li_Limit = UpperBound(inv_attrib)
If ltvi_Item.Level > li_Limit Then
	li_Index = li_Limit
Else
	li_Index = ltvi_Item.Level
End If

return li_Index

end function

public function integer of_confirmdelete (long al_amount);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_ConfirmDelete
//
//	Access:		protected
//
//	Arguments:
//	al_amount			number of rows to confirm deletion for
//
//	Returns:  integer
//	 1 = yes (ok to delete)
//	 2 = no (do not delete)
//	-1 = error
//
//	Description:  Displays messagebox confirming deletion
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// Validate amount argument
if al_amount <=0 then
	return -1
end if

// Display confirm delete message based on single/multiple deletes
if al_amount = 1 then
	return of_MessageBox ("pfc_tv_datasource_confirmdeletesingle", "Confirm Delete", &
			"Are you sure you want to delete " + is_displayitem + "?", question!, yesno!, 1)
else
	return of_MessageBox ("pfc_tv_datasource_confirmdeletemulti", "Confirm Multiple Delete", &
			"Are you sure you want to delete these " + &
			String (al_amount) + " " + is_displayunits + "?", question!, yesno!, 1)
end if

end function

public function integer of_getlevel (n_ds ads_obj);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetLevel
//
//	Access:		public
//
//	Arguments:
//	ads_obj		The datastore object to find the level for.
//
//	Returns:		Integer
//					 # of the level the datastore object populates if successful
//					-1	if an error occurs
//
//	Description:	Find the level the datastore object populates. 
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
Integer		li_Level, li_Limit
String		ls_syntax, ls_sqlerr, ls_newsyntax
n_ds			lds_test

If IsNull(ads_obj) or Not Isvalid(ads_obj) Then Return -1

// Determine proper element in the data source structure
li_Limit = UpperBound(inv_attrib)
For li_Level = 1 to li_Limit
	// compare to datawindow defined for level
	If inv_attrib[li_Level].is_dataobject = ads_obj.dataobject then
		Return li_Level
	End If
	// check for SQL as source
	If ads_obj.dataobject = "" AND inv_attrib[li_level].is_method = inv_cache.SQL then
		ls_syntax = ads_obj.object.DataWindow.Syntax
		// create temporary datastore 
		lds_test = Create n_ds
		lds_test.Create( inv_attrib[li_Level].is_dataobject, ls_sqlerr )
		If Len(ls_sqlerr) > 0 Then
			Destroy lds_test
			Continue		
		End If 	
		ls_newsyntax = lds_test.object.Datawindow.Syntax
		Destroy lds_test
		// if syntax is the same we have the right level
		If ls_syntax = ls_newsyntax then
			return li_level
		end if
	end if
Next

return -1
end function

public function boolean of_isrecursivelevel (integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_IsRecursiveLevel
//
//	Access:		Public
//
//	Arguments:	
//	ai_level		The level of the treeview to find out if it is recursive
//
//	Returns:		boolean
//					true = level is recursive
//					false = level is not recursive
//
//	Description:
//	Returns whether the treeview level is recursive
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
Integer	li_limit

// check arguments
If IsNull(ai_level) or (ai_level < 0) then
	Return False
End If

// Verify that this is a valid level
li_Limit = UpperBound(inv_attrib)
If ai_Level > li_Limit Then
	// Allow for recursion
	Return inv_attrib[li_Limit].ib_Recursive
End If

Return inv_attrib[ai_level].ib_recursive

end function

public function boolean of_canundo (ref string as_undotype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_CanUndo
//
//	Access:		Public
//
//	Arguments:	
//	as_undotype		The type of undo we are performing.  Passed by reference
//
//	Returns:		Boolean
//					true = we can undo the last edit/insert/delete
//					false = cannot undo the last edit/insert/delete
//
//	Description:
//	Returns if undo can be performed and the type of undo that can be performed
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// initialize the undo type
as_undotype = ""

// if undo not on then we cannot undo
If Not ib_undo Then
	Return FALSE
End If

// Validate arguments
CHOOSE CASE is_undotype
	CASE UNDO_EDIT, UNDO_INSERT, UNDO_DELETE
		// Good style.
		as_undotype = is_undotype
		Return TRUE
END CHOOSE

Return FALSE

end function

protected function integer of_setcache (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_setCache
//
//	Access:  	protected
//
//	Arguments:
//	ab_switch   enable/disable the internal cache
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Instantiates or destroys the listview cacheing service
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

integer	li_rc

// Check arguments
if IsNull (ab_switch) then
	return -1
end if

if ab_Switch then
	if IsNull(inv_cache) Or not IsValid (inv_cache) then
		inv_cache = create n_cst_dwcache
		li_rc = 1
	end if
else
	if IsValid (inv_cache) then
		destroy inv_cache
		li_rc = 1
	end if	
end if

return li_rc


end function

public function integer of_removechildren (long al_handle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_RemoveChildren
//
//	Access:		public
//
//	Arguments:
//	al_Handle	The handle of the item for which all child items will
//						be removed.
//
//	Returns:		Integer
//					 1	- the children were removed successfully
//					-1	- an error occurred
//
//	Description:	Remove all the items from the TreeView below a specified item.
//						All appropriate rows will be removed from the DataStores.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Integer			li_level
Long				ll_Child, ll_Next, ll_Row
n_ds				ads_obj
TreeViewItem	ltvi_Item

// check reference variables
If IsNull(itv_requestor) or Not IsValid(itv_requestor) Then Return -1

ll_Child = itv_requestor.FindItem(ChildTreeItem!, al_Handle)
Do While ll_Child > 0

	// Recursively remove its child items
	If of_RemoveChildren(ll_Child) = -1 Then Return -1
	
	// Discard its row from the DataStore and the item itself
	If of_GetDataRow(ll_Child, ads_obj, ll_Row) = -1 Then Return -1
	
	// parent level knows the style to remove the children
	li_level = of_GetLevel(ll_child) - 1
	If li_level < 1 Then Return -1
	
	CHOOSE CASE inv_attrib[li_level].ii_deletestyle
		Case DELETE_ROWS 
			// This will perform Deletes on all Children rows for the deleted Master row.
			If ads_obj.DeleteRow(ll_Row) < 1 Then Return -1
		Case DISCARD_ROWS
			// This will perform Discards on all Children rows for the deleted Master row.
			If ads_obj.RowsDiscard(ll_Row, ll_Row, Primary!) < 1 Then Return -1
	End Choose
	
	ll_Next = itv_requestor.FindItem(NextTreeItem!, ll_Child)

	itv_requestor.DeleteItem(ll_Child)
	ll_Child = ll_Next
Loop

Return 1

end function

public function string of_getlabelcolumn (integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetLabelColumn
//
//	Access:		Public
//
//	Arguments:	
//	ai_Level		The level of the treeview to get the information from.
//
//	Returns:		string
//					string holding the column name used by the level
//					"!" if error
//
//	Description:
//	Returns the column name used from the datasource as item label
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
integer	li_limit

// check arguments
If isNull(ai_level) or (ai_level < 1) Then Return "!"

// Verify that this is a valid level
li_Limit = UpperBound(inv_attrib)
If ai_Level > li_Limit Then
	// Allow for recursion
	If Not inv_attrib[li_Limit].ib_Recursive Then Return "!"
	
	ai_Level = li_Limit
End If

return inv_attrib[ai_level].is_LabelColumn

end function

public function string of_getmethod (integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetMethod
//
//	Access:		Public
//
//	Arguments:	
//	ai_Level		The level of the treeview to get the information from.
//
//	Returns:		string
//					string holding the method used by the level
//					"!" if error
//
//	Description:
//	Returns the method used to populate the datasource
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
integer	li_limit

// check arguments
If isNull(ai_level) or (ai_level < 1) Then Return "!"

// Verify that this is a valid level
li_Limit = UpperBound(inv_attrib)
If ai_Level > li_Limit Then
	// Allow for recursion
	If Not inv_attrib[li_Limit].ib_Recursive Then Return "!"
	
	ai_Level = li_Limit
End If

return inv_attrib[ai_level].is_Method

end function

public function string of_getoverlaypicturecolumn (integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetOverlayPictureColumn
//
//	Access:		Public
//
//	Arguments:	
//	ai_Level		The level of the treeview to get the information from.
//					string holding the overlay picture column name used by the level
//					"!" if error
//
//	Returns:		string
//
//	Description:
//	Returns the column name used from the datasource as the overlay display picture
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

integer	li_limit

// check arguments
If isNull(ai_level) or (ai_level < 1) Then Return "!"

// Verify that this is a valid level
li_Limit = UpperBound(inv_attrib)
If ai_Level > li_Limit Then
	// Allow for recursion
	If Not inv_attrib[li_Limit].ib_Recursive Then Return "!"
	
	ai_Level = li_Limit
End If

return inv_attrib[ai_level].is_OverlayColumn

end function

public function string of_getpicturecolumn (integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetPictureColumn
//
//	Access:		Public
//
//	Arguments:	
//	ai_Level		The level of the treeview to get the information from.
//
//	Returns:		string
//					string holding the picture column name used by the level
//					"!" if error
//
//	Description:
//	Returns the column name used from the datasource as the picture display
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
integer	li_limit


// check arguments
If isNull(ai_level) or (ai_level < 1) Then Return "!"

// Verify that this is a valid level
li_Limit = UpperBound(inv_attrib)
If ai_Level > li_Limit Then
	// Allow for recursion
	If Not inv_attrib[li_Limit].ib_Recursive Then Return "!"
	
	ai_Level = li_Limit
End If

return inv_attrib[ai_level].is_PictureColumn

end function

public function string of_getstatepicturecolumn (integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetStatePictureColumn
//
//	Access:		Public
//
//	Arguments:	
//	ai_Level		The level of the treeview to get the information from.
//
//	Returns:		string
//					string holding the state picture column name used by the level
//					"!" if error
//
//	Description:
//	Returns the column name used from the datasource as the state picture display
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
integer	li_limit

// check arguments
If isNull(ai_level) or (ai_level < 1) Then Return "!"

// Verify that this is a valid level
li_Limit = UpperBound(inv_attrib)
If ai_Level > li_Limit Then
	// Allow for recursion
	If Not inv_attrib[li_Limit].ib_Recursive Then Return "!"
	
	ai_Level = li_Limit
End If

return inv_attrib[ai_level].is_StateColumn

end function

public function string of_getselectedpicturecolumn (integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetSelectedPictureColumn
//
//	Access:		Public
//
//	Arguments:	
//	ai_Level		The level of the treeview to get the information from.
//
//	Returns:		string
//					string holding the selected picture column name used by the level
//					"!" if error
//
//	Description:
//	Returns the column name used from the datasource as the selected picture display
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
integer	li_limit

// check arguments
If isNull(ai_level) or (ai_level < 1) Then Return "!"

// Verify that this is a valid level
li_Limit = UpperBound(inv_attrib)
If ai_Level > li_Limit Then
	// Allow for recursion
	If Not inv_attrib[li_Limit].ib_Recursive Then Return "!"
	
	ai_Level = li_Limit
End If

return inv_attrib[ai_level].is_SelectedColumn

end function

public function string of_getdataobject (integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetDataObject
//
//	Access:		Public
//
//	Arguments:	
//	ai_Level		The level of the treeview to get the information from.
//
//	Returns:		string
//					string holding the dataobject used by the level
//					"!" if error
//
//	Description:
//	Returns the dataobject used by the datasource to store the data for the level
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
integer	li_limit

// validate arguments
If IsNull(ai_level) or (ai_level < 1) Then Return "!"

// Verify that this is a valid level
li_Limit = UpperBound(inv_attrib)
If ai_Level > li_Limit Then
	// Allow for recursion
	If Not inv_attrib[li_Limit].ib_Recursive Then Return "!"
	
	ai_Level = li_Limit
End If

return inv_attrib[ai_level].is_DataObject

end function

public function integer of_setoverlaypicturecolumn (integer ai_level, string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetOverlayPictureColumn
//
//	Access:		Public
//
//	Arguments:	
//	ai_Level		The level of the treeview to set the information for.
//	as_column	column in datasource to be used for overlay picture display purposes
//						The column may be an integer (used as the picture index) or a
//						string (a bmp name which will be used as the picture).  Or a number
//						may be passed in (i.e. "1") which will be used as the state picture
//						index for all items.
//
//	Returns:		integer
//					 1 = success
//					-1 = failure
//
//	Description:
//		Sets the column name used from the datasource as the overlay display picture
//
//		Note:  The datasource(dataobject) must be set first before calling this function
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
string	ls_coltype

// Verify that this is a valid level
If ai_Level > UpperBound(inv_attrib) Then
	Return -1
Else
	If Trim(inv_attrib[ai_Level].is_DataObject) = "" Then
		Return -1
	End If
End If

If IsNull(as_column) Then
	Return -1
End If

// Check to make sure column is valid for the dataobject
If Trim(as_column) <> "" And Not IsNumber(as_column) And &
	inv_attrib[ai_Level].ids_obj.Describe(as_column + ".Band") = "!" Then 
		Return -1
End If

inv_attrib[ai_level].is_OverlayColumn = as_column

return 1
end function

public function integer of_setpicturecolumn (integer ai_level, string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetPictureColumn
//
//	Access:		Public
//
//	Arguments:	
//	ai_Level		The level of the treeview to set the information for.
//	as_Column		The column in the DataWindow object to use for the picture.
//							The column may be an integer (used as the picture index) or a
//							string (a bmp name which will be used as the picture).  Or a number
//							may be passed in (i.e. "1") which will be used as the picture index
//							for all items.
//
//	Returns:		integer
//					 1 = success
//					-1 = failure
//
//	Description:
//		Sets the column name used from the datasource as the picture display
//
//		Note:  The datasource(dataobject) must be set first before calling this function
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
string	ls_coltype

// Verify that this is a valid level
If ai_Level > UpperBound(inv_attrib) Then
	Return -1
Else
	If Trim(inv_attrib[ai_Level].is_DataObject) = "" Then
		Return -1
	End If
End If

If IsNull(as_column) Then
	Return -1
End If

// Check to make sure column is valid for the dataobject
If Trim(as_column) <> "" And Not IsNumber(as_column) And &
	inv_attrib[ai_Level].ids_obj.Describe(as_column + ".Band") = "!" Then 
		Return -1
End If

inv_attrib[ai_level].is_PictureColumn = as_column

return 1
end function

public function integer of_setstatepicturecolumn (integer ai_level, string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetStatePictureColumn
//
//	Access:		Public
//
//	Arguments:	
//	ai_Level		The level of the treeview to set the information for.
//	as_column	column in datasource to be used for state picture display purposes
//						The column may be an integer (used as the picture index) or a
//						string (a bmp name which will be used as the picture).  Or a number
//						may be passed in (i.e. "1") which will be used as the state picture
//						index for all items.
//
//	Returns:		integer
//					 1 = success
//					-1 = failure
//
//	Description:
//		Sets the column name used from the datasource as the state picture display
//
//		Note:  The datasource(dataobject) must be set first before calling this function
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
string	ls_coltype

// Verify that this is a valid level
If ai_Level > UpperBound(inv_attrib) Then
	Return -1
Else
	If Trim(inv_attrib[ai_Level].is_DataObject) = "" Then
		Return -1
	End If
End If

If IsNull(as_column) Then
	Return -1
End If

// Check to make sure column is valid for the dataobject
If Trim(as_column) <> "" And Not IsNumber(as_column) And &
	inv_attrib[ai_Level].ids_obj.Describe(as_column + ".Band") = "!" Then 
		Return -1
End If

inv_attrib[ai_level].is_StateColumn = as_column

return 1
end function

public function integer of_setselectedpicturecolumn (integer ai_level, string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetSelectedPictureColumn
//
//	Access:		Public
//
//	Arguments:	
//	ai_Level		The level of the treeview to set the information for.
//	as_column	column in datasource to be used for state picture display purposes
//						The column may be an integer (used as the picture index) or a
//						string (a bmp name which will be used as the picture).  Or a number
//						may be passed in (i.e. "1") which will be used as the state picture
//						index for all items.
//
//	Returns:		integer
//					 1 = success
//					-1 = failure
//
//	Description:
//		Sets the column name used from the datasource as the state picture display
//
//		Note:  The datasource(dataobject) must be set first before calling this function
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
string	ls_coltype

// Verify that this is a valid level
If ai_Level > UpperBound(inv_attrib) Then
	Return -1
Else
	If Trim(inv_attrib[ai_Level].is_DataObject) = "" Then
		Return -1
	End If
End If

If IsNull(as_column) Then
	Return -1
End If

// Check to make sure column is valid for the dataobject
If Trim(as_column) <> "" And Not IsNumber(as_column) And &
	inv_attrib[ai_Level].ids_obj.Describe(as_column + ".Band") = "!" Then 
		Return -1
End If

inv_attrib[ai_level].is_SelectedColumn = as_column

return 1
end function

public function string of_getretrieveargs (integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetRetreiveArgs
//
//	Access:		public
//
//	Arguments:
//	ai_Level		The level of the treeview to get the information from.
//
//	Returns:		String
//					string holding the definition of retrieval arguments used by the level
//					"!" if error
//
//	Description:	Get the string defining the retrieval arguments for a level of the TreeView
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
integer	li_limit

// check arguments
If isNull(ai_level) or (ai_level < 1) Then Return "!"

// Verify that this is a valid level
li_Limit = UpperBound(inv_attrib)
If ai_Level > li_Limit Then
	// Allow for recursion
	If Not inv_attrib[li_Limit].ib_Recursive Then Return "!"
	
	ai_Level = li_Limit
End If

return inv_attrib[ai_level].is_retrieveargs

end function

public function integer of_getlevelattributes (integer ai_level, ref n_cst_tvsrvattrib anv_attrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetLeveLAttributes
//
//	Access:		Public
//
//	Arguments:	
//	ai_Level		The level of the treeview to get the information from.
//	anv_attrib	The attributes object containing the attributes for the level
//
//	Returns:		Integer
//
//	Description:
//	Returns all the attributes used to populate the datasource for the level
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
integer					li_limit
n_cst_tvsrvattrib		lnv_emptyattrib

// check arguments
If isNull(ai_level) or (ai_level < 1) Then Return -1

// Verify that this is a valid level
li_Limit = UpperBound(inv_attrib)
If ai_Level > li_Limit Then
	// Allow for recursion
	If Not inv_attrib[li_Limit].ib_Recursive Then Return -1
	
	ai_Level = li_Limit
End If

anv_attrib = lnv_emptyattrib
anv_attrib = inv_attrib[ai_level]

return 1

end function

public function integer of_reset ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_Reset
//
//	Access:		public
//
//	Arguments:  
//
//	Returns:  Integer
//	 1 if it succeeds
//	-1 if an error occurs.
//	
//	Description:
//	Reset all the treeview datastores.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Return of_reset(0)
end function

public function integer of_resetupdate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_ResetUpdate
//
//	Access:		public
//
//	Arguments:
//
//	Returns:		Integer
//					 1	- the flags were reset successfully
//					-1	- an error occurred
//
//	Description:	Reset the update flags for a DataStore associated with a level of the TreeView.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Return of_resetupdate(0)

end function

public function integer of_setitemattributes (ref n_ds ads_source, long al_row, ref treeviewitem atvi_item);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetItemAttributes
//
//	Access:		public
//
//	Arguments:
//	ads_source	The DataStore with the data used to populate the item.  Passed
//						by reference.
//	al_Row		The row in the DataStore for the item.
//	atvi_Item	The TreeView item that is being populated.  Passed by reference.
//
//	Returns:		Integer
//					Returns 1 if the item was populated successfully, -1 if an error occurrs.
//
//	Description:	Set the attributes of a TreeView item with data from its DataStore.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Integer	li_overlay, li_picture, li_selected, li_state, li_level, li_levelcount
string	ls_picturecolumn, ls_statecolumn, ls_overlaycolumn, ls_selectedcolumn
string	ls_picture, ls_key

// Validate required reference.
If IsNull(itv_requestor) or Not IsValid(itv_requestor) Then Return -1
If IsNull(ads_source) or Not IsValid(ads_source) Then Return -1
If IsNull(ads_source.inv_base) or Not IsValid(ads_source.inv_base) Then Return -1

SetPointer(Hourglass!)

// determine which level the datastore belongs to
li_level = of_GetLevel(ads_source)
If li_level < 1 then Return -1

// Set Label
atvi_Item.Label = ads_source.inv_base.of_GetItem(al_Row, inv_attrib[li_level].is_LabelColumn)

//// Set Data to the unique key
//ls_key = this.of_encodekey(ads_source, al_Row)
//If ls_key = "!" then return -1
atvi_Item.Data = ""
//
// Set the children attribute
li_levelcount = upperbound(inv_attrib)
If li_level < li_levelcount Or inv_attrib[li_level].ib_Recursive Then
	atvi_Item.Children = True
Else
	atvi_Item.Children = False
End if

// Set the various picture indexes
ls_picturecolumn = inv_attrib[li_level].is_PictureColumn
If Trim(ls_PictureColumn) <> "" Then
	If IsNumber(ls_PictureColumn) Then
		// The Picture Index is hard coded
		li_picture = Integer(ls_PictureColumn)
	ElseIf Left(ads_source.Describe(ls_PictureColumn + ".coltype"), 4) = "char" Then
		// The column contains a bmp name, so add the picture
		ls_picture = ads_source.GetItemString(al_Row, ls_PictureColumn)
		If Not IsNull(ls_picture) Then 
			li_picture = itv_requestor.AddPicture(ls_picture)
		Else
			li_picture = 0
		End If
	Else 
		// the column contains a index
		li_picture = ads_source.GetItemNumber(al_Row, ls_PictureColumn)
		If IsNull(li_picture) Then li_picture = 0
	End If
End if
atvi_Item.PictureIndex = li_picture
	
// Set the selected picture for the item - cannot add it to the picture array
ls_selectedcolumn = inv_attrib[li_level].is_SelectedColumn
If Trim(ls_selectedcolumn) <> "" Then
	If IsNumber(ls_selectedcolumn) Then
		// The Picture Index is hard coded
		li_selected = Integer(ls_selectedcolumn)
	Else 
		// the column contains a index
		li_selected = ads_source.GetItemNumber(al_Row, ls_selectedcolumn)
		If IsNull(li_selected) Then li_selected = 0
	End If
End if
atvi_Item.SelectedPictureIndex = li_selected

// Set the state picture for the item
ls_statecolumn = inv_attrib[li_level].is_StateColumn
If Trim(ls_StateColumn) <> "" Then
	If IsNumber(ls_StateColumn) Then
		// The Picture Index is hard coded
		li_state = Integer(ls_StateColumn)
	ElseIf Left(ads_source.Describe(ls_StateColumn + ".coltype"), 4) = "char" Then
		// The column contains a bmp name, so add the picture
		ls_picture = ads_source.GetItemString(al_Row, ls_StateColumn)
		If Not IsNull(ls_picture) Then 
			li_state = itv_requestor.AddStatePicture(ls_picture)
		Else
			li_state = 0
		End If
	Else 
		// the column contains a index
		li_state = ads_source.GetItemNumber(al_Row, ls_StateColumn)
		If IsNull(li_state) Then li_state = 0
	End If
End if
atvi_Item.StatePictureIndex = li_state

// set the overlay picture for the item - cannot add it to the picture array
ls_overlaycolumn = inv_attrib[li_level].is_OverlayColumn
If Trim(ls_overlaycolumn) <> "" Then
	If IsNumber(ls_overlaycolumn) Then
		// The Picture Index is hard coded
		li_overlay = Integer(ls_overlaycolumn)
	Else 
		// the column contains a index
		li_overlay = ads_source.GetItemNumber(al_Row, ls_overlaycolumn)
		If IsNull(li_overlay) Then li_overlay = 0
	End If
End if
atvi_Item.OverlayPictureIndex = li_overlay

Return 1

end function

public function integer of_getlevelcount ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetLevelCount
//
//	Access:		public
//
//	Arguments:None
//
//	Returns:		Integer
//					 # of the levels the service services
//
//	Description:	Get the number of levels we have for the service. 
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

return UpperBound(inv_attrib)

end function

public function integer of_unregister (integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_unregister
//
//	Access:		public
//
//	Arguments:
//	ai_Level		The TreeView level to unregister.
//
//	Returns:  integer
//	 1 = the data source was unregistered successfully
//	-1 = argument validation error
//
//	Description:	Remove a data source for a level of the TreeView.  The data source is a
//						DataWindow object that will be linked to the TreeView level and used
//						to populate.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Integer	li_NumDS, li_rc
String	ls_cacheid
String	EMPTY = ""
n_tr		ltr_empty

// Check arguments
li_NumDS = UpperBound(inv_attrib)
if IsNull (ai_level) or (ai_level <= 0) or (ai_level > li_NumDS) then
	return -1
end if

If IsNull(inv_attrib[ai_Level]) Or Not IsValid(inv_attrib[ai_Level]) Then
	Return -1
End IF

// clear values in the structure array
inv_attrib[ai_Level].ib_recursive = false

inv_attrib[ai_Level].is_Dataobject = EMPTY
inv_attrib[ai_Level].is_LabelColumn = EMPTY
inv_attrib[ai_Level].is_RetrieveArgs = EMPTY
inv_attrib[ai_Level].is_Method = EMPTY
inv_attrib[ai_Level].is_picturecolumn = EMPTY
inv_attrib[ai_Level].is_selectedcolumn = EMPTY
inv_attrib[ai_Level].is_statecolumn = EMPTY
inv_attrib[ai_Level].is_overlaycolumn = EMPTY

inv_attrib[ai_Level].itr_obj = ltr_empty
If isvalid(inv_attrib[ai_Level].ids_obj) Then
	Destroy inv_attrib[ai_Level].ids_obj
End If

// Unregister with cache service
ls_cacheid = CACHE_ID + string(ai_level)
If inv_cache.of_IsRegistered(ls_cacheid) > 0 Then
	// already registered so unregister
	li_rc = inv_cache.of_unregister(ls_cacheid)
end if

Return 1

end function

public function integer of_gettransobject (integer ai_level, ref n_tr atr_obj);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetTransObject
//
//	Access:		public
//
//	Arguments:
//	ai_level		The level of the treeview to get the transaction object from
//	atr_obj		The transaction object (of type n_tr) the treeview level uses.
//						Passed by reference.
//
//	Returns:		Integer
//					 1	- the transaction object was valid, 
//					-1	- it was not.
//
//	Description:	Get the transaction object used for the treeview level.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
integer	li_limit

// check arguments
If isNull(ai_level) or (ai_level < 1) Then Return -1

// Verify that this is a valid level
li_Limit = UpperBound(inv_attrib)
If ai_Level > li_Limit Then
	// Allow for recursion
	If Not inv_attrib[li_Limit].ib_Recursive Then Return -1
	
	ai_Level = li_Limit
End If

If IsNull(inv_attrib[ai_level].itr_obj) Or Not IsValid(inv_attrib[ai_level].itr_obj) Then 
	Return -1
End if

atr_obj = inv_attrib[ai_level].itr_obj

Return 1

end function

protected function integer of_clearundo ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_ClearUndo
//
//	Access:		protected
//
//	Arguments:  None
//
//	Returns:		Integer
//				 	 1 if it succeeds
//					-1 if error
//	
//	Description:
//	clear the undo properties
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0  Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
treeviewitem	ltvi_emptyitem

// Reset the undo variables
itvi_UndoDeleteItem = ltvi_emptyitem
il_UndoDeleteParentHandle = 0
il_UndoDeleteHandle = 0
il_UndoEditHandle = 0
il_UndoInsertHandle = 0
is_UndoEditLabelText = ""
is_UndoType = ""

return 1

end function

protected function integer of_parseargs (string as_args, integer ai_level, ref integer ai_arglevel[], ref string as_argcolumn[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_ParseArgs
//
//	Access:		protected
//
//	Arguments:
//	as_Args				The retrieval argument string
//	ai_Level				The TreeView level these arguments are for
//	ai_ArgLevel[]		An integer array that will contain the levels that
//								the retrieval arguments come from, passed by reference
//	as_ArgColumn[]		A string array that will contain the columns containing
//								the retrieval arguments, passed by reference
//
//	Returns:		Integer
//					 1 if successful
//					-1 if error occurs
//
//	Description:	Parse the string of retrieval arugments into separate
//						arguments and fill the array reference arguments.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
String			ls_Parm[], ls_Type, ls_ColName, ls_Level
Integer			li_Args, li_Cnt, li_P1, li_P2, li_Level
n_cst_string	lnv_String

// check arguments
If IsNull(as_args) or (as_args = "") Then Return -1
If isNull(ai_level) or (ai_level < 1) Then Return -1

// Parse the comma-delimeted string
li_Args = 1
ls_Parm[li_Args] = Trim(lnv_String.of_gettoken(as_Args, ","))
Do While Len(as_Args) > 0
	li_Args ++
	ls_Parm[li_Args] = Trim(lnv_String.of_gettoken(as_Args, ","))
Loop

// Determine the column name
For li_Cnt = 1 To li_Args
	If ls_Parm[li_Cnt] <> "" Then
		li_P1 = Pos(ls_Parm[li_Cnt], ".", 1)
		li_P2 = Pos(ls_Parm[li_Cnt], ".", (li_P1 + 1))
		ls_Type = Left(ls_Parm[li_Cnt], (li_P1 - 1))
		ls_Level = Mid(ls_Parm[li_Cnt], (li_P1 + 1), (li_P2 - (li_P1 + 1)))
		ls_ColName = Right(ls_Parm[li_Cnt], (Len(ls_Parm[li_Cnt]) - li_P2))
		
		// Determine the level to pull from
		If Lower(ls_Type) = ":level" Then
			// Absolute level
			li_Level = Integer(ls_Level)
		Else
			// Relative level
			li_Level = ai_Level - Integer(ls_Level)
		End if
		
		ai_ArgLevel[li_Cnt] = li_Level
		as_ArgColumn[li_Cnt] = ls_ColName
	End if
Next

Return 1
end function

public function integer of_setundo (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetUndo
//
//	Access:		Public
//
//	Arguments:
//	ab_switch	specifies whether undo information will be remembered
//
//	Returns:		integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets whether undo information will be remembered
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// Validate arguments
if IsNull (ab_switch) then return -1

ib_undo = ab_switch

return 1
end function

public function integer of_setrecursive (integer ai_level, boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetRecursive
//
//	Access:		Public
//
//	Arguments:	
//	ai_Level		The level of the treeview to set the recursion for.
//	ab_switch	True to turn on recursion for the tree level
//					false to turn off recursion for the tree level
//
//	Returns:		integer
//					 1 = success
//					-1 = failure
//
//	Description:	Turn on recursion for this level of the tree and all beneath it.
//						You must define the level first and then set recursion on it.
//						Recursion means that the level will be the last level of the tree
//						defined and all children of that level's items will be defined like
//						the level defined as recursive.  Using this you can show the recursive
//						relationship between items in the tree.  visualize it as the tree in
//						Windows Explorer where all that tree shows is directories and 
//						subdirectories... no matter how far down the tree you go.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
string	ls_coltype

// Verify that this is a valid level
If ai_Level > UpperBound(inv_attrib) Then
	Return -1
Else
	If Trim(inv_attrib[ai_Level].is_DataObject) = "" Then
		Return -1
	End If
End If

If IsNull(ab_switch) Then
	Return -1
End If


inv_attrib[ai_level].ib_recursive = ab_switch

return 1
end function

public function integer of_deleteitem (long al_handle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_DeleteItem
//
//	Access:		public
//
//	Arguments:
//	al_Handle	The handle of the item to be delete.
//
//	Returns:		Integer
//					 1	- the item was deleted successfully
//					 0 - nothing deleted - cancelled
//					-1	- an error occurred
//
//	Description:	Delete an item from the TreeView.  The item's row will be
//						DELETED from its DataStore (the user must call the Update(),
//						however).  
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
Integer				li_confirm, li_rc
Long					ll_row
TreeViewItem		ltvi_Item
n_ds					lds_source

// validate references
If IsNull(itv_requestor) or Not IsValid(itv_requestor) Then Return -1
If itv_requestor.GetItem(al_handle, ltvi_item) <> 1 Then Return -1

// ask for confirmation if it is needed
if of_ConfirmOnDelete() then
	li_confirm = of_ConfirmDelete(1)
	// Delete item if = 1
	if li_confirm <> 1 then return 0
End If

// this may take some time if all children are not retrieved
// aka cascade delete
setpointer(hourglass!)

//turn off redraw for performance
itv_requestor.setredraw(false)

// automatically populate all children
itv_requestor.expandall(al_handle)

// Remove the item's children
If of_RemoveChildren(al_Handle) = -1 Then Return -1

If of_GetDataRow(al_handle, lds_source, ll_row) <> 1 Then 
	// row is already deleted from datastore
	Return -1
End If

// only need to delete the row
lds_Source.DeleteRow(ll_Row)

// Get the parent and previous handle (for undo capability) 
If ib_undo Then
	il_UndoDeleteParentHandle = itv_requestor.FindItem(ParentTreeItem!, al_handle)
	il_UndoDeleteHandle = itv_requestor.FindItem(PreviousTreeItem!, al_handle)
	itvi_UndoDeleteItem = ltvi_Item
	is_UndoType = UNDO_DELETE
End If

// hide the children and then delete the item
itv_requestor.collapseitem(al_handle)
li_rc = itv_requestor.DeleteItem(al_Handle)

// turn back on redraw
itv_requestor.setredraw(true)

// return code of deleteitem call
return li_rc

end function

protected function boolean of_confirmondelete ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_ConfirmOnDelete
//
//	Access:		protected
//
//	Arguments:	none
//
//	Returns:		boolean
//
//	Description:
//	Returns whether we want a confirmation dialog box to appear on deletions 
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// If the service is in the process of deleting we do not want to get the confirm question
If ib_isUndoing Then
	Return False
Else
	Return of_isconfirmondelete()
End If

end function

public function long of_gethandle (ref n_ds ads_obj, long al_row, integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetHandle
//
//	Access:		public
//
//	Arguments:
//	ads_obj		The handle to the DataStore (of type n_ds) for the item's
//						level.  Passed by reference.
//	al_Row		The row in the DataStore that the item points to.
//	ai_Level		The level to search, if 0 entire tree will be searched.
//
//	Returns:		Long
//					The handle of the TreeView item that points to that row, 0 if the item
//					was not found, or -1 if an error occurrs
//
//	Description:	Return the TreeView handle that points to a particular row in a DataStore.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Long		ll_rowid
String	ls_Key

// Check Arguments
If IsNull(ads_obj) or Not IsValid(ads_obj) then Return -1
If IsNull(al_Row) or (al_row < 1) Then Return -1
If IsNull(ai_level) or (ai_level < 0) Then Return -1
If ai_level > UpperBound(inv_attrib) then Return -1

// Get the generated key for the row
ls_key = of_encodekey(ads_obj, al_Row)
If ls_key = "!" then return -1

// Find the item
Return of_FindItem("data", ls_Key, 0, ai_level, False, True)

end function

public function long of_gethandle (ref n_ds ads_obj, long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetHandle
//
//	Access:		public

//
//	Arguments:
//	ads_obj		The handle to the DataStore (of type n_ds) for the item's
//						level.  Passed by reference.
//	al_Row		The row in the DataStore that the item points to.
//
//	Returns:		Long
//					The handle of the TreeView item that points to that row, 0 if the item
//					was not found, or -1 if an error occurrs
//
//	Description:	Return the handle to the TreeView item that refers to a particular 
//						row in a DataStore.
//
//		This function overloads the real of_GetHandle function to allow the level 
//		parameter to be optional.  
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
Integer	li_level

// check arguments
If IsNull(ads_obj) or Not IsValid(ads_obj) then Return -1
If IsNull(al_row) or (al_row < 1) then Return -1

// find the level this datastore is on
li_level = this.of_getlevel(ads_obj)
If li_level < 1 Then Return -1

Return of_GetHandle(ads_obj, al_row, li_level)

end function

public function integer of_setdeletestyle (integer ai_level, integer ai_style);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_SetDeleteStyle
//
//	Access:		Public
//
//	Arguments:
//	ai_Level		The level of the treeview to set the information for.
//	ai_style		specifies whether treeview children will be:
//						DELETE_ROWS 	1 - deleted 
//						DISCARD_ROWS 	2 - discarded 
//
//	Returns:		integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Sets the delete style this level will use on it's immediate children
//
//	Sets whether treeview item children being removed will be deleted or discarded
//	used for RI (referential Integrity purposes.. delete or discard )
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// Verify that this is a valid level
If ai_Level > UpperBound(inv_attrib) Then
	Return -1
End If

// Validate arguments
CHOOSE CASE ai_style
	CASE DELETE_ROWS, DISCARD_ROWS
		// Good style.
	CASE ELSE
		Return -1
END CHOOSE

inv_attrib[ai_level].ii_deletestyle = ai_style

return 1
end function

public function integer of_getdeletestyle (integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetDeleteStyle
//
//	Access:		Public
//
//	Arguments:	
//	ai_Level		The level of the treeview to get the information from.
//
//	Returns:		Integer
//					DELETE_ROWS (1)
//					DISCARD_ROWS (2)
//					-1 - if error
//
//	Description:
//	Returns the delete style this level will use on it's immediate children
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
integer	li_limit

// check arguments
If IsNull(ai_level) or (ai_level < 1) then Return -1

// Verify that this is a valid level
li_Limit = UpperBound(inv_attrib)
If ai_Level > li_Limit Then
	// Allow for recursion
	If Not inv_attrib[li_Limit].ib_Recursive Then Return -1
	
	ai_Level = li_Limit
End If

return inv_attrib[ai_level].ii_Deletestyle

end function

public function integer of_setupdatestyle (integer ai_style);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetUpdateStyle
//
//	Access:    		Public
//
//	Arguments:
//   ai_style:	The style for Updates.
//					TOPDOWN
//					BOTTOMUP
//					TOPDOWN_BOTTOMUP
//					BOTTOMUP_TOPDOWN
//					CUSTOM
//
//	Returns:   		Integer
//						1 if it succeeds and -1 if an error occurs.
//
//	Description:  Set the Update Style.
//
//		Note: If CUSTOM is used, the of_UpdateCustom() function needs to be coded 
//				to provide the custom functionality.
//	
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// Validate the argument.
If IsNull(ai_style) Then Return -1
CHOOSE CASE ai_style
	CASE	TOPDOWN, BOTTOMUP, TOPDOWN_BOTTOMUP, BOTTOMUP_TOPDOWN, CUSTOM
		// Good value.
	CASE ELSE
		Return -1
END CHOOSE

// Set the update style.
ii_updatestyle = ai_style
Return 1
end function

public function integer of_getupdatestyle ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetUpdateStyle
//
//	Access:    		Public
//
//	Arguments:		None
//
//	Returns:   		Integer
//						The Update Style.
//
//	Description:  Get the Update Style.
//	
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Return ii_updatestyle
end function

public function integer of_update (boolean ab_accepttext, boolean ab_resetflags);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_Update
//
//	Access:		public
//
//	Arguments:
//	ab_Accepttext	True - (default) perform an AcceptText prior to the update,
//						False - do not perform an AcceptText.
//	ab_ResetFlags	True - (default) reset the status flags,
//						False - do not reset the flags.
//
//	Returns:		Integer
//					 1	- the treeview updated successfully
//					-1	- an error occurred
//
//	Description:	Update all the DataStores associated with the Treeview.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

return of_update(0, ab_accepttext, ab_resetflags)

end function

public function integer of_update (integer ai_level, boolean ab_accepttext, boolean ab_resetflags);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_Update
//
//	Access:		public
//
//	Arguments:
//	ai_Level			The level for which to update its DataStore.
//							If ai_Level is 0, all DataStores will be updated.
//							NOTE:  There is only one DataStore for all 
//							recursive levels.  So if ai_Level is a recursive level, 
//							all levels using that DataStore will be updated.
//	ab_AcceptText	True - (default) perform an AcceptText prior to the update,
//						False - do not perform an AcceptText.
//	ab_ResetFlags	True - (default) reset the status flags,
//						False - do not reset the flags.
//
//	Returns:		Integer
//					 1	- the level was updated successfully
//					-1	- an error occurred
//
//	Description:	Update the DataStore associated with a level of the TreeView.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

boolean	lb_focusonerror = False
Integer	li_Index, li_Start, li_Cnt, li_rc
n_ds		lds_updatearray[]
powerobject lpo_pending[]

// Verify passed arguments.
IF IsNull ( ab_AcceptText ) Or IsNull ( ab_ResetFlags ) THEN Return -1 
If IsNull ( ai_level ) or (ai_level < 0) Then Return -1
If IsNull (itv_requestor) or Not IsValid(itv_requestor) Then Return -1

/// Make sure the Object is updateable.
If not itv_requestor.of_IsUpdateable() Then
	return 0
End If

li_Index = UpperBound(inv_attrib)
If ai_Level = 0 Then
	// Update all DataStores
	li_Start = 1
Else
	If ai_Level > li_Index Then
		// If level > li_Index then inv_attrib[li_Index] must be recursive
		If Not inv_attrib[li_Index].ib_Recursive Then Return -1
		ai_Level = li_Index
	End If
	
	li_Start = ai_Level
End If

// Build the Update object list
For li_Cnt = li_Start To li_Index
	If IsValid(inv_attrib[li_Cnt].ids_obj) Then
		lds_updatearray[li_Cnt] = inv_attrib[li_Cnt].ids_obj
	End If
Next

// Perform AcceptText processing (all datastores) prior to update.
IF ab_AcceptText THEN 
	IF itv_requestor.event pfc_accepttext(lds_updatearray, lb_focusonerror) <> 1 THEN Return -1
END IF

// Perform the appropriate update sequence.
CHOOSE CASE ii_updatestyle
	CASE TOPDOWN	
		li_rc = of_Update(lds_updatearray, TOPDOWN, True, True, True ) 	
	CASE BOTTOMUP 
		li_rc = of_Update(lds_updatearray, BOTTOMUP, True, True, True )
	CASE TOPDOWN_BOTTOMUP
		// -- First loop thru the array; top-level datawindow going down the chain.
		//    Performing Inserts and Updates only.  --
		IF of_Update(lds_updatearray, TOPDOWN, True, True, False ) <> 1 Then Return -1
		// -- Second loop thru the array; bottom-level datawindow going up the chain.
		//    Performing Deletes only. --
		li_rc = of_Update(lds_updatearray, BOTTOMUP, False, False, True )
	CASE BOTTOMUP_TOPDOWN
		// -- First loop thru the array; bottom-level datawindow going up the chain.
		//    Performing Deletes only. --
		IF of_Update(lds_updatearray, BOTTOMUP, False, False, True ) <> 1 Then Return -1
		// -- Second loop thru the array; top-level datawindow going down the chain.
		//    Performing Inserts and Updates only.  --
		li_rc = of_Update(lds_updatearray, TOPDOWN, True, True, False )
	CASE CUSTOM
		// perform the specified custom update style
		li_rc = of_UpdateCustom(ii_customupdate)			
	CASE ELSE
		li_rc = -1
END CHOOSE

// Note: One may want to confirm all other updates are succesful 
//	prior to clearing any flags.
IF li_rc = 1 AND ab_ResetFlags THEN 
	li_rc = of_ResetUpdate(ai_level) 
END IF

return 1

end function

public function integer of_updatecustom (integer ai_custom);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_UpdateCustom
//
//	Access:    		Public
//
//	Arguments: 		
//		ai_custom 	Allowing for more than one custom update.
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  Allows for customization of the Update process.  This is 
//		provided by PFC as an empty stub to be coded with specific update
//		functionality.  This function will be triggered by the level centric
//		treeview service when the UpdateStyle is set to CUSTOM.
//
//		Note:	If more than one Custom Update is needed use of_SetCustom().
//
//		Note: If there is any need to customize, this function should be code on
//				the extension layer.
//
//	   Note: This function is not typically called by the developer.  
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Return FAILURE
end function

public function integer of_getcustomupdate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_GetCustomUpdate
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:   	Integer
// 			  	The current CUSTOM Update.
//
//	Description:  Get the CUSTOM update attribute.
//
//	   *Note: This value is used for CUSTOM Updates.  It allows for more than
//					one custom update.  Look in of_Update(...) and of_UpdateCustom(...) 
//					for its usage.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Return ii_customupdate
end function

public function integer of_setcustomupdate (integer ai_custom);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetCustomUpdate
//
//	Access:    	Public
//
//	Arguments:
//   ai_custom	Custom update identifier (1 through 9)
//
//	Returns:   	Integer
// 			  	1 if it succeeds and -1 if an error occurs.
//
//	Description:  
//	Used to establish more than one type of CUSTOM update.
//
//	   *Note: This value is used for CUSTOM Updates.  It allows for more than
//					one custom update.  Look in of_Update(...) and of_UpdateCustom(...) 
//					for its usage.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// Validate passed arguments.
If IsNull(ai_custom) or ai_custom <= 1 Or ai_custom >= 9 Then 
	Return -1
End If

// Set the attribute.
ii_customupdate = ai_custom
Return 1
end function

public function integer of_getdatasource (integer ai_level, ref n_ds ads_obj);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_GetDataSource
//
//	Access:		public
//
//	Arguments:
//	ai_Level		The level of the TreeView for which you want the DataStore.
//	ads_obj		The handle to the DataStore (of type n_ds) for the level.
//						Passed by reference.
//
//	Returns:		Integer
//					 1	- the DataStore was found
//					-1	- the DataStore was not found
//
//	Description:	Return the DataStore a particular level in the TreeView points
//						to.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Integer				li_Limit
TreeViewItem		ltvi_Item

// check arguments
If IsNull(ai_level) or (ai_level < 1) Then Return -1

li_Limit = UpperBound(inv_attrib)
If ai_Level > li_Limit Then
	// Allow for recursion
	If Not inv_attrib[li_Limit].ib_Recursive Then Return -1
	
	ai_Level = li_Limit
End If

ads_obj = inv_attrib[ai_Level].ids_obj

Return 1

end function

public function string of_decodekey (string as_decodekey);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_Decodekey
//
//	Access:		public
//
//	Arguments:
//	as_decodekey	The treeview data attribute as a string.  
//
//	Returns:		String
//					The created key if successful, 
//					"!" if an error occurrs.
//
//	Description:	Get the unique key which was previously placed in the data attribute
//						of the treeview item 
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

long				ll_rowid
string			ls_key, ls_data
n_cst_string	lnv_string

// Validate arguments
If IsNull(as_decodekey) or (len(trim(as_decodekey)) = 0) Then Return "!"

// Set Data to the unique key
ls_key = lnv_string.of_GetKeyValue(as_decodekey, is_pfckey, is_delimiter)

return ls_key
end function

public function string of_encodekey (n_ds ads_source, long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_encodekey
//
//	Access:		public
//
//	Arguments:
//	ads_source	The DataStore with the data used to populate the item.  
//	al_Row		The row in the DataStore for the item.
//
//	Returns:		String
//					The created key if successful, 
//					"!" if an error occurrs.
//
//	Description:	Set the unique key of a treeview item so we can find out the row
//						in the datastore which created the item at a later point in time.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

long				ll_rowid
string			ls_key
string			ls_pfckey
n_cst_string	lnv_string

// Validate arguments
If IsNull(ads_source) or Not IsValid(ads_source) Then Return "!"
If IsNull(al_row) or (al_row < 1) then Return "!"

// Set Data to the unique key
ll_rowid = ads_source.GetRowIDFromRow(al_Row)
If ll_rowid < 1 then return "!"

ls_pfckey = is_pfckey + "="
lnv_string.of_SetKeyValue (ls_pfckey, is_pfckey, string(ll_rowid), "=")

ls_key = ls_pfckey + is_delimiter

return ls_key
end function

protected function integer of_parsecols (string as_cols, ref string as_operators[], ref string as_column[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_ParseCols
//
//	Access:		protected
//
//	Arguments:
//	as_Cols				The column definition string string
//								ex:  N.colname, AN.Col2name, O.col3name
//								means Not (Colname) and Not (col2name) or col3name
//	as_Operators[]		A string array that will contain the relational operators
//								passed by reference
//	as_Column[]			A string array that will contain the columns to filter
//								passed by reference
//
//	Returns:		Integer
//					 1 if successful
//					-1 if error occurs
//
//	Description:	Parse the string of columns into separate
//						columns and fill the array reference arguments.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
String			ls_Parm[], ls_ColName, ls_Oper
Integer			li_Args, li_Cnt, li_P1 
n_cst_string	lnv_String

// check arguments
If IsNull(as_cols) or (as_cols = "") Then Return -1

// Parse the comma-delimeted string
li_Args = 1
ls_Parm[li_Args] = Trim(lnv_String.of_gettoken(as_cols, ","))
Do While Len(as_cols) > 0
	li_Args ++
	ls_Parm[li_Args] = Trim(lnv_String.of_gettoken(as_cols, ","))
Loop


// Determine the column name
For li_Cnt = 1 To li_Args
	If ls_Parm[li_Cnt] <> "" Then
		li_P1 = Pos(ls_Parm[li_Cnt], ".", 1)
		ls_Oper = Left(ls_Parm[li_Cnt], (li_P1 - 1))
		ls_Colname = Mid(ls_Parm[li_Cnt], (li_P1 + 1) )
		
		as_operators[li_Cnt] = upper(ls_oper)
		as_Column[li_Cnt] = ls_ColName
	End if
Next

Return 1
end function

public function long of_insertitem (long al_parent, n_ds ads_obj, long al_row, treeviewitem atvi_item, string as_position, long al_after);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_InsertItem
//
//	Access:		public
//
//	Arguments:
//	al_Parent	The handle of the parent TreeView item that the new item will
//						be inserted under - new item is now parent's child.
//	ads_obj		The DataStore containing the data to be used for the new item.
//						This can be the same DataStore that was created for the level, or
//						another maintained by the user.  If the latter, the row will be added
//						to the level's DataStore. 
//	al_Row		The row in the DataStore pointing to the data.
//	atvi_item	The Item to be added to the treeview
//	as_Position	The position under the parent where the new item will be inserted:
//						"First" - before the first child of the parent (Default)
//						"Last" - after the last child
//						"Sort" - in the sorted position based on the item's label
//						"After" - after the item with handle al_After
//	al_After		The handle to the item after which the new item will be inserted.
//						Ignored unless as_Position = "After".
//
//	Returns:		Long
//					Returns the handle of the item if it was added successfully, 
//					-1 if an error occurrs.
//
//	Description:	Add a new item to the TreeView using data from a DataStore.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
Integer				li_NewLevel, li_Index, li_rc
long					ll_rowcount, ll_newhandle
String				ls_key
TreeViewItem		ltvi_Parent

// check reference variables
If IsNull(itv_requestor) or Not IsValid(itv_requestor) Then Return -1

// Check Arguments
If IsNull(al_parent) or IsNull(al_row) or IsNull(al_after) or &
	(al_parent < 0) or (al_row < 1) or (al_after < 0) or &
	IsNull(as_position) or (Trim(as_position) = "") or &
	IsNull(ads_obj) or Not IsValid(ads_obj) Then
	Return -1
End If

Choose Case lower(as_position)
	Case itv_requestor.INSERT_FIRST, itv_requestor.INSERT_LAST, &
			itv_requestor.INSERT_SORT, itv_requestor.INSERT_AFTER
		// valid insert type
	Case Else
		Return -1
End Choose

// Determine the level to place data in correct datastore
If al_Parent <> 0 Then
	If itv_requestor.GetItem(al_Parent, ltvi_Parent) = -1 Then Return -1
	li_NewLevel = ltvi_Parent.Level + 1
Else
	li_NewLevel = 1
End If

// Get index into the data source array
li_Index = UpperBound(inv_attrib)
If li_NewLevel <= li_Index Then
	li_Index = li_NewLevel
Else
	// If new item is being added to a level > li_Index then
	// inv_attrib[li_Index] must be recursive
	If Not inv_attrib[li_Index].ib_Recursive Then Return -1
End If

// Check if the DataStore passed is the same as the one for the level
If ads_obj <> inv_attrib[li_Index].ids_obj Then
	// Verify that the it is valid for the level
	If ads_obj.DataObject <> inv_attrib[li_Index].ids_obj.DataObject Then Return -1

	// Append the rows to the level's DataStore
	ll_rowcount = inv_attrib[li_Index].ids_obj.rowcount()
	li_rc = ads_obj.RowsCopy(al_Row, al_Row, Primary!, inv_attrib[li_Index].ids_obj, (ll_rowcount + 999999), Primary!)
	If li_rc < 1 Then Return -1
	
	// Set status flag of new row to what it was in the original datastore
	// The new row is copied as NewModified! 
	ll_rowcount = inv_attrib[li_Index].ids_obj.rowcount()
	choose case ads_obj.GetItemStatus(al_Row, 0, primary!)
		case New!
			// newmodified! and notmodified! = new!
			inv_attrib[li_Index].ids_obj.SetItemStatus(ll_rowcount, 0, primary!, notmodified!)
		case DataModified!
			// newmodified! and datamodified! = datamodified!
			inv_attrib[li_Index].ids_obj.SetItemStatus(ll_rowcount, 0, primary!, datamodified!)
		case NotModified!
			// newmodified!  and datamodified! = datamodified!
			// datamodified! and notmodified!  = notmodified!
			inv_attrib[li_Index].ids_obj.SetItemStatus(ll_rowcount, 0, primary!, datamodified!)
			inv_attrib[li_Index].ids_obj.SetItemStatus(ll_rowcount, 0, primary!, notmodified!)
	end choose
	al_row = inv_attrib[li_Index].ids_obj.RowCount()
End If

// Set Data to the unique key
ls_key = this.of_encodekey(inv_attrib[li_Index].ids_obj, al_row)
If ls_key = "!" then return -1
atvi_Item.Data = string(atvi_item.data) + ls_key

//  Add the Item
Choose Case Lower(as_Position)
	Case itv_requestor.INSERT_LAST
		ll_newhandle = itv_requestor.InsertItemLast(al_Parent, atvi_Item)
	Case itv_requestor.INSERT_SORT
		ll_newhandle = itv_requestor.InsertItemSort(al_Parent, atvi_Item)
	Case itv_requestor.INSERT_AFTER
		ll_newhandle = itv_requestor.InsertItem(al_Parent, al_After, atvi_Item)
	Case itv_requestor.INSERT_FIRST
		ll_newhandle = itv_requestor.InsertItemFirst(al_Parent, atvi_Item)
End Choose

// Remember for Undo capability
If ib_undo Then
	If ll_newhandle > 0 then
		il_undoinserthandle = ll_newhandle
		is_UndoType = UNDO_INSERT
	End If
End If

Return ll_newhandle

end function

protected function integer of_update (ref n_ds ads_updatearray[], integer ai_direction, boolean ab_insert, boolean ab_update, boolean ab_delete);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Update
//
//	Access:    		Protected
//
//	Arguments: 		
//	ads_updatearray[]	Array of treeview datastores to be updated
//	ai_direction		Direction to perform updates in (topdown or bottomup)
//	ab_insert			True if we need to perform insert SQL statements
//	ab_update			True if we need to perform update SQL statements
//	ab_delete			True if we need to perform delete SQL statements
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  Updates the datawindows in the linked chain of tree levels
//
//	   Note: This function is not typically called by the developer.  
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
boolean	lb_accepttext = False
boolean 	lb_resetflag = False
integer	li_i, li_max
String	ls_sqlspyheading
String	ls_sqlspymessage

IF IsNull(itv_requestor) or Not Isvalid(itv_requestor) Then Return -1

//If available notify the SQLSpy service.
If IsValid(gnv_app.inv_debug) Then
	If IsValid(gnv_app.inv_debug.inv_sqlspy) Then

		//Create the heading and message for the SQLSpy.
		ls_sqlspyheading = itv_requestor.ClassName() + '.Levelsource'
		ls_sqlspymessage = 'Smart Update - '
		Choose Case ai_direction
			Case TOPDOWN
				ls_sqlspymessage = ls_sqlspymessage + 'TOPDOWN: '
			Case BOTTOMUP
				 ls_sqlspymessage = ls_sqlspymessage + 'BOTTOMTOP: '
		End Choose
		If ab_insert Then
			ls_sqlspymessage = ls_sqlspymessage + 'Insert '
		End If
		If ab_update Then
			ls_sqlspymessage = ls_sqlspymessage + 'Update '
		End If
		If ab_delete Then
			ls_sqlspymessage = ls_sqlspymessage + 'Delete '
		End If
		
		//Send the information to the service for processing.
		gnv_app.inv_debug.inv_sqlspy.of_sqlSyntax  &
			(ls_sqlspyheading, '/*** ' + ls_sqlspymessage + ' ***/')
	End If
End If

li_max = upperbound(ads_updatearray)
Choose Case ai_direction
	Case TOPDOWN
		// update from first to last
		For li_i = 1 to li_max
			If ads_updatearray[li_i].of_Update &
				(lb_accepttext, lb_resetflag, ab_insert, ab_update, ab_delete) <> 1 Then 
				Return FAILURE
			End If
		Next 
		Return 1
	Case BOTTOMUP
		// update from last to first
		For li_i = li_max to 1 Step -1
			If ads_updatearray[li_i].of_Update &
				(lb_accepttext, lb_resetflag, ab_insert, ab_update, ab_delete) <> 1 Then 
				Return FAILURE
			End If
		Next 
		Return 1
End Choose

Return -1
end function

public function integer of_discardchildren (long al_handle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_DiscardChildren
//
//	Access:		public
//
//	Arguments:
//	al_Handle	The handle of the item for which all child items will
//						be removed.
//
//	Returns:		Integer
//					 1	- the children were discarded successfully
//					-1	- an error occurred
//
//	Description:	Remove all the items from the TreeView below a specified item.
//						Discard the rows from DataStores.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Integer			li_level
Long				ll_Child, ll_Next, ll_Row
n_ds				ads_obj
TreeViewItem	ltvi_Item

// check reference variables
If IsNull(itv_requestor) or Not IsValid(itv_requestor) Then Return -1

ll_Child = itv_requestor.FindItem(ChildTreeItem!, al_Handle)
Do While ll_Child > 0

	// Recursively remove its child items
	If of_DiscardChildren(ll_Child) = -1 Then Return -1
	
	// find its row from the DataStore 
	If of_GetDataRow(ll_Child, ads_obj, ll_Row) = -1 Then Return -1
	
	// This will perform Discards on all Children rows of the Master row.
	If ads_obj.RowsDiscard(ll_Row, ll_Row, Primary!) < 1 Then Return -1
	
	// get the next child item handle
	ll_Next = itv_requestor.FindItem(NextTreeItem!, ll_Child)

	itv_requestor.DeleteItem(ll_Child)
	ll_Child = ll_Next
Loop

Return 1

end function

public function boolean of_canundo ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_CanUndo
//
//	Access:		Public
//
//	Arguments:	none
//
//	Returns:		Boolean
//					true = we can undo the last edit/insert/delete
//					false = cannot undo the last edit/insert/delete
//
//	Description:
//	Returns if undo can be performed
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////
boolean	lb_undo
string	ls_undotype

lb_undo = of_CanUndo(ls_undotype)

Return lb_undo

end function

public function long of_retrieve (integer ai_level, any aa_arg[20], ref n_ds ads_data);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Retrieve
//	Arguments:		ai_Level		The TreeView level to be retrieved.
//						aa_Arg[20]	An array of type Any that will contain the retrieval
//									argument values.  
//						ads_obj		The datastore holding the retrieved data.  Passed by reference
//	Returns:			Integer
//						Returns 1 if the data source was added successfully, 
//						-1 if an error occurrs.
//						-2 Key columns were not defined for the level
//						-3 Retrieve from datastore was not successful
//						-4 if datawindow object is not valid
//	Description:	Retrieve the data for a treeview level.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						6.0   Initial version
//						7.0   Fix call to of_BuildExpression, requires string argument
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//////////////////////////////////////////////////////////////////////////////
Integer		li_Cnt, li_Index, li_numcols
Long			ll_NewRows, ll_Rows
String		ls_cacheid, ls_filter, ls_expression
string		ls_column[], ls_operators[]
window		lw_parentwindow

//	Check arguments
If IsNull(itv_requestor) or not isvalid(itv_requestor) Then Return -1
If IsNull(ai_level) or (ai_level < 1) Then Return -1

// Determine if the level is recursive
If ai_Level > UpperBound(inv_attrib) Then
	li_Index = UpperBound(inv_attrib)
Else
	li_Index = ai_Level
End If

// check datawindow object for existence.  This is set to ""
// in of_register() when the datawindow is not updateable
if inv_attrib[li_Index].is_DataObject= "" then return -4

// Set up the cache id 
ls_cacheid = CACHE_ID + string(li_index)

// Retrieve data into the DataStore
// pass the arguments to the cache
If (inv_attrib[li_Index].is_method = inv_cache.SQL) or &
	(inv_attrib[li_Index].is_method = inv_cache.RETRIEVE) Then
		// register the arguments; retrieve the cache and get the reference
		inv_cache.of_RegisterArgs(ls_cacheid, aa_Arg)
		If inv_cache.of_Refresh(ls_cacheid) < 0 Then return -1
End If

// Get a reference to the cache - data was retrieved on registration
IF inv_cache.of_GetRegistered(ls_cacheid, ads_data) <> 1 then Return -1

// turn back on the base service as cache does not turn it on
ads_data.of_SetBase(TRUE)

//// datastore needs parent window reference to perform updates
//itv_requestor.of_Getparentwindow(lw_parentwindow)
//ads_data.of_SetParentWindow(lw_parentwindow)

// filter the datastore to return only the necessary rows
If (inv_attrib[li_Index].is_method = inv_cache.SQL) or &
	(inv_attrib[li_Index].is_method = inv_cache.RETRIEVE) Then
		// do not filter.  The refresh should have done the work for those methods
Else
	of_parsecols(inv_attrib[li_index].is_filtercols, ls_operators, ls_column)
	for li_cnt = 1 to upperbound(ls_column)
		
		ls_expression = ads_data.inv_base.of_buildexpression(0, ls_column[li_cnt], "=", String (aa_Arg[li_cnt]))
		If Pos(ls_operators[li_cnt], "N") > 0 Then
			ls_expression = " NOT (" + ls_expression + ") "
		End If
		If Pos(ls_operators[li_cnt], "A") > 0 Then
			ls_expression = " AND " + ls_expression
		End If
		If Pos(ls_operators[li_cnt], "O") > 0 Then
			ls_expression = " OR " + ls_expression
		End If
		ls_filter = ls_filter + ls_expression
	end for
	ads_data.setfilter(ls_filter)
	ads_data.filter()
End If

ll_NewRows = ads_data.RowCount()

//// Append the rows to the level's DataStore
//ll_Rows = inv_attrib[li_Index].ids_obj.RowCount()
//ids_Buffer.RowsCopy(1, ll_NewRows, Primary!, inv_attrib[li_Index].ids_obj, (ll_Rows + 1), Primary!)
//
//// Clear the status flags for the new rows
//For li_Cnt = (ll_Rows + 1) To (ll_Rows + ll_NewRows)
//	inv_attrib[li_Index].ids_obj.SetItemStatus(li_Cnt, 0, Primary!, DataModified!)
//	inv_attrib[li_Index].ids_obj.SetItemStatus(li_Cnt, 0, Primary!, NotModified!)
//Next

Return ll_NewRows

end function

on pfc_n_cst_tvsrv_levelsource.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_tvsrv_levelsource.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		Constructor
//
//	Description:
//				Create instance objects
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

// create the cache service
of_setcache(true)

end event

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		destructor
//
//	Description:
//				Destroy instance objects used in this service
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Integer	li_NumDS, li_Cnt

//	destroy the datastore array
li_NumDS = UpperBound(inv_attrib)
For li_Cnt = 1 To li_NumDS
	If IsValid(inv_attrib[li_Cnt].ids_obj) Then
		Destroy inv_attrib[li_Cnt].ids_obj
	End If
Next

of_setcache(false)


end event

