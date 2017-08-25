HA$PBExportHeader$pfc_u_tv.sru
$PBExportComments$PFC TreeView class
forward
global type pfc_u_tv from treeview
end type
end forward

global type pfc_u_tv from treeview
integer width = 343
integer height = 252
integer taborder = 1
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long picturemaskcolor = 553648127
long statepicturemaskcolor = 536870912
event type boolean pfc_searchcompare ( long al_handle,  string as_attribute,  any aa_target,  boolean ab_respectcase,  boolean ab_fullcompare )
end type
global pfc_u_tv pfc_u_tv

type variables
Public:
long	il_DragSource
long	il_DragTarget

Protected:
long		il_queue[]
//	7.0   Instance variable datatype changed from os_datasource to n_cst_tvattrib type
//	7.0   Instance variable name changed from istr_ds to inv_ds
n_cst_tvattrib	inv_ds[]
n_ds		ids_Buffer
n_tr		itr_obj
string		is_pfckeydelimiter = '#$%'

// 7.0	This variable is obsolete.  Left in for migration purposes.
//			DO NOT USE THIS VARIABLE
n_cst_tvattrib	istr_ds[]

boolean		ib_IsObsolete
end variables

forward prototypes
protected function integer of_createkey (ref n_ds ads_obj)
public function integer of_SetPictureColumn (integer ai_level, string as_column, string as_indextype)
protected subroutine of_ParseArgs (string as_args, integer ai_level, ref integer ai_arglevel[], ref string as_argcolumn[])
protected function long of_searchchild (string as_attribute, any aa_target, long al_begin, integer ai_level, boolean ab_respectcase, boolean ab_fullcompare)
public function long of_finditem (string as_attribute, any aa_target, long al_begin, integer ai_level, boolean ab_respectcase, boolean ab_fullcompare)
public function long of_FindItem (string as_attribute, any aa_target, long al_begin, integer ai_level, boolean ab_respectcase)
public function long of_FindItem (string as_Attribute, any aa_Target, long al_Begin, integer ai_Level)
public function long of_FindItem (string as_Attribute, any aa_Target, long al_Begin)
public function long of_FindItem (string as_Attribute, any aa_Target)
public function integer of_getdatastore (integer ai_level, ref n_ds ads_obj)
public function integer of_RefreshItem (long al_handle)
public function integer of_Update (integer ai_level, boolean ab_accept, boolean ab_resetflag)
public function integer of_Update (integer ai_level, boolean ab_accept)
public function integer of_Update (integer ai_level)
public function integer of_Update ()
public function integer of_refreshlevel (integer ai_level)
public function integer of_DiscardChildren (long al_handle)
public function long of_findfirstitemlevel (integer ai_level, long al_handle)
public function integer of_getdatarow (long al_handle, ref n_ds ads_obj, ref long al_row)
public function long of_getitemfordata (ref n_ds ads_obj, long al_row)
public function long of_InsertItem (long al_parent, ref n_ds ads_obj, long al_row, string as_position, long al_after)
public function long of_InsertItem (long al_parent, ref n_ds ads_obj, long al_row, string as_position)
public function long of_InsertItem (long al_parent, ref n_ds ads_obj, long al_row)
public function integer of_refreshitem (long al_handle, long al_row)
protected function integer of_setitemattributes (integer ai_index, ref n_ds ads_obj, long al_row, ref treeviewitem atvi_item)
public function integer of_ResetUpdate (integer ai_level)
public function long of_initialretrieve (any aa_args[20])
public function long of_initialretrieve ()
public function integer of_setdatasource (integer ai_level, string as_datawindow, n_tr atr_obj, string as_labelcolumn, string as_retrieveargs, boolean ab_recursive, integer ai_pictureindex, integer ai_selpictindex, integer ai_statepictindex, integer ai_overlaypictindex)
public function integer of_setdatasource (integer ai_level, string as_datawindow, n_tr atr_obj, string as_labelcolumn, string as_retrieveargs, boolean ab_recursive, integer ai_pictureindex, integer ai_selpictindex)
public function integer of_setdatasource (integer ai_level, string as_datawindow, n_tr atr_obj, string as_labelcolumn, string as_retrieveargs, boolean ab_recursive)
public function integer of_setdatasource (integer ai_level, string as_datawindow, n_tr atr_obj, string as_labelcolumn, string as_retrieveargs, boolean ab_recursive, integer ai_pictureindex, integer ai_selpictindex, integer ai_statepictindex)
public function integer of_setdatasource (integer ai_level, string as_datawindow, n_tr atr_obj, string as_labelcolumn, string as_retrieveargs, boolean ab_recursive, integer ai_pictureindex)
public function integer of_setdatasource (integer ai_level, string as_datawindow, n_tr atr_obj, string as_labelcolumn, string as_retrieveargs)
protected function string of_buildtree (long al_handle, string as_picts, string as_levelpicts)
public function integer of_printtree (long al_handle, boolean ab_canceldialog, string as_pictname, string as_selpictname)
public function integer of_printtree (long al_handle, boolean ab_canceldialog, string as_levelpicts[10], string as_levelselpicts[10])
public function integer of_printtree (long al_handle, boolean ab_canceldialog)
public function integer of_printtree ()
public function integer of_printtree (long al_Handle)
public function integer of_getparentwindow (ref window aw_parent)
protected function integer of_printtree (long al_handle, boolean ab_canceldialog, string as_pictname, string as_selpictname, string as_levelpicts[10], string as_levelselpicts[10])
protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default)
protected function long of_populatelevel (integer ai_level, long al_parent)
public function integer of_getargs (long al_parent, integer ai_level, ref any aa_arg[20])
public function integer of_deleteitem (long al_handle)
end prototypes

event pfc_searchcompare;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_searchcompare
//
//	Arguments:
//	al_Handle					The handle of the item being compared.
//	as_Attribute				The attribute of the TreeView item to search ("Label", 
//									or "Data")
//	aa_Target					A variable of type Any containg the search target.
//	ab_RespectCase			True - search is case sensitive,
//									False - search is not case sensitive.  Only used if the target
//									is a string.
//	ab_FullCompare			True - Label or Data and Target must be equal,
//									False - Label or Data can contain Target (uses POS() function).
//									Only used if the target is a string.
//
//	Returns:		Boolean
//					True - a match was found
//					False - no match
//
//	Description:	This event is triggered by the of_SearchChild function (which is called
//						by of_FindItem).  It does the actual comparison between a TreeView
//						item and the target being searched for.
//
//						If a more complex comparison is desired, this event should be overridden.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
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

String				ls_Target, ls_Source
TreeViewItem		ltvi_Item

If GetItem(al_Handle, ltvi_Item) = -1 Then Return False


If Lower(as_Attribute) = "label" Then
	// Label Comparison
	If ab_RespectCase Then
		// Comparison is case-sensitive
		ls_Source = ltvi_Item.Label
		ls_Target = String(aa_Target)
	Else
		ls_Source = Upper(ltvi_Item.Label)
		ls_Target = Upper(String(aa_Target))
	End If

	If ab_FullCompare Then
		// Match whole words only
		If ls_Source = ls_Target Then Return True
	Else
		If Pos(ls_Source, ls_Target) > 0 Then Return True
	End If

Else
	// Data Comparison
	If ClassName(ltvi_Item.Data) = "string" Then
		// RespectCase and FullCompare boolean arguments are valid
		If ab_RespectCase Then
			// Comparison is case-sensitive
			ls_Source = String(ltvi_Item.Data)
			ls_Target = String(aa_Target)
		Else
			ls_Source = Upper(String(ltvi_Item.Data))
			ls_Target = Upper(String(aa_Target))
		End If

		If ab_FullCompare Then
			// Match whole words only
			If ls_Source = ls_Target Then Return True
		Else
			If Pos(ls_Source, ls_Target) > 0 Then Return True
		End If

	Else
		// Data is non-string
		If ltvi_Item.Data = aa_Target Then Return True
	End If
End If

Return False

end event

protected function integer of_createkey (ref n_ds ads_obj);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_CreateKey
//
//	Access:  protected
//
//	Arguments:
//	ads_obj			The DataStore to create the computed column on.
//
//	Returns:		Integer
//					1	- the key was created successfully
//					-1	- the DataWindow object did not have any key columns assigned
//
//	Description:	Add a computed column to the DataWindow object that will contain 
//						all the keys concatenated together.  This is necessary to be able to 
//						find a unique row.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0	Corrected multiple numeric key columns concatenation problem
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

String	ls_Exp, ls_Obj[], ls_rc
Integer	li_Obj, li_Cnt
Boolean	lb_First

ls_Exp = "expression='"
lb_First = True
li_Obj = ads_obj.inv_base.of_GetObjects(ls_Obj, "*", "*", False)

For li_Cnt = 1 To li_Obj
	If ads_obj.Describe(ls_Obj[li_Cnt] + ".key") = "yes" Then
		If Not lb_First Then
			ls_Exp = ls_Exp + " + "
		Else
			lb_First = False
		End if
		ls_Exp = ls_Exp + 'String(' + ls_Obj[li_Cnt] + ') + "' + is_pfckeydelimiter + '"'
	End if
Next

If lb_First Then
	// No key columns were defined
	Return -1
Else
	ls_Exp = ls_Exp + "'"
End if

ls_rc = ads_obj.Modify("create compute(band=detail x='0' y='0' " + &
								"height='0' width='0' name=pfc_tvi_key " + ls_Exp + ")")

Return 1

end function

public function integer of_SetPictureColumn (integer ai_level, string as_column, string as_indextype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetPictureColumn
//
//	Access:  public
//
//	Arguments:
//	ai_Level					The level to use the picture index for
//	as_Column					The name of the column in the DataStore to use for
//									the index
//	as_IndexType				The index type:  "PictureIndex", "SelectedPictureIndex", 
//									"StatePictureIndex", or "OverlayPictureIndex" (this is NOT
//									case-sensitive)
//
//	Returns:		Integer
//					Return 1 if successful, -1 if an invalid parameter was passed
//
//	Description:	Identify a column in the DataStore to use for one of the various picture
//						indexes for the TreeView items in this level.  This will override any index
//						set with the of_SetDatasource function.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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
If ai_Level > UpperBound(inv_ds) Then
	Return -1
Else
	If Trim(inv_ds[ai_Level].s_DataWindow) = "" Then
		Return -1
	End If
End If

// Set the proper value in the attribute class
Choose Case Lower(as_IndexType)
	Case "pictureindex"
		inv_ds[ai_Level].i_PictureIndex = 0
		inv_ds[ai_Level].s_PictureIndexCol = as_Column
	Case "selectedpictureindex"
		inv_ds[ai_Level].i_SelectedPictureIndex = 0
		inv_ds[ai_Level].s_SelectedPictureIndexCol = as_Column
	Case "statepictureindex"
		inv_ds[ai_Level].i_StatePictureIndex = 0
		inv_ds[ai_Level].s_StatePictureIndexCol = as_Column
	Case "overlaypictureindex"
		inv_ds[ai_Level].i_OverlayPictureIndex = 0
		inv_ds[ai_Level].s_OverlayPictureIndexCol = as_Column
	Case Else
		Return -1
End Choose

Return 1

end function

protected subroutine of_ParseArgs (string as_args, integer ai_level, ref integer ai_arglevel[], ref string as_argcolumn[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ParseArgs
//
//	Access:  protected
//
//	Arguments:
//	as_Args						The retrieval argument string
//	ai_Level					The TreeView level these arguments are for
//	ai_ArgLevel[]				An integer array that will contain the levels that
//									the retrieval arguments come from, passed by reference
//	as_ArgColumn[]			A string array that will contain the columns containing
//									the retrieval arguments, passed by reference
//
//	Returns:		None
//
//	Description:	Parse the string of retrieval arugments into separate
//						arguments and fill the array reference arguments.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

end subroutine

protected function long of_searchchild (string as_attribute, any aa_target, long al_begin, integer ai_level, boolean ab_respectcase, boolean ab_fullcompare);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SearchChild
//
//	Access:  protected
//
//	Arguments:
//	as_Attribute				The attribute of the TreeView item to search ("Label", 
//									or "Data")
//	aa_Target					A variable of type Any containg the search target.
//	al_Begin					The handle of the TreeView item to begin searching, if
//									0 entire tree will be searched.
//	ai_Level					The level to search, if 0 entire tree will be searched.
//	ab_RespectCase			True - search is case sensitive,
//									False - search is not case sensitive.  Only used if the target
//									is a string.
//	ab_FullCompare			True - Label or Data and Target must be equal,
//									False - Label or Data can contain Target (uses POS() function).
//									Only used if the target is a string.
//
//	Returns:		Long
//					The handle of the item whose Label or Data matches the target.  Returns 0
//					if not found, -1 if an error occurrs.
//
//	Description:	Search for the target in either the Label or Data attribute of the TreeView 
//						items..  This function is called by of_FindItem.  It will use the 
//						pfc_searchcompare event to actually perform the comparison.  Override 
//						this event if another comparison is desired.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0.01	Rewrite to be non-recursive to avoid stack overflow errors.  Use a queue 
//				to simulate recursion in a level centered traversal
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

Integer				li_Level, li_next
Long					ll_Handle, ll_child, ll_qposition
TreeViewItem		ltvi_Item

ll_qposition = 1

DO
	ll_handle = il_queue[ll_qposition]
	
	// should not put invalid items in the queue, but check it anyway and also get the level info
	If GetItem(ll_handle, ltvi_Item) = -1 Then Return -1
	li_level = ltvi_Item.Level

	// make the comparison
	If ai_Level = 0 Or ai_Level = li_Level Then
		If Trigger Event pfc_searchcompare(ll_handle, as_Attribute, aa_Target, ab_RespectCase, &
															ab_FullCompare) Then Return ll_handle
	Else
		// queue is populated in level order, so when the current level is greater than the level
		// to search in, we did not find the item.
		If li_level > ai_level then Return 0
	End If

	// match was not found, so add this item children to the end of the queue
	ll_child = FindItem(ChildTreeItem!, ll_handle)
	Do While ll_child > 0
		// add handle to queue
		li_next = upperbound(il_queue) + 1
		il_queue[li_next] = ll_child
		ll_child = FindItem(NextTreeItem!, ll_child)
	Loop

	ll_qposition++

Loop until ll_qposition > upperbound(il_queue)

Return 0

end function

public function long of_finditem (string as_attribute, any aa_target, long al_begin, integer ai_level, boolean ab_respectcase, boolean ab_fullcompare);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_FindItem
//
//	Access:  public
//
//	Arguments:
//	as_Attribute				The attribute of the TreeView item to search ("Label", 
//									or "Data")
//	aa_Target					A variable of type Any containg the search target.
//	al_Begin					The handle of the TreeView item to begin searching, if
//									0 entire tree will be searched.
//	ai_Level					The level to search, if 0 entire tree will be searched.
//	ab_RespectCase			True - search is case sensitive,
//									False - search is not case sensitive.  Only used if the target
//									is a string.
//	ab_FullCompare			True - Label or Data and Target must be equal,
//									False - Label or Data can contain Target (uses POS() function).
//									Only used if the target is a string.
//
//	Returns:		Long
//					The handle of the item whose Label matches the target.  Returns 0
//					if not found, -1 if an error occurrs.
//
//	Description:	Search for an item in the TreeView.  This function calls of_SearchChild
//						to search for the target in either the Label or Data attribute
//						of the TreeView items.  It will use the pfc_searchcompare event to actually
//						perform the comparison.  Override this event if another comparison is desired.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0.01	Rewrite to be non-recursive to avoid stack overflow errors.  Use a queue 
//				to simulate recursion in a level centered traversal
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

Integer			li_next
Long				ll_handle, ll_parent, ll_queue[]
Treeviewitem	ltvi_item

If IsNull(as_attribute) or IsNull(al_begin) or IsNull(ai_level) or &
	IsNull(ab_respectcase) or IsNull(ab_fullcompare) Then Return -1
If (al_begin < 0) or (ai_level < 0) or (as_attribute = "") Then Return -1

// this could be a potentially long operation
SetPointer(hourglass!)

// reset the queue
il_queue = ll_queue

// Initialize the tree queue
If al_begin = 0 Then
	// search the whole tree, look for multiple nodes on level 1
	ll_handle = this.FindItem(RootTreeItem!, 0)
Else
	// start at the beginning position and search the children from that point down
	// add handle to queue
	li_next = upperbound(il_queue) + 1
	il_queue[li_next] = al_begin
	// search for siblings
	ll_handle = this.FindItem(NextTreeItem!, al_begin)
End IF

// add siblings to the queue
Do While ll_handle > 0
	// add handle to queue
	li_next = upperbound(il_queue) + 1
	il_queue[li_next] = ll_handle
	ll_handle = FindItem(NextTreeItem!, ll_handle)
Loop

Return of_SearchChild(as_Attribute, aa_Target, al_begin, ai_Level, ab_RespectCase, ab_FullCompare)

end function

public function long of_FindItem (string as_attribute, any aa_target, long al_begin, integer ai_level, boolean ab_respectcase);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_FindItem
//
//	Access:  public
//
//	Arguments:
//	as_Attribute				The attribute of the TreeView item to search ("Label", 
//									or "Data")
//	aa_Target					A variable of type Any containg the search target.
//	al_Begin					The handle of the TreeView item to begin searching, if
//									0 entire tree will be searched.
//	ai_Level					The level to search, if 0 entire tree will be searched.
//	ab_RespectCase			True - search is case sensitive,
//									False - search is not case sensitive.  Only used if the target
//									is a string.
//
//	Returns:		Long
//					The handle of the item whose Label matches the target.  Returns 0
//					if not found, -1 if an error occurrs.
//
//	Description:	Search for an item in the TreeView.  This function calls of_SearchChild
//						which is recursive to search for the target in either the Label or Data attribute
//						of the TreeView items.  It will use the pfc_searchcompare event to actually
//						perform the comparison.  Override this event if another comparison is desired.
//
//						This function overloads the real of_FindItem function to allow the last
//						retrieval argument to be optional.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

Return of_FindItem(as_Attribute, aa_Target, al_Begin, ai_Level, ab_RespectCase, False)

end function

public function long of_FindItem (string as_Attribute, any aa_Target, long al_Begin, integer ai_Level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_FindItem
//
//	Access:  public
//
//	Arguments:
//	as_Attribute				The attribute of the TreeView item to search ("Label", 
//									or "Data")
//	aa_Target					A variable of type Any containg the search target.
//	al_Begin					The handle of the TreeView item to begin searching, if
//									0 entire tree will be searched.
//	ai_Level					The level to search, if 0 entire tree will be searched.
//
//	Returns:		Long
//					The handle of the item whose Label matches the target.  Returns 0
//					if not found, -1 if an error occurrs.
//
//	Description:	Search for an item in the TreeView.  This function calls of_SearchChild
//						which is recursive to search for the target in either the Label or Data attribute
//						of the TreeView items.  It will use the pfc_searchcompare event to actually
//						perform the comparison.  Override this event if another comparison is desired.
//
//						This function overloads the real of_FindItem function to allow the last 2
//						retrieval argument to be optional.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

Return of_FindItem(as_Attribute, aa_Target, al_Begin, ai_Level, False, False)

end function

public function long of_FindItem (string as_Attribute, any aa_Target, long al_Begin);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_FindItem
//
//	Access:  public
//
//	Arguments:
//	as_Attribute				The attribute of the TreeView item to search ("Label", 
//									or "Data")
//	aa_Target					A variable of type Any containg the search target.
//	al_Begin					The handle of the TreeView item to begin searching, if
//									0 entire tree will be searched.
//
//	Returns:		Long
//					The handle of the item whose Label matches the target.  Returns 0
//					if not found, -1 if an error occurrs.
//
//	Description:	Search for an item in the TreeView.  This function calls of_SearchChild
//						which is recursive to search for the target in either the Label or Data attribute
//						of the TreeView items.  It will use the pfc_searchcompare event to actually
//						perform the comparison.  Override this event if another comparison is desired.
//
//						This function overloads the real of_FindItem function to allow the last 3
//						retrieval argument to be optional.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

Return of_FindItem(as_Attribute, aa_Target, al_Begin, 0, False, False)

end function

public function long of_FindItem (string as_Attribute, any aa_Target);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_FindItem
//
//	Access:  public
//
//	Arguments:
//	as_Attribute				The attribute of the TreeView item to search ("Label", 
//									or "Data")
//	aa_Target					A variable of type Any containg the search target.
//									0 entire tree will be searched.
//
//	Returns:		Long
//					The handle of the item whose Label matches the target.  Returns 0
//					if not found, -1 if an error occurrs.
//
//	Description:	Search for an item in the TreeView.  This function calls of_SearchChild
//						which is recursive to search for the target in either the Label or Data attribute
//						of the TreeView items.  It will use the pfc_searchcompare event to actually
//						perform the comparison.  Override this event if another comparison is desired.
//
//						This function overloads the real of_FindItem function to allow the last 4
//						retrieval argument to be optional.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

Return of_FindItem(as_Attribute, aa_Target, 0, 0, False, False)

end function

public function integer of_getdatastore (integer ai_level, ref n_ds ads_obj);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetDatastore
//
//	Access:  public
//
//	Arguments:
//	ai_Level					The level of the TreeView for which you want the DataStore.
//	ads_obj			The handle to the DataStore (of type n_ds) for the level.
//									Passed by reference.
//
//	Returns:		Integer
//					1	- the DataStore was found
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
//	5.0   Initial version
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

li_Limit = UpperBound(inv_ds)
If ai_Level > li_Limit Then
	// Allow for recursion
	If Not inv_ds[li_Limit].b_Recursive Then Return -1
	
	ai_Level = li_Limit
End If

ads_obj = inv_ds[ai_Level].ds_obj

Return 1

end function

public function integer of_RefreshItem (long al_handle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RefreshItem
//
//	Access:  public
//
//	Arguments:
//	al_Handle						The handle of the item to be refreshed.
//
//	Returns:		Integer
//					1	- the item was refreshed successfully
//					-1	- an error occurred
//
//	Description:	Refresh an item in the TreeView.  This includes removing
//						all its children (and discarding their rows from the DataStores)
//						and resetting its Label and Data attributes from the DataStore.
//
//						NOTE:  If the value of any of the key columns in the DataStore
//						have changed, this function will not work.  It will no longer be
//						able to find the proper row.  In that case, get the row with
//						of_GetDataRow BEFORE it is changed and call 
//						of_RefreshItem(al_Handle, ai_Row)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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
Long					ll_Row
TreeViewItem		ltvi_Item

If GetItem(al_Handle, ltvi_Item) = -1 Then Return -1

// Determine proper element in the data source attribute class
li_Limit = UpperBound(inv_ds)
If ltvi_Item.Level > li_Limit Then
	li_Index = li_Limit
Else
	li_Index = ltvi_Item.Level
End If

// Get the row in the DataStore for this item
ll_Row = inv_ds[li_Index].ds_obj.Find("pfc_tvi_key = '" + String(ltvi_Item.Data) + "'", &
																1, inv_ds[li_Index].ds_obj.RowCount())
If ll_Row < 1 Then Return -1

Return of_RefreshItem(al_Handle, ll_Row)

end function

public function integer of_Update (integer ai_level, boolean ab_accept, boolean ab_resetflag);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Update
//
//	Access:  public
//
//	Arguments:
//	ai_Level						The level for which to update its DataStore.
//										If ai_Level is 0, all DataStores will be updated.
//										NOTE:  There is only one DataStore for all 
//										recursive levels.  So if ai_Level is a recursive level, 
//										all levels using that DataStore will be updated.
//	ab_Accept						True - (default) perform an AcceptText prior to the update,
//										False - do not perform an AcceptText.
//	ab_ResetFlags				True - (default) reset the status flags,
//										False - do not reset the flags.
//
//	Returns:		Integer
//					1	- the level was updated successfully
//					-1	- an error occurred
//
//	Description:	Update the DataStore associated with a level of the TreeView.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

li_Index = UpperBound(inv_ds)

If ai_Level = 0 Then
	// Update all DataStores
	li_Start = 1
Else
	If ai_Level < li_Index Then
		li_Index = ai_Level
	End If
	
	li_Start = li_Index
End If

// Update the level(s)
For li_Cnt = li_Start To li_Index
	If inv_ds[li_Cnt].ds_obj.Update(ab_Accept, ab_ResetFlag) = -1 Then Return -1
Next

Return 1

end function

public function integer of_Update (integer ai_level, boolean ab_accept);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Update
//
//	Access:  public
//
//	Arguments:
//	ai_Level						The level for which to update its DataStore.
//										If ai_Level is 0, all DataStores will be updated.
//										NOTE:  There is only one DataStore for all 
//										recursive levels.  So if ai_Level is a recursive level, 
//										all levels using that DataStore will be updated.
//	ab_Accept						True - (default) perform an AcceptText prior to the update,
//										False - do not perform an AcceptText.
//
//	Returns:		Integer
//					1	- the level was updated successfully
//					-1	- an error occurred
//
//	Description:	Update the DataStore associated with a level of the TreeView.
//
//						This function overloads the real of_Update function to allow the last
//						retrieval argument to be optional.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

Return of_Update(ai_Level, ab_Accept, True)

end function

public function integer of_Update (integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Update
//
//	Access:  public
//
//	Arguments:
//	ai_Level						The level for which to update its DataStore.
//										If ai_Level is 0, all DataStores will be updated.
//										NOTE:  There is only one DataStore for all 
//										recursive levels.  So if ai_Level is a recursive level, 
//										all levels using that DataStore will be updated.
//
//	Returns:		Integer
//					1	- the level was updated successfully
//					-1	- an error occurred
//
//	Description:	Update the DataStore associated with a level of the TreeView.
//
//						This function overloads the real of_Update function to allow the last 2
//						retrieval arguments to be optional.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

Return of_Update(ai_Level, True, True)

end function

public function integer of_Update ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Update
//
//	Access:  public
//
//	Arguments:	None.
//
//	Returns:		Integer
//					1	- the level was updated successfully
//					-1	- an error occurred
//
//	Description:	Update all the DataStores associated with the TreeView.
//
//						This function overloads the real of_Update function to allow the retrieval
//						arguments to be optional.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

Return of_Update(0, True, True)

end function

public function integer of_refreshlevel (integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RefreshLevel
//
//	Access:  public
//
//	Arguments:
//	ai_Level						The level to be refreshed.
//
//	Returns:		Integer
//					1	- the TreeView was refreshed successfully
//					-1	- an error occurred
//
//	Description:	Refresh all items in a particular level of the TreeView.  This 
//						includes removing all lower levels (and discarding their rows 
//						from the DataStores) and resetting their Label and Data 
//						attributes from the DataStore.
//
//						NOTE:  If the value of any of the key columns in the DataStore
//						have changed, this function will not work.  It will no longer be
//						able to find the proper row.  In that case, get the row with
//						of_GetDataRow BEFORE it is changed and call 
//						of_RefreshItem(al_Handle, ai_Row)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

Long					ll_Handle

// Find the first item at this level
ll_Handle = of_FindFirstItemLevel(ai_Level, 0)
If ll_Handle <=0 Then Return -1

// Refresh all items at this level
Do
	If of_RefreshItem(ll_Handle) = -1 Then Return -1
	ll_Handle = FindItem(NextTreeItem!, ll_Handle)
Loop Until ll_Handle <=0

Return 1

end function

public function integer of_DiscardChildren (long al_handle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_DiscardChildren
//
//	Access:  public
//
//	Arguments:
//	al_Handle						The handle of the item for which all child items will
//										be removed.
//
//	Returns:		Integer
//					1	- the children were removed successfully
//					-1	- an error occurred
//
//	Description:	Remove all the items from the TreeView below a specified item.
//						All appropriate rows will be discarded from the DataStores.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

Long					ll_Child, ll_Next, ll_Row
n_ds			ads_obj
TreeViewItem		ltvi_Item

ll_Child = FindItem(ChildTreeItem!, al_Handle)
Do While ll_Child > 0

	// Recursively remove its child items
	If of_DiscardChildren(ll_Child) = -1 Then Return -1
	
	// Discard its row from the DataStore and the item itself
	If of_GetDataRow(ll_Child, ads_obj, ll_Row) = -1 Then Return -1
	ads_obj.RowsDiscard(ll_Row, ll_Row, Primary!)
	
	ll_Next = FindItem(NextTreeItem!, ll_Child)

	DeleteItem(ll_Child)
	ll_Child = ll_Next
Loop

Return 1

end function

public function long of_findfirstitemlevel (integer ai_level, long al_handle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_FindFirstItemLevel
//
//	Access:  public
//
//	Arguments:
//	ai_Level					The Level of the TreeView for which the first item is
//									being sought.
//	al_Handle					The handle of the TreeView item to begin searching
//
//	Returns:		Long
//					The handle of the first item on the given level.  Returns 0 if not found,
//					-1 if an error occurrs.
//
//	Description:	Find the first item on a level.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0.01	Rewrite to be non-recursive to avoid stack overflow errors.  Use a queue 
//				to simulate recursion in a level centered traversal
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

Long					ll_Handle, ll_Found
Integer				li_items, li_idx
TreeViewItem		ltvi_Item
any					la_find

// do not have this string as your label
la_find = "0987654321FIRSTitemonlevel1234567890)(*&^%$#@!~~"

// populate the queue - very restrictive search
this.of_finditem("label", la_find, al_handle, ai_level, True, True)

li_items = upperbound(il_queue)
For li_idx = 1 to li_items
	If this.GetItem(il_queue[li_idx], ltvi_item) = -1 Then Return -1
	// the queue is in level order.  The first item we match level with is the first
	// item for the level
	If ai_level = ltvi_item.level Then
		Return il_queue[li_idx]
	End If
Next

Return 0

end function

public function integer of_getdatarow (long al_handle, ref n_ds ads_obj, ref long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetDataRow
//
//	Access:  public
//
//	Arguments:
//	al_Handle					The handle to the TreeView item for which data is desired.
//	ads_obj			The handle to the DataStore (of type n_ds) for the item's
//									level.  Passed by reference.
//	al_Row						The row in the DataStore that the item points to.  Passed by
//									reference.
//
//	Returns:		Integer
//					1	- the item's data was found
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
//	5.0   Initial version
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
TreeViewItem		ltvi_Item

If GetItem(al_Handle, ltvi_Item) = -1 Then Return -1

li_Level = UpperBound(inv_ds)
If ltvi_Item.Level < li_Level Then li_Level = ltvi_Item.Level

ads_obj = inv_ds[li_Level].ds_obj

if IsNull(inv_ds[li_level].ds_obj) Or not IsValid (inv_ds[li_level].ds_obj) then
	return -1
end if

ll_Row = ads_obj.Find("pfc_tvi_key = '" + String(ltvi_Item.Data) + "'", &
											1, ads_obj.RowCount())

If ll_Row <= 0 Then
	Return -1
Else
	al_Row = ll_Row
	Return 1
End If

end function

public function long of_getitemfordata (ref n_ds ads_obj, long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetItemForData
//
//	Access:  public
//
//	Arguments:
//	ads_obj			The handle to the DataStore (of type n_ds) for the item's
//									level.  Passed by reference.
//	al_Row						The row in the DataStore that the item points to.
//
//	Returns:		Long
//					The handle of the TreeView item that points to that row, 0 if the item
//					was not found, or -1 if an error occurrs
//
//	Description:	Return the TreeView item that points to a particular row in a DataStore.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

String				ls_Key

// Get the generated key for the row
ls_Key = ads_obj.Object.pfc_tvi_key[al_Row]
If ls_Key = "" Then Return -1

// Find the item
Return of_FindItem("data", ls_Key, 0, 0, False, True)

end function

public function long of_InsertItem (long al_parent, ref n_ds ads_obj, long al_row, string as_position, long al_after);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_InsertItem
//
//	Access:  public
//
//	Arguments:
//	al_Parent					The handle of the parent TreeView item that the new item will
//									be inserted under.
//	ads_obj			The DataStore containing the data to be used for the new item.
//									This can be the same DataStore that was created for the level, or
//									another maintained by the user.  If the latter, the row will be added
//									to the level's DataStore.  Passed by reference.
//	al_Row						The row in the DataStore pointing to the data.
//	as_Position				The position under the parent where the new item will be inserted:
//									"First" - before the first child of the parent (Default)
//									"Last" - after the last child
//									"Sort" - in the sorted position based on the item's label
//									"After" - after the item with handle al_After
//	al_After						The handle to the item after which the new item will be inserted.
//									Ignored unless as_Position = "After".
//
//	Returns:		Long
//					Returns the handle of the item if it was added successfully, -1 if an error occurrs.
//
//	Description:	Add a new item to the TreeView using data from a DataStore.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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
Integer				li_NewLevel, li_Index
Any					la_Arg[20]
TreeViewItem		ltvi_Parent, ltvi_New

If al_Parent <> 0 Then
	If GetItem(al_Parent, ltvi_Parent) = -1 Then Return -1
	li_NewLevel = ltvi_Parent.Level + 1
Else
	li_NewLevel = 1
End If

// Get index into the data source array
li_Index = UpperBound(inv_ds)
If li_NewLevel <= li_Index Then
	li_Index = li_NewLevel
Else
	// If new item is being added to a level > li_Index then
	// inv_ds[li_Index] must be recursive
	If Not inv_ds[li_Index].b_Recursive Then Return -1
End If

// Check if the DataStore passed is the same as the one for the level
If ads_obj <> inv_ds[li_Index].ds_obj Then
	// Verify that the it is valid for the level
	If ads_obj.DataObject <> inv_ds[li_Index].ds_obj.DataObject Then Return -1

	// Append the rows to the level's DataStore
	ads_obj.RowsCopy(al_Row, al_Row, Primary!, inv_ds[li_Index].ds_obj, 999999, Primary!)
End If

 // Set the item's data
If of_SetItemAttributes(li_index, ads_obj, al_Row, ltvi_New) = -1 Then Return -1
	
If li_Index > li_NewLevel Or inv_ds[li_Index].b_Recursive Then
	ltvi_New.Children = True
Else
	ltvi_New.Children = False
End if

//  Add the Item
Choose Case Lower(as_Position)
	Case "last"
		Return InsertItemLast(al_Parent, ltvi_New)
	Case "sort"
		Return InsertItemSort(al_Parent, ltvi_New)
	Case "after"
		Return InsertItem(al_Parent, al_After, ltvi_New)
	Case Else	// "first"
		Return InsertItemFirst(al_Parent, ltvi_New)
End Choose

end function

public function long of_InsertItem (long al_parent, ref n_ds ads_obj, long al_row, string as_position);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_InsertItem
//
//	Access:  public
//
//	Arguments:
//	al_Parent					The handle of the parent TreeView item that the new item will
//									be inserted under.
//	ads_obj			The DataStore containing the data to be used for the new item.
//									This can be the same DataStore that was created for the level, or
//									another maintained by the user.  If the latter, the row will be added
//									to the level's DataStore.  Passed by reference.
//	al_Row						The row in the DataStore pointing to the data.
//	as_Position				The position under the parent where the new item will be inserted:
//									"First" - before the first child of the parent (Default)
//									"Last" - after the last child
//									"Sort" - in the sorted position based on the item's label
//									"After" - after the item with handle al_After (not valid with this format
//									of the function call)
//
//	Returns:		Long
//					Returns the handle of the item if it was added successfully, -1 if an error occurrs.
//
//	Description:	Add a new item to the TreeView using data from a DataStore.
//
//						This function overloads the real of_InsertItem function to allow the last
//						parameter to be optional.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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
	
Return of_InsertItem(al_Parent, ads_obj, al_Row, as_Position, 0)

end function

public function long of_InsertItem (long al_parent, ref n_ds ads_obj, long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_InsertItem
//
//	Access:  public
//
//	Arguments:
//	al_Parent					The handle of the parent TreeView item that the new item will
//									be inserted under.
//	ads_obj			The DataStore containing the data to be used for the new item.
//									This can be the same DataStore that was created for the level, or
//									another maintained by the user.  If the latter, the row will be added
//									to the level's DataStore.  Passed by reference.
//	al_Row						The row in the DataStore pointing to the data.
//
//	Returns:		Long
//					Returns the handle of the item if it was added successfully, -1 if an error occurrs.
//
//	Description:	Add a new item to the TreeView using data from a DataStore.
//
//						This function overloads the real of_InsertItem function to allow the last 2
//						parameter to be optional.  The item will be inserted as the First child.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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
	
Return of_InsertItem(al_Parent, ads_obj, al_Row, "first", 0)

end function

public function integer of_refreshitem (long al_handle, long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RefreshItem
//
//	Access:  public
//
//	Arguments:
//	al_Handle						The handle of the item to be refreshed.
//	al_Row							The row of the DataStore pointing to the item.
//
//	Returns:		Integer
//					1	- the item was refreshed successfully
//					-1	- an error occurred
//
//	Description:	Refresh an item in the TreeView.  This includes removing
//						all its children (and discarding their rows from the DataStores)
//						and resetting its Label and Data attributes from the DataStore.
//
//						NOTE:  If the value of any of the key columns in the DataStore
//						have changed, this function MUST be used rather than
//						of_RefreshItem(al_Handle).  Because it would not be able to
//						find the proper row.  Get the row by calling of_GetDataRow
//						BEFORE it is changed.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0.01	Change to return successful return code
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

If GetItem(al_Handle, ltvi_Item) = -1 Then Return -1

// Remove its child items
If ltvi_Item.Expanded Then
	CollapseItem(al_Handle)
	GetItem(al_Handle, ltvi_Item)
End If
If of_DiscardChildren(al_Handle) = -1 Then Return -1
	
// Determine proper element in the data source attribute class
li_Limit = UpperBound(inv_ds)
If ltvi_Item.Level > li_Limit Then
	li_Index = li_Limit
Else
	li_Index = ltvi_Item.Level
End If

// Reset the item's attributes
If of_SetItemAttributes(li_Index, inv_ds[li_Index].ds_obj, al_Row, ltvi_Item) = -1 Then Return -1

If SetItem(al_Handle, ltvi_Item) = -1 Then Return -1

Return 1

end function

protected function integer of_setitemattributes (integer ai_index, ref n_ds ads_obj, long al_row, ref treeviewitem atvi_item);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetItemAttributes
//
//	Access:  protected
//
//	Arguments:
//	ai_Index					The index into the data source attribute class for this item.
//	ads_obj			The DataStore with the data used to populate the item.  Passed
//									by reference.
//	al_Row						The row in the DataStore for the item.
//	atvi_Item					The TreeView item that is being populated.  Passed by reference.
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
//	5.0   Initial version
//	6.0	Correct OverlayIndex to set correctly.  
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

Integer	li_Overlay

SetPointer(Hourglass!)

// Set Label
atvi_Item.Label = ads_obj.GetItemString(al_Row, inv_ds[ai_Index].s_LabelColumn)
	
// Set Data to the unique key
atvi_Item.Data = ads_obj.Object.pfc_tvi_key[al_Row]
	
// Set the various picture indexes
If inv_ds[ai_Index].s_PictureIndexCol <> "" Then
	atvi_Item.PictureIndex = ads_obj.GetItemNumber(al_Row, inv_ds[ai_Index].s_PictureIndexCol)
Else
	atvi_Item.PictureIndex = inv_ds[ai_Index].i_PictureIndex
End if
	
If inv_ds[ai_Index].s_SelectedPictureIndexCol <> "" Then
	atvi_Item.SelectedPictureIndex = ads_obj.GetItemNumber(al_Row, inv_ds[ai_Index].s_SelectedPictureIndexCol)
Else
	atvi_Item.SelectedPictureIndex = inv_ds[ai_Index].i_SelectedPictureIndex
End if
	
If inv_ds[ai_Index].s_StatePictureIndexCol <> "" Then
	atvi_Item.StatePictureIndex = ads_obj.GetItemNumber(al_Row, inv_ds[ai_Index].s_StatePictureIndexCol)
Else
	atvi_Item.StatePictureIndex = inv_ds[ai_Index].i_StatePictureIndex
End if
	
If inv_ds[ai_Index].s_OverlayPictureIndexCol <> "" Then
	atvi_Item.OverlayPictureIndex = ads_obj.GetItemNumber(al_Row, inv_ds[ai_Index].s_OverlayPictureIndexCol)
Else
	atvi_Item.OverlayPictureIndex = inv_ds[ai_Index].i_OverlayPictureIndex
End if

Return 1

end function

public function integer of_ResetUpdate (integer ai_level);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ResetUpdate
//
//	Access:  public
//
//	Arguments:
//	ai_Level						The level for which to reset the update flags of its 
//										DataStore.  If ai_Level is 0, all DataStores will be updated.
//										NOTE:  There is only one DataStore for all 
//										recursive levels.  So if ai_Level is a recursive level, 
//										all levels using that DataStore will be updated.
//
//	Returns:		Integer
//					1	- the flags were reset successfully
//					-1	- an error occurred
//
//	Description:	Reset the update flags for a DataStore associated with a level of the TreeView.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

li_Index = UpperBound(inv_ds)

If ai_Level = 0 Then
	// Update all DataStores
	li_Start = 1
Else
	If ai_Level < li_Index Then
		li_Index = ai_Level
	End If
	
	li_Start = li_Index
End If

// Update the level(s)
For li_Cnt = li_Start To li_Index
	If inv_ds[li_Cnt].ds_obj.ResetUpdate() = -1 Then Return -1
Next

Return 1

end function

public function long of_initialretrieve (any aa_args[20]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_InitialRetrieve
//
//	Access:  public
//
//	Arguments:
//	aa_Args[20]				An array of type Any which contains the retrieval arguments
//									the first level's DataStore.
//
//	Returns:		Long
//					The number of rows retrieved
//
//	Description:	Retrieve the data and populate the first level of the TreeView.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0.01	Call of_settransobject on datastore rather than settransobject
//	6.0.01	Add error checking on settransobject, dw existing and successful population
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
Long	ll_Rows

// check datawindow object for existence.  This is set to ""
// in of_setdatasource() when the datawindow is not updateable
if inv_ds[1].s_DataWindow = "" then
	return -2
end if

ids_Buffer.DataObject = inv_ds[1].s_DataWindow

// Need to connect ok before we do a retrieve
If ids_Buffer.of_SetTransObject(inv_ds[1].tr_obj) <> 1 Then Return -5

ll_Rows = ids_Buffer.Retrieve(aa_Args[1], aa_Args[2], aa_Args[3], aa_Args[4], aa_Args[5], &
											aa_Args[6], aa_Args[7], aa_Args[8], aa_Args[9], aa_Args[10], &
											aa_Args[11], aa_Args[12], aa_Args[13], aa_Args[14], aa_Args[15], &
											aa_Args[16], aa_Args[17], aa_Args[18], aa_Args[19], aa_Args[20])

If ll_Rows > 0 Then 
	li_rc = of_PopulateLevel(1, 0)
	If li_rc < 0 Then Return li_rc
End if

Return ll_Rows

end function

public function long of_initialretrieve ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_InitialRetrieve
//
//	Access:  public
//
//	Arguments:	None
//
//	Returns:		Long
//					The number of rows retrieved
//
//	Description:	Retrieve the data and populate the first level of the TreeView.
//
//						This function overloads the real of_InitialRetrieve function to allow the
//						retrieval arguments to be optional.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

Any		la_Args[20]

Return of_InitialRetrieve(la_Args)

end function

public function integer of_setdatasource (integer ai_level, string as_datawindow, n_tr atr_obj, string as_labelcolumn, string as_retrieveargs, boolean ab_recursive, integer ai_pictureindex, integer ai_selpictindex, integer ai_statepictindex, integer ai_overlaypictindex);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetDatasource
//
//	Access:  public
//
//	Arguments:
//	ai_Level					The TreeView level to associate the data source with.
//	as_DataWindow			The DataWindow object to be used for the data source.
//	atr_obj						The transaction object for this data source (can be
//									different for each level).
//	as_LabelColumn			The column in the DataWindow object to display. 
//	as_RetrieveArgs			Retrieval arugments for the DataWindow.  These should
//									be separated by commas in the format:
//											:keyword.n.column
//									where column is the name of a column in another level's
//									data source.  If keyword is 'level', n is an absolute level 
//									number.  If keyword is 'parent', n is a number relative to
//									the current level (i.e. :parent.2.c1 would be column c1 in
//									the DataWindow for the level 2 levels above this one.
//	ab_Recursive				True - indicates that this is the last data source for this tree.
//									It will be used recursively for each subsequent level.
//	ai_PictureIndex			The index to the picture array to use for this level.
//	ai_SelPictIndex			The index to the picture array to use for the selected picture for
//									this level.
//	ai_StatePictIndex		The index to the picture array to use for the state picture for
//									this level.
//	ai_OverlayPictIndex	The index to the picture array to use for the overlay picture for
//									this level.
//
//	Returns:  integer
//	 1 = the data source was added successfully
//	-1 = argument validation error
//	-2 = the DataWindow object did not have any key columns assigned
//	-3 = a previous level had already been marked as recursive (there can be no more)
//	-4 = column label datatype was not a string
//	-5 = The transaction object could not be set
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
//	5.0   Initial version
//	5.0.03	Add Check to verify label datatype as string and new return code (-4)
//	6.0.01	Call of_settransobject on datastore rather than settransobject
// 6.0.01	Add code to check rc from settransobject (-5) and if 
//				column label is in datasource (-4)
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
Boolean	lb_First
String	ls_rc

// Check arguments
if IsNull (ai_level) or ai_level <= 0 or &
	Len (as_datawindow) = 0 or IsNull (as_datawindow) or &
	IsNull (atr_obj) or not IsValid (atr_obj) or &
	IsNull (as_labelcolumn) or IsNull (as_retrieveargs) or &
	IsNull (ab_recursive) or IsNull (ai_pictureindex) or IsNull (ai_selpictindex) or &
	IsNull (ai_statepictindex) or IsNull (ai_overlaypictindex) then
	return -1
end if
	
// Check if recurrsive is being used
li_NumDS = UpperBound(inv_ds)
If li_NumDS > 0 Then
	If inv_ds[li_NumDS].b_Recursive Then
		// If the last one is recursive, there can be no more
		Return -3
	End if
End if

// Set values in the attribute class array
inv_ds[ai_Level].s_DataWindow = as_DataWindow
inv_ds[ai_Level].s_LabelColumn = as_LabelColumn
inv_ds[ai_Level].s_RetrieveArgs = as_RetrieveArgs
inv_ds[ai_Level].b_Recursive = ab_Recursive
inv_ds[ai_Level].i_PictureIndex = ai_PictureIndex
inv_ds[ai_Level].i_SelectedPictureIndex = ai_SelPictIndex
inv_ds[ai_Level].i_StatePictureIndex = ai_StatePictIndex
inv_ds[ai_Level].i_OverlayPictureIndex = ai_OverlayPictIndex

// Create a DataStore to use as the data source
If IsNull(inv_ds[ai_Level].ds_obj) Or Not IsValid(inv_ds[ai_Level].ds_obj) Then
	inv_ds[ai_Level].ds_obj = Create n_ds
	inv_ds[ai_Level].ds_obj.of_SetBase(true)
End if

// Set parameters for the DataStore
inv_ds[ai_Level].ds_obj.of_SetAppend(True)
inv_ds[ai_Level].ds_obj.DataObject = as_DataWindow
inv_ds[ai_Level].tr_obj = atr_obj

// make sure transaction object is valid
If inv_ds[ai_Level].ds_obj.of_SetTransObject(atr_obj) <> 1 Then 
	inv_ds[ai_Level].s_DataWindow = ""
	Destroy inv_ds[ai_Level].ds_obj
	Return -5
End if

// label column must be in the datawindow
If inv_ds[ai_Level].ds_obj.Describe(as_LabelColumn + ".Band") = "!" Then 
	inv_ds[ai_Level].s_DataWindow = ""
	Destroy inv_ds[ai_Level].ds_obj
	Return -4
End if

// verify column label datatype as string
ls_rc = inv_ds[ai_Level].ds_obj.describe(as_LabelColumn + ".ColType")
if lower(left(ls_rc,4)) <> "char" then
	inv_ds[ai_Level].s_DataWindow = ""
	Destroy inv_ds[ai_Level].ds_obj
	Return -4
End if

// Add a computed column to the DataWindow object that will
// contain all the keys concatenated together.  This is necessary
// to be able to find a unique row.
If of_CreateKey(inv_ds[ai_Level].ds_obj) = -1 Then
	// No key columns were defined
	inv_ds[ai_Level].s_DataWindow = ""
	Destroy inv_ds[ai_Level].ds_obj
	Return -2
End if

// Determine if this is recursive
If ai_Level < li_NumDS And ab_Recursive Then
	// Remove all below this one because it is recursive
	For li_Cnt = (ai_Level + 1) To li_NumDS
		inv_ds[ai_Level].s_DataWindow = ""
	Next
End if

Return 1

end function

public function integer of_setdatasource (integer ai_level, string as_datawindow, n_tr atr_obj, string as_labelcolumn, string as_retrieveargs, boolean ab_recursive, integer ai_pictureindex, integer ai_selpictindex);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetDatasource
//
//	Access:  public
//
//	Arguments:
//	ai_Level					The TreeView level to associate the data source with.
//	as_DataWindow			The DataWindow object to be used for the data source.
//	atr_obj						The transaction object for this data source (can be
//									different for each level).
//	as_LabelColumn			The column in the DataWindow object to display. 
//	as_RetrieveArgs			Retrieval arugments for the DataWindow.  These should
//									be separated by commas in the format:
//											:keyword.n.column
//									where column is the name of a column in another level's
//									data source.  If keyword is 'level', n is an absolute level 
//									number.  If keyword is 'parent', n is a number relative to
//									the current level (i.e. :parent.2.c1 would be column c1 in
//									the DataWindow for the level 2 levels above this one.
//	ab_Recursive				True - indicates that this is the last data source for this tree.
//									It will be used recursively for each subsequent level.
//	ai_PictureIndex			The index to the picture array to use for this level.
//	ai_SelPictIndex			The index to the picture array to use for the selected picture for
//									this level.
//
//	Returns:  integer
//	 1 = the data source was added successfully
//	-1 = argument validation error
//	-2 = the DataWindow object did not have any key columns assigned
//	-3 = a previous level had already been marked as recursive (there can be no more)
//
//
//	Description:	Register a data source for a level of the TreeView.  The data source is a
//						DataWindow object that will be linked to the TreeView level and used
//						to populate.
//
//						This function overloads the real of_SetDatasource function to allow the
//						last two parameters to be optional.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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
return of_SetDatasource(ai_Level, as_DataWindow, atr_obj, as_LabelColumn, as_RetrieveArgs, ab_Recursive, &
							ai_PictureIndex, ai_SelPictIndex, 0, 0)
end function

public function integer of_setdatasource (integer ai_level, string as_datawindow, n_tr atr_obj, string as_labelcolumn, string as_retrieveargs, boolean ab_recursive);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetDatasource
//
//	Access:  public
//
//	Arguments:
//	ai_Level					The TreeView level to associate the data source with.
//	as_DataWindow			The DataWindow object to be used for the data source.
//	atr_obj						The transaction object for this data source (can be
//									different for each level).
//	as_LabelColumn			The column in the DataWindow object to display. 
//	as_RetrieveArgs			Retrieval arugments for the DataWindow.  These should
//									be separated by commas in the format:
//											:keyword.n.column
//									where column is the name of a column in another level's
//									data source.  If keyword is 'level', n is an absolute level 
//									number.  If keyword is 'parent', n is a number relative to
//									the current level (i.e. :parent.2.c1 would be column c1 in
//									the DataWindow for the level 2 levels above this one.
//	ab_Recursive				True - indicates that this is the last data source for this tree.
//									It will be used recursively for each subsequent level.
//
//	Returns:  integer
//	 1 = the data source was added successfully
//	-1 = argument validation error
//	-2 = the DataWindow object did not have any key columns assigned
//	-3 = a previous level had already been marked as recursive (there can be no more)
//
//
//	Description:	Register a data source for a level of the TreeView.  The data source is a
//						DataWindow object that will be linked to the TreeView level and used
//						to populate.
//
//						This function overloads the real of_SetDatasource function to allow the
//						last four parameters to be optional.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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
return of_SetDatasource(ai_Level, as_DataWindow, atr_obj, as_LabelColumn, as_RetrieveArgs, ab_Recursive, 0, 0, 0, 0)
end function

public function integer of_setdatasource (integer ai_level, string as_datawindow, n_tr atr_obj, string as_labelcolumn, string as_retrieveargs, boolean ab_recursive, integer ai_pictureindex, integer ai_selpictindex, integer ai_statepictindex);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetDatasource
//
//	Access:  public
//
//	Arguments:
//	ai_Level					The TreeView level to associate the data source with.
//	as_DataWindow			The DataWindow object to be used for the data source.
//	atr_obj						The transaction object for this data source (can be
//									different for each level).
//	as_LabelColumn			The column in the DataWindow object to display. 
//	as_RetrieveArgs			Retrieval arugments for the DataWindow.  These should
//									be separated by commas in the format:
//											:keyword.n.column
//									where column is the name of a column in another level's
//									data source.  If keyword is 'level', n is an absolute level 
//									number.  If keyword is 'parent', n is a number relative to
//									the current level (i.e. :parent.2.c1 would be column c1 in
//									the DataWindow for the level 2 levels above this one.
//	ab_Recursive				True - indicates that this is the last data source for this tree.
//									It will be used recursively for each subsequent level.
//	ai_PictureIndex			The index to the picture array to use for this level.
//	ai_SelPictIndex			The index to the picture array to use for the selected picture for
//									this level.
//	ai_StatePictIndex		The index to the picture array to use for the state picture for
//									this level.
//
//	Returns:  integer
//	 1 = the data source was added successfully
//	-1 = argument validation error
//	-2 = the DataWindow object did not have any key columns assigned
//	-3 = a previous level had already been marked as recursive (there can be no more)
//
//
//	Description:	Register a data source for a level of the TreeView.  The data source is a
//						DataWindow object that will be linked to the TreeView level and used
//						to populate.
//
//						This function overloads the real of_SetDatasource function to allow the
//						last parameter to be optional.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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
return of_SetDatasource(ai_Level, as_DataWindow, atr_obj, as_LabelColumn, as_RetrieveArgs, ab_Recursive, &
							ai_PictureIndex, ai_SelPictIndex, ai_StatePictIndex, 0)
end function

public function integer of_setdatasource (integer ai_level, string as_datawindow, n_tr atr_obj, string as_labelcolumn, string as_retrieveargs, boolean ab_recursive, integer ai_pictureindex);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetDatasource
//
//	Access:  public
//
//	Arguments:
//	ai_Level					The TreeView level to associate the data source with.
//	as_DataWindow			The DataWindow object to be used for the data source.
//	atr_obj						The transaction object for this data source (can be
//									different for each level).
//	as_LabelColumn			The column in the DataWindow object to display. 
//	as_RetrieveArgs			Retrieval arugments for the DataWindow.  These should
//									be separated by commas in the format:
//											:keyword.n.column
//									where column is the name of a column in another level's
//									data source.  If keyword is 'level', n is an absolute level 
//									number.  If keyword is 'parent', n is a number relative to
//									the current level (i.e. :parent.2.c1 would be column c1 in
//									the DataWindow for the level 2 levels above this one.
//	ab_Recursive				True - indicates that this is the last data source for this tree.
//									It will be used recursively for each subsequent level.
//	ai_PictureIndex			The index to the picture array to use for this level.
//
//	Returns:  integer
//	 1 = the data source was added successfully
//	-1 = argument validation error
//	-2 = the DataWindow object did not have any key columns assigned
//	-3 = a previous level had already been marked as recursive (there can be no more)
//
//
//	Description:	Register a data source for a level of the TreeView.  The data source is a
//						DataWindow object that will be linked to the TreeView level and used
//						to populate.
//
//						This function overloads the real of_SetDatasource function to allow the
//						last three parameters to be optional.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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
return of_SetDatasource(ai_Level, as_DataWindow, atr_obj, as_LabelColumn, as_RetrieveArgs, ab_Recursive, &
							ai_PictureIndex, 0, 0, 0)
end function

public function integer of_setdatasource (integer ai_level, string as_datawindow, n_tr atr_obj, string as_labelcolumn, string as_retrieveargs);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetDatasource
//
//	Access:  public
//
//	Arguments:
//	ai_Level					The TreeView level to associate the data source with.
//	as_DataWindow			The DataWindow object to be used for the data source.
//	atr_obj						The transaction object for this data source (can be
//									different for each level).
//	as_LabelColumn			The column in the DataWindow object to display. 
//	as_RetrieveArgs			Retrieval arugments for the DataWindow.  These should
//									be separated by commas in the format:
//											:keyword.n.column
//									where column is the name of a column in another level's
//									data source.  If keyword is 'level', n is an absolute level 
//									number.  If keyword is 'parent', n is a number relative to
//									the current level (i.e. :parent.2.c1 would be column c1 in
//									the DataWindow for the level 2 levels above this one.
//
//	Returns:  integer
//	 1 = the data source was added successfully
//	-1 = argument validation error
//	-2 = the DataWindow object did not have any key columns assigned
//	-3 = a previous level had already been marked as recursive (there can be no more)
//
//
//	Description:	Register a data source for a level of the TreeView.  The data source is a
//						DataWindow object that will be linked to the TreeView level and used
//						to populate.
//
//						This function overloads the real of_SetDatasource function to allow the
//						last five parameters to be optional.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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
return of_SetDatasource(ai_Level, as_DataWindow, atr_obj, as_LabelColumn, as_RetrieveArgs, False, 0, 0, 0, 0)

end function

protected function string of_buildtree (long al_handle, string as_picts, string as_levelpicts);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_BuildTree
//
//	Access:  protected
//
//	Arguments:
//	al_Handle		The handle of the TreeView item to start building the tree.
//   as_Picts			The file names for the picture and selected picture to display.
//   as_LevelPicts	The file names for all the pictures and selected pictures to display
//						when using a different picture for each level.
//
//	Returns:		String
//					The ImportString data to populate the DataWindow that will be printed.
//
//	Description:	Build the data to populate the DataWindow that will be printed to print
//						a TreeView.  This function is called by of_PrintTree and is recurrsive.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0	Fix to allow label to only be length of column it is displayed in
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

String				ls_Return
Long					ll_Next
TreeViewItem		ltvi_Item

If al_Handle <= 0 Then Return ""

GetItem(al_Handle, ltvi_Item)

ls_Return = " ~t" + left(ltvi_Item.Label,55) + "~t" + as_Picts
If ltvi_Item.Selected Then
	ls_Return = ls_Return + "~t1"
Else
	ls_Return = ls_Return + "~t0"
End if
	
If ltvi_Item.Expanded Then
	ls_Return = ls_Return + "~t1"
Else
	ls_Return = ls_Return + "~t0"
End if

If ltvi_Item.Children Then
	ls_Return = ls_Return + "~t1~t0"
Else
	ls_Return = ls_Return + "~t0"
	If FindItem(NextTreeItem!, al_Handle) > 0 Then
		ls_Return = ls_Return + "~t1"
	Else
		ls_Return = ls_Return + "~t0"
	End if
End if

ls_Return = ls_Return + "~t" + String(ltvi_Item.Level) + "~t" + as_LevelPicts + "~r~n"

If ltvi_Item.Expanded And ltvi_Item.Children Then
	ll_Next = FindItem(ChildTreeItem!, al_Handle)
	ls_Return = ls_Return + of_buildtree(ll_Next, as_Picts, as_LevelPicts)
End if

ll_Next = FindItem(NextTreeItem!, al_Handle)
ls_Return = ls_Return + of_buildtree(ll_Next, as_Picts, as_LevelPicts)

Return ls_Return

end function

public function integer of_printtree (long al_handle, boolean ab_canceldialog, string as_pictname, string as_selpictname);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_PrintTree
//
//	Access:  public
//
//	Arguments:
//	al_Handle					The handle of the TreeView item to start building the tree.  Pass 0
//									to print the entire tree.
//  ab_CancelDialog			True - display the Cancel Printing dialog,
//									False - do not display the dialog.
//   as_PictName				The file name to display as the picture.
//   as_SelPictName			The file name to display as the selected picture.
//
//	Returns:		Integer
//					1 if successful, -1 if an error occurrs.
//
//	Description:	Print the TreeView.  
//
//						This function overloads the real of_PrintTree which is protected.  Use this
//						format of the function when the same picture is desired for all levels of the tree.
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

String	ls_Picts[10], ls_SelPicts[10]

Return of_PrintTree(al_Handle, ab_CancelDialog, as_PictName, as_SelPictName, ls_Picts, ls_SelPicts)

end function

public function integer of_printtree (long al_handle, boolean ab_canceldialog, string as_levelpicts[10], string as_levelselpicts[10]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_PrintTree
//
//	Access:  public
//
//	Arguments:
//	al_Handle					The handle of the TreeView item to start building the tree.  Pass 0
//									to print the entire tree.
//  ab_CancelDialog			True - display the Cancel Printing dialog,
//									False - do not display the dialog.
//   as_LevelPicts[10]		The file names for all the pictures to display a different picture for
//									each level.
//   as_LevelSelPicts[10]	The file names for all the pictures to display a different selected
//									picture for each level.
//
//	Returns:		Integer
//					1 if successful, -1 if an error occurrs.
//
//	Description:	Print the TreeView.  
//
//
//						This function overloads the real of_PrintTree which is protected.  Use this
//						format of the function when a different picture is desired for each level of the tree.
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

String	ls_Pict, ls_SelPict

Return of_PrintTree(al_Handle, ab_CancelDialog, ls_Pict, ls_SelPict, as_LevelPicts, as_LevelSelPicts)

end function

public function integer of_printtree (long al_handle, boolean ab_canceldialog);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_PrintTree
//
//	Access:  public
//
//	Arguments:
//	al_Handle					The handle of the TreeView item to start building the tree.  Pass 0
//									to print the entire tree.
//  ab_CancelDialog			True - display the Cancel Printing dialog,
//									False - do not display the dialog.
//
//	Returns:		Integer
//					1 if successful, -1 if an error occurrs.
//
//	Description:	Print the TreeView.  
//
//						This function overloads the real of_PrintTree which is protected.  Use this
//						format of the function when the same picture is desired for all levels of the tree.
//
//						This function will default to using "folder.bmp" for the picture and "foldopen.bmp"
//						for the selected picture.
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

String	ls_Picts[10], ls_SelPicts[10]

Return of_PrintTree(al_Handle, ab_CancelDialog, "folder.bmp", "foldopen.bmp", ls_Picts, ls_SelPicts)

end function

public function integer of_printtree ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_PrintTree
//
//	Access:  public
//
//	Arguments:	None.
//
//	Returns:		Integer
//					1 if successful, -1 if an error occurrs.
//
//	Description:	Print the TreeView.  
//
//						This function overloads the real of_PrintTree which is protected.  Use this
//						format of the function to print the entire tree with the same picture for all 
//						levels.
//
//						This function will default to using "folder.bmp" for the picture and "foldopen.bmp"
//						for the selected picture.
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

String	ls_Picts[10], ls_SelPicts[10]

Return of_PrintTree(0, False, "folder.bmp", "foldopen.bmp", ls_Picts, ls_SelPicts)

end function

public function integer of_printtree (long al_Handle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_PrintTree
//
//	Access:  public
//
//	Arguments:
//	al_Handle					The handle of the TreeView item to start building the tree.  Pass 0
//									to print the entire tree.
//
//	Returns:		Integer
//					1 if successful, -1 if an error occurrs.
//
//	Description:	Print the TreeView.  
//
//						This function overloads the real of_PrintTree which is protected.  Use this
//						format of the function when the same picture is desired for all levels.
//
//						This function will default to using "folder.bmp" for the picture and "foldopen.bmp"
//						for the selected picture.
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

String	ls_Picts[10], ls_SelPicts[10]

Return of_PrintTree(al_Handle, False, "folder.bmp", "foldopen.bmp", ls_Picts, ls_SelPicts)

end function

public function integer of_getparentwindow (ref window aw_parent);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetParentWindow
//
//	Access:  public
//
//	Arguments:
//	aw_parent   The Parent window for this object (passed by reference).
//	   If a parent window is not found, aw_parent is NULL
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:	 Calculates the parent window of a window object
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

powerobject	lpo_parent

lpo_parent = this.GetParent()

// Loop getting the parent of the object until it is of type window!
do while IsValid (lpo_parent) 
	if lpo_parent.TypeOf() <> window! then
		lpo_parent = lpo_parent.GetParent()
	else
		exit
	end if
loop

if IsNull(lpo_parent) Or not IsValid (lpo_parent) then
	setnull(aw_parent)	
	return -1
end If

aw_parent = lpo_parent
return 1

end function

protected function integer of_printtree (long al_handle, boolean ab_canceldialog, string as_pictname, string as_selpictname, string as_levelpicts[10], string as_levelselpicts[10]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_PrintTree
//
//	Access:  protected
//
//	Arguments:
//	al_Handle					The handle of the TreeView item to start building the tree.  Pass 0
//									to print the entire tree.
//  ab_CancelDialog			True - display the Cancel Printing dialog,
//									False - do not display the dialog.
//   as_PictName				The file name to display as the picture.
//   as_SelPictName			The file name to display as the selected picture.
//   as_LevelPicts[10]		The file names for all the pictures to display a different picture for
//									each level.
//   as_LevelSelPicts[10]	The file names for all the pictures to display a different selected
//									picture for each level.
//
//	Returns:		Integer
//					1 if successful, -1 if an error occurrs.
//
//	Description:	Print the TreeView.  
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
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

Integer	li_Cnt, li_RC
String	ls_Picts, ls_LevelPicts
n_ds		lds_Print

If al_Handle < 0 Then Return -1

If al_Handle = 0 Then al_Handle = FindItem(RootTreeItem!, 0)

// Determine the picture and selected picture
If as_PictName = "" Then
	ls_Picts = " ~t"
Else
	ls_Picts = as_PictName + "~t"
End If

If as_SelPictName = "" Then
	ls_Picts = ls_Picts + " "
Else
	ls_Picts = ls_Picts + as_SelPictName
End If

For li_Cnt = 1 To 10
	ls_LevelPicts = ls_LevelPicts + as_LevelPicts[li_Cnt] + "~t"
Next
	
ls_LevelPicts = ls_LevelPicts + as_LevelSelPicts[1]
For li_Cnt = 2 To 10
	ls_LevelPicts = ls_LevelPicts + "~t" + as_LevelSelPicts[li_Cnt]
Next

// Create the DataStore to be used to print the TreeView
lds_Print = Create n_ds
lds_Print.DataObject = "d_printtree"

If lds_Print.ImportString(of_buildtree(al_Handle, ls_Picts, ls_LevelPicts)) <= 0 Then Return -1
li_RC = lds_Print.Print(ab_CancelDialog)

Destroy lds_Print

Return li_RC

end function

protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  			of_MessageBox
//
//	Access:  			protected
//
//	Arguments:
//	as_id			An ID for the Message.
//	as_title  	Text for title bar
//	as_text		Text for the actual message.
//	ae_icon 		The icon you want to display on the MessageBox.
//	ae_button	Set of CommandButtons you want to display on the MessageBox.
//	ai_default  The default button.
//
//	Returns:  integer
//	Return value of the MessageBox.
//
//	Description:
//	Display a PowerScript MessageBox.  
//	Allow PFC MessageBoxes to be manipulated prior to their actual display.
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

Return MessageBox(as_title, as_text, ae_icon, ae_button, ai_default)
end function

protected function long of_populatelevel (integer ai_level, long al_parent);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_PopulateLevel
//
//	Access:  protected
//
//	Arguments:
//	ai_Level					The TreeView level to be populated.
//	al_Parent					The handle of the parent TreeView item that is being populated.
//
//	Returns:		long
//			Returns # of rows added successfully, 
//			-1 if an error occurrs.
//			-2 no key columns defined on data source object
//			-3 Retrieve failed
//			-4 dw object does not exist - of_setdatasource probably failed
//			-5 Setting the transaction object failed
//
//	Description:	Populate a TreeView item with its child items.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03	Fix null object reference error on non-updateable datawindows
//				and add a new return code (-2).
//	6.0.01	Call of_settransobject on datastore rather than settransobject
// 6.0.01	Add code to check rc from settransobject (-5) and retrieve (-3)
//				and non-updateable check on key creation (-2)
//	6.0.01	Change Return codes to match those from of_setdatasource (was -2 (5.03) is now -4)
//	12.5		CJH		Issue 12324
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
Long					ll_NewRows, ll_Rows, ll_Cnt
Any					la_Arg[20]
TreeViewItem		ltvi_New

IF UpperBound(inv_ds[]) = 0 THEN Return(0)										//	Issue 12324

SetPointer(Hourglass!)

// Determine if the level is recursive
If ai_Level > UpperBound(inv_ds) Then
	li_Index = UpperBound(inv_ds)
Else
	li_Index = ai_Level
End If

// check datawindow object for existence.  This is set to ""
// in of_setdatasource() when the datawindow is not updateable
if inv_ds[li_Index].s_DataWindow = "" then
	return -4
end if

// Get retrieval arguments
If al_Parent > 0 Then
	of_GetArgs(al_Parent, ai_Level, la_Arg)
	
	// Retrieve the rows into the temporary buffer
	ids_Buffer.Reset()
	ids_Buffer.DataObject = inv_ds[li_Index].s_DataWindow
	// Need to connect ok before we do a retrieve
	If ids_Buffer.of_SetTransObject(inv_ds[li_Index].tr_obj) <> 1 Then Return -5
	ll_NewRows = ids_Buffer.Retrieve(la_Arg[1], la_Arg[2], la_Arg[3], la_Arg[4], la_Arg[5], &
													la_Arg[6], la_Arg[7], la_Arg[8], la_Arg[9], la_Arg[10], &
													la_Arg[11], la_Arg[12], la_Arg[13], la_Arg[14], la_Arg[15], &
													la_Arg[16], la_Arg[17], la_Arg[18], la_Arg[19], la_Arg[20])
Else
	ll_NewRows = ids_Buffer.RowCount()
End if

// was the retrieve successful?
If ll_NewRows < 0 Then Return -3

// Append the rows to the level's DataStore
ll_Rows = inv_ds[li_Index].ds_obj.RowCount()
ids_Buffer.RowsCopy(1, ll_NewRows, Primary!, inv_ds[li_Index].ds_obj, (ll_Rows + 1), Primary!)

// Clear the status flags for the new rows
For ll_Cnt = (ll_Rows + 1) To (ll_Rows + ll_NewRows)
	inv_ds[li_Index].ds_obj.SetItemStatus(ll_Cnt, 0, Primary!, DataModified!)
	inv_ds[li_Index].ds_obj.SetItemStatus(ll_Cnt, 0, Primary!, NotModified!)
Next

// Add key column to the DataStore.  This will be set in the Data attribute of the TreeView item
If of_CreateKey(ids_Buffer) = -1 Then
	// No key columns were defined or non-updateable dw
	Return -2
End if

 // Add nodes to the TreeView
For ll_Cnt = 1 To ll_NewRows
	If of_SetItemAttributes(li_index, ids_Buffer, ll_Cnt, ltvi_New) = -1 Then Return -1
	
	If UpperBound(inv_ds) > ai_Level Or inv_ds[li_Index].b_Recursive Then
		ltvi_New.Children = True
	Else
		ltvi_New.Children = False
	End if

	This.InsertItemLast(al_Parent, ltvi_New)
Next

Return ll_NewRows

end function

public function integer of_getargs (long al_parent, integer ai_level, ref any aa_arg[20]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetArgs
//
//	Access:  public
//
//	Arguments:
//	al_Parent					The handle of the parent of the current TreeView item
//	ai_Level					The current TreeView level.
//	aa_Arg[20]					An array of type Any that will contain the retrieval
//									argument values.  Passed by reference.
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
//	5.0   Initial version
// 7.0   Changed the li_row datatype to long (ll_row)
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

Integer				li_Limit, li_Cnt, li_Cnt2, li_ArgItem, li_Index, &
						li_ArgIndex, li_RetrieveArgLevel[]
Long 					ll_row
String				ls_ArgCol, ls_Arg, ls_RetrieveArgColumn[]
Long					ll_Arg
Double				ldb_Arg
Decimal				ldc_Arg
Date					ld_Arg
DateTime			ldt_Arg
Time					lt_Arg
TreeViewItem		ltvi_Item

// Determine if the level is recursive
If ai_Level > UpperBound(inv_ds) Then
	li_Index = UpperBound(inv_ds)
Else
	li_Index = ai_Level
End If

of_ParseArgs(inv_ds[li_Index].s_RetrieveArgs, ai_Level, li_RetrieveArgLevel, ls_RetrieveArgColumn)

li_Limit = UpperBound(li_RetrieveArgLevel)

For li_Cnt = (ai_Level - 1) To 1 Step - 1
	If This.GetItem(al_Parent, ltvi_Item) = -1 Then Return -1
	
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
			ll_Row = inv_ds[li_ArgIndex].ds_obj.Find("pfc_tvi_key = '" + String(ltvi_Item.Data) + "'", &
																		1, inv_ds[li_ArgIndex].ds_obj.RowCount())
			If ll_Row <= 0 Then Return -1
			
			// Cast the value into the proper data type
			Choose Case Left(inv_ds[li_ArgIndex].ds_obj.Describe(ls_ArgCol + ".coltype"), 7)
				Case "integer", "long"
					ll_Arg = inv_ds[li_ArgIndex].ds_obj.GetItemNumber(ll_Row, ls_ArgCol)
					aa_Arg[li_ArgItem] = ll_Arg
				Case "double", "number"
					ldb_Arg = inv_ds[li_ArgIndex].ds_obj.GetItemNumber(ll_Row, ls_ArgCol)
					aa_Arg[li_ArgItem] = ldb_Arg
				Case "decimal"
					ldc_Arg = inv_ds[li_ArgIndex].ds_obj.GetItemDecimal(ll_Row, ls_ArgCol)
					aa_Arg[li_ArgItem] = ldc_Arg
				Case "date"
					ld_Arg = inv_ds[li_ArgIndex].ds_obj.GetItemDate(ll_Row, ls_ArgCol)
					aa_Arg[li_ArgItem] = ld_Arg
				Case "time"
					lt_Arg = inv_ds[li_ArgIndex].ds_obj.GetItemTime(ll_Row, ls_ArgCol)
					aa_Arg[li_ArgItem] = lt_Arg
				Case "datetim"
					ldt_Arg = inv_ds[li_ArgIndex].ds_obj.GetItemDateTime(ll_Row, ls_ArgCol)
					aa_Arg[li_ArgItem] = ldt_Arg
				Case Else
					ls_Arg = inv_ds[li_ArgIndex].ds_obj.GetItemString(ll_Row, ls_ArgCol)
					aa_Arg[li_ArgItem] = ls_Arg
			End Choose
		End If
	Next
	
	If li_Cnt > 1 Then
		// Move up one level
		al_Parent = This.FindItem(ParentTreeItem!, al_Parent)
		If al_Parent = -1 Then Return -1
	End If
Next

Return 1

end function

public function integer of_deleteitem (long al_handle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_DeleteItem
//
//	Access:  public
//
//	Arguments:
//	al_Handle						The handle of the item to be delete.
//
//	Returns:		Integer
//					1	- the item was deleted successfully
//					-1	- an error occurred
//
//	Description:	Delete an item from the TreeView.  The item's row will be
//						DELETED from its DataStore (the user must call the Update(),
//						however).  All its children will be removed and their rows 
//						DISCARDED from their DataStores.  Refrential integrity is left
//						to the user.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 7.0   Changed the li_row datatype to long (ll_row).
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
Long					ll_Row
TreeViewItem		ltvi_Item

If GetItem(al_Handle, ltvi_Item) = -1 Then Return -1

// Determine proper element in the data source attribute class
li_Limit = UpperBound(inv_ds)
If ltvi_Item.Level > li_Limit Then
	li_Index = li_Limit
Else
	li_Index = ltvi_Item.Level
End If

// Discard the item's children
If of_DiscardChildren(al_Handle) = -1 Then Return -1

// Get the row in the DataStore for this item
ll_Row = inv_ds[li_Index].ds_obj.Find("pfc_tvi_key = '" + String(ltvi_Item.Data) + "'", &
																1, inv_ds[li_Index].ds_obj.RowCount())
If ll_Row < 1 Then Return -1

// Delete the row
inv_ds[li_Index].ds_obj.DeleteRow(ll_Row)

Return DeleteItem(al_Handle)

end function

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Destructor
//
//	Description:	Destroy the DataStores that were created
//						when the data sources were registered.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
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

li_NumDS = UpperBound(inv_ds)
For li_Cnt = 1 To li_NumDS
	If IsValid(inv_ds[li_Cnt].ds_obj) Then
		Destroy inv_ds[li_Cnt].ds_obj
	End If
Next

ids_buffer.of_SetBase(false)
Destroy ids_Buffer

end event

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Constructor
//
//	Description:	Create the temporary buffer DataStore.
//						It will be used to retrieve the rows for a
//						level of the TreeView.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
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

ids_Buffer = Create n_ds
ids_buffer.of_SetBase(true)

end event

event itemexpanding;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  ItemExpanding
//
//	Description:	If this is the first time the item is expanded, 
//						call of_PopulateLevel to populate it with its children.
//
//						This is done in this event as opposed to the ItemPopulate
//						event because it needs to be executed again if the children
//						are deleted (of_RefreshItem).
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
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

Integer	li_RC
TreeViewItem	ltvi_This

If FindItem(ChildTreeItem!, handle) = -1 Then
	// No children, so populate
	if GetItem(handle, ltvi_This) > 0 then
		li_RC = of_PopulateLevel((ltvi_This.Level + 1), handle)
		If li_RC < 1 Then
			ltvi_This.Children = False
			SetItem(handle, ltvi_This)
		End if
	end if
End If

end event

event endlabeledit;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  EndLabelEdit
//
//	Description:	Change the label column in the appropriate DataStore to
//						be the new label text.  This only works if the label column
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
//	5.0   Initial version
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

if GetItem(handle, ltvi_Item) = -1 then
	return
end if

// Get the row in the DataStore
If of_GetDataRow(handle, lds_obj, ll_Row) = -1 Then
	Return
End If

// Get the label column
li_Index = UpperBound(inv_ds)
If ltvi_Item.Level < li_Index Then
	li_Index = ltvi_Item.Level
End If

// Change the value of the label column
lds_obj.SetItem(ll_Row, inv_ds[li_Index].s_LabelColumn, newtext)

end event

event begindrag;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  BeginDrag
//
//	Description:	Save the handle of the item that is being
//						dragged in the instance variable il_DragSource.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
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

il_DragSource = handle

end event

event dragdrop;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  DragDrop
//
//	Description:	Save the handle of the item that is being
//						dropped on in the instance variable il_DragTarget.
//						The user should extend this script to allow dragging
//						and dropping TreeView items from one branch to
//						another.  il_DragSource will equal the handl of the
//						item being dropped.
//
//						NOTE:  You should verify that source is this TreeView
//						control.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
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

il_DragTarget = handle

end event

event getfocus;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			getfocus
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	If appropriate, notify the parent window that this
//						control got focus.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
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

window 	lw_parent

//Check for microhelp requirements.
If gnv_app.of_GetMicrohelp() Then
	//Notify the parent.
	of_GetParentWindow(lw_parent)
	If IsValid(lw_parent) Then
		lw_parent.Dynamic Event pfc_ControlGotFocus (this)
	End If
End If

end event

on pfc_u_tv.create
end on

on pfc_u_tv.destroy
end on

