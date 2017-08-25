HA$PBExportHeader$pfc_u_lv.sru
$PBExportComments$PFC ListView class
forward
global type pfc_u_lv from listview
end type
end forward

global type pfc_u_lv from listview
integer width = 329
integer height = 268
integer taborder = 1
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 50331647
borderstyle borderstyle = stylelowered!
integer largepicturewidth = 32
integer largepictureheight = 32
long largepicturemaskcolor = 553648127
integer smallpicturewidth = 16
integer smallpictureheight = 16
long smallpicturemaskcolor = 553648127
long statepicturemaskcolor = 553648127
event rbuttonup pbm_rbuttonup
event contextmenu pbm_contextmenu
event pfc_prermbmenu ( ref m_view am_view )
end type
global pfc_u_lv pfc_u_lv

type variables
Protected:
boolean		ib_IsObsolete
boolean	ib_rmbmenu=true
integer	ii_CurrentSortCol
long	il_LastHandle
long	il_RightClicked
string	is_LabelColumn
string	is_PictureColumn
string	is_StateColumn
string	is_OverlayColumn
string	is_XPosColumn
string	is_YPosColumn
string	is_pfckeydelimiter = '#$%'
string	is_Columns[]
string	is_ColFormat[]
string	is_ColType[]
grsorttype	ie_CurrentSort
n_ds	ids_source
m_view	im_view
end variables

forward prototypes
public function integer of_AddColumn (string as_columnname, string as_columnlabel, alignment aal_alignment, integer ai_columnwidth)
public function integer of_AddColumn (string as_columnname, string as_columnlabel, alignment aal_alignment)
public function integer of_AddColumn (string as_columnname, string as_columnlabel)
public function integer of_addcolumn (string as_columnname)
public function integer of_addcolumns ()
protected function integer of_createkey ()
public function integer of_getdatarow (long al_item, ref n_ds ads_source, ref long al_row)
public function long of_getitemforrow (long al_row)
public function long of_Populate (any aa_Args[20])
public function long of_Populate ()
public function long of_Refresh ()
public function long of_AddItem (long al_row)
public function integer of_deleteitem (long al_item)
protected function integer of_setattributes (long al_row, ref listviewitem alvi_item)
public function integer of_RefreshItem (long al_Item, long al_Row)
public function integer of_RefreshItem (long al_item)
public function integer of_update (boolean ab_accept)
public function integer of_Update (boolean ab_accept, boolean ab_resetflags)
public function integer of_update ()
public function string of_FormatData (string as_columnname, string as_colformat, string as_coltype, long al_row)
public function integer of_getdatasource (ref n_ds ads_source)
public function integer of_RefreshItemForRow (long al_row)
public function integer of_resetupdate ()
public function integer of_setdatasource (string as_datawindow, n_tr at_trans, string as_labelcolumn, string as_picturecolumn, string as_statecolumn, string as_overlaycolumn, string as_xposcolumn, string as_yposcolumn)
public function integer of_setdatasource (string as_datawindow, n_tr at_trans, string as_labelcolumn)
public function integer of_setdatasource (string as_datawindow, n_tr at_trans, string as_labelcolumn, string as_picturecolumn, string as_statecolumn)
public function integer of_setdatasource (string as_datawindow, n_tr at_trans, string as_labelcolumn, string as_picturecolumn)
public function integer of_setdatasource (string as_datawindow, n_tr at_trans, string as_labelcolumn, string as_picturecolumn, string as_statecolumn, string as_overlaycolumn)
public function integer of_getparentwindow (ref window aw_parent)
public function integer of_getcurrentsort (ref integer ai_column, ref grsorttype agrs_type)
public function integer of_deletecolumns ()
public function integer of_deletecolumn (integer ai_column)
protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default)
end prototypes

event rbuttonup;//////////////////////////////////////////////////////////////////////////////
//	Event:				rbuttonup
//	Description:			
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							5.0   Initial version
//							8.0   Moved existing code for PopUp menu to new contextmenu event
//						   	12.5	Redirect code to contextmenu event
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

Return this.event contextmenu( xpos, ypos)
end event

event contextmenu;//////////////////////////////////////////////////////////////////////////////
//	Event:				contextmenu
//	Description:			Popup menu
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							8.0   Initial version
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
boolean	lb_frame
integer	li_rc
integer	li_index
integer	li_width
string		ls_label
alignment	le_align
window		lw_parent
window		lw_frame
window		lw_sheet
window		lw_childparent

// Determine if RMB popup menu should occur
if not ib_rmbmenu or il_rightclicked > 0 then
	return 1
end if

// Determine parent window for PointerX, PointerY offset
this.of_GetParentWindow (lw_parent)
if IsValid (lw_parent) then
	// Get the MDI frame window if available
	lw_frame = lw_parent
	do while IsValid (lw_frame)
		if lw_frame.windowtype = mdi! or lw_frame.windowtype = mdihelp! then
			lb_frame = true
			exit
		else
			lw_frame = lw_frame.ParentWindow()
		end if
	loop
	
	if lb_frame then
		// If MDI frame window is available, use it as the reference point for the
		// popup menu for sheets (windows opened with OpenSheet function) or child windows
		if lw_parent.windowtype = child! then
			lw_parent = lw_frame
		else
			lw_sheet = lw_frame.GetFirstSheet()
			if IsValid (lw_sheet) then
				do
					// Use frame reference for popup menu if the parentwindow is a sheet
					if lw_sheet = lw_parent then
						lw_parent = lw_frame
						exit
					end if
					lw_sheet = lw_frame.GetNextSheet (lw_sheet)
				loop until IsNull(lw_sheet) Or not IsValid (lw_sheet)
			end if
		end if
	else
		// SDI application.  All windows except for child windows will use the parent
		// window of the control as the reference point for the popmenu
		if lw_parent.windowtype = child! then
			lw_childparent = lw_parent.ParentWindow()
			if IsValid (lw_childparent) then
				lw_parent = lw_childparent
			end if
		end if
	end if
else
	return 1
end if

// Create popup menu
if IsNull(im_view) Or not IsValid (im_view) then
	im_view = create m_view
	im_view.of_SetParent (this)
end if

// Set the values of the Arrange Items submenu
li_index = 1
li_rc = GetColumn (li_index, ls_label, le_align, li_width)
do while li_rc = 1
	if li_index >=1 and li_index <= 10 then
		im_view.m_viewitem.m_arrangeicons.item[li_index].text = "by " + ls_label
		im_view.m_viewitem.m_arrangeicons.item[li_index].microhelp = "Sorts items by " + ls_label
		im_view.m_viewitem.m_arrangeicons.item[li_index].visible = true
	end if
	li_index++
	li_rc = GetColumn (li_index, ls_label, le_align, li_width)
loop

// Determine if the Auto Arrange Icons item should be enabled
if this.view = ListViewLargeIcon! or this.view = ListViewSmallIcon! then
	im_view.m_viewitem.m_arrangeicons.m_autoarrange.enabled = true
	im_view.m_viewitem.m_arrangeicons.m_autoarrange.checked = this.autoarrange
else
	im_view.m_viewitem.m_arrangeicons.m_autoarrange.enabled = false
	im_view.m_viewitem.m_arrangeicons.m_autoarrange.checked = false
end if

this.event pfc_prermbmenu (im_view)

im_view.m_viewitem.PopMenu (lw_parent.PointerX() + 5, lw_parent.PointerY() + 10)

return 1
end event

public function integer of_AddColumn (string as_columnname, string as_columnlabel, alignment aal_alignment, integer ai_columnwidth);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddColumn
//
//	Access:  public
//
//	Arguments:
//	as_ColumnName			The column in the DataWindow object to add as a column in
//									the ListView. 
//	as_ColumnLabel			The heading for the column to display in the ListView
//	aal_Alignment			The alignment of the column in the ListView (Left!, Right!, Center!, Justify!).
//	ai_ColumnWidth			The width of the column in the ListView (in PB Units).
//
//	Returns:		Integer
//					The index of the column if added successfully, -1 if an error occurred
//
//	Description:	Add a column to the ListView control.  It will be displayed in Report View only.
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

String	ls_Type
Integer	li_Cols, li_Cnt, li_ColCnt

// Check if the column was previously added
li_Cols = UpperBound(is_Columns)
For li_Cnt = 1 To li_Cols
	If as_ColumnName = is_Columns[li_Cnt] Then
		// Already added, so set new values
		SetColumn(li_Cnt, as_ColumnLabel, aal_Alignment, ai_ColumnWidth)
		Return li_Cnt
	End If
Next

// Set the value in the data source structure
ls_Type  = ids_Source.Describe(as_ColumnName + ".coltype")
If ls_Type = "!" Then Return -1

li_ColCnt = UpperBound(is_Columns) + 1 
is_Columns[li_ColCnt] = as_ColumnName
is_ColType[li_ColCnt] = ls_Type
is_ColFormat[li_ColCnt] = ids_Source.Describe(as_ColumnName + ".format")
If is_ColFormat[li_ColCnt] = "?" Then is_ColFormat[li_ColCnt] = ""

// Add the column to the ListView
Return AddColumn(as_ColumnLabel, aal_Alignment, ai_ColumnWidth)

end function

public function integer of_AddColumn (string as_columnname, string as_columnlabel, alignment aal_alignment);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddColumn
//
//	Access:  public
//
//	Arguments:
//	as_ColumnName			The column in the DataWindow object to add as a column in
//									the ListView. 
//	as_ColumnLabel			The heading for the column to display in the ListView
//	aal_Alignment			The alignment of the column in the ListView (Left!, Right!, Center!, Justify!).
//
//	Returns:		Integer
//					The index of the column if added successfully, -1 if an error occurred
//
//	Description:	Add a column to the ListView control.  It will be displayed in Report View only.
//
//						This function overrides the real of_AddColumn to allow the column width to be
//						determined by the width of the column in the DataWindow.
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

Integer		li_Width

// Get the width of the column in the DataWindow

li_Width = Integer(ids_Source.Describe(as_ColumnName + ".width"))

// Add the column to the ListView
Return of_AddColumn(as_ColumnName, as_ColumnLabel, aal_Alignment, li_Width)

end function

public function integer of_AddColumn (string as_columnname, string as_columnlabel);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddColumn
//
//	Access:  public
//
//	Arguments:
//	as_ColumnName			The column in the DataWindow object to add as a column in
//									the ListView. 
//	as_ColumnLabel			The heading for the column to display in the ListView
//
//	Returns:		Integer
//					The index of the column if added successfully, -1 if an error occurred
//
//	Description:	Add a column to the ListView control.  It will be displayed in Report View only.
//
//						This function overrides the real of_AddColumn to allow the column width and
//						alignment to be determined by the width of the column in the DataWindow.
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

Alignment		lal_Align

// Get the alignment of the column in the DataWindow

Choose Case Lower(ids_Source.Describe(as_ColumnName + ".alignment"))
	Case "0"
		lal_Align = Left!
	Case "1"
		lal_Align = Right!
	Case "2"
		lal_Align = Center!
End Choose

// Add the column to the ListView
Return of_AddColumn(as_ColumnName, as_ColumnLabel, lal_Align)

end function

public function integer of_addcolumn (string as_columnname);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddColumn
//
//	Access:  public
//
//	Arguments:
//	as_ColumnName			The column in the DataWindow object to add as a column in
//									the ListView. 
//
//	Returns:		Integer
//					The index of the column if added successfully, -1 if an error occurred
//
//	Description:	Add a column to the ListView control.  It will be displayed in Report View only.
//
//						This function overrides the real of_AddColumn to allow the column width, alignment
//						and label to be determined by the attributes of the column in the DataWindow.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.02   Allow function to use the default header suffix as specified in the base DW service.
//		Previously, the function always expected "_t" suffix for column headers in the datawindow.
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

string	ls_header

// Get the header of the column in the DataWindow
ls_header = ids_source.inv_base.of_GetHeaderName (as_columnname)

// Add the column to the ListView
return of_AddColumn (as_columnname, ls_header)

end function

public function integer of_addcolumns ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddColumns
//
//	Access:  public
//
//	Arguments:	None.
//
//	Returns:		Integer
//					The number of columns add if successfull, -1 if an error occurred
//
//	Description:	Add a column to the ListView control for each visible column in the DataWindow.
//						They will be displayed in Report View only.
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

Integer	li_NumObj, li_Cnt, li_Cols
String	ls_Columns[]

// Get all the visible objects in the DataWindow
li_NumObj = ids_Source.inv_base.of_GetObjects(ls_Columns, "*", "*", True)

// Add each column to the ListView
For li_Cnt = 1 To li_NumObj
	// Only add objects that are columns or computed fields
	If ids_Source.Describe(ls_Columns[li_Cnt] + ".Type") = "column" Or &
		ids_Source.Describe(ls_Columns[li_Cnt] + ".Type") = "compute" Then

		li_Cols++
		If of_AddColumn(ls_Columns[li_Cnt]) < 0 Then Return -1
	End If
Next

Return li_Cols

end function

protected function integer of_createkey ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_CreateKey
//
//	Access:  protected
//
//	Arguments:	None.
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

String	ls_Exp, ls_Obj[], ls_mod
Integer	li_Obj, li_Cnt
Boolean	lb_First

ls_Exp = "expression='"
lb_First = True
li_Obj = ids_Source.inv_base.of_GetObjects(ls_Obj, "*", "*", False)

For li_Cnt = 1 To li_Obj
	If ids_Source.Describe(ls_Obj[li_Cnt] + ".key") = "yes" Then
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

ls_mod = ids_Source.Modify("create compute(band=detail x='0' y='0' visible='0' " + &
							"height='0' width='0' name=pfc_lvi_key " + ls_Exp + ")")
if Len (ls_mod) > 0 then
	return -1
else
	return 1
end if


end function

public function integer of_getdatarow (long al_item, ref n_ds ads_source, ref long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetDataRow
//
//	Access:  public
//
//	Arguments:
//	al_Item						The handle to the ListView item for which data is desired.
//	ads_Source				The handle to the DataStore (of type n_ds) for the Listview.
//									Passed by reference.
//	al_Row						The row in the DataStore that the item points to.  Passed by
//									reference.
//
//	Returns:		Integer
//					1	- the item's data was found
//					-1	- the item or row was not found
//
//	Description:	Return the DataStore and row a particular item in the ListView points
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

Long				ll_Row
ListViewItem	llvi_Item

If GetItem(al_Item, llvi_Item) = -1 Then Return -1

ads_Source = ids_Source

ll_Row = ads_Source.Find("pfc_lvi_key = '" + String(llvi_Item.Data) + "'", &
										1, ads_Source.RowCount())

If ll_Row <= 0 Then
	Return -1
Else
	al_Row = ll_Row
	Return 1
End If

end function

public function long of_getitemforrow (long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetItemForRow
//
//	Access:  public
//
//	Arguments:
//	al_Row						The row in the DataStore that the item points to.
//
//	Returns:		Long
//					The handle of the ListView item that points to that row, 0 if the item
//					was not found, or -1 if an error occurrs
//
//	Description:	Return the ListView item that points to a particular row in the source DataStore.
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

Long				ll_Cnt
String			ls_Key
ListViewItem	llvi_Item

// Get the generated key for the row
ls_Key = ids_Source.Object.pfc_lvi_key[al_Row]
If ls_Key = "" Then Return -1

// Find the item
For ll_Cnt = 1 To il_LastHandle
	If GetItem(ll_Cnt, llvi_Item) = 1 Then
		If llvi_Item.Data = ls_Key Then Return ll_Cnt
	End If
Next

Return 0

end function

public function long of_Populate (any aa_Args[20]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Populate
//
//	Access:  public
//
//	Arguments:
//	aa_Args[20]				An array of type Any which contains the retrieval arguments
//									the DataStore.
//
//	Returns:		Long
//					Returns the number of items added if successfull, -1 if an error occurred
//
//	Description:	Populate the ListView with items from the data source.
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

// Retrieve data into the DataStore
ids_Source.Retrieve(aa_Args[1], aa_Args[2], aa_Args[3], aa_Args[4], aa_Args[5], &
							aa_Args[6], aa_Args[7], aa_Args[8], aa_Args[9], aa_Args[10], &
							aa_Args[11], aa_Args[12], aa_Args[13], aa_Args[14], aa_Args[15], &
							aa_Args[16], aa_Args[17], aa_Args[18], aa_Args[19], aa_Args[20])

// Call the function to add the items to the ListView
Return of_Refresh()

end function

public function long of_Populate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Populate
//
//	Access:  public
//
//	Arguments:	None.
//
//	Returns:		Long
//					Returns the number of items added if successfull, -1 if an error occurred
//
//	Description:	Populate the ListView with items from the data source.
//
//						This function overrides the real of_Populate to allow the retrieval arguments
//						to be optional.
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

Any	la_Args[20]

Return of_Populate(la_Args)

end function

public function long of_Refresh ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Refresh
//
//	Access:  public
//
//	Arguments:	None.
//
//	Returns:		Long
//					Returns the number of items added if successfull, -1 if an error occurred
//
//	Description:	Refresh the ListView with items from the data source.
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

Long		ll_Rows, ll_Cnt

// Clear the ListView
DeleteItems()

// Get all rows from the datastore and add as items to the listview
ll_Rows = ids_Source.RowCount()
For ll_Cnt = 1 To ll_Rows
	// Add the item
	If of_AddItem(ll_Cnt) = -1 Then Return -1
Next

Return ll_Rows

end function

public function long of_AddItem (long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddItem
//
//	Access:  public
//
//	Arguments:
//	al_Row							The row in the DataStore to use for the new item's attributes.
//
//	Returns:		Long
//					Returns the handle of item added if successfull, -1 if an error occurred
//
//	Description:	Add a new item to the ListView using data from the data source.
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

Long				ll_Handle
ListViewItem	llvi_Item

// Set the item's attributes
If of_SetAttributes(al_Row, llvi_Item) = -1 Then Return -1

// Add the item
ll_Handle = AddItem(llvi_Item)
If ll_Handle = -1 Then Return -1
If ll_Handle > il_LastHandle Then 	il_LastHandle = ll_Handle

Return ll_Handle

end function

public function integer of_deleteitem (long al_item);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_DeleteItem
//
//	Access:  public
//
//	Arguments:
//	al_Item						The handle to the ListView item to be deleted.
//
//	Returns:		Integer
//					1	- the item was deleted successfully
//					-1	- an error occurred
//
//	Description:	Delete an item from the ListView and it's corresponding row from
//						the DataStore
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

Long				ll_Row
ListViewItem	llvi_Item

If GetItem(al_Item, llvi_Item) = -1 Then Return -1

ll_Row = ids_Source.Find("pfc_lvi_key = '" + String(llvi_Item.Data) + "'", &
									1, ids_Source.RowCount())

If ll_Row <= 0 Then
	Return -1
Else
	// Delete the row
	ids_Source.DeleteRow(ll_Row)
	
	// Delete the item
	Return DeleteItem(al_Item)
End If

end function

protected function integer of_setattributes (long al_row, ref listviewitem alvi_item);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetAttributes
//
//	Access:  protected
//
//	Arguments:
//	al_Row							The row in the DataStore to use for the item's attributes.
//	alvi_Item						The pointer to a ListView item whose attributes are to be set.
//										Passed by reference
//
//	Returns:		Integer
//					Returns 1 if successfull, -1 if an error occurred
//
//	Description:	Set the attributes of a ListView item using data from the data source.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0	Fix bug overlay picture attributes not being set correctly
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

Integer			li_Cnt, li_Cols, li_Overlay
String			ls_Label, ls_Column

// Determine how to handle the pictures
// Picture
If Trim(is_PictureColumn) = "" Then
	alvi_Item.PictureIndex = 0
ElseIf IsNumber(is_PictureColumn) Then
	// The Picture Index is hard coded
	alvi_Item.PictureIndex = Integer(is_PictureColumn)
ElseIf Left(ids_Source.Describe(is_PictureColumn + ".coltype"), 4) = "char" Then
	// The column contains a bmp name, so add the picture
	alvi_Item.PictureIndex = AddLargePicture(ids_Source.GetItemString(al_Row, is_PictureColumn))
	AddSmallPicture(ids_Source.GetItemString(al_Row, is_PictureColumn))
Else
	// The column contains an index
	alvi_Item.PictureIndex = ids_Source.GetItemNumber(al_Row, is_PictureColumn)
End If

// State Picture
If Trim(is_StateColumn) = "" Then
	alvi_Item.StatePictureIndex = 0
ElseIf IsNumber(is_StateColumn) Then
	// The State Picture Index is hard coded
	alvi_Item.StatePictureIndex = Integer(is_StateColumn)
ElseIf Left(ids_Source.Describe(is_StateColumn + ".coltype"), 4) = "char" Then
	// The column contains a bmp name, so add the picture
	alvi_Item.StatePictureIndex = AddStatePicture(ids_Source.GetItemString(al_Row, is_StateColumn))
Else
	// The column contains an index
	alvi_Item.StatePictureIndex = ids_Source.GetItemNumber(al_Row, is_StateColumn)
End If
	
// Overlay Picture
If Trim(is_OverlayColumn) = "" Then
	alvi_Item.OverlayPictureIndex = 0
ElseIf IsNumber(is_OverlayColumn) Then
	// The Picture Index is hard coded
	alvi_Item.OverlayPictureIndex = Integer(is_OverlayColumn)
Else
	// The column contains an index
	alvi_Item.OverlayPictureIndex = ids_Source.GetItemNumber(al_Row, is_OverlayColumn)
End If

// Set the X and Y coordinates
If Trim(is_XPosColumn) = "" Then
	alvi_Item.ItemX = 0
Else
	alvi_Item.ItemX = ids_Source.GetItemNumber(al_Row, is_XPosColumn)
End If
If Trim(is_YPosColumn) = "" Then
	alvi_Item.ItemY = 0
Else
	alvi_Item.ItemY = ids_Source.GetItemNumber(al_Row, is_XPosColumn)
End If

// Set label with data from columns
li_Cols = UpperBound(is_Columns)
For li_Cnt = 1 To li_Cols
	ls_Column = of_FormatData(is_Columns[li_Cnt], is_ColFormat[li_Cnt], is_ColType[li_Cnt], al_Row)
	If Trim(ls_Label) = "" Then
		ls_Label = ls_Column
	Else
		ls_Label = ls_Label + "~t" + ls_Column
	End If
Next
alvi_Item.Label = ls_Label

// Set data to be the created key to be sure it can be found later
alvi_Item.Data = ids_Source.Object.pfc_lvi_key[al_Row]

Return 1

end function

public function integer of_RefreshItem (long al_Item, long al_Row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RefreshItem
//
//	Access:  public
//
//	Arguments:
//	al_Item							The handle of the item to be refreshed.
//	al_Row							The row in the DataStore to use for the item's attributes.
//
//	Returns:		Integer
//					Returns 1 if successfull, -1 if an error occurred
//
//	Description:	Refresh an item in the ListView.  Reset all its attributes to the appropriate
//						values based on the data in the DataStore.
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

ListViewItem	llvi_Item

// Get the item
If GetItem(al_Item, llvi_Item) = -1 Then Return -1

// Set the item's attributes
If of_SetAttributes(al_Row, llvi_Item) = -1 Then Return -1

// Refresh the item
Return SetItem(al_Item, llvi_Item)

end function

public function integer of_RefreshItem (long al_item);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RefreshItem
//
//	Access:  public
//
//	Arguments:
//	al_Item							The handle of the item to be refreshed.
//
//	Returns:		Integer
//					Returns 1 if successfull, -1 if an error occurred
//
//	Description:	Refresh an item in the ListView.  Reset all its attributes to the appropriate
//						values based on the data in the DataStore.
//
//						This function overrides the real of_RefreshItem to allow the DataStore row
//						to be optional.
//
//						NOTE:  If the value of any of the key columns in the DataStore
//						have changed, this function will not work.  It will no longer be
//						able to find the proper row.  In that case, get the row with
//						of_GetDataRow BEFORE it is changed and call 
//						of_RefreshItem(al_Item, ai_Row)
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

Long		ll_Row
n_ds		lds_Source

// Get the corresponding row in the DataStore
If of_GetDataRow(al_Item, lds_Source, ll_Row) = -1 Then Return -1

// Refresh the item
Return of_RefreshItem(al_Item, ll_Row)

end function

public function integer of_update (boolean ab_accept);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Update
//
//	Access:  public
//
//	Arguments:
//	ab_Accept						True - (default) perform an AcceptText prior to the update,
//										False - do not perform an AcceptText.
//
//	Returns:		Integer
//					1	- the DataStore was updated successfully
//					-1	- an error occurred
//
//	Description:	Update the DataStore associated with the ListView.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.03	Correct to use function overloading
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

Return of_Update(ab_Accept, true)

end function

public function integer of_Update (boolean ab_accept, boolean ab_resetflags);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Update
//
//	Access:  public
//
//	Arguments:
//	ab_Accept						True - (default) perform an AcceptText prior to the update,
//										False - do not perform an AcceptText.
//	ab_ResetFlags				True - (default) reset the status flags,
//										False - do not reset the flags.
//
//	Returns:		Integer
//					1	- the DataStore was updated successfully
//					-1	- an error occurred
//
//	Description:	Update the DataStore associated with the ListView.
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

Return ids_Source.Update(ab_Accept, ab_ResetFlags)

end function

public function integer of_update ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Update
//
//	Access:  public
//
//	Arguments:	None.
//
//	Returns:		Integer
//					1	- the DataStore was updated successfully
//					-1	- an error occurred
//
//	Description:	Update the DataStore associated with the ListView.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.03	Correct to use function overloading
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

Return of_Update(true, true)

end function

public function string of_FormatData (string as_columnname, string as_colformat, string as_coltype, long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_FormatData
//
//	Access:  protected
//
//	Arguments:
//	as_ColumnName				The name of the column whose data is desired
//	as_ColFormat					The format for the column in the DataWindow
//	as_ColType					The data type of the column
//	al_Row							The row of the data
//
//	Returns:		String
//					The data in the column, row converted to a string and formatted
//					using the format attribute from the DataWindow.
//
//	Description:	Get the data from a row/column and convert it to a string using
//						the column's format attribute from the DataWindow.
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

String		ls_Data, ls_Arg
Long			ll_Arg
Double		ldb_Arg
Decimal		ldc_Arg
Date			ld_Arg
DateTime	ldt_Arg
Time			lt_Arg

// Format the column as a string
Choose Case Left(as_ColType, 7)
	Case "integer", "long"
		ll_Arg = ids_Source.GetItemNumber(al_Row, as_ColumnName)
		ls_Data = String(ll_Arg, as_ColFormat)
	Case "double", "number"
		ldb_Arg = ids_Source.GetItemNumber(al_Row, as_ColumnName)
		ls_Data = String(ldb_Arg, as_ColFormat)
	Case "decimal"
		ldc_Arg = ids_Source.GetItemDecimal(al_Row, as_ColumnName)
		ls_Data = String(ldc_Arg, as_ColFormat)
	Case "date"
		ld_Arg = ids_Source.GetItemDate(al_Row, as_ColumnName)
		ls_Data = String(ld_Arg, as_ColFormat)
	Case "time"
		lt_Arg = ids_Source.GetItemTime(al_Row, as_ColumnName)
		ls_Data = String(lt_Arg, as_ColFormat)
	Case "datetim"
		ldt_Arg = ids_Source.GetItemDateTime(al_Row, as_ColumnName)
		ls_Data = String(ldt_Arg, as_ColFormat)
	Case Else
		ls_Arg = ids_Source.GetItemString(al_Row, as_ColumnName)
		ls_Data = String(ls_Arg, as_ColFormat)
End Choose

Return ls_Data

end function

public function integer of_getdatasource (ref n_ds ads_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetDataRow
//
//	Access:  public
//
//	Arguments:
//	ads_Source				The handle to the DataStore (of type n_ds) for the Listview.
//									Passed by reference.
//
//	Returns:		Integer
//					1	- the DataStore was valid, -1	- it was not.
//
//	Description:	Get the DataStore used as the source for the ListView.  This
//						allows the user to update this row any way they wish.
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

If IsNull(ids_Source) Or Not IsValid(ids_Source) Then Return -1

ads_Source = ids_Source
Return 1

end function

public function integer of_RefreshItemForRow (long al_row);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RefreshItemForRow
//
//	Access:  public
//
//	Arguments:
//	al_Row							The row in the DataStore whose item is to be
//										refreshed.
//
//	Returns:		Integer
//					Returns 1 if successfull, -1 if an error occurred
//
//	Description:	Refresh an item in the ListView.  Reset all its attributes to the appropriate
//						values based on the data in the DataStore.
//
//						NOTE:  If the value of any of the key columns in the DataStore
//						have changed, this function will not work.  It will no longer be
//						able to find the proper row.  In that case, get the row with
//						of_GetDataRow BEFORE it is changed and call 
//						of_RefreshItem(al_Item, ai_Row)
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

Long		ll_Item

// Get the corresponding item in the ListView
ll_Item = of_GetItemForRow(al_Row)
If ll_Item = -1 Then Return -1

// Refresh the item
Return of_RefreshItem(ll_Item, al_Row)

end function

public function integer of_resetupdate ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ResetUpdate
//
//	Access:  public
//
//	Arguments:	None.
//
//	Returns:		Integer
//					1	- the DataStore flags were reset successfully
//					-1	- an error occurred
//
//	Description:	Reset the update flags for a DataStore associated with the ListView.
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

Return ids_Source.ResetUpdate()

end function

public function integer of_setdatasource (string as_datawindow, n_tr at_trans, string as_labelcolumn, string as_picturecolumn, string as_statecolumn, string as_overlaycolumn, string as_xposcolumn, string as_yposcolumn);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetDataSource
//
//	Access:  public
//
//	Arguments:
//	as_DataWindow			The DataWindow object to be used for the data source.
//	at_Trans					The transaction object for this data source.
//	as_LabelColumn			The column in the DataWindow object to display as the label. 
//	as_PictureColumn		The column in the DataWindow object to use for the picture.
//									The column may be an integer (used as the picture index) or a
//									string (a bmp name which will be used as the picture).  Or a number
//									may be passed in (i.e. "1") which will be used as the picture index
//									for all items.
//	as_StateColumn			The column in the DataWindow object to use for the state picture.
//									The column may be an integer (used as the picture index) or a
//									string (a bmp name which will be used as the picture).  Or a number
//									may be passed in (i.e. "1") which will be used as the state picture
//									index for all items.
//	as_OverlayColumn		The column in the DataWindow object to use for the overlay picture.
//									The column may be an integer (used as the picture index) or a
//									string (a bmp name which will be used as the picture).  Or a number
//									may be passed in (i.e. "1") which will be used as the state picture
//									index for all items.
//	as_XPosColumn			The column in the DataWindow object to use for the x-position
//									of the item (used in large icon and small icon views only).
//	as_YPosColumn			The column in the DataWindow object to use for the x-position
//									of the item (used in large icon and small icon views only).
//
//	Returns:		Integer
//					1	- the data source was added successfully
//					-1	- there were no key columns defined on the DataWindow
//					-2	- one of the columns provided did not exist
//					-3	- no DataWindow object was provided
//					-4 - the SetTransObject failed
//
//	Description:	Register a data source for the ListView.  The data source is a
//						DataWindow object that will be linked to the ListView level and used
//						to populate.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.03	Add deletion of previous columns
//	6.0.01	Call of_settransobject on datastore rather than settransobject
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

If as_DataWindow = "" Then Return -3

// Create a DataStore to use as the data source
If IsNull(ids_Source) Or Not IsValid(ids_Source) Then
	ids_Source = Create n_ds
	ids_Source.of_SetBase(true)
End if

// Set parameters for the DataStore
ids_Source.DataObject = as_DataWindow
If ids_Source.of_SetTransObject(at_Trans) <> 1 Then Return -4

// Set data source values
is_LabelColumn = as_LabelColumn
If Trim(as_LabelColumn) <> "" And &
	ids_Source.Describe(as_LabelColumn + ".Band") = "!" Then Return -2

is_PictureColumn = as_PictureColumn
If Trim(as_PictureColumn) <> "" And Not IsNumber(as_PictureColumn) And &
	ids_Source.Describe(as_PictureColumn + ".Band") = "!" Then Return -2

is_StateColumn = as_StateColumn
If Trim(as_StateColumn) <> "" And Not IsNumber(as_StateColumn) And &
	ids_Source.Describe(as_StateColumn + ".Band") = "!" Then Return -2

is_OverlayColumn = as_OverlayColumn
If Trim(as_OverlayColumn) <> "" And Not IsNumber(as_OverlayColumn) And &
	ids_Source.Describe(as_OverlayColumn + ".Band") = "!" Then Return -2

is_XPosColumn = as_XPosColumn
If Trim(as_XPosColumn) <> "" And &
	ids_Source.Describe(as_XPosColumn + ".Band") = "!" Then Return -2

is_YPosColumn = as_YPosColumn
If Trim(as_YPosColumn) <> "" And &
	ids_Source.Describe(as_YPosColumn + ".Band") = "!" Then Return -2

// Add a computed column to the DataWindow object that will
// contain all the keys concatenated together.  This is necessary
// to be able to find a unique row.
If of_CreateKey() = -1 Then
	// No key columns were defined
	Return -1
End if

// Delete the columns if already exists and clear column array
of_DeleteColumns()

// Add a column to the ListView for the Label
of_AddColumn(as_LabelColumn)

Return 1

end function

public function integer of_setdatasource (string as_datawindow, n_tr at_trans, string as_labelcolumn);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetDataSource
//
//	Access:  public
//
//	Arguments:
//	as_DataWindow			The DataWindow object to be used for the data source.
//	at_Trans					The transaction object for this data source.
//	as_LabelColumn			The column in the DataWindow object to display as the label. 
//
//	Returns:		Integer
//					1	- the data source was added successfully
//					-1	- there were no key columns defined on the DataWindow
//					-2	- one of the columns provided did not exist
//					-3	- no DataWindow object was provided
//
//	Description:	Register a data source for the ListView.  The data source is a
//						DataWindow object that will be linked to the ListView level and used
//						to populate.
//
//						This function overloads the real of_SetDataSource function to allow the 
//						last 5 retrieval argument to be optional.
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

Return of_SetDataSource(as_DataWindow, at_Trans, as_LabelColumn, "", "", "", "", "")

end function

public function integer of_setdatasource (string as_datawindow, n_tr at_trans, string as_labelcolumn, string as_picturecolumn, string as_statecolumn);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetDataSource
//
//	Access:  public
//
//	Arguments:
//	as_DataWindow			The DataWindow object to be used for the data source.
//	at_Trans					The transaction object for this data source.
//	as_LabelColumn			The column in the DataWindow object to display as the label. 
//	as_PictureColumn		The column in the DataWindow object to use for the picture.
//									The column may be an integer (used as the picture index) or a
//									string (a bmp name which will be used as the picture).
//	as_StateColumn			The column in the DataWindow object to use for the state picture.
//									The column may be an integer (used as the picture index) or a
//									string (a bmp name which will be used as the picture).
//
//	Returns:		Integer
//					1	- the data source was added successfully
//					-1	- there were no key columns defined on the DataWindow
//					-2	- one of the columns provided did not exist
//					-3	- no DataWindow object was provided
//
//	Description:	Register a data source for the ListView.  The data source is a
//						DataWindow object that will be linked to the ListView level and used
//						to populate.
//
//						This function overloads the real of_SetDataSource function to allow the 
//						last 3 retrieval argument to be optional.
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

Return of_SetDataSource(as_DataWindow, at_Trans, as_LabelColumn, as_PictureColumn, &
									as_StateColumn, "", "", "")

end function

public function integer of_setdatasource (string as_datawindow, n_tr at_trans, string as_labelcolumn, string as_picturecolumn);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetDataSource
//
//	Access:  public
//
//	Arguments:
//	as_DataWindow			The DataWindow object to be used for the data source.
//	at_Trans					The transaction object for this data source.
//	as_LabelColumn			The column in the DataWindow object to display as the label. 
//	as_PictureColumn		The column in the DataWindow object to use for the picture.
//									The column may be an integer (used as the picture index) or a
//									string (a bmp name which will be used as the picture).
//
//	Returns:		Integer
//					1	- the data source was added successfully
//					-1	- there were no key columns defined on the DataWindow
//					-2	- one of the columns provided did not exist
//					-3	- no DataWindow object was provided
//
//	Description:	Register a data source for the ListView.  The data source is a
//						DataWindow object that will be linked to the ListView level and used
//						to populate.
//
//						This function overloads the real of_SetDataSource function to allow the 
//						last 4 retrieval argument to be optional.
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

Return of_SetDataSource(as_DataWindow, at_Trans, as_LabelColumn, as_PictureColumn, &
									"", "", "", "")

end function

public function integer of_setdatasource (string as_datawindow, n_tr at_trans, string as_labelcolumn, string as_picturecolumn, string as_statecolumn, string as_overlaycolumn);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetDataSource
//
//	Access:  public
//
//	Arguments:
//	as_DataWindow			The DataWindow object to be used for the data source.
//	at_Trans					The transaction object for this data source.
//	as_LabelColumn			The column in the DataWindow object to display as the label. 
//	as_PictureColumn		The column in the DataWindow object to use for the picture.
//									The column may be an integer (used as the picture index) or a
//									string (a bmp name which will be used as the picture).
//	as_StateColumn			The column in the DataWindow object to use for the state picture.
//									The column may be an integer (used as the picture index) or a
//									string (a bmp name which will be used as the picture).
//	as_OverlayColumn		The column in the DataWindow object to use for the overlay picture.
//									The column may be an integer (used as the picture index) or a
//									string (a bmp name which will be used as the picture).
//
//	Returns:		Integer
//					1	- the data source was added successfully
//					-1	- there were no key columns defined on the DataWindow
//					-2	- one of the columns provided did not exist
//					-3	- no DataWindow object was provided
//
//	Description:	Register a data source for the ListView.  The data source is a
//						DataWindow object that will be linked to the ListView level and used
//						to populate.
//
//						This function overloads the real of_SetDataSource function to allow the 
//						last 2 retrieval argument to be optional.
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

Return of_SetDataSource(as_DataWindow, at_Trans, as_LabelColumn, as_PictureColumn, &
									as_StateColumn, as_OverlayColumn, "", "")

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

public function integer of_getcurrentsort (ref integer ai_column, ref grsorttype agrs_type);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetCurrentSort
//
//	Access:  public
//
//	Arguments:
//	ai_Column					The number of the column that the ListView is currently
//									sorted by.
//	agrs_Type					The type of sort (Ascending!, Descending!).
//
//	Returns:  integer
//	1 = listview has been sorted
//	0 = listview has not been sorted
//
//	Description:	Get the column number and sort type for the current sort.
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

If ii_CurrentSortCol = 0 Then Return 0

ai_Column = ii_CurrentSortCol
agrs_Type = ie_CurrentSort

Return 1

end function

public function integer of_deletecolumns ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_DeleteColumns
//
//	Access:		public
//
//	Arguments:	None.
//
//	Returns:		Integer
//					1 if successful, -1 if an error occurred
//
//	Description:	Delete all columns in the ListView control and reset the internal column arrays.
//						Columns are displayed in Report View only.
//
//						NOTE:  If you perform this function on a populated listview you
//						should call of_refresh to refresh the data view if needed
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0.03   Initial version
//	6.0.01	Add column count check
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
string	ls_empty[]

// Delete the current columns in the report view
If this.totalcolumns() > 0 then
	if this.deletecolumns() < 1 then return -1
End If

// Empty the column list array
is_Columns = ls_Empty
is_ColType = ls_Empty
is_ColFormat = ls_Empty

return 1
end function

public function integer of_deletecolumn (integer ai_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_DeleteColumn
//
//	Access:		public
//
//	Arguments:	ai_column	the column to be removed.
//
//	Returns:		Integer
//					1 if successful, -1 if an error occurred
//
//	Description:	Delete the column in the ListView control and sync the internal column arrays.
//						Columns are displayed in Report View only.
//
//						NOTE:  If you perform this function on column 1 you
//						should call of_refresh to refresh the data view.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0.03   Initial version
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

integer	li_cols, li_cnt, li_index
string	ls_columns[], ls_colformat[], ls_coltype[], ls_empty[]

li_Cols = UpperBound(is_Columns)

If (ai_column > li_cols) or (ai_column < 1) Then Return -1

// Delete the listview column
If this.DeleteColumn(ai_column) < 1 Then Return -1

// Sync internal arrays
For li_Cnt = 1 To (ai_column - 1)
	ls_Columns[li_Cnt] = is_Columns[li_Cnt]
	ls_ColFormat[li_Cnt] = is_ColFormat[li_Cnt]
	ls_ColType[li_Cnt] = is_ColType[li_Cnt]
Next

For li_index = (ai_column + 1) To li_cols
	ls_Columns[li_index - 1] = is_Columns[li_index]
	ls_ColFormat[li_index - 1] = is_ColFormat[li_index]
	ls_ColType[li_index - 1] = is_ColType[li_index]
Next

is_Columns = ls_empty
is_ColFormat = ls_empty
is_ColType = ls_empty

is_Columns = ls_Columns
is_ColFormat = ls_ColFormat
is_ColType = ls_ColType

return 1

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

event columnclick;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  ColumnClick
//
//	Description:	Sort the items based on the column whose heading
//						was clicked.  If already sorted on that column, then
//						reverse the sort order.
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

If column <> ii_CurrentSortCol Then
	ie_CurrentSort = ascending!
	ii_CurrentSortCol = column
Else
	If ie_CurrentSort = ascending! Then
		ie_CurrentSort = descending!
	Else
		ie_CurrentSort = ascending!
	End if
End if

This.Sort(ie_CurrentSort, column)

end event

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Destructor
//
//	Description:	Destroy the DataStore that was created
//						when the data source was registered.
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

if isvalid(ids_Source) then 
	Destroy ids_Source
end if

If IsValid(im_View) Then Destroy im_View

end event

event rightclicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  RightClicked
//
//	Description:	Keep track of the item that was clicked.
//					This is necessary because the contextmenu
//						event has no parameters.
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

il_RightClicked = index

end event

event endlabeledit;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  EndLabelEdit
//
//	Description:	Change the label column in the appropriate to be the new
//						text.  This only works if the label column is updatable.
//						If a computed column is being used for the label, override
//						this script with appropriate code.
//
//						NOTE:  Update() is NOT called for the DataStore.  This is
//						left to the user to perform.
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

Long					ll_Row
n_ds					lds_DataStore
ListViewItem		llvi_Item

// Make sure the label did change
This.GetItem(index, llvi_Item)
If newlabel = llvi_Item.Label Then Return

// Get the row in the DataStore
If of_GetDataRow(index, lds_DataStore, ll_Row) = -1 Then
	Return
End If

// Change the value of the label column
lds_DataStore.SetItem(ll_Row, is_LabelColumn, newlabel)

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

on pfc_u_lv.create
end on

on pfc_u_lv.destroy
end on

