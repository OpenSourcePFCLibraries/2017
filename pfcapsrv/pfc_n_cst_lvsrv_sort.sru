HA$PBExportHeader$pfc_n_cst_lvsrv_sort.sru
$PBExportComments$PFC ListView Sort service
forward
global type pfc_n_cst_lvsrv_sort from n_cst_lvsrv
end type
end forward

global type pfc_n_cst_lvsrv_sort from n_cst_lvsrv
event type long pfc_columnclick ( integer ai_column )
event type long pfc_sort ( integer ai_index1,  integer ai_index2,  integer ai_column )
end type
global pfc_n_cst_lvsrv_sort pfc_n_cst_lvsrv_sort

type variables
Protected:
boolean	ib_columnheadersort
string	is_excludecolumns[]

integer	ii_CurrentSortCol
grsorttype	ie_CurrentSort

end variables

forward prototypes
public function boolean of_iscolumnheader ()
public function integer of_setcolumnheader (boolean ab_switch)
public function integer of_setexclude (string as_excludecols[])
public function integer of_getexclude (ref string as_excludecols[])
public function boolean of_isexclude (integer ai_column)
public function boolean of_isexclude (string as_columnlabel)
end prototypes

event pfc_columnclick;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		PFC_ColumnClick
//
//	Arguments:	
//	ai_column	The column that was clicked
//
//	Returns:		Integer
//					 1 = success
//					 0 = No action taken
//					-1 = error
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
//	6.0   Initial version
// 7.0	Changed If statement to look for 'char(' and 'char'
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

n_cst_columnattrib	lnv_columnattrib

// check arguments and references
If Not IsValid(ilv_requestor) Then Return -1
If IsNull(ai_column) or (ai_column < 1) then Return -1

// do not sort if column header sorting is off
If Not of_IsColumnHeader() Then
	Return 0
Else
	// do not sort if this column is excluded from the sort
	If of_IsExclude(ai_column) Then
		Return 0
	End If
	If ai_column <> ii_CurrentSortCol Then
		ie_CurrentSort = ascending!
		ii_CurrentSortCol = ai_column
	Else
		If ie_CurrentSort = ascending! Then
			ie_CurrentSort = descending!
		Else
			ie_CurrentSort = ascending!
		End if
	End if

	// Default sort is alphanumeric
	// Determine the datatype of the column and then call the appropriate Sort Mechanism
	ilv_requestor.of_GetColumnInfo(ai_column, lnv_columnattrib)
	If lower(left(lnv_columnattrib.is_ColType, 4)) = "char" then
		//  CHARACTER DATATYPE
		ilv_requestor.Sort(ie_CurrentSort, ai_column)
	ELSE													
		//  ALL OTHER DATATYPES
		ilv_requestor.Sort(UserDefinedSort!, ai_column)
	End If
	
End If

return 1
end event

event pfc_sort;//////////////////////////////////////////////////////////////////////////////
//
//	Event:		PFC_Sort
//
//	Arguments:
//	ai_index1	The index of one item being compared during a sorting operation
//	ai_index2	The index of a second item being compared during a sorting operation
//	ai_column	The number of the column containing the items being sorted
//
//	Returns:		Integer
//					 1	Index1 is greater than index2
//					 0	Index1 is equal to index2
//					-1	Index1 is less than index2
//
//	Description:	Perform the sort comparison on the column whose heading
//						was clicked.  
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0	Initial version
// 7.0	Added "char" datatype to case statement
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
Integer				li_returnmodifier
string				ls_value1, ls_value2
n_cst_columnattrib	lnv_columnattrib

// check arguments and references.  Must return 0 if nothing done
If Not IsValid(ilv_requestor) Then Return 0
If IsNull(ai_index1) or IsNull(ai_index2) or IsNull(ai_column) Then Return 0
If (ai_index1 < 1) or (ai_index2 < 1) or (ai_column < 1) Then Return 0
	
// change the return value based on sort we are performing
If ie_currentsort = Ascending! Then
	li_returnmodifier = 1
Else
	li_returnmodifier = -1
End If

// get the values to be compared
ilv_requestor.GetItem(ai_index1, ai_column, ls_value1)
ilv_requestor.GetItem(ai_index2, ai_column, ls_value2)

//  Determine the datatype of the column and then call the appropriate Sort Mechanism
ilv_requestor.of_getcolumninfo(ai_column, lnv_columnattrib)
Choose Case lower(left(lnv_columnattrib.is_ColType, 5))
	CASE "char(", "char"				//  CHARACTER DATATYPE
		If ls_value1 > ls_value2 Then 
			Return (1 * li_returnmodifier)
		ElseIf ls_value1 < ls_value2 Then 
			Return (-1 * li_returnmodifier) 
		Else 
			Return 0
		End If
	CASE "date"					//  DATE DATATYPE
		date	ld_item1, ld_item2
		ld_item1 = date(ls_value1)
		ld_item2 = date(ls_value2)
		If ld_item1 > ld_item2 Then 
			Return (1 * li_returnmodifier)
		ElseIf ld_item1 < ld_item2 Then 
			Return (-1 * li_returnmodifier) 
		Else 
			Return 0
		End If
	CASE "datet"				//  DATETIME DATATYPE
		datetime	ldt_item1, ldt_item2
		ldt_item1 = datetime(ls_value1)
		ldt_item2 = datetime(ls_value2)
		If ldt_item1 > ldt_item2 Then 
			Return (1 * li_returnmodifier)
		ElseIf ldt_item1 < ldt_item2 Then 
			Return (-1 * li_returnmodifier) 
		Else 
			Return 0
		End If
	CASE "decim"				//  DECIMAL DATATYPE
		decimal	ldc_item1, ldc_item2
		ldc_item1 = dec(ls_value1)
		ldc_item2 = dec(ls_value2)
		If ldc_item1 > ldc_item2 Then 
			Return (1 * li_returnmodifier)
		ElseIf ldc_item1 < ldc_item2 Then 
			Return (-1 * li_returnmodifier) 
		Else 
			Return 0
		End If
	CASE "numbe", "long", "ulong"				//  NUMBER = Integer DATATYPE	
		long	ll_item1, ll_item2
		ll_item1 = long(ls_value1)
		ll_item2 = long(ls_value2)
		If ll_item1 > ll_item2 Then 
			Return (1 * li_returnmodifier)
		ElseIf ll_item1 < ll_item2 Then 
			Return (-1 * li_returnmodifier) 
		Else 
			Return 0
		End If
	CASE "real"				// 	Real DATATYPE	
		real	lr_item1, lr_item2
		lr_item1 = real(ls_value1)
		lr_item2 = real(ls_value2)
		If lr_item1 > lr_item2 Then 
			Return (1 * li_returnmodifier)
		ElseIf lr_item1 < lr_item2 Then 
			Return (-1 * li_returnmodifier) 
		Else 
			Return 0
		End If
	CASE "time", "times"		//  TIME DATATYPE
		time	lt_item1, lt_item2
		lt_item1 = time(ls_value1)
		lt_item2 = time(ls_value2)
		If lt_item1 > lt_item2 Then 
			Return (1 * li_returnmodifier)
		ElseIf lt_item1 < lt_item2 Then 
			Return (-1 * li_returnmodifier) 
		Else 
			Return 0
		End If
	CASE ELSE
		Return 0
End Choose

Return 0
end event

public function boolean of_iscolumnheader ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsColumnHeader
//
//	Access:    		Public
//
//	Arguments: 		None
//
//	Returns:   		Boolean
//						True if the object is set to sort when the user clicks
//						on a column	header.
//
//	Description: 	Determine if the object is set to sort when the user clicks
//						on a column	header.  Default setting is TRUE
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

Return ib_columnheadersort
end function

public function integer of_setcolumnheader (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetColumnHeader
//
//	Access:    		Public
//
//	Arguments:
// ab_switch		States if the object should sort when the user clicks
//						on a column	header.
//
//	Returns:   		Integer
//   					1 if successful, otherwise -1
//
//	Description:  	States if the object should sort when the user clicks
//						on a column	header. 
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

// Check arguments.
IF IsNull(ab_switch) THEN Return -1

ib_columnheadersort = ab_switch
Return 1
end function

public function integer of_setexclude (string as_excludecols[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SetExclude
//
//	Access:    		Public
//
//	Arguments:
//	as_excludecols:  An array of columnnames to be excluded from sorting
//
//	Returns:   		Integer
//   					1 if it succeeds and -1 if an error occurs.
//
//	Description:  	Establishes a list of columns to be excluded from
//					  	the sorting.
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

If upperbound(as_excludecols) < 1 Then
	Return -1
End If

is_excludecolumns = as_excludecols

Return 1
end function

public function integer of_getexclude (ref string as_excludecols[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetExclude
//
//	Access:    		Public
//
//	Arguments:
//	as_excludecols		A string array, passed by reference, that will
//			   			 	hold the exclude columns returned.
//
//	Returns:   		Integer
//   					# of columns returned
//						-1 if an error occurs
//
//	Description:	Get the list of exclude columns set in of_SetExclude.
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
string	ls_empty[]

as_excludecols = ls_empty
as_excludecols = is_excludecolumns

Return upperbound(as_excludecols)
end function

public function boolean of_isexclude (integer ai_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsExclude
//
//	Access:    		Public
//
//	Arguments:
//	ai_column			The column to check for exclusion
//
//	Returns:   		Boolean
//   					True if it succeed
//						False if not excluded
//
//	Description:  	Checks the column to see if it is elgible for sorting.
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
Integer		li_width
string		ls_label
alignment	lal_align

If Not IsValid(ilv_requestor) Then Return False
If IsNull(ai_column) or (ai_column < 0) Then Return False

// Get the name of the column in question
ilv_requestor.GetColumn(ai_column, ls_label, lal_align, li_width)

Return of_isExclude(ls_label)
end function

public function boolean of_isexclude (string as_columnlabel);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsExclude
//
//	Access:    		Public
//
//	Arguments:
//	as_columnlabel		The column to check for exclusion
//
//	Returns:   		Boolean
//   					True if it succeed
//						False if not excluded
//
//	Description:  	Checks the column to see if it is elgible for sorting.
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
boolean		lb_exclude=False
Integer		li_count, li_index

If Not IsValid(ilv_requestor) Then Return False
If isnull(as_columnlabel) or (trim(as_columnlabel) = "") then Return False

// See if any columns were set to be excluded from the sort 
li_count  = UpperBound(is_excludecolumns) 
FOR li_index = 1 to li_count
	IF lower(as_columnlabel) = lower(is_excludecolumns[li_index]) THEN
		lb_exclude = TRUE
		EXIT
	END IF
NEXT

Return lb_exclude
end function

on pfc_n_cst_lvsrv_sort.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_lvsrv_sort.destroy
TriggerEvent( this, "destructor" )
end on

