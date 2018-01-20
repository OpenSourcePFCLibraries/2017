HA$PBExportHeader$pfc_w_sortdragdrop.srw
$PBExportComments$PFC Drag/Drop Style Sort dialog window
forward
global type pfc_w_sortdragdrop from w_response
end type
type cb_reset from u_cb within pfc_w_sortdragdrop
end type
type dw_sorted from u_dw within pfc_w_sortdragdrop
end type
type st_3 from u_st within pfc_w_sortdragdrop
end type
type st_4 from u_st within pfc_w_sortdragdrop
end type
type st_2 from u_st within pfc_w_sortdragdrop
end type
type dw_sortcolumns from u_dw within pfc_w_sortdragdrop
end type
type cb_ok from u_cb within pfc_w_sortdragdrop
end type
type cb_cancel from u_cb within pfc_w_sortdragdrop
end type
type cb_dlghelp from u_cb within pfc_w_sortdragdrop
end type
end forward

global type pfc_w_sortdragdrop from w_response
integer x = 1280
integer y = 780
integer width = 2176
integer height = 952
string title = "Sort"
long backcolor = 80263328
cb_reset cb_reset
dw_sorted dw_sorted
st_3 st_3
st_4 st_4
st_2 st_2
dw_sortcolumns dw_sortcolumns
cb_ok cb_ok
cb_cancel cb_cancel
cb_dlghelp cb_dlghelp
end type
global pfc_w_sortdragdrop pfc_w_sortdragdrop

type variables
Protected:
long		il_availablerow
long		il_sortingrow
n_cst_sortattrib 	inv_sortattrib
n_cst_returnattrib 	inv_return 
end variables

forward prototypes
protected function string of_BuildSortString ()
end prototypes

protected function string of_BuildSortString ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BuildSortString
//
//	Access:    		Protected
//
//	Arguments: 		None
//	
//	Returns:   		String
//   					The new sort string
//
//	Description:  	This function will construct the new sort string
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

string	ls_colname
string	ls_sortitem
string 	ls_sortstring=''
integer	li_i
integer	li_max

// Loop around all rows.
li_max = dw_sorted.RowCount ( ) 
FOR li_i = 1 to li_max 
	
	// Get the column name.
	ls_colname = dw_sorted.GetItemString (li_i, "columnname")
	IF IsNull(ls_colname) or Len(Trim(ls_colname))=0 Then Continue
	
	// Determine if LookUpDisplay should be used.
	IF dw_sorted.GetItemString (li_i, "use_display" ) = "1" THEN 
		// Use LookUpDisplay.
		ls_sortitem = "LookUpDisplay(" + ls_colname + ") "
	ELSE
		// Do NOT use LookUpDisplay.
		ls_sortitem = ls_colname + " "
	END IF 

	// Append the sort order.
	ls_sortitem = ls_sortitem + dw_sorted.GetItemString (li_i, "sort_order" ) + " "

	// Create the sort criteria.
	ls_sortstring = ls_sortstring + ls_sortitem
NEXT

// Return the new sort string.
Return ls_sortstring
end function

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  pfc_sortdragdrop
//
//	Description:  A Specify Sort dialog using drag/drop for selection
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 7.0	Modify left-hand datawindow so we can scroll to long
//			column names
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

// Get the PowerObject.
inv_sortattrib = Message.PowerObjectParm 

// Start the base service.
of_SetBase (true)

// Center the window.
inv_base.of_center()

// Allow window to close without the CloseQuery checks being performed.
ib_disableclosequery = True

dw_sortcolumns.Object.display_column.Width = 2194
dw_sortcolumns.Object.sort_order.Visible = 0

end event

on pfc_w_sortdragdrop.create
int iCurrent
call super::create
this.cb_reset=create cb_reset
this.dw_sorted=create dw_sorted
this.st_3=create st_3
this.st_4=create st_4
this.st_2=create st_2
this.dw_sortcolumns=create dw_sortcolumns
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.cb_dlghelp=create cb_dlghelp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_reset
this.Control[iCurrent+2]=this.dw_sorted
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.dw_sortcolumns
this.Control[iCurrent+7]=this.cb_ok
this.Control[iCurrent+8]=this.cb_cancel
this.Control[iCurrent+9]=this.cb_dlghelp
end on

on pfc_w_sortdragdrop.destroy
call super::destroy
destroy(this.cb_reset)
destroy(this.dw_sorted)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.dw_sortcolumns)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.cb_dlghelp)
end on

event pfc_postopen;call super::pfc_postopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event Name:  pfc_postopen
//
//	Description:  Populate the columnnames and previous sort string
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
Integer 	li_i, li_sortnumcols
Integer	li_orignumcols, li_found, li_newrow
Integer	li_rc

SetPointer ( HourGlass! ) 

// Turn off re-drawing until all done.
dw_sortcolumns.SetReDraw (FALSE)

// Populate the "dw_sortcolumns" datawindow with column names.
// Loop around all the columns.
li_sortnumcols = UpperBound(inv_sortattrib.is_sortcolumns)
FOR li_i = 1 to li_sortnumcols
	// Insert a new row
	li_newrow = dw_sortcolumns.InsertRow(0) 
	// Populate the attributes for the column.
	dw_sortcolumns.SetItem(li_newrow, "columnname", inv_sortattrib.is_sortcolumns[li_i])
	dw_sortcolumns.SetItem(li_newrow, "displayname", inv_sortattrib.is_colnamedisplay[li_i]) 
	IF inv_sortattrib.ib_usedisplay[li_i] THEN
		dw_sortcolumns.SetItem ( li_newrow, "use_display", "1" ) 
	ELSE
		dw_sortcolumns.SetItem ( li_newrow, "use_display", "0" ) 
	END IF 
NEXT

// Sort dw_sortcolumns.
dw_sortcolumns.SetSort("displayname A")
dw_sortcolumns.Sort() 

// Find the current sort columns (dw_sorted) and display them as selected.
li_orignumcols = UpperBound(inv_sortattrib.is_origcolumns) 
FOR li_i = 1 to li_orignumcols
	// Find the row on dw_sortcolumns
	li_found = dw_sortcolumns.Find ( "columnname = '" + inv_sortattrib.is_origcolumns[li_i] + &
												 "'", 1, dw_sortcolumns.RowCount() ) 
	IF li_found > 0 THEN
		// Move the row from dw_sortcolumns to dw_sorted.
		li_rc = dw_sortcolumns.RowsMove ( li_found, li_found, Primary!, &
					dw_sorted, dw_sorted.RowCount()+1, Primary! )
		
		// Check the Asc/Desc sort order column
		dw_sorted.SetItem ( li_i, "sort_order", inv_sortattrib.is_origorder[li_i] ) 
	END IF 
NEXT 

// Turn off re-drawing until all done.
dw_sortcolumns.SetReDraw (TRUE)
end event

event pfc_cancel;call w_response::pfc_cancel;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_Cancel
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Set to the appropriate return code and close the dialog.
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

// Set the return code to mean the window was closed by a cancel operation.
inv_return.ii_rc = 0

// Clear the sort string.
inv_return.is_rs = ''

// Close the window.
CloseWithReturn ( this, inv_return ) 
end event

event pfc_default;call w_response::pfc_default;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_Default
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Construct the new sort string and close this dialog
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

// Set the return code to mean succesful operation.
inv_return.ii_rc = 1

// Set the new sort string.
inv_return.is_rs = of_BuildSortString ( ) 

// Close the window.
CloseWithReturn ( this, inv_return )
end event

event close;call w_response::close;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Close
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Window close.
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

// If the return code matches the default value,
// then window is currently being closed as a Cancel operation.
If inv_return.ii_rc=-99 Then
	this.Event pfc_Cancel ()
End If
end event

type cb_reset from u_cb within pfc_w_sortdragdrop
integer x = 1344
integer y = 748
integer width = 375
integer taborder = 30
string text = "Reset"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Display Reset dialog settings
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	12.5   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2013, All rights reserved.
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
 * Libraries see http://pfc.codeplex.com
*/
//
//////////////////////////////////////////////////////////////////////////////

dw_sortcolumns.reset()
dw_sorted.reset()

parent.event pfc_postopen()

end event

type dw_sorted from u_dw within pfc_w_sortdragdrop
integer x = 1006
integer y = 108
integer width = 1111
integer height = 612
integer taborder = 0
string dragicon = "arrowl.ico"
string dataobject = "d_sortdragdrop"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked!
//
//	Description:  Determine if the user clicked on a column and start Drag
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
IF IsNull (dwo) or IsNull(row) or row<=0 THEN 
	Return
End If

IF dwo.name = "display_column" THEN 
	il_sortingrow = row
	
	// Start the drag.
	this.Drag ( Begin! ) 
END IF 
end event

event dragdrop;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  DragDrop!
//
//	Description:  Move the row from the "sort from" dw to the 
//					  "selected sort" dw or within "selected sort" dw 
//					  and stop the Drag
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//	12.5	DraggedObject() is obsolete, use source instead
//	2017	Insert marker for Drag&Drop, Drag&Drop to every position 
//       and within "selected sort"
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

// Hide insert marker
Modify ("l_marker_top.visible=0 l_marker_bottom.visible=0")

// Drag&Drop this object on itself
IF TypeOf ( source ) = DataWindow! THEN
	IF source.ClassName ( ) = "dw_sorted" THEN 
		If il_sortingrow > 0 Then
			IF row = 0 THEN row = this.RowCount() + 1
			li_rc = this.RowsMove ( il_sortingrow, il_sortingrow, Primary!, &
						this, row, Primary! )
		End If
		
		dw_sortcolumns.Drag ( End! ) 
		Return 
	END IF
END IF

// Move the row.
If il_availablerow > 0 Then
	IF row = 0 THEN row = this.RowCount() + 1
	li_rc = dw_sortcolumns.RowsMove ( il_availablerow, il_availablerow, Primary!, &
				this, row, Primary! )
End If

dw_sortcolumns.Drag ( End! ) 

end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Constructor
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Sort Columns DataWindow.
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

of_SetUpdateable ( FALSE ) 
ib_rmbmenu = FALSE

end event

event dragwithin;call super::dragwithin;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  DragWithin
//
//	Description:  Show and hide insert marker for Drag&Drop
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	2017   Initial version
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

IF row = 0 THEN
	// add to the end, show marker after last row
	Modify ("l_marker_top.visible=0")
	Modify ("l_marker_bottom.visible='0~tif (GetRow() = RowCount(), 1, 0)'")

ELSE
	// insert before a row, show marker before this row
	Modify ("l_marker_bottom.visible=0")
	Modify ("l_marker_top.visible='0~tif (GetRow() = " + string (row) + ", 1, 0)'")
END IF

end event

event dragleave;call super::dragleave;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  DragWithin
//
//	Description:  Hide all insert markers for Drag&Drop
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	2017   Initial version
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

Modify ("l_marker_top.visible=0 l_marker_bottom.visible=0")

end event

type st_3 from u_st within pfc_w_sortdragdrop
integer x = 1010
integer y = 44
integer width = 759
integer height = 60
long textcolor = 33554687
long backcolor = 82889382
string text = "Sort Columns"
end type

type st_4 from u_st within pfc_w_sortdragdrop
integer x = 1783
integer y = 44
integer width = 379
integer height = 60
long textcolor = 33554687
long backcolor = 82889382
string text = "Ascending"
alignment alignment = center!
end type

type st_2 from u_st within pfc_w_sortdragdrop
integer x = 46
integer y = 44
integer width = 942
integer height = 60
long textcolor = 33554687
long backcolor = 82889382
string text = "Columns Available for Sorting"
end type

type dw_sortcolumns from u_dw within pfc_w_sortdragdrop
integer x = 37
integer y = 108
integer width = 955
integer height = 612
integer taborder = 0
string dragicon = "arrowr.ico"
string dataobject = "d_sortdragdrop"
boolean hscrollbar = true
string icon = "arrowr.ico"
end type

event dragdrop;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  DragDrop!
//
//	Description:  Move the row from the "selected sort" dw to the 
//					  "sort from" dw and stop the Drag
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
//	12.5	DraggedObject() is obsolete, use source instead
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

// Make sure you are not dropping this object on itself!.
IF TypeOf ( source ) = DataWindow! THEN
	IF source.ClassName ( ) = "dw_sortcolumns" THEN 
		li_rc = this.Drag ( Cancel! ) 
		Return 
	END IF
END IF

// Move the row.
If il_sortingrow > 0 Then
	li_rc = dw_sorted.RowsMove ( il_sortingrow, il_sortingrow, Primary!, &
				this, this.RowCount()+1, Primary! )
End If

li_rc = this.SetSort ( "display_column A" )
li_rc = this.Sort ( ) 

dw_sorted.Drag ( End! ) 


end event

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked!
//
//	Description:  Determine if the user clicked on a column and start Drag
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
IF IsNull (dwo) or IsNull(row) or row<=0 THEN 
	Return
End If

IF dwo.Name = "display_column" THEN
	il_availablerow = row
	
	// Start the drag.
	this.Drag ( Begin! ) 
END IF 
end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Constructor
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Columns Available DataWindow.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.04 Prevent the Sort_Order column from being accessible.
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

of_SetUpdateable ( FALSE ) 
ib_rmbmenu = FALSE

// Prevent the Sort_Order column from being accessible.
this.Object.sort_order.Visible = 0

end event

type cb_ok from u_cb within pfc_w_sortdragdrop
integer x = 558
integer y = 748
integer width = 375
integer taborder = 10
string text = "OK"
boolean default = true
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked!
//
//	Description:  Perform the Default processing.
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

Parent.Event pfc_default()
end event

type cb_cancel from u_cb within pfc_w_sortdragdrop
integer x = 951
integer y = 748
integer width = 375
integer taborder = 20
boolean bringtotop = true
string text = "Cancel"
boolean cancel = true
end type

event clicked;call u_cb::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			Clicked!
//
//	Description:  	Perform the Cancel processing.
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

Parent.Event pfc_cancel()

end event

type cb_dlghelp from u_cb within pfc_w_sortdragdrop
integer x = 1737
integer y = 748
integer width = 375
integer taborder = 40
string text = "&Help"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Display PFC dialog help
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

showHelp ("pfcdlg.hlp", topic!, 900)
end event

