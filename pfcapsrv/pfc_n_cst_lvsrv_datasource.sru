HA$PBExportHeader$pfc_n_cst_lvsrv_datasource.sru
$PBExportComments$PFC ListView Datasource Service
forward
global type pfc_n_cst_lvsrv_datasource from n_cst_lvsrv
end type
end forward

global type pfc_n_cst_lvsrv_datasource from n_cst_lvsrv
event type long pfc_endlabeledit ( integer ai_index,  string as_newlabel )
event type integer pfc_undodelete ( )
event type integer pfc_undoinsert ( )
event type integer pfc_undoedit ( )
event type integer pfc_undo ( )
event type integer pfc_deleteitem ( )
event type integer pfc_insertitem ( n_ds ads_obj,  long al_row,  listviewitem alvi_item,  string as_position,  integer ai_item )
event type integer pfc_setitemattributes ( n_ds ads_source,  long al_row,  ref listviewitem alvi_item )
event type integer pfc_refresh ( )
event type integer pfc_refreshitem ( integer ai_index )
end type
global pfc_n_cst_lvsrv_datasource pfc_n_cst_lvsrv_datasource

type variables
Constant string UNDO_EDIT = "Edit"
Constant string UNDO_INSERT = "Insert"
Constant string UNDO_DELETE = "Delete"
Constant string CACHE_ID = "pfc listview"

Protected:
n_cst_lvsrvattrib		inv_Attrib
n_cst_columnattrib	inv_ColAttrib[]
n_cst_dwcache			inv_Cache

boolean		ib_ConfirmOnDelete = false
boolean		ib_IsRefreshing = false
boolean		ib_IsUndoing = false

Constant string IS_PFCKEY = "pfc_lvi_key"

// undo functionality
boolean		ib_Undo = false
long			il_UndoDeleteHandle[]
long			il_UndoInsertHandle
long			il_UndoEditHandle
string		is_UndoEditLabelText
string		is_UndoType
listviewitem	ilvi_UndoDeleteItem[]
end variables

forward prototypes
public function integer of_Update (boolean ab_accept, boolean ab_resetflags)
public function integer of_GetDataSource (ref n_ds ads_source)
public function integer of_ResetUpdate ()
public function integer of_Register (string as_labelcolumn, string as_dwobjectname, string as_importfile)
public function integer of_Register (string as_labelcolumn, string as_dwobjectname, powerobject apo_data[])
public function integer of_Register (string as_labelcolumn, string as_dwobjectname, n_tr atr_obj)
public function integer of_Register (string as_labelcolumn, string as_dwobjectname)
public function integer of_Register (string as_labelcolumn, datastore ads_control)
public function integer of_Register (string as_labelcolumn, n_tr atr_obj, string as_sql)
public function integer of_Register (string as_labelcolumn, datawindow adw_control)
public function integer of_ResetList ()
public function integer of_Reset ()
protected function integer of_ClearUndo ()
public function boolean of_IsConfirmOnDelete ()
public function integer of_SetConfirmOnDelete (boolean ab_switch)
public function string of_GetLabelColumn ()
public function string of_GetPictureColumn ()
public function string of_GetStatePictureColumn ()
public function string of_GetOverlayPictureColumn ()
public function integer of_SetStatePictureColumn (string as_column)
public function integer of_SetOverlayPictureColumn (string as_column)
public function string of_GetXposColumn ()
public function string of_GetYposColumn ()
public function integer of_SetXposColumn (string as_column)
public function integer of_SetYposColumn (string as_column)
public function integer of_SetPictureColumn (string as_column)
public function integer of_SetItemAttributes (n_ds ads_source, long al_row, ref listviewitem alvi_item)
public function string of_GetDataObject ()
public function string of_GetMethod ()
public function integer of_ConvertToRow (any aa_columnvalues[], ref n_ds ads_obj, ref long al_row)
protected function integer of_RegisterDataSource (string as_method, string as_dataobject, n_tr atr_obj, string as_sql, powerobject apo_data[], datawindow adw_control, datastore ads_control, string as_importfile)
public function integer of_ConfirmDelete (long al_amount)
public function integer of_RegisterReportColumn ()
public function boolean of_CanUndo (ref string as_undotype)
protected function integer of_SetCache (boolean ab_switch)
public function integer of_GetTransObject (ref n_tr atr_obj)
public function integer of_GetDataRow (integer ai_item, ref n_ds ads_source, ref long al_row)
protected function integer of_Register (string as_labelcolumn, string as_dwobjectname, n_tr atr_obj, string as_method, string as_sql, powerobject apo_data[], datawindow adw_control, datastore ads_control, string as_importfile)
public function integer of_UnRegister ()
public function integer of_RegisterReportColumn (n_ds ads_obj, string as_columnname, string as_columnlabel, alignment aal_alignment, integer ai_columnwidth)
public function integer of_RegisterReportColumn (n_ds ads_obj, string as_columnname, string as_columnlabel, alignment aal_alignment)
public function integer of_RegisterReportColumn (n_ds ads_obj, string as_columnname, string as_columnlabel)
public function integer of_RegisterReportColumn (n_ds ads_obj, string as_columnname)
public function integer of_UnRegisterReportColumn ()
public function integer of_UnRegisterReportColumn (integer ai_column)
public function integer of_GetColumnInfo (integer ai_column, ref n_cst_columnattrib anv_colattrib)
public function integer of_RegisterReportColumn (n_ds ads_obj)
public function string of_FormatData (string as_columnname, string as_colformat, string as_coltype, n_ds ads_obj, long al_row)
public function integer of_SetUndo (boolean ab_switch)
protected function boolean of_ConfirmOnDelete ()
public function string of_DecodeKey (string as_decodekey)
public function integer of_DeleteItem (integer ai_index)
public function integer of_GetIndex (n_ds ads_obj, long al_row)
public function integer of_GetIndex (long al_row)
public function string of_EncodeKey (n_ds ads_source, long al_row)
public function integer of_DeleteItem ()
public function integer of_GetAttributes (ref n_cst_lvsrvattrib anv_attrib)
public function long of_Refresh ()
public function long of_Retrieve (any aa_args[20], ref n_ds ads_data)
public function boolean of_canundo ()
public function integer of_insertitem (ref n_ds ads_obj, long al_row, listviewitem alvi_new, string as_position, integer ai_item)
end prototypes

event pfc_EndLabelEdit;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_EndLabelEdit
//	Arguments:		ai_index			Index of the listview item being used
//						as_newlabel		Text to become the new label of the listview item
//	Returns:			Long
//						CONTINUE_ACTION	Allow the new text to become the item's label
//						PREVENT_ACTION		Prevent the new text from becoming the item's label
//	Description:	Change the label column in the appropriate data source to be
//						the newtext.  This only works if the label column is updatable.
//						If a computed column is being used for the label, override
//						this script with appropriate code.
//						NOTE:  Update() is NOT called for the DataStore.  This is
//						left to the user to perform.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
long					ll_Row
n_ds					lds_DataStore
listviewitem		llvi_Item

// Check reference variables
if IsNull(ilv_requestor) or not IsValid(ilv_requestor) then return -1

// Make sure the label did change
ilv_requestor.GetItem(ai_index, llvi_Item)
if as_newlabel = llvi_Item.Label then return PREVENT_ACTION

// Get the row in the DataStore
if this.of_GetDataRow(ai_index, lds_DataStore, ll_Row) = FAILURE then return PREVENT_ACTION

// Change the value of the label column
if lds_DataStore.SetItem(ll_Row, inv_Attrib.is_LabelColumn, as_newlabel) < 1 then return PREVENT_ACTION

// Set the undo values
if ib_Undo then
	il_UndoEditHandle = ai_index
	is_UndoEditLabelText = llvi_Item.Label
	is_UndoType = UNDO_EDIT
end if

return CONTINUE_ACTION
end event

event pfc_UndoDelete;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_UndoDelete
//	Arguments:		None
//	Returns:			integer
//	 					1 = success; last delete was undone
//	 					0 = nothing to undo
//						-1 = error
//	Description:	Restore the last deleted item (items if multiple delete occured)
//						back to the listview
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
integer	li_rc, li_numbertoundo, li_cnt
long		ll_row, ll_rowcount, ll_undohandle, ll_deleterowid
long		ll_emptyhandle[], ll_numbertoundo, ll_cnt
string	ls_key, ls_undokey
listviewitem	llvi_undo
listviewitem	llvi_empty, llvi_emptyitem[]

// Check reference variables
if IsNull(ilv_requestor) or not IsValid(ilv_requestor) then return -1

// Do not undo if undo is not set
if not ib_Undo then return -1

// Check to see if we have an delete to undo
li_numbertoundo = UpperBound(il_UndoDeleteHandle)
if li_numbertoundo < 1 then return 0

//ilv_requestor.SetRedraw(false)
for li_cnt = li_numbertoundo to 1 step -1

	ll_undohandle = il_UndoDeleteHandle[li_cnt]
//	ls_undokey = string( ilvi_UndoDeleteItem[ll_cnt].Data )
	llvi_undo = ilvi_UndoDeleteItem[li_cnt]
	
	// Reset the undo delete variables (here if there are problems so we don't try to undelete the wrong thing)
	il_UndoDeleteHandle[li_cnt] = 0
	ilvi_UndoDeleteItem[li_cnt] = llvi_empty
	
	// The last row in the DataStore Delete! buffer is the one last deleted.
	ll_row = inv_Attrib.ids_Source.DeletedCount()
	if ll_row < 1 then return -1

	// Compare the keys to see if we really have the right row
	ls_undokey = of_DecodeKey(String(llvi_undo.Data))
	ll_deleterowid = inv_Attrib.ids_Source.GetRowFromRowid(Long(ls_undokey), Delete!)
	if ll_deleterowid > 0 then
		// Move row back to primary buffer
		ll_rowcount = inv_Attrib.ids_Source.RowCount()
		inv_Attrib.ids_Source.RowsMove(ll_deleterowid, ll_deleterowid, Delete!, inv_Attrib.ids_Source, (ll_rowcount + 1), Primary!)
	else
		continue
	end if

	// Insert row back under parent.
	llvi_undo.Selected = false
	li_rc = ilv_requestor.InsertItem(ll_undohandle, llvi_undo)
	il_UndoInsertHandle = ll_undohandle
	if li_rc < 0 then return -1

end for

// Reset the undo delete variables for upperbound check
il_UndoDeleteHandle = ll_emptyhandle
ilvi_UndoDeleteItem = llvi_emptyitem
is_UndoType = ""

//ilv_requestor.SetRedraw(true)

return 1
end event

event pfc_UndoInsert;call super::pfc_UndoInsert;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_UndoInsert
//	Arguments:		None
//	Returns:			integer
//	 					1 = success; last Insert was undone
//	 					0 = nothing to undo
//						-1 = error
//	Description:	Remove the last inserted item from the listview
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
long		ll_undohandle

// Do not undo if undo is not set
if not ib_Undo then return -1

// Check to see if we have something to undo
if il_UndoInsertHandle < 1 then return 0

ll_undohandle = il_UndoInsertHandle
	
// Reset the undo insert variables (here if there are problems so we don't try to uninsert the wrong thing)
il_UndoInsertHandle = 0
is_UndoType = ""

// pfc undo process running - do not display confirmation messages
ib_IsUndoing = true

//	Remove the item from the listview (visual and datastore)
if of_DeleteItem(ll_undohandle) < 1 then return -1

// pfc undo process not running - ok to display confirmation messages
ib_IsUndoing = true

return 1
end event

event pfc_UndoEdit;call super::pfc_UndoEdit;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_UndoEdit
//	Arguments:		None
//	Returns:			integer
//	 					1 = success; last change was undone
//	 					0 = nothing to undo
//						-1 = error
//	Description:	Restore the previous value the label had before it was changed
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
long					ll_Row, ll_undohandle
string				ls_undotext
n_ds					lds_DataStore
listviewitem		llvi_Item

// Check reference variables
if IsNull(ilv_requestor) or not IsValid(ilv_requestor) then return -1

// Do not undo if undo is not set
if not ib_Undo then return -1

// Check to see if we have something to undo
if il_UndoEditHandle < 1 then return 0

ll_undohandle = il_UndoEditHandle
ls_undotext = is_UndoEditLabelText
	
// Reset the undo values here.  if an error occurs do not want undo hanging around
il_UndoEditHandle = 0
is_UndoEditLabelText = ""
is_UndoType = ""

// Get the listview item
if ilv_requestor.GetItem(ll_undohandle, llvi_Item) < 1 then return -1

// Get the row in the DataStore
if of_GetDataRow(ll_undohandle, lds_DataStore, ll_Row) = -1 then return -1

// Change the value of the label column
lds_DataStore.SetItem(ll_Row, inv_Attrib.is_LabelColumn, ls_undotext)

// Reset the label on the treeivew item
llvi_Item.Label = ls_undotext
if ilv_requestor.SetItem(ll_undohandle, llvi_item) < 1 then return -1

return 1
end event

event pfc_Undo;call super::pfc_Undo;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_Undo
//	Arguments:		None
//	Returns:			integer
//	 					1 = success; 
//	 					0 = nothing to undo
//						-1 = error
//	Description:	Restore the last listview change.  
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
string	ls_undotype

// do not undo if undo is not set
if not ib_Undo then return -1

if of_CanUndo(ls_undotype) then
	choose case ls_UndoType
		case UNDO_DELETE
			return this.event pfc_UndoDelete()
		case UNDO_INSERT
			return this.event pfc_UndoInsert()
		case UNDO_EDIT
			return this.event pfc_UndoEdit()
	end choose
end if

return 0
end event

event pfc_DeleteItem;call super::pfc_DeleteItem;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_DeleteItem
//	Arguments:		None
//	Returns:			Integer
//					 	1	- the item was deleted successfully
//					 	0 - nothing deleted (or was prevented)
//						-1	- an error occurred
//	Description:	Delete an item(s) from the listview.  The item's row will be
//						DELETED from its DataStore (the user must call the Update(),
//						however).  
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
return of_DeleteItem()
end event

event pfc_InsertItem;call super::pfc_InsertItem;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_InsertItem
//	Arguments:		ads_obj		The DataStore containing the data to be used for the new item.
//										This can be the same DataStore that was created for the listview, or
//										another maintained by the user.  If the latter, the row will be added
//										to the listviews DataStore.  Passed by reference.
//						al_Row		The row in the DataStore pointing to the data.
//						alvi_item	The Item to be added to the listview
//						as_Position	The position under the parent where the new item will be inserted:
//										"First" - before the first item of the listview 
//										"Last" - after the last listview item (default)
//										"Before" - before the item with index ai_item
//										"After" - after the item with index ai_item
//						ai_Item		The index to the item which the new item will be inserted either after or before.
//										Ignored unless as_Position = "After" or "Before".
//	Returns:			Integer
//						Returns the index of the item if it was added successfully, 
//						-1 if an error occurrs.
//	Description:	Add a new item to the ListView using data from a DataStore.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
return of_InsertItem(ads_obj, al_row, alvi_item, as_position, ai_item)
end event

event pfc_SetItemAttributes;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_SetItemAttributes
//	Arguments:		ads_source	The datasource used to get information for the listview attributes
//						al_Row		The row in the DataStore to use for the item's attributes.
//						alvi_Item	The pointer to a ListView item whose attributes are to be set.
//										Passed by reference
//	Returns:			Integer
//						Returns 1 if successful, -1 if an error occurred
//	Description:	Set the default attributes of a ListView item using data from the data source.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
return of_SetItemAttributes(ads_source, al_row, alvi_item)
end event

event pfc_Refresh;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_Refresh
//	Arguments:		None
//	Returns:			long
//						# of items refreshed successfully  
//						-1 = an error occurred
//	Description:	Refresh the ListView with items from the data source.
//						Do not re-retrieve the data.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
n_ds		lds_data

// Check reference variables
if IsNull(ilv_requestor) or not IsValid(ilv_requestor) then return -1

SetPointer(HourGlass!)

// Refresh the listview
if ilv_requestor.DeleteItems() < 1 then return -1

// Reset the undo delete variables because indexes change when re-adding items
this.of_ClearUndo()

// Get the data
this.of_GetDataSource(lds_data)

// add the retrieved rows to the listview
return ilv_requestor.event pfc_AddAll(lds_data) 
end event

event pfc_RefreshItem;//////////////////////////////////////////////////////////////////////////////
//	Event:			pfc_RefreshItem
//	Arguments:		ai_index		The index of the item to be refreshed.
//	Returns:			Integer
//					 	1 if successfull
//						-1 if an error occurred
//	Description:	Refresh an item in the ListView.  Reset all its attributes to the 
//						default values based on the data in the DataStore.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
long				ll_Row
listviewitem	llvi_Item
n_ds				lds_Source

// Check reference variables
if IsNull(ilv_requestor) or not IsValid(ilv_requestor) then return -1

// Check Arguments
if IsNull(ai_index) or (ai_index < 0) then return -1
	
// Get the item
if ilv_requestor.GetItem(ai_index, llvi_Item) <> 1 then return -1

// Get the corresponding row in the DataStore
if this.of_GetDataRow(ai_index, lds_Source, ll_Row) <> 1 then return -1

// Set the item's attributes
ilv_requestor.event pfc_SetItemAttributes(lds_source, ll_row, llvi_item)

// Perform the Prerefreshitem logic if needed
ilv_requestor.event pfc_PreRefreshItem(ai_index, lds_source, ll_row, llvi_item)

// Refresh the item
return ilv_requestor.SetItem(ai_index, llvi_Item)
end event

public function integer of_Update (boolean ab_accept, boolean ab_resetflags);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Update
//	Arguments:		ab_Accept		True - perform an AcceptText prior to the update,
//											False - do not perform an AcceptText.
//						ab_ResetFlags	True - reset the status flags,
//											False - do not reset the flags.
//	Returns:			Integer
//					 	1	- the DataStore was updated successfully
//						-1	- an error occurred
//	Description:	Update the DataStore associated with the ListView.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
return inv_Attrib.ids_Source.Update(ab_Accept, ab_ResetFlags)
end function

public function integer of_GetDataSource (ref n_ds ads_source);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetDataSource
//	Arguments:		ads_Source	The handle to the DataStore (of type n_ds) for the Listview.
//										Passed by reference.
//	Returns:			Integer
//					 	1	- the DataStore was valid, 
//						-1	- it was not.
//	Description:	Get the DataStore used as the source for the ListView.  This
//						allows the user get data and attributes from the internal data source.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
if IsNull(inv_Attrib.ids_Source) or not IsValid(inv_Attrib.ids_Source) then return -1

ads_Source = inv_Attrib.ids_Source

return 1
end function

public function integer of_ResetUpdate ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_ResetUpdate
//	Arguments:		None
//	Returns:			Integer
//					 	1	- the DataStore flags were reset successfully
//						-1	- an error occurred
//	Description:	Reset the update flags for a DataStore associated with the ListView.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
return inv_Attrib.ids_Source.ResetUpdate()
end function

public function integer of_Register (string as_labelcolumn, string as_dwobjectname, string as_importfile);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_LabelColumn		The column in the DataWindow object to display as the label. 
//						as_dwobjectname	The data object to be used for the data source datastore.
//						as_importfile		The filename to be used for the data source.
//	Returns:  		integer
//	 					1 = the data source was added successfully
//						-1 = argument validation error
//						-2 = the DataWindow object did not have any key columns assigned
//						-3 = no DataWindow object was provided
//						-4 = one of the columns provided did not exist
//						-5 = SetTransObject failed for the data source
// 					-6 = Error from Cache Registration
//	Description:	Register a disk file as a data source for the ListView.  
//						The data source will be linked to the Listview and used to populate.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
n_tr			ltr_obj
string		ls_dwobjectname
string		ls_sql
powerobject lpo_obj[]
datawindow	ldw_control
datastore	lds_control
string		ls_importfile

//	Check Arguments
if IsNull(as_dwobjectname) or Len(Trim(as_dwobjectname))= 0 then return -1
if IsNull(as_importfile) or not FileExists(as_importfile) then return -1

// Set Null to indicate non-usage
SetNull(ls_sql)
SetNull(ldw_control)
SetNull(lds_control)
SetNull(ls_importfile)

return of_Register(as_LabelColumn, as_dwobjectname, ltr_obj, inv_Cache.IMPORTFILE, &
						 ls_sql, lpo_obj, ldw_control, lds_control, as_importfile)
end function

public function integer of_Register (string as_labelcolumn, string as_dwobjectname, powerobject apo_data[]);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_LabelColumn		The column in the DataWindow object to display as the label. 
//						as_dwobjectname	The data object to be used for the data source datastore.
//						apo_data				The powerobject object to be used for the data source.
//	Returns:  		integer
//	 					1 = the data source was added successfully
//						-1 = argument validation error
//						-2 = the DataWindow object did not have any key columns assigned
//						-3 = no DataWindow object was provided
//						-4 = one of the columns provided did not exist
//						-5 = SetTransObject failed for the data source
// 					-6 = Error from Cache Registration
//	Description:	Register a powerobject (usually an array) as a data source for the ListView.  
//						The data source will be linked to the ListView and used to populate.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
n_tr			ltr_obj
string		ls_dwobjectname
string		ls_sql
powerobject lpo_obj[]
datawindow	ldw_control
datastore	lds_control
string		ls_importfile

// Check Arguments
if IsNull(as_dwobjectname) or Len(Trim(as_dwobjectname))= 0 then return -1
if IsNull(apo_data) then return -1
if UpperBound(apo_data) = 0 then return -1

// Set Null to indicate non-use
SetNull(ls_sql)
SetNull(ldw_control)
SetNull(lds_control)
SetNull(ls_importfile)

return of_Register(as_LabelColumn, as_dwobjectname, ltr_obj, inv_Cache.POWEROBJECT, &
						 ls_sql, apo_data, ldw_control, lds_control, ls_importfile)
end function

public function integer of_Register (string as_labelcolumn, string as_dwobjectname, n_tr atr_obj);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_LabelColumn		The column in the DataWindow object to display as the label. 
//						as_dwobjectname	The data object to be used for the data source datastore.
//						atr_obj				The transaction object to be used for the data source.
//	Returns:  		integer
//						1 = the data source was added successfully
//						-1 = argument validation error
//						-2 = the DataWindow object did not have any key columns assigned
//						-3 = no DataWindow object was provided
//						-4 = one of the columns provided did not exist
//						-5 = SetTransObject failed for the data source
// 					-6 = Error from Cache Registration
//	Description:	Register a datawindow as a data source for the ListView.  
//						The data source will be linked to the ListView and used to populate.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
n_tr			ltr_obj
string		ls_dwobjectname
string		ls_sql
powerobject lpo_obj[]
datawindow	ldw_control
datastore	lds_control
string		ls_importfile

// Check Arguments
if IsNull(as_dwobjectname) or Len(Trim(as_dwobjectname))= 0 then return -1
if IsNull(atr_obj) or not IsValid(atr_obj) then return -1
if not atr_obj.of_IsConnected() then return -1

SetNull(ls_sql)
SetNull(ldw_control)
SetNull(lds_control)
SetNull(ls_importfile)

return of_Register(as_LabelColumn, as_dwobjectname, atr_obj, inv_Cache.RETRIEVE, &
						 ls_sql, lpo_obj, ldw_control, lds_control, ls_importfile)
end function

public function integer of_Register (string as_labelcolumn, string as_dwobjectname);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_LabelColumn		The column in the DataWindow object to display as the label. 
//						as_dwobjectname	The data object to be used for the data source datastore.
//	Returns:  		integer
//	 					1 = the data source was added successfully
//						-1 = argument validation error
//						-2 = the DataWindow object did not have any key columns assigned
//						-3 = no DataWindow object was provided
//						-4 = one of the columns provided did not exist
//						-5 = SetTransObject failed for the data source
// 					-6 = Error from Cache Registration
//	Description:	Register a datawindow object as a data source for the ListView.  
//						The data source will be linked to the ListView and used to populate.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
n_tr			ltr_obj
string		ls_dwobjectname
string		ls_retrieveargs
string		ls_sql
string		ls_importfile
powerobject lpo_obj[]
datawindow	ldw_control
datastore	lds_control

// Check Arguments
if IsNull(as_dwobjectname) or Len(Trim(as_dwobjectname))= 0 then return -1

// Set null to indicate non-use
SetNull(ls_sql)
SetNull(ldw_control)
SetNull(lds_control)
SetNull(ls_importfile)

return of_Register(as_LabelColumn, as_dwobjectname, ltr_obj, inv_Cache.DATAOBJECTDATA, &
						 ls_sql, lpo_obj, ldw_control, lds_control, ls_importfile)
end function

public function integer of_Register (string as_labelcolumn, datastore ads_control);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_LabelColumn		The column in the Datastore object to display as the label. 
//						ads_control			The DataStore control to be used for the data source.
//	Returns:  		integer
//	 					1 = the data source was added successfully
//						-1 = argument validation error
//						-2 = the DataWindow object did not have any key columns assigned
//						-3 = no DataWindow object was provided
//						-4 = one of the columns provided did not exist
//						-5 = SetTransObject failed for the data source
// 					-6 = Error from Cache Registration
//	Description:	Register a datastore control as a data source for the ListView.  
//						The data source will be linked to the ListView and used to populate.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
string		ls_dwobjectname
string		ls_sql
string		ls_importfile
powerobject lpo_obj[]
datawindow	ldw_control
datastore	lds_control
n_tr			ltr_obj

// Check Arguments
if IsNull(ads_control) or not IsValid(ads_control) then return -1
if Len(ads_control.DataObject) = 0 then return -1

// Set null to indicate non usage
SetNull(ls_sql)
SetNull(ldw_control)
SetNull(lds_control)
SetNull(ls_importfile)

// Populate the argument with the desired DataObject.
ls_dwobjectname = ads_control.DataObject

return of_Register(as_LabelColumn, ls_dwobjectname, ltr_obj, inv_Cache.DATASTORECONTROL, &
						 ls_sql, lpo_obj, ldw_control, ads_control, ls_importfile)
end function

public function integer of_Register (string as_labelcolumn, n_tr atr_obj, string as_sql);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_LabelColumn		The column in the DataWindow object to display as the label. 
//						atr_obj				The transaction object to be used for the data source.
//						as_sql				The SQL Statement to be used for the data source.
//	Returns:  		integer
//	 					1 = the data source was added successfully
//						-1 = argument validation error
//						-2 = the DataWindow object did not have any key columns assigned
//						-3 = no DataWindow object was provided
//						-4 = one of the columns provided did not exist
//						-5 = SetTransObject failed for the data source
// 					-6 = Error from Cache Registration
//	Description:	Register a SQL statement as a data source for the ListView.  
//						The data source will be linked to the ListView and used to populate.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
string		ls_dwobjectname
string		ls_sql
string		ls_importfile
string		ls_dwsyntax, ls_Sqlerr
powerobject lpo_obj[]
datawindow	ldw_control
datastore	lds_control
n_tr			ltr_obj

// Check transaction objects
if IsNull(atr_obj) or not IsValid(atr_obj) then return -1
if not atr_obj.of_IsConnected() then return -1

// Check sql statement
if IsNull(as_sql) or (Len(as_sql) = 0) then return -1
	
// Set null to indicate non-use
SetNull(ls_sql)
SetNull(ldw_control)
SetNull(lds_control)
SetNull(ls_importfile)

// get sql statement for object creation
ls_dwsyntax = atr_obj.SyntaxFromSQL ( as_sql, "", ls_sqlerr )	
if Len(ls_sqlerr) > 0 then return -1
		
return of_Register(as_LabelColumn, ls_dwsyntax, atr_obj, inv_Cache.SQL, &
						 as_sql, lpo_obj, ldw_control, lds_control, ls_importfile)
end function

public function integer of_Register (string as_labelcolumn, datawindow adw_control);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Register
//	Arguments:		as_LabelColumn		The column in the DataWindow object to display. 
//						adw_control			The DataWindow control to be used for the data source.
//	Returns:  		integer
//	 					1 = the data source was added successfully
//						-1 = argument validation error
//						-2 = the DataWindow object did not have any key columns assigned
//						-3 = no DataWindow object was provided
//						-4 = one of the columns provided did not exist
//						-5 = SetTransObject failed for the data source
// 					-6 = Error from Cache Registration
//	Description:	Register a datawindow control as a data source for the ListView.  
//						The data source will be linked to the ListView and used to populate.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
string		ls_dwobjectname
string		ls_sql
string		ls_importfile
powerobject lpo_obj[]
datawindow	ldw_control
datastore	lds_control
n_tr			ltr_obj

// Check Arguments
if IsNull(adw_control) or not IsValid(adw_control) then return -1
if Len(adw_control.DataObject) = 0 then return -1

// Set Null to indicate non-use
SetNull(ls_sql)
SetNull(ldw_control)
SetNull(lds_control)
SetNull(ls_importfile)

// Populate the argument with the desired DataObject.
ls_dwobjectname = adw_control.DataObject

return of_Register(as_LabelColumn, ls_dwobjectname, ltr_obj, inv_Cache.DATAWINDOWCONTROL, &
					 	 ls_sql, lpo_obj, adw_control, lds_control, ls_importfile)
end function

public function integer of_ResetList ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_ResetList
//	Arguments:  	None
//	Returns:  		Integer
//	 					1 if it succeeds
//						-1 if an error occurs.
//	Description:	Reset/clear the entire listview (items and datastores).
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0  Initial version
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
// clear the listview - delete the columns from detail view
if of_UnRegisterReportColumn() < 1 then return -1

// clear the datasource
this.of_Reset()

// Reset the undo variables 
this.of_ClearUndo()

return 1
end function

public function integer of_Reset ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Reset
//	Arguments:		None
//	Returns:			Integer
//					 	1	- the DataStore was reset successfully
//						-1	- an error occurred
//	Description:	Reset the DataStore associated with the ListView.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
return inv_Attrib.ids_Source.Reset()
end function

protected function integer of_ClearUndo ();//////////////////////////////////////////////////////////////////////////////
//	Protected Function:	of_ClearUndo
//	Arguments:  	None
//	Returns:  		Integer
//				 		1 if it succeeds
//	Description:	Clear the undo properties
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0  Initial version
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
long				ll_empty[]
listviewitem	llvi_emptyitem[]

// Reset the undo variables
ilvi_UndoDeleteItem = llvi_emptyitem
il_UndoDeleteHandle = ll_empty
il_UndoEditHandle = 0
il_UndoInsertHandle = 0
is_UndoEditLabelText = ""
is_UndoType = ""

return 1
end function

public function boolean of_IsConfirmOnDelete ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_IsConfirmOnDelete
//	Arguments:		None
//	Returns:			boolean
//	Description:	Returns whether deletions will be confirmed first
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
return ib_ConfirmOnDelete
end function

public function integer of_SetConfirmOnDelete (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetConfirmOnDelete
//	Arguments:		ab_switch	Specifies whether deletions will be confirmed first
//	Returns:			integer
//	 					1 = success
//						-1 = error
//	Description:	Sets whether deletions will be confirmed by user first
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
// Validate arguments
if IsNull (ab_switch) then return -1

ib_ConfirmOnDelete = ab_switch

return 1
end function

public function string of_GetLabelColumn ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetLabelColumn
//	Arguments:		None
//	Returns:			string
//	Description:	Returns the column name used from the datasource as item label
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
return inv_Attrib.is_LabelColumn
end function

public function string of_GetPictureColumn ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetPictureColumn
//	Arguments:		None
//	Returns:			string
//	Description:	Returns the column name used from the datasource as the picture display
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
return inv_Attrib.is_PictureColumn
end function

public function string of_GetStatePictureColumn ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetStatePictureColumn
//	Arguments:		None
//	Returns:			string
//	Description:	Returns the column name used from the datasource as the state picture display
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
return inv_Attrib.is_StateColumn
end function

public function string of_GetOverlayPictureColumn ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetOverlayPictureColumn
//	Arguments:		None
//	Returns:			string
//	Description:	Returns the column name used from the datasource as the overlay display picture
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
return inv_Attrib.is_OverlayColumn
end function

public function integer of_SetStatePictureColumn (string as_column);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetStatePictureColumn
//	Arguments:		as_column	column in datasource to be used for state picture display purposes
//										The column may be an integer (used as the picture index) or a
//										string (a bmp name which will be used as the picture).  Or a number
//										may be passed in (i.e. "1") which will be used as the state picture
//										index for all items.
//	Returns:			integer
//					 	1 = success
//						-1 = failure
//	Description:	Sets the column name used from the datasource as the state picture display
//						Note:  The datasource(dataobject) must be set first before calling this function
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
if IsNull(as_column) then return -1

// Check to make sure column is valid for the dataobject
if Trim(as_column) <> "" and not IsNumber(as_column) &
and inv_Attrib.ids_Source.Describe(as_column + ".Band") = "!" then return -1

inv_Attrib.is_StateColumn = as_column

return 1
end function

public function integer of_SetOverlayPictureColumn (string as_column);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetOverlayPictureColumn
//	Arguments:		as_column	column in datasource to be used for overlay picture display purposes
//										The column may be an integer (used as the picture index) or a
//										string (a bmp name which will be used as the picture).  Or a number
//										may be passed in (i.e. "1") which will be used as the state picture
//										index for all items.
//	Returns:			integer
//					 	1 = success
//						-1 = failure
//	Description:	Sets the column name used from the datasource as the overlay display picture
//						Note:  The datasource(dataobject) must be set first before calling this function
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
if IsNull(as_column) then return -1

// Check to make sure column is valid for the dataobject
if Trim(as_column) <> "" and not IsNumber(as_column) &
and inv_Attrib.ids_Source.Describe(as_column + ".Band") = "!" then return -1

inv_Attrib.is_OverlayColumn = as_column

return 1
end function

public function string of_GetXposColumn ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetXposColumn
//	Arguments:		None
//	Returns:			string
//	Description:	Returns the column name used from the datasource as the item x coordinate
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
return inv_Attrib.is_XPosColumn
end function

public function string of_GetYposColumn ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetYposColumn
//	Arguments:		None
//	Returns:			string
//	Description:	Returns the column name used from the datasource as the item y coordinate
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
return inv_Attrib.is_YPosColumn
end function

public function integer of_SetXposColumn (string as_column);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetXposColumn
//	Arguments:		as_column	column in datasource to be used for defining x position of the item
//	Returns:			integer
//					 	1 = success
//						-1 = failure
//	Description:	Sets the column name used from the datasource as the item x coordinate
//						Note:  The datasource(dataobject) must be set first before calling this function
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
if IsNull(as_column) then return -1

// Check to make sure column is valid for the dataobject
if Trim(as_column) <> "" and inv_Attrib.ids_Source.Describe(as_column + ".Band") = "!" then return -1

inv_Attrib.is_XPosColumn = as_column

return 1
end function

public function integer of_SetYposColumn (string as_column);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetYposColumn
//	Arguments:		as_column	column in datasource to be used for defining y position of the item
//	Returns:			integer
//					 	1 = success
//						-1 = failure
//	Description:	Sets the column name used from the datasource as the item y coordinate
//						Note:  The datasource(dataobject) must be set first before calling this function
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
if IsNull(as_column) then return -1

// Check to make sure column is valid for the dataobject
if Trim(as_column) <> "" and inv_Attrib.ids_Source.Describe(as_column + ".Band") = "!" then return -1

inv_Attrib.is_YPosColumn = as_column

return 1
end function

public function integer of_SetPictureColumn (string as_column);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetPictureColumn
//	Arguments:		as_Column		The column in the DataWindow object to use for the picture.
//											The column may be an integer (used as the picture index) or a
//											string (a bmp name which will be used as the picture).  Or a number
//											may be passed in (i.e. "1") which will be used as the picture index
//											for all items.
//	Returns:			integer
//					 	1 = success
//						-1 = failure
//	Description:	Sets the column name used from the datasource as the picture display
//						Note:  The datasource(dataobject) must be set first before calling this function
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
if IsNull(as_column) then return -1

// Check to make sure column is valid for the dataobject
if Trim(as_column) <> "" and not IsNumber(as_column) &
and inv_Attrib.ids_Source.Describe(as_column + ".Band") = "!" then return -1

inv_Attrib.is_PictureColumn = as_column

return 1
end function

public function integer of_SetItemAttributes (n_ds ads_source, long al_row, ref listviewitem alvi_item);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetItemAttributes
//	Arguments:		ads_source	The datasource used to get information for the listview attributes
//						al_Row		The row in the DataStore to use for the item's attributes.
//						alvi_Item	The pointer to a ListView item whose attributes are to be set.
//										Passed by reference
//	Returns:			Integer
//						Returns 1 if successful, -1 if an error occurred
//	Description:	Set the default attributes of a ListView item using data from the data source.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
Integer			li_Cnt, li_Cols
Integer			li_picture, li_state, li_overlay, li_x, li_y
Long				ll_Handle
string			ls_Label, ls_Column, ls_picture, ls_key

// Validate required reference.
if IsNull(ilv_requestor) or not IsValid(ilv_requestor) then return -1
if IsNull(ads_source) or not IsValid(ads_source) then return -1
if IsNull(ads_source.inv_base) or not IsValid(ads_source.inv_base) then return -1

// Determine how to handle the pictures

// Large and Small Pictures
if Trim(inv_Attrib.is_PictureColumn) <> "" then
	if IsNumber(inv_Attrib.is_PictureColumn) then
		// The Picture Index is hard coded
		li_picture = Integer(inv_Attrib.is_PictureColumn)
	elseif Left(ads_source.Describe(inv_Attrib.is_PictureColumn + ".coltype"), 4) = "char" then
		// The column contains a bmp name, so add the picture
		ls_picture = ads_source.GetItemString(al_Row, inv_Attrib.is_PictureColumn)
		if not IsNull(ls_picture) then 
			ilv_requestor.AddSmallPicture(ls_picture)
			li_picture = ilv_requestor.AddLargePicture(ls_picture)
		else
			li_picture = 0
		end if
	else 
		// the column contains a index
		li_picture = ads_source.GetItemNumber(al_Row, inv_Attrib.is_PictureColumn)
	end if
end if
if IsNull(li_picture) then li_picture = 0
alvi_Item.PictureIndex = li_picture

// State Picture
if Trim(inv_Attrib.is_StateColumn) <> "" then
	if IsNumber(inv_Attrib.is_StateColumn) then
		// The Picture Index is hard coded
		li_state = Integer(inv_Attrib.is_StateColumn)
	elseif Left(ads_source.Describe(inv_Attrib.is_StateColumn + ".coltype"), 4) = "char" then
		// The column contains a bmp name, so add the picture
		ls_picture = ads_source.GetItemString(al_Row, inv_Attrib.is_StateColumn)
		if not IsNull(ls_picture) then 
			li_state = ilv_requestor.AddStatePicture(ls_picture)
		else
			li_state = 0
		end if
	else 
		// the column contains a index
		li_state = ads_source.GetItemNumber(al_Row, inv_Attrib.is_StateColumn)
	end if
end if
if IsNull(li_state) then li_state = 0
alvi_Item.StatePictureIndex = li_state

// Overlay Picture - cannot add it to the picture array
if Trim(inv_Attrib.is_OverlayColumn) <> "" then
	if IsNumber(inv_Attrib.is_OverlayColumn) then
		// The Index is hard coded
		li_overlay = Integer(inv_Attrib.is_OverlayColumn)
	else 
		// the column contains a index
		li_overlay = ads_source.GetItemNumber(al_Row, inv_Attrib.is_OverlayColumn)
	end if
end if
if IsNull(li_overlay) then li_overlay = 0
alvi_Item.OverlayPictureIndex = li_overlay

// Set the X and Y coordinates
if Trim(inv_Attrib.is_XPosColumn) <> "" then	li_x = ads_source.GetItemNumber(al_Row, inv_Attrib.is_XPosColumn)

if IsNull(li_x) then li_x = 0
alvi_Item.ItemX = li_x

if Trim(inv_Attrib.is_YPosColumn) <> "" then	li_y = ads_source.GetItemNumber(al_Row, inv_Attrib.is_YPosColumn)

if IsNull(li_y) then li_y = 0
alvi_Item.ItemY = li_y

// Set label with data from columns
li_Cols = UpperBound(inv_ColAttrib)
for li_Cnt = 1 to li_Cols
	ls_Column = ads_source.inv_base.of_GetItem(al_row, inv_ColAttrib[li_Cnt].is_Columns)
	if Trim(ls_Label) = "" then
		ls_Label = ls_Column
	else
		ls_Label = ls_Label + "~t" + ls_Column
	end if
next
alvi_Item.Label = ls_Label

//// Set data to be the unique key to be sure it can be found later
//ls_key = of_EncodeKey(ads_source, al_Row)
//if ls_key = "!" then return -1
//alvi_Item.Data = ls_key
	
return 1
end function

public function string of_GetDataObject ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetDataObject
//	Arguments:		None
//	Returns:			string
//	Description:	Returns the dataobject used by the datasource to store the data
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
return inv_Attrib.is_DataObject
end function

public function string of_GetMethod ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetMethod
//	Arguments:		None
//	Returns:			string
//	Description:	Returns the method used to populate the datasource
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
return inv_Attrib.is_Method
end function

public function integer of_ConvertToRow (any aa_columnvalues[], ref n_ds ads_obj, ref long al_row);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_ConvertToRow
//	Arguments:		aa_ColumnValues[]	The array containing the data to be used for the new row.
//						ads_obj				The datastore to place the new row in (the dataobjects should have
//												the same column types).  Passed by reference
//						al_Row				The new row of the array in the datastore.  Passed by reference
//	Returns:			Integer
//					 	1 if successful
//						-1 if an error occurrs.
//	Description:	Convert an array of values which corresponded to columns in the 
//						source dataobject to a row in a datastore.  A row does not have to
//						be added to the data source first using this method
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
Integer				li_columns, li_cnt
string				ls_Sqlerr
window				lw_parentwindow

// check reference variables
if IsNull(ilv_requestor) or not IsValid(ilv_requestor) then return -1
if UpperBound(aa_columnvalues) < 1 then return -1

// Populate the storage datastore
if inv_Attrib.is_Method = inv_Cache.SQL then
	ads_obj.Create( inv_Attrib.is_DataObject, ls_sqlerr )
	if Len(ls_sqlerr) > 0 then	return -1		
else
	ads_obj.DataObject = inv_Attrib.is_DataObject
end if

ads_obj.of_SetBase(true)
ilv_requestor.of_GetParentWindow(lw_parentwindow)
ads_obj.of_SetParentWindow(lw_parentwindow)

al_row = ads_obj.InsertRow(0)
if al_row < 1 then return -1

// copy the argument array to the datastore column by column
li_columns = UpperBound(aa_columnvalues)
for li_cnt = 1 to li_columns
	ads_obj.Object.Data[al_row, li_cnt] = aa_columnvalues[li_cnt]
end for

return 1
end function

protected function integer of_RegisterDataSource (string as_method, string as_dataobject, n_tr atr_obj, string as_sql, powerobject apo_data[], datawindow adw_control, datastore ads_control, string as_importfile);//////////////////////////////////////////////////////////////////////////////
//	Protected Function:	of_RegisterDataSource
//	Arguments:		as_method			The Method we will use to populate the data source
//						as_dataobject		The DataWindow object to be used for the data source.
//						atr_obj				The transaction object for this data source .
//						as_sql				The SQL Statement to be used for the data source (if specified).
//						apo_data[]			The data to be used for the data source (if specified).
//						adw_control			The datawindow control to be used for the data source (if specified).
//						ads_control			The datastore control to be used for the data source (if specified).
//						as_importfile		The import file from which to be used for the data source (if specified).
//
//	Returns:			Integer
//	 					1 = the data source was added successfully
//						-1 = Nothing was registered with the cache
//	Description:	Register a data source for the ListView with the cache service. 
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
Integer	li_rc

if IsNull(inv_Cache) or not Isvalid(inv_Cache) then return -1

choose case as_method
	case inv_Cache.DATASTORECONTROL
		// register a datastore control
		if IsValid(ads_control) then
			if inv_Cache.of_IsRegistered(CACHE_ID) > 0 then
				// already registered so unregister and re-register
				li_rc = inv_Cache.of_UnRegister(CACHE_ID)
			end if				
			li_rc = inv_Cache.of_Register(CACHE_ID, ads_control, true)
		else
			li_rc = -1
		end if
	case inv_Cache.DATAWINDOWCONTROL
		// register a datawindow control
		if IsValid(adw_control) then
			if inv_Cache.of_IsRegistered(CACHE_ID) > 0 then
				// already registered so unregister and re-register
				li_rc = inv_Cache.of_UnRegister(CACHE_ID)
			end if				
			li_rc = inv_Cache.of_Register(CACHE_ID, adw_control, true)
		else
			li_rc = -1
		end if
	case inv_Cache.POWEROBJECT
		// register a powerobject 
		if (UpperBound(apo_data) <> 0) and not IsNull(apo_data) then
			if inv_Cache.of_IsRegistered(CACHE_ID) > 0 then
				// already registered so unregister and re-register
				li_rc = inv_Cache.of_UnRegister(CACHE_ID)
			end if				
			li_rc = inv_Cache.of_Register(CACHE_ID, as_dataobject, apo_data)
		else
			li_rc = -1
		end if
	case inv_Cache.IMPORTFILE
		// register a file from disk
		if Len(as_importfile) <> 0 and not IsNull(as_importfile) then
			if inv_Cache.of_IsRegistered(CACHE_ID) > 0 then
				// already registered so unregister and re-register
				li_rc = inv_Cache.of_UnRegister(CACHE_ID)
			end if				
			li_rc = inv_Cache.of_Register(CACHE_ID, as_dataobject, as_importfile, true)
		else
			li_rc = -1
		end if
	case inv_Cache.RETRIEVE
		// register a Retrieve
		if Len(as_dataobject) <> 0 and not IsNull(as_dataobject) and &
			IsValid(atr_obj) and not IsNull(atr_obj) then
				if inv_Cache.of_IsRegistered(CACHE_ID) > 0 then
					// already registered so unregister and re-register
					li_rc = inv_Cache.of_UnRegister(CACHE_ID)
				end if				
				li_rc = inv_Cache.of_Register(CACHE_ID, as_dataobject, atr_obj, false)
		else
			li_rc = -1
		end if
	case inv_Cache.SQL
		// register a SQL statement
		if Len(as_sql) <> 0 and not IsNull(as_sql) and &
			IsValid(atr_obj) and not IsNull(atr_obj) then
				if inv_Cache.of_IsRegistered(CACHE_ID) > 0 then
					// already registered so unregister and re-register
					li_rc = inv_Cache.of_UnRegister(CACHE_ID)
				end if				
				li_rc = inv_Cache.of_Register(CACHE_ID, atr_obj, as_sql, false)
		else
			li_rc = -1
		end if
	case inv_Cache.DATAOBJECTDATA
		// register a dataobject
		if Len(as_dataobject) <> 0 and not IsNull(as_dataobject) then
			if inv_Cache.of_IsRegistered(CACHE_ID) > 0 then
				// already registered so unregister and re-register
				li_rc = inv_Cache.of_UnRegister(CACHE_ID)
			end if				
			li_rc = inv_Cache.of_Register(CACHE_ID, as_dataobject)
		else
			li_rc = -1
		end if
	case else
		// didn't register anything
		li_rc = -1
end choose

return li_rc
end function

public function integer of_ConfirmDelete (long al_amount);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_ConfirmDelete
//	Arguments:		al_amount		Number of rows to confirm deletion for
//	Returns:  		integer
//	 					1 = yes (ok to delete)
//	 					2 = no (do not delete)
//						-1 = error
//	Description:	Displays messagebox confirming deletion
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
// Validate amount argument
if al_amount <=0 then return -1

// Display confirm delete message based on single/multiple deletes
if al_amount = 1 then
	return of_MessageBox ("pfc_lv_datasource_confirmdeletesingle", "Confirm Delete", &
			"Are you sure you want to delete " + is_displayitem + "?", Question!, YesNo!, 1)
else
	return of_MessageBox ("pfc_lv_datasource_confirmdeletemulti", "Confirm Multiple Delete", &
			"Are you sure you want to delete these " + &
			String (al_amount) + " " + is_displayunits + "?", Question!, YesNo!, 1)
end if
end function

public function integer of_RegisterReportColumn ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_RegisterReportColumn
//	Arguments:		None
//	Returns:			Integer
//						The number of columns added if successful, -1 if an error occurred
//	Description:	Add a column to the ListView control for each visible column in the DataWindow.
//						They will be displayed in Report View only.
//						This function overloads the of_RegisterReportColumn in the base service to
//						allow the internal data source to be used as the default value.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
return of_RegisterReportColumn(inv_Attrib.ids_Source)
end function

public function boolean of_CanUndo (ref string as_undotype);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_CanUndo
//	Arguments:		as_undotype		The type of undo we are performing.  Passed by reference
//	Returns:			Boolean
//						true = we can undo the last edit/insert/delete
//						false = cannot undo the last edit/insert/delete
//	Description:	Returns if undo can be performed and the type of undo that can be performed
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
// initialize the undo type
as_undotype = ""

// if undo not on then we cannot undo
if not ib_Undo then return false

// Validate arguments
choose case is_UndoType
	case UNDO_EDIT, UNDO_INSERT, UNDO_DELETE
		// Good style.
		as_undotype = is_UndoType
		return true
end choose

return false
end function

protected function integer of_SetCache (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Protected Function:	of_SetCache
//	Arguments:		ab_switch   enable/disable the internal cache
//	Returns:  		integer
//	 					1 = success
//						-1 = error
//	Description:	Instantiates or destroys the listview caching service.  The cache
//						is used as the mechanism to retrieve data into the internal listview
//						datastore (inv_Attrib.ids_Source)
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
integer	li_rc

// Check arguments
if IsNull (ab_switch) then	return -1

if ab_Switch then
	if IsNull(inv_Cache) or not IsValid (inv_Cache) then
		inv_Cache = create n_cst_dwcache
		li_rc = 1
	end if
else
	if IsValid (inv_Cache) then
		destroy inv_Cache
		li_rc = 1
	end if	


end if

return li_rc
end function

public function integer of_GetTransObject (ref n_tr atr_obj);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetTransObject
//	Arguments:		atr_obj	The transaction object (of type n_tr) the Listview uses.
//									Passed by reference.
//	Returns:			Integer
//					 	1	- the transaction object was valid, 
//						-1	- it was not.
//	Description:	Get the transaction object used for the Listview.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
if IsNull(inv_Attrib.itr_obj) or not IsValid(inv_Attrib.itr_obj) then return -1

atr_obj = inv_Attrib.itr_obj

return 1
end function

public function integer of_GetDataRow (integer ai_item, ref n_ds ads_source, ref long al_row);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetDataRow
//	Arguments:		ai_Item		The index to the ListView item for which data is desired.
//						ads_Source	The handle to the DataStore (of type n_ds) for the Listview.
//										Passed by reference.
//						al_Row		The row in the DataStore that the item points to.  Passed by reference.
//	Returns:			Integer
//					 	1	- the item's data was found
//						-1	- the item or row was not found
//	Description:	Return the DataStore and row a particular item in the ListView points
//						to.  This allows the user to update this row any way they wish.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
long				ll_Row
string			ls_key
listviewitem	llvi_Item

// check reference variables
if IsNull(ilv_requestor) or not IsValid(ilv_requestor) then return -1
if IsNull(ai_item) or (ai_item < 1) then return -1

if ilv_requestor.GetItem(ai_Item, llvi_Item) = -1 then return -1

ads_Source = inv_Attrib.ids_Source

if IsNull(inv_Attrib.ids_Source) or not IsValid (inv_Attrib.ids_Source) then return -1

// find the row
ls_key = of_DecodeKey( String(llvi_item.Data) )
ll_row = ads_Source.GetRowFromRowID( long(ls_key) )

//ll_Row = ads_Source.Find("pfc_lvi_key = '" + String(llvi_Item.Data) + "'", &
//										1, ads_Source.RowCount())

if ll_Row <= 0 then
	return -1
else
	al_Row = ll_Row
	return 1
end if
end function

protected function integer of_Register (string as_labelcolumn, string as_dwobjectname, n_tr atr_obj, string as_method, string as_sql, powerobject apo_data[], datawindow adw_control, datastore ads_control, string as_importfile);//////////////////////////////////////////////////////////////////////////////
//	Protected Function:	of_Register
//	Arguments:		as_LabelColumn		The column in the DataWindow object to display as the label. 
//						as_DWobjectname	The DataWindow object to be used for the data source.
//						atr_obj				The transaction object for this data source .
//						as_method			The Method we will use to populate the data source
//						as_sql				The SQL Statement to be used for the data source (if specified).
//						apo_data[]			The data to be used for the data source (if specified).
//						adw_control			The datawindow control to be used for the data source (if specified).
//						ads_control			The datastore control to be used for the data source (if specified).
//						as_importfile		The import file from which to be used for the data source (if specified).
//	Returns:			Integer
//	 					1 = the data source was added successfully
//						-1 = argument validation error
//						-2 = the DataWindow object did not have any key columns assigned
//						-3 = no DataWindow object was provided
//						-4 = one of the columns provided did not exist
//						-5 = SetTransObject failed for the data source
// 					-6 = Error from Cache Registration
//	Description:	Register a data source for the ListView.  The data source is a	DataWindow
//						object that will be linked to the ListView level and used to populate.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
integer	li_rc
string	ls_sqlerr, ls_empty[]
window	lw_parentwindow
n_ds		lds_test

// Check arguments
if Len (as_labelcolumn) = 0 or IsNull (as_labelcolumn) or Len(as_DWobjectname) = 0 &
or IsNull (as_DWobjectname) or Len(as_method) = 0 or IsNull (as_method) then return -1

// create temporary datastore
lds_test = Create n_ds
if as_method = inv_Cache.SQL then
	lds_test.Create( as_DWobjectname, ls_sqlerr )
	if Len(ls_sqlerr) > 0 then
		Destroy lds_test
		return -1		
	end if 	
else
	lds_test.DataObject = as_DWobjectname
end if

// Set data source values.  label column must be in datawindow
if Trim(as_LabelColumn) <> "" And lds_test.Describe(as_LabelColumn + ".Band") = "!" then 
	Destroy lds_test
	return -4
end if

// do not need this anymore
Destroy lds_test

// set the values in the array structure
inv_Attrib.is_DataObject = as_DWobjectname
inv_Attrib.itr_obj = atr_obj
inv_Attrib.is_Method = as_method
inv_Attrib.is_LabelColumn = as_LabelColumn

// register with cache service
li_rc = of_RegisterDataSource(as_method, as_DWobjectname, atr_obj, &
										as_sql, apo_data, adw_control, ads_control, as_importfile)
if li_rc < 1 then 
	return -6
end if

// create a new dataobject 
if IsNull(inv_Attrib.ids_Source) or not IsValid(inv_Attrib.ids_Source) then
	inv_Attrib.ids_Source = Create n_ds
end if
if as_method = inv_Cache.SQL then
	inv_Attrib.ids_Source.Create( as_DWobjectname, ls_sqlerr )
else
	inv_Attrib.ids_Source.DataObject = as_DWobjectname	
end if

// make sure transaction object is valid
if IsValid(atr_obj) then
	if inv_Attrib.ids_Source.of_SetTransObject(atr_obj) <> 1 then return -5
end if

// Set parameters for the DataStore
inv_Attrib.ids_Source.of_SetBase(true)
ilv_requestor.of_GetParentWindow(lw_parentwindow)
inv_Attrib.ids_Source.of_SetParentWindow(lw_parentwindow)

// if method is dataobjectdata then we already will have the data in the datastore
// so we will delete the data and wait for it to be added by populate
if as_method = inv_Cache.DATAOBJECTDATA then	inv_Attrib.ids_Source.Reset()

// Delete the columns if already exists in listview and clear column array
of_UnRegisterReportColumn()

// Add a column to the ListView for the Label
of_RegisterReportColumn(inv_Attrib.ids_Source, as_LabelColumn)

return 1
end function

public function integer of_UnRegister ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_UnRegister
//	Arguments:		None
//	Returns:			Integer
//	 					1 = the data source was unregistered successfully
//						-1 = error
//	Description:	UnRegister a data source for the ListView.  Reset the attribute
//						values to defaults and destroy the datastore reference
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
integer	li_rc
n_tr		ltr_obj

// reset the values in the array structure
inv_Attrib.is_DataObject = ""
inv_Attrib.is_LabelColumn = ""
inv_Attrib.is_PictureColumn = ""
inv_Attrib.is_StateColumn = ""
inv_Attrib.is_OverlayColumn = ""
inv_Attrib.is_XPosColumn = ""
inv_Attrib.is_YPosColumn = ""
inv_Attrib.is_Method = ""

inv_Attrib.itr_obj = ltr_obj

if isvalid(inv_Attrib.ids_Source) then	Destroy inv_Attrib.ids_Source

// unregister with cache service
inv_Cache.of_UnRegister(CACHE_ID) 

// Delete the report view columns
of_UnRegisterReportColumn()

// no need to remember the undo items
of_ClearUndo()

return 1
end function

public function integer of_RegisterReportColumn (n_ds ads_obj, string as_columnname, string as_columnlabel, alignment aal_alignment, integer ai_columnwidth);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_RegisterReportColumn
//	Arguments:		ads_obj				The data store which holds the column information of as_columnname
//						as_ColumnName		The column in the DataWindow object to add as a column in the ListView. 
//						as_ColumnLabel		The heading for the column to display in the ListView
//						aal_Alignment		The alignment of the column in the ListView 
//												(Left!, Right!, Center!, Justify!).
//						ai_ColumnWidth		The width of the column in the ListView (in PB Units).
//	Returns:			Integer
//						The index of the column if added successfully
//						-1 if an error occurred
//	Description:	Add a column to the ListView control.  It will be displayed in 
//						Report View only.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
string	ls_Type
Integer	li_Cols, li_Cnt, li_ColCnt

// check reference variables and arguments
if IsNull(ilv_requestor) or not IsValid(ilv_requestor) then return -1
if IsNull(as_columnlabel) or (trim(as_columnlabel) = "") then return -1
if IsNull(as_columnname) or (trim(as_columnname) = "") then return -1
if IsNull(ai_columnwidth) or (ai_columnwidth < 0) then return -1

// Check if the column was previously added
li_Cols = UpperBound(inv_ColAttrib)
for li_Cnt = 1 to li_Cols
	if as_ColumnName = inv_ColAttrib[li_Cnt].is_Columns then
		// Already added, so set new values
		ilv_requestor.SetColumn(li_Cnt, as_ColumnLabel, aal_Alignment, ai_ColumnWidth)
		return li_Cnt
	end if
next

// Set the value in the data source structure
ls_Type  = ads_obj.Describe(as_ColumnName + ".coltype")
if ls_Type = "!" then return -1

li_ColCnt = UpperBound(inv_ColAttrib) + 1 
inv_ColAttrib[li_ColCnt].is_Columns = as_ColumnName
inv_ColAttrib[li_ColCnt].is_ColType = ls_Type
inv_ColAttrib[li_ColCnt].is_ColFormat = ads_obj.Describe(as_ColumnName + ".format")
if inv_ColAttrib[li_ColCnt].is_ColFormat = "?" then inv_ColAttrib[li_ColCnt].is_ColFormat = ""

// Add the column to the ListView
return ilv_requestor.AddColumn(as_ColumnLabel, aal_Alignment, ai_ColumnWidth)
end function

public function integer of_RegisterReportColumn (n_ds ads_obj, string as_columnname, string as_columnlabel, alignment aal_alignment);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_RegisterReportColumn
//	Arguments:		ads_obj				The data store which holds the column information of as_columnname
//						as_ColumnName		The column in the DataWindow object to add as a column in the ListView. 
//						as_ColumnLabel		The heading for the column to display in the ListView
//						aal_Alignment		The alignment of the column in the ListView 
//												(Left!, Right!, Center!, Justify!).
//	Returns:			Integer
//						The index of the column if added successfully
//						-1 if an error occurred
//	Description:	Add a column to the ListView control.  It will be displayed 
//						in Report View only.
//						This function overrides the real of_RegisterReportColumn to allow the 
//						column width to be determined by the width of the column in the DataWindow.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
Integer		li_Width

// Validate required reference.
if IsNull(ads_obj) or not IsValid(ads_obj) then return -1
if IsNull(as_columnname) or (trim(as_columnname) = "") then return -1
if IsNull(as_columnlabel) or (trim(as_columnlabel) = "") then return -1

// Get the width of the column in the DataWindow
li_Width = Integer(ads_obj.Describe(as_ColumnName + ".width"))

// Add the column to the ListView
return of_RegisterReportColumn(ads_obj, as_ColumnName, as_ColumnLabel, aal_Alignment, li_Width)
end function

public function integer of_RegisterReportColumn (n_ds ads_obj, string as_columnname, string as_columnlabel);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_RegisterReportColumn
//	Arguments:		ads_obj			The data store which holds the column information of as_columnname
//						as_ColumnName	The column in the DataWindow object to add as a column in the ListView. 
//						as_ColumnLabel	The heading for the column to display in the ListView
//	Returns:			Integer
//						The index of the column if added successfully
//						-1 if an error occurred
//	Description:	Add a column to the ListView control.  It will be displayed 
//						in Report View only.	This function overrides the real 
//						of_RegisterReportColumn to allow the column width and alignment
//						to be determined by the width of the column in the DataWindow.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
alignment		lal_Align

// Validate required reference.
if IsNull(ads_obj) or not IsValid(ads_obj) then return -1
if IsNull(as_columnname) or (trim(as_columnname) = "") then return -1
if IsNull(as_columnlabel) or (trim(as_columnlabel) = "") then return -1

// Get the alignment of the column in the DataWindow
choose case Lower(ads_obj.Describe(as_ColumnName + ".alignment"))
	case "0"
		lal_Align = Left!
	case "1"
		lal_Align = Right!
	case "2"
		lal_Align = Center!
end choose

// Add the column to the ListView
return of_RegisterReportColumn(ads_obj, as_ColumnName, as_ColumnLabel, lal_Align)
end function

public function integer of_RegisterReportColumn (n_ds ads_obj, string as_columnname);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_RegisterReportColumn
//	Arguments:		ads_obj			The data store which holds the column information of as_columnname
//						as_ColumnName	The column in the DataWindow object to add as a column in the ListView. 
//	Returns:			Integer
//						The index of the column if added successfully
//						-1 if an error occurred
//	Description:	Add a column to the ListView control for Report View only.
//						This function overrides the real of_RegisterReportColumn to allow the 
//						column width, alignment and label to be determined by the attributes 
//						of the column in the DataWindow.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
string	ls_header

// Validate required reference.
if IsNull(ads_obj) or not IsValid(ads_obj) then return -1
if IsNull(ads_obj.inv_base) or not IsValid(ads_obj.inv_base) then return -1
if IsNull(as_columnname) or (trim(as_columnname) = "") then return -1

// Get the header of the column in the DataWindow
ls_header = ads_obj.inv_base.of_GetHeaderName (as_columnname)

// Add the column to the ListView
return of_RegisterReportColumn (ads_obj, as_columnname, ls_header)
end function

public function integer of_UnRegisterReportColumn ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_UnRegisterReportColumn
//	Arguments:		None
//	Returns:			Integer
//						1 if successful, -1 if an error occurred
//	Description:	Delete all columns in the ListView control and reset the internal column arrays.
//						Columns are displayed in Report View only.
//						NOTE:  If you perform this function on a populated listview you
//						should call of_Refresh to refresh the data view if needed
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
//
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
n_cst_columnattrib	lnv_empty[]

// validate required reference
if IsNull(ilv_requestor) or NOT IsValid(ilv_requestor) then return -1

// Delete the current columns in the report view
if ilv_requestor.TotalColumns() > 0 then
	if ilv_requestor.DeleteColumns() < 1 then return -1
end if

// Empty the column list array
inv_ColAttrib = lnv_empty

return 1
end function

public function integer of_UnRegisterReportColumn (integer ai_column);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_UnRegisterReportColumn
//	Arguments:		ai_column	the column to be removed.
//	Returns:			Integer
//						1 if successful, -1 if an error occurred
//	Description:	Delete the column in the ListView control and sync the internal column arrays.
//						Columns are displayed in Report View only.
//						NOTE:  If you perform this function on column 1 you
//						should call of_Refresh to refresh the data view.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
integer					li_cols, li_cnt, li_index
n_cst_columnattrib	lnv_empty[], lnv_columns[]

li_Cols = UpperBound(inv_ColAttrib)

// validate required reference
if IsNull(ilv_requestor) or NOT IsValid(ilv_requestor) then return -1
if IsNull(ai_column) or (ai_column > li_cols) or (ai_column < 1) then return -1

// Delete the listview column
if ilv_requestor.DeleteColumn(ai_column) < 1 then return -1

// Sync internal arrays
for li_Cnt = 1 to (ai_column - 1)
	lnv_Columns[li_Cnt] = inv_ColAttrib[li_Cnt]
next

for li_index = (ai_column + 1) to li_cols
	lnv_Columns[li_index - 1] = inv_ColAttrib[li_index]
next

inv_ColAttrib = lnv_empty
inv_ColAttrib = lnv_Columns

return 1
end function

public function integer of_GetColumnInfo (integer ai_column, ref n_cst_columnattrib anv_colattrib);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetColumnInfo
//	Arguments:		ai_column			Column from the listview
//						anv_ColAttrib		The attribute nvo containing the Datasource column information 
//												passed by reference
//	Returns:			Integer
//					 	1 = success,
//						-1 = an error occurred
//	Description:	Return column information from ListView control.  
//						Column information is displayed in Report View only.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
Integer	li_Cols

// Check arguments
if IsNull(ai_column) or (ai_column < 1) then return -1

// Check if the column was previously added
li_Cols = UpperBound(inv_ColAttrib)
if ai_column > li_Cols then return -1

anv_colattrib = inv_ColAttrib[ai_column] 

return 1
end function

public function integer of_RegisterReportColumn (n_ds ads_obj);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_RegisterReportColumn
//	Arguments:		ads_obj		The datastore which holds the column information to add to the listview
//	Returns:			Integer
//						The number of columns added if successful
//						-1 if an error occurred
//	Description:	Add a column to the ListView control for all visible columns in
//						the Datastore.  They will be displayed in Report View only.
//						This function overloads the of_RegisterReportColumn function to allow 
//						the last 4 arguments to be optional.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
Integer	li_NumObj, li_Cnt, li_Cols
string	ls_Columns[]

// Validate required reference.
if IsNull(ads_obj) or not IsValid(ads_obj) then return -1
if IsNull(ads_obj.inv_base) or not IsValid(ads_obj.inv_base) then return -1

// Get all the visible objects in the DataWindow
li_NumObj = ads_obj.inv_base.of_GetObjects(ls_Columns, "*", "*", true)

// Add each column to the ListView
for li_Cnt = 1 to li_NumObj
	// Only add objects that are columns or computed fields
	if ads_obj.Describe(ls_Columns[li_Cnt] + ".Type") = "column" or &
		ads_obj.Describe(ls_Columns[li_Cnt] + ".Type") = "compute" then

		li_Cols++
		if of_RegisterReportColumn(ads_obj, ls_Columns[li_Cnt]) < 0 then return -1
	end if
Next

return li_Cols
end function

public function string of_FormatData (string as_columnname, string as_colformat, string as_coltype, n_ds ads_obj, long al_row);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_FormatData
//	Arguments:		as_ColumnName	The name of the column whose data is desired
//						as_ColFormat	The format for the column in the DataWindow
//						as_ColType		The data type of the column
//						ads_obj			The data store for the row of data
//						al_Row			The row of the data in the datastore
//	Returns:			String
//						The data in the column, row converted to a string and formatted
//						using the format attribute from the DataWindow.
//	Description:	Get the data from a row/column and convert it to a string using
//						the column's format attribute from the DataWindow.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version - this function may be obsolete
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
string		ls_Data, ls_Arg
long			ll_Arg
double		ldb_Arg
decimal		ldc_Arg
date			ld_Arg
dateTime		ldt_Arg
time			lt_Arg

if IsNull(ads_obj) or not IsValid(ads_obj) then return "!"
if IsNull(as_columnname) or (trim(as_columnname) = "") or IsNull(al_row) or (al_row < 1) then return "!"

// Format the column as a string
choose case Left(as_ColType, 7)
	case "integer", "long"
		ll_Arg = ads_obj.GetItemNumber(al_Row, as_ColumnName)
		ls_Data = String(ll_Arg, as_ColFormat)
	case "double", "number"
		ldb_Arg = ads_obj.GetItemNumber(al_Row, as_ColumnName)
		ls_Data = String(ldb_Arg, as_ColFormat)
	case "decimal"
		ldc_Arg = ads_obj.GetItemDecimal(al_Row, as_ColumnName)
		ls_Data = String(ldc_Arg, as_ColFormat)
	case "date"
		ld_Arg = ads_obj.GetItemDate(al_Row, as_ColumnName)
		ls_Data = String(ld_Arg, as_ColFormat)
	case "time"
		lt_Arg = ads_obj.GetItemTime(al_Row, as_ColumnName)
		ls_Data = String(lt_Arg, as_ColFormat)
	case "datetim"
		ldt_Arg = ads_obj.GetItemDateTime(al_Row, as_ColumnName)
		ls_Data = String(ldt_Arg, as_ColFormat)
	case else
		ls_Arg = ads_obj.GetItemString(al_Row, as_ColumnName)
		ls_Data = String(ls_Arg, as_ColFormat)
end choose

if IsNull(ls_Data) then ls_Data = ""

return ls_Data
end function

public function integer of_SetUndo (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_SetUndo
//	Arguments:		ab_switch	specifies whether undo information will be remembered
//	Returns:			integer
//	 					1 = success
//						-1 = error
//	Description:	Sets whether undo information will be remembered
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
// Validate arguments
if IsNull (ab_switch) then return -1

ib_Undo = ab_switch

return 1
end function

protected function boolean of_ConfirmOnDelete ();//////////////////////////////////////////////////////////////////////////////
//	Protected Function:	of_ConfirmOnDelete
//	Arguments:		None
//	Returns:			boolean
//	Description:	Returns whether we want a confirmation dialog box to appear on deletions 
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
// If the service is in the process of deleting we do not want to get the confirm question
if ib_IsUndoing or ib_IsRefreshing then
	return false
else
	return of_IsConfirmOnDelete()
end if
end function

public function string of_DecodeKey (string as_decodekey);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_DecodeKey
//	Arguments:		as_decodekey	The listview data attribute as a string.  
//	Returns:			String
//						The created key if successful, 
//						"!" if an error occurrs.
//	Description:	Get the unique key which was previously placed in the data attribute
//						of the listview item 
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
long				ll_rowid
string			ls_key, ls_data
n_cst_string	lnv_string

// Validate required reference.
if IsNull(as_decodekey) or (len(trim(as_decodekey)) = 0) then return "!"

// Set Data to the unique key
ls_key = lnv_string.of_GetKeyValue(as_decodekey, IS_PFCKEY, is_delimiter)

return ls_key
end function

public function integer of_DeleteItem (integer ai_index);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_DeleteItem
//	Arguments:		ai_index		The index of the item to be deleted
//	Returns:			Integer
//					 	1	- the item was deleted successfully
//					 	0 - nothing deleted
//						-1	- an error occurred
//	Description:	Delete an item from the listview.  The item's row will be
//						DELETED from its DataStore (the user must call the Update(), however).  
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
long					ll_row
listviewitem		llvi_Item
n_ds					lds_source

// check reference variables
if IsNull(ilv_requestor) or not IsValid(ilv_requestor) then return -1
if IsNull(ai_index) or (ai_index < 1) then return -1

if ilv_requestor.GetItem(ai_index, llvi_Item) <> 1 then return -1

if of_GetDataRow(ai_index, lds_source, ll_row) <> 1 then 
	// row is already deleted from datastore
	return -1
end if

// only need to delete the row
lds_Source.DeleteRow(ll_Row)

// Get the parent and previous handle (for undo capability) 
if ib_Undo then
	il_UndoDeleteHandle[1] = ai_index
	ilvi_UndoDeleteItem[1] = llvi_item
	is_UndoType = UNDO_DELETE
end if

return ilv_requestor.DeleteItem(ai_index)
end function

public function integer of_GetIndex (n_ds ads_obj, long al_row);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetIndex
//	Arguments:		ads_obj		The handle to the DataStore (of type n_ds) for the Listview.
//						al_Row		The row in the DataStore that the item points to.
//	Returns:			Integer
//						The Index of the ListView item that points to that row
//						0 if the item was not found
//						-1 if an error occurrs
//	Description:	Return the ListView item index that points to a particular row 
//						in the source DataStore.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
long				ll_Cnt, ll_items
string			ls_Key
listviewitem	llvi_Item

// check reference variables
if IsNull(ilv_requestor) or not IsValid(ilv_requestor) then return -1

// Check Arguments
if not IsValid(ads_obj) then return -1
if IsNull(al_Row) or (al_row < 1) then return -1

// Get the generated key for the row
ls_key = of_EncodeKey(ads_obj, al_Row)
if ls_key = "!" then return -1

// Find the item
ll_items = ilv_requestor.TotalItems()
for ll_Cnt = 1 to ll_items
	if ilv_requestor.GetItem(ll_Cnt, llvi_Item) = 1 then
		if String(llvi_Item.Data) = ls_Key then return ll_Cnt
	end if
Next

return 0
end function

public function integer of_GetIndex (long al_row);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetIndex
//	Arguments:		al_Row		The row in the DataStore that the item points to.
//	Returns:			Integer
//						The Index of the ListView item that points to that row
//						0 if the item was not found
//						-1 if an error occurrs
//	Description:	Return the ListView item index that points to a particular row 
//						in the source DataStore.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
// Check Arguments
if IsNull(al_Row) or (al_row < 1) then return -1

return of_GetIndex(inv_Attrib.ids_Source, al_row)
end function

public function string of_EncodeKey (n_ds ads_source, long al_row);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_EncodeKey
//	Arguments:		ads_source	The DataStore with the data used to populate the item.  
//						al_Row		The row in the DataStore for the item.
//	Returns:			String
//						The created key if successful, 
//						"!" if an error occurrs.
//	Description:	Set the unique key of a listview item so we can find out the row
//						in the datastore which created the item at a later point in time.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
long				ll_rowid
string			ls_key
string			ls_pfckey
n_cst_string	lnv_string

// Validate required reference.
if IsNull(ads_source) or not IsValid(ads_source) then return "!"
if IsNull(al_row) or (al_row < 1) then return "!"

// Set Data to the unique key
ll_rowid = ads_source.GetRowIDFromRow(al_Row)
if ll_rowid < 1 then return "!"

ls_pfckey = IS_PFCKEY + "="
lnv_string.of_SetKeyValue (ls_pfckey, IS_PFCKEY, String(ll_rowid), "=")

ls_key = ls_pfckey + is_delimiter

return ls_key
end function

public function integer of_DeleteItem ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_DeleteItem
//	Arguments:		None
//	Returns:			Integer
//					 	1	- the item was deleted successfully
//					 	0 - nothing deleted (or was prevented)
//						-1	- an error occurred
//	Description:	Delete an item(s) from the listview.  The item's row will be
//						DELETED from its DataStore (the user must call the Update(), however).  
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
integer	li_totalitems, li_selected, li_confirm
integer	li_deletecount=0

// check reference variables
if IsNull(ilv_requestor) or not IsValid(ilv_requestor) then return -1

li_totalitems = ilv_requestor.TotalSelected()
if li_totalitems < 1 then return 0

// confirm this action
if of_ConfirmOnDelete() then
	if li_totalitems = 1 then
		li_confirm = of_ConfirmDelete(1)
		// Delete item if = 1
		if li_confirm <> 1 then return 0
	else
		// we have multiple deletions, so check to see if we have asked the question before
		li_confirm = of_ConfirmDelete( li_totalitems )
		// Delete item if = 1
		if li_confirm <> 1 then return 0
	end if
end if

// find the first selected item
li_selected = ilv_requestor.SelectedIndex()

//Loop and delete the selected items.
do while li_selected > 0
	ilv_requestor.event pfc_PreDeleteItem(li_selected)
	if this.of_DeleteItem(li_selected) < 0 then return -1
	li_deletecount++

	// Get handle to next selected item - when an item is deleted, listview count is reset
	// so we have to start from the top again
	li_selected = of_FindSelected(0, Directiondown!)
loop

return li_deletecount
end function

public function integer of_GetAttributes (ref n_cst_lvsrvattrib anv_attrib);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_GetAttributes
//	Arguments:		anv_attrib	The attributes object containing the attributes for the listview
//	Returns:			Integer
//	Description:	Returns all the attributes used to populate the datasource for the listview
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
n_cst_lvsrvattrib		lnv_emptyattrib

anv_attrib = lnv_emptyattrib
anv_attrib = inv_Attrib

return 1
end function

public function long of_Refresh ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Refresh
//	Arguments:		None
//	Returns:			Long
//					 	1 if successful
//						-1 if an error occurred
//	Description:	Refresh the ListView with items from the data source.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
// Reset the undo delete variables because indexes change when re-adding items
return this.of_ClearUndo()
end function

public function long of_Retrieve (any aa_args[20], ref n_ds ads_data);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_Retrieve
//	Arguments:		aa_Args[20]	An array of type Any which contains the retrieval arguments to	the DataStore.
//	Returns:			Long
//						Returns the number of items retrieved if successful
//						-1 if an error occurred
//	Description:	Retrieve the data for ListView with items from the data source.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
//						7.0   Changed the datatypes of local "row" variables from integer to long
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
long	ll_NewRows, ll_cnt
window	lw_parentwindow

if IsNull(ilv_requestor) or not Isvalid(ilv_requestor) then return -1

// Retrieve data into the DataStore and pass the arguments to the cache
if (inv_Attrib.is_method = inv_Cache.SQL) or (inv_Attrib.is_method = inv_Cache.RETRIEVE) then
	// register the arguments; retrieve the cache and get the reference
	inv_Cache.of_RegisterArgs(CACHE_ID, aa_Args)
	if inv_Cache.of_Refresh(CACHE_ID) < 0 then return -1
end if

// Get a reference to the cache - data was retrieved on registration
if inv_Cache.of_GetRegistered(CACHE_ID, ads_data) <> 1 then return -1

// turn back on the base service as cache does not turn it on
ads_data.of_SetBase(true)

//// datastore needs parent window reference to perform updates
//ilv_requestor.of_Getparentwindow(lw_parentwindow)
//ads_data.of_SetParentWindow(lw_parentwindow)

// Clear the status flags for the new rows - want them to be notmodified!
ll_NewRows = ads_data.RowCount()
for ll_Cnt = 1 to ll_NewRows
	ads_data.SetItemStatus(ll_Cnt, 0, Primary!, DataModified!)
	ads_data.SetItemStatus(ll_Cnt, 0, Primary!, NotModified!)
next

// return the rows in the datasource
return ll_NewRows
end function

public function boolean of_canundo ();//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_CanUndo
//	Arguments:		None
//	Returns:			Boolean
//						true = we can undo the last edit/insert/delete
//						false = cannot undo the last edit/insert/delete
//	Description:	Returns if undo can be performed
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
string	ls_undotype

return of_CanUndo(ls_undotype)
end function

public function integer of_insertitem (ref n_ds ads_obj, long al_row, listviewitem alvi_new, string as_position, integer ai_item);//////////////////////////////////////////////////////////////////////////////
//	Public Function:	of_InsertItem
//	Arguments:		ads_obj		The DataStore containing the data to be used for the new item.
//										This can be the same DataStore that was created for the listview, or
//										another maintained by the user.  If the latter, the row will be added
//										to the listviews DataStore.  Passed by reference.
//						al_Row		The row in the DataStore pointing to the data.
//						alvi_item	The Item to be added to the listview
//						as_Position	The position under the parent where the new item will be inserted:
//										"First" - before the first item of the listview 
//										"Last" - after the last listview item (default)
//										"Before" - before the item with index ai_item
//										"After" - after the item with index ai_item
//						ai_Item		The index to the item which the new item will be inserted either after or before.
//										Ignored unless as_Position = "After" or "Before".
//	Returns:			Integer
//						Returns the index of the item if it was added successfully, 
//						-1 if an error occurrs.
//	Description:	Add a new item to the ListView using data from a DataStore.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
// 						7.0   Performance Improvements:  Removed extraneous rowcounts, and ArrangeAll
//						8.0	   Uncommented required code
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
integer				li_rc
integer				li_index, li_newindex, li_totalitems, li_after
long					ll_rowcount, ll_rowid
string				ls_key, ls_syntax1, ls_syntax2
ListViewItem		llvi_temp

// check reference variables
if IsNull(ilv_requestor) or not IsValid(ilv_requestor) then return -1

// Check Arguments
if IsNull(al_row) or IsNull(ai_item) or (al_row < 1) or (ai_item < 0) or IsNull(as_position) &
or (Trim(as_position) = "") or IsNull(ads_obj) or not IsValid(ads_obj) then return -1

choose case as_position
	case ilv_requestor.INSERT_FIRST, ilv_requestor.INSERT_LAST, &
		  ilv_requestor.INSERT_BEFORE, ilv_requestor.INSERT_AFTER
		// valid values
	case else
		return -1
end choose

// Check if the DataStore passed is the same as the one for the level
if ads_obj <> inv_Attrib.ids_Source then
	
	// Verify that the it is valid for the level
	if (ads_obj.DataObject = inv_Attrib.ids_Source.DataObject) then
		if ads_obj.DataObject = "" then
			ls_syntax1 = ads_obj.Object.Datawindow.Syntax
			ls_syntax2 = inv_Attrib.ids_Source.Object.Datawindow.Syntax
			if ls_syntax1 <> ls_syntax2 then return -1
		end if
	else
		return -1
	end if

	// Append the rows to the DataStore
	ll_rowcount = inv_Attrib.ids_Source.RowCount()
	li_rc = ads_obj.RowsCopy(al_Row, al_Row, Primary!, inv_Attrib.ids_Source, (ll_rowcount + 1), Primary!)
	if li_rc <> 1 then return -1

	// Set status flag of new row to what it was in the original datastore
	// The new row is copied as NewModified! 
	ll_rowcount++
	choose case ads_obj.GetItemStatus(al_Row, 0, primary!)
		case New!
			// newmodified! and notmodified! = new!
			inv_Attrib.ids_Source.SetItemStatus(ll_rowcount, 0, primary!, notmodified!)
		case DataModified!
			// newmodified! and datamodified! = datamodified!
			inv_Attrib.ids_Source.SetItemStatus(ll_rowcount, 0, primary!, datamodified!)
		case NotModified!
			// newmodified!  and datamodified! = datamodified!
			// datamodified! and notmodified!  = notmodified!
			inv_Attrib.ids_Source.SetItemStatus(ll_rowcount, 0, primary!, datamodified!)
			inv_Attrib.ids_Source.SetItemStatus(ll_rowcount, 0, primary!, notmodified!)
	end choose
	al_row = ll_rowcount
end if

// set the data attribute so we can find this row again later
ls_key = of_EncodeKey(inv_Attrib.ids_Source, al_row)
if ls_key = "!" then return -1
alvi_new.Data = String(alvi_new.Data) + ls_key

// Insert the Item.  Based on position not index.  Change x, y of item to be added
//li_totalitems = ilv_requestor.TotalItems() + 1
choose case Lower(as_Position)
	case "first"
		li_index = ilv_requestor.FindItem(0, DirectionDown!, false, false, false, false)
		if ilv_requestor.GetItem(li_index, llvi_temp) <> 1 then return -1
		alvi_new.ItemX = llvi_temp.ItemX - 1
		alvi_new.ItemY = llvi_temp.ItemY - 1
		li_newindex = ilv_requestor.InsertItem(1, alvi_new)
	case "after"
		// get next item in the listview
		li_after = ai_item + 1
		if li_after > ilv_requestor.TotalItems() then
			// at end, after is adding to end
			li_newindex = ilv_requestor.AddItem(alvi_new)
		else	
			if ilv_requestor.GetItem(ai_item, llvi_temp) <> 1 then return -1
			alvi_new.ItemX = llvi_temp.ItemX + 1
			alvi_new.ItemY = llvi_temp.ItemY + 1
			li_newindex = ilv_requestor.InsertItem(li_after, alvi_new)
		end if
	case "before"
		if ilv_requestor.GetItem(ai_item, llvi_temp) <> 1 then return -1
		alvi_new.ItemX = llvi_temp.ItemX - 1
		alvi_new.ItemY = llvi_temp.ItemY - 1
		li_newindex = ilv_requestor.InsertItem(ai_item, alvi_new)
	case else	// "last"
		li_newindex = ilv_requestor.AddItem(alvi_new)
end choose

// Add for Undo capability
if ib_Undo then
	if li_newindex > 0 then
		il_UndoInsertHandle = li_newindex
		is_UndoType = UNDO_INSERT
	end if
end if

return li_newindex
end function

on pfc_n_cst_lvsrv_datasource.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_lvsrv_datasource.destroy
TriggerEvent( this, "destructor" )
end on

event destructor;//////////////////////////////////////////////////////////////////////////////
//	Event:  			Destructor
//	Description:	Destroy the items created for use by the listview
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
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
of_SetCache(false)
end event

event constructor;//////////////////////////////////////////////////////////////////////////////
//	Event:  Constructor
//	Description:	Turn on the cache service which enables multiple types of data 
//						to be able to populate the listview
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						6.0   Initial version
//						7.0	Converted to abbreviated header
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
of_SetCache(true)
end event

