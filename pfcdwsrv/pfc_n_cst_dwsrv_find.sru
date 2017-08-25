HA$PBExportHeader$pfc_n_cst_dwsrv_find.sru
$PBExportComments$PFC DataWindow Find/Replace service
forward
global type pfc_n_cst_dwsrv_find from n_cst_dwsrv
end type
end forward

global type pfc_n_cst_dwsrv_find from n_cst_dwsrv
event type long pfc_findnext ( n_cst_findattrib anv_findattrib )
event type long pfc_replace ( n_cst_findattrib anv_findattrib )
event type integer pfc_replaceall ( n_cst_findattrib anv_findattrib )
event pfc_finddlg ( )
event pfc_replacedlg ( )
end type
global pfc_n_cst_dwsrv_find pfc_n_cst_dwsrv_find

type variables
Protected:
string		is_lastfindcolumn
long      	il_lastfindrow

string     is_findexpression

boolean 	ib_allowfinddlg = True
boolean 	ib_allowreplacedlg = True
boolean  	ib_replaced = False
boolean	ib_ongoingfind = False
boolean	ib_includecomputes = False				//  Added for 8.0

n_cst_findattrib 	inv_findattrib
end variables

forward prototypes
public function integer of_initialize (n_cst_findattrib anv_findattrib)
protected function string of_buildfindexpression (string as_find, string as_column)
protected function boolean of_compareattrib (n_cst_findattrib anv_findattrib)
protected function boolean of_isongoingfind (n_cst_findattrib anv_findattrib)
public function long of_find (string as_column, string as_find, long al_startrow, long al_endrow)
protected function integer of_selecttext (string as_colname, long al_row, boolean ab_matchcase, string as_find)
protected function integer of_findstartandendrows (ref long al_startrow, ref long al_endrow)
protected function integer of_replace (long al_row, string as_colname, string as_replacewith)
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_setallowfinddlg (boolean ab_switch)
public function boolean of_isallowfinddlg ()
public function boolean of_IsAllowReplaceDlg ()
public function integer of_SetAllowReplaceDlg (boolean ab_switch)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
protected function long of_find ()
public function integer of_includecomputes (boolean ab_switch)
protected function integer of_buildcolumnnames (boolean ab_replacelist)
end prototypes

event pfc_findnext;//////////////////////////////////////////////////////////////////////////////
//
//	Event: 			pfc_findnext
//
//	Arguments:
//	anv_findattrib Reference of search attributes
//
//	Returns:  		long
//						search results
//
//	Description:	This event is called to start the search
//						using the current attribute settings.
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
long		ll_row

If ib_ongoingfind Then
	//Determine if this continues to be an Ongoing Find. 
	ib_ongoingfind = of_IsOnGoingFind(anv_findattrib)
End If

//Stored in the service the passed arguments.
inv_findattrib = anv_findattrib

//Build the find expression.
is_findexpression = of_BuildFindExpression(inv_findattrib.is_find, &
	inv_findattrib.is_lookdata[inv_findattrib.ii_lookindex])
If is_findexpression = '!' Then Return 0

//Perform the find operation.
ll_row = of_Find ()

//Return find row.
return ll_row
end event

event type long pfc_replace(n_cst_findattrib anv_findattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Event:  				pfc_replace
//
//	Arguments:
//	anv_findattrib		search attributes.
//
//	Returns:  			integer
//							 The find results..
//							 0 = No row was found.
//							-1 = Error;
//									No FindNext was performed.
//							-2 = The replace operation was not valid because the
//									ReplaceWith value was not of the correct type;
//									or the field is protected;
//									No FindNext was performed.
//
//	Description:  		Search and replace using the passed in settings.
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
long  	ll_row
long		ll_currrow
string	ls_colname
integer	li_rc
string	ls_coleditstatus

If ib_ongoingfind Then
	//Determine if this continues to be an Ongoing Find. 
	ib_ongoingfind = of_IsOnGoingFind(anv_findattrib)
End If

//Make a copy of passed argument.
inv_findattrib = anv_findattrib

//Get the current row.
ll_currrow = idw_requestor.GetRow()

//Get the current column.
ls_colname = inv_findattrib.is_lookdata[inv_findattrib.ii_lookindex]

//Get the column edit status.
ls_coleditstatus = of_GetColumnEditStatus(ls_colname, ll_currrow)

//Determine if the current row/column can be replaced.
If ls_coleditstatus = 'editable' Then

	//Build find expression.
	is_findexpression = of_BuildFindExpression(inv_findattrib.is_find, ls_colname)
	If is_findexpression = '!' Then Return 0

	If idw_requestor.GetColumnName() = ls_colname Then
		//Attempt to replace the selected text.
		li_rc = of_replace(ll_currrow, ls_colname, inv_findattrib.is_replacewith)
		If li_rc = 1 Then
			/* Replace was successful. */
			ib_replaced = True
		ElseIf li_rc = 0 Then
			/* Replacing of text was not appropriate. Not an error*/
		ElseIf li_rc <= -1 Then
			/* An unappropriate action was selected */
			Return li_rc
		End If
	End If
	
End If

//Perform the find operation.
ll_row = of_Find()

return ll_row
end event

event pfc_replaceall;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  				pfc_replaceall
//
//	Arguments:
//	anv_findattrib		nvo-structure - reference of search attributes
//
//	Returns:  			none
//
//	Description:  		This event is called dynimaclly to search and replace all
//							instances of the text using the current settings.
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
integer	li_counter=0
integer	li_rc

SetPointer(HourGlass!)
			
idw_requestor.SetRedraw(False)			
DO
	ib_replaced = False
	li_rc = this.Event pfc_Replace(anv_findattrib)
	If ib_replaced Then li_counter ++
LOOP UNTIL li_rc <= 0
idw_requestor.SetRedraw(True)

return li_counter
end event

event pfc_finddlg;//////////////////////////////////////////////////////////////////////////////
//	Event:				pfc_finddlg
//	Arguments:			None
//	Returns:  			None
//	Description:			Begin a search based on current settings
//							of the nvo-structure inv_findattrib with the find dialog. 
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							5.0			Initial version
// 							5.0.02		Close existing Dialog window prior to displaying the new Dlg window.
// 							6.0			Enhanced with pfc_prefinddlg capabilities.
// 							6.0			Enhanced to use new Allow Dialog attribute.
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
integer li_rc

//Make sure is allowed to open dialog.
If Not of_IsAllowFindDlg() Then Return

//Validate required reference.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then Return

//Close existing Dialog window prior to displaying the new Dlg window.
If IsValid(w_replace) Then Close(w_replace)
If IsValid(w_find) Then Close(w_find)

//Set this object as the requestor.
inv_findattrib.ipo_requestor = this

//Look Options are required for Column Searches.
inv_findattrib.ib_lookvisible = True
inv_findattrib.ib_lookenabled = True

//Whole word capabilities are not supported on column searches.
inv_findattrib.ib_wholewordvisible =False
inv_findattrib.ib_wholewordenabled =False
inv_findattrib.ib_wholeword = False

//Build the Column List for the Find operation.
//The Find list is build everytime to catch for possible manipulation of the
//columns.  i.e., columns changing between visible and not visible.
li_rc = of_BuildColumnNames (False)

//Pfc_prefinddlg capabilities.
idw_requestor.Event pfc_prefinddlg(inv_findattrib)

//Open find window.
OpenWithParm(w_find, inv_findattrib)
end event

event pfc_replacedlg;//////////////////////////////////////////////////////////////////////////////
//	Event:				pfc_replacedlg
//	Arguments:			None
//	Returns:  			None
//	Description:			Call the replace dialog window.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History			Version
//							5.0   		Initial version
// 							5.0.02		Close existing Dialog window prior to displaying the new Dlg window.
//							6.0			Enhanced with pfc_prereplacedlg capabilities.
// 							6.0			Enhanced to use new Allow Dialog attribute.
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
integer li_rc

//Make sure is allowed to open dialog.
If Not of_IsAllowReplaceDlg() Then Return

//Validate required reference.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then Return

//Close existing Dialog window prior to displaying the new Dlg window.
If IsValid(w_replace) Then Close(w_replace)
If IsValid(w_find) Then Close(w_find)

//Set this object as the requestor.
inv_findattrib.ipo_requestor = this

//Look Options are required for Column Searches.
inv_findattrib.ib_lookvisible = True
inv_findattrib.ib_lookenabled = True

//Whole word capabilities are not supported on column searches.
inv_findattrib.ib_wholewordvisible =False
inv_findattrib.ib_wholewordenabled =False
inv_findattrib.ib_wholeword = False

//Build the Column List for the Replace operation.
//The Replace list is build everytime to catch for possible manipulation of the
//columns between visible and not visible.
li_rc = of_BuildColumnNames (True)

//Pfc_prereplacedlg capabilities.
idw_requestor.Event pfc_prereplacedlg(inv_findattrib)

//Open Replace window.
OpenWithParm(w_replace, inv_findattrib)
end event

public function integer of_initialize (n_cst_findattrib anv_findattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_initialize
//
//	Access:  		public
//
//	Arguments:		
//	anv_findattrib	NonVisual holding the desired initial values.
//
//	Returns:  		Integer
//
//	Description:  	Initialize the options for this service.
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
//Check arguments.
If IsNull(anv_findattrib) Or Not IsValid(anv_findattrib) Then
	Return -1
End If

inv_findattrib.is_find = anv_findattrib.is_find
inv_findattrib.is_replacewith  = anv_findattrib.is_replacewith

//Whole word capabilities are not supported on column searches.
inv_findattrib.ib_wholewordvisible =False
inv_findattrib.ib_wholewordenabled =False
inv_findattrib.ib_wholeword = False

inv_findattrib.ib_matchcasevisible = anv_findattrib.ib_matchcasevisible
inv_findattrib.ib_matchcaseenabled = anv_findattrib.ib_matchcaseenabled
inv_findattrib.ib_matchcase = anv_findattrib.ib_matchcase

inv_findattrib.ib_directionvisible = anv_findattrib.ib_directionvisible
inv_findattrib.ib_directionenabled = anv_findattrib.ib_directionenabled
inv_findattrib.is_direction = anv_findattrib.is_direction

//Look Options are required for Column Searches.
inv_findattrib.ib_lookvisible = True
inv_findattrib.ib_lookenabled = True

Return 1
end function

protected function string of_buildfindexpression (string as_find, string as_column);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_BuildFindExpression
//
//	Access:  		protected
//
//	Arguments: 		
//	as_find			String being searched for.
//	as_column		The column to search in.
//
//	Returns:  		string
//						String expression to use in search.
//						'!' if an error is encountered.
//
//	Description:  	This function build the string that is passed to the 
//						find function.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Handle searching of quotes.
//	12.5	Number conversion to handle other number formats (like 1.234,56) #11010
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
string	ls_findexp
string	ls_coltype
string	ls_editstyle
n_cst_string lnv_string

//Check arguments.
If IsNull(as_find) or Len(as_find)=0 or &
	IsNull(as_column) or Len(Trim(as_column))=0 Then
	Return '!'
End If

//Check required.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then
	Return '!'
end If

//Get the column type and edit style.
ls_coltype = idw_requestor.describe(as_column+".coltype")
ls_editstyle = idw_requestor.Describe(as_column+".Edit.Style")

//Create the string according to the column type and edit style.
If ls_editstyle='dddw' or ls_editstyle='ddlb' Then
	// Handle searching of quotes by replacing them with the special characters.
	If Pos(as_find, "'") > 0 Then
		as_find = lnv_string.of_GlobalReplace (as_find, "'", "~~'", FALSE)
	End If	
	
	//Add the MatchCase attributes.
	if inv_findattrib.ib_matchcase THEN
		ls_findexp = "Pos(LookUpDisplay(" +as_column+ "),'" + as_find + "') > 0"
	else
		ls_findexp = "Pos(Lower(LookUpDisplay(" +as_column+ ")),'" +Lower(as_find)+ "') > 0"
	end if
Else
	//Process according to the column type.
	Choose Case Left(Lower(ls_coltype),4)
		Case 'long', 'inte'
			If IsNumber(as_find) Then
				ls_findexp = as_column+ " = Long ('" + as_find + "')"
			Else
				ls_findexp = "!"
			End If
		Case 'numb', 'deci'
			If IsNumber(as_find) Then
				ls_findexp = as_column+ " = Dec ('" + as_find + "')"
			Else
				ls_findexp = "!"
			End If
		Case 'date'
			If IsDate(as_find) Then
				ls_findexp = as_column+ " = Date ('" + as_find + "')"
			Else
				ls_findexp = "!"
			End If			
		Case 'time'	
			If IsTime(as_find) Then
				ls_findexp = as_column+ " = Time ('" + as_find + "')"
			Else
				ls_findexp = "!"
			End If				
		Case Else
			// Handle searching of quotes by replacing them with the special characters.
			If Pos(as_find, "'") > 0 Then
				as_find = lnv_string.of_GlobalReplace (as_find, "'", "~~'", FALSE)
			End If				
			
			//Add the MatchCase attributes.
			if inv_findattrib.ib_matchcase THEN
				ls_findexp = "Pos(" +as_column+ ",'" + as_find + "') > 0"
			else
				ls_findexp = "Pos(Lower(" +as_column+ "),'" +Lower(as_find)+ "') > 0"
			end if
	End Choose
End If

Return ls_findexp
end function

protected function boolean of_compareattrib (n_cst_findattrib anv_findattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  			of_CompareAttrib
//
//	Access:  			protected
//
//	Arguments: 
//	anv_findattrib		nvo structure to compare
//
//
//	Returns: 			boolean 
//							true - the structures are the same
//							false - the structures are not the same
//
//	Description: 		This function is called to replace text found in search.
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
//If any of the attributes do not match, return false
if anv_findattrib.is_find <> inv_findattrib.is_find then return false
if anv_findattrib.is_replacewith <> inv_findattrib.is_replacewith then return false
if anv_findattrib.ib_wholeword <> inv_findattrib.ib_wholeword then return false
if anv_findattrib.ib_matchcase <> inv_findattrib.ib_matchcase then return false
if anv_findattrib.is_direction <> inv_findattrib.is_direction then return false

//The structures match.
return true
end function

protected function boolean of_isongoingfind (n_cst_findattrib anv_findattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_IsOnGoingFind
//
//	Access:  		protected
//
//	Arguments:		
//	anv_findattrib	Copy of structure holding all find/replace flags.
//
//	Returns:  		Boolean
//						True - This is an ongoing find.
//						False - This is not an ongoing find.
//						Null - if an error occurrs.
//
//	Description:  	Determines if the current find operation is a brand new
//						Find or a FindNext operation.
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

//Check required.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then
	boolean lb_null
	SetNull (lb_null)
	Return lb_null
end If

//Check if find/replace criteria was changed on visual object.
If IsValid(anv_findattrib) Then
	if NOT of_CompareAttrib(anv_findattrib) THEN
		Return False
	end if
End If

//Check that the current row is the same as the last found row.
If il_lastfindrow <> idw_requestor.GetRow() Then
	Return False
End If

//Check that the current column is the same as the last found column.
If idw_requestor.GetColumnName() <> is_lastfindcolumn Then
	Return False
End If

Return True
end function

public function long of_find (string as_column, string as_find, long al_startrow, long al_endrow);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Find
//
//	Access:  		public
//
//	Arguments: 	
//	as_column		Column name to search.
//	as_find			Text to search for.
//	al_startrow		Row number to start search.
//	al_endrow		Row number to end search.
//
//	Returns:  		long
//						Row number where text was found, or
//						0 if not found
//						-1 if an error is encountered.
//
//	Description: 	Search on a specific column, for a specific value, with a
//						starting row, and an ending row. 
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

string   ls_findexp
long		ll_rowfound

//Check arguments
If IsNull(as_column) or Len(Trim(as_column))=0 or &
	IsNull(as_find) or Len(Trim(as_find))=0 or &
	IsNull(al_startrow) or al_startrow < 0 or &
	IsNull(al_endrow)	or al_endrow < 0 Then
	Return -1
End If

//Check required.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then
	Return -1
end If

//Build the find expression to search the dw.
ls_findexp = of_BuildFindExpression(as_find, as_column)
If ls_findexp = "!" Then Return -1

//Get the starting row for which the search text was found.
ll_rowfound = idw_requestor.Find (ls_findexp, al_startrow, al_endrow)

//Return search results.
return ll_rowfound
end function

protected function integer of_selecttext (string as_colname, long al_row, boolean ab_matchcase, string as_find);//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_SelectText
//
//	Access:  		protected
//
//	Arguments: 		
//	as_colname		The column name.
//	al_row			The row.
//	ab_matchcase	Match case flag.
//	as_find			The find string.
//
//	Returns:  		Integer
//						1 if it succeeds.
//						0 Selection of text is not appropriate.
//
//	Description:  	Selects the appropriate text on the column/row.  Function 
//						takes into consideration the column may be a dropdowndatawindow,
//						dropdownlistbox, or a string with an editmask.
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

string	ls_find, ls_maskedfind
integer	li_find_startpos, li_find_selectedtextlen
integer	li_maskedfind_textlen, li_maskedfind_startpos, li_maskedfind_selectedtextlen
integer	li_i, li_count
string	ls_coltype, ls_editstyle

//Check required.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then
	Return -1
end If

//////////////////////////////////////////////////////////////////////////////
//Get the current column, columntype, and editstyle
//////////////////////////////////////////////////////////////////////////////
ls_coltype = idw_requestor.describe(as_colname+".coltype")
ls_editstyle = idw_requestor.Describe(as_colname+".Edit.Style")

//////////////////////////////////////////////////////////////////////////////
// If the editstyle of the column is of dddw or ddlb use the LookUpDisplay 
// value.
//////////////////////////////////////////////////////////////////////////////
If ls_editstyle='dddw' or ls_editstyle='ddlb' Then
	If idw_requestor.Describe(as_colname+".ddlb.AllowEdit") = 'yes' or &
		idw_requestor.Describe(as_colname+".dddw.AllowEdit") = 'yes' Then
		//Get the LookUpDisplay value.
		ls_find = idw_requestor.Describe( &
			"Evaluate('LookUpDisplay("+as_colname+")',"+string(al_row)+")")
		//Determine the "LookUpDisplay" starting position and its length.
		If ab_matchcase Then
			li_find_startpos = Pos (ls_find, as_find)
		Else			
			li_find_startpos = Pos (Lower(ls_find), Lower(as_find))
		End If
		li_find_selectedtextlen = Len(as_find)			
		//Select the appropriate portion of the LookUpDisplay value.
		idw_requestor.SelectText(li_find_startpos, li_find_selectedtextlen)		
		Return 1
	End If
End If

//////////////////////////////////////////////////////////////////////////////
// If the column is of character then only select the matching characters 
// within the string.
// Determine the simple find case for a string case.. 
//////////////////////////////////////////////////////////////////////////////
If Left(Lower(ls_coltype),4) = 'char' Then
	//Get complete "Find" string.
	ls_find = idw_requestor.GetItemString(al_row, as_colname)

	//Determine the "Find" starting position and its length.
	If ab_matchcase Then
		li_find_startpos = Pos (ls_find, as_find)
	Else			
		li_find_startpos = Pos (Lower(ls_find), Lower(as_find))
	End If
	li_find_selectedtextlen = Len(as_find)
End If

//////////////////////////////////////////////////////////////////////////////
//	Process strings that have NO editmask
//////////////////////////////////////////////////////////////////////////////
//If a string find, then only select the matching text.
If Left(Lower(ls_coltype),4) = 'char' Then
	If ls_editstyle<>"editmask" Then
		//Select the appropriate text
		idw_requestor.SelectText(li_find_startpos, li_find_selectedtextlen)
		Return 1
	End If
End If

//////////////////////////////////////////////////////////////////////////////
//	Process strings that have an editmask.
//////////////////////////////////////////////////////////////////////////////
//If a string find, then only select the matching text.
If Left(Lower(ls_coltype),4) = 'char' Then
	If ls_editstyle="editmask" Then
		//Get "Masked Find"  and its appropriate length.
		ls_maskedfind = of_GetItem(al_row, as_colname)
		li_maskedfind_textlen = Len(ls_maskedfind)

		//Determine the "Masked Find" starting position and its length.
		li_count = 1
		For li_i = 1 to li_maskedfind_textlen
			If Mid(ls_find, li_count, 1) =  Mid(ls_maskedfind, li_i, 1) Then
				If li_count = li_find_startpos Then
					li_maskedfind_startpos = li_i
				End If
				If li_count = li_find_startpos+li_find_selectedtextlen -1 Then
					li_maskedfind_selectedtextlen = li_i - (li_maskedfind_startpos -1)
					Exit
				End If
				li_count ++							
			End If
		Next

		//Select the appropriate editmasked text.
		idw_requestor.SelectText(li_maskedfind_startpos, li_maskedfind_selectedtextlen)
		Return 1
	End If
End If	

Return 0
end function

protected function integer of_findstartandendrows (ref long al_startrow, ref long al_endrow);//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_FindStartAndEndRows
//
//	Access:  		protected
//
//	Arguments: 		
//	al_startrow		The row the find should start looking in. (by Reference)
//	al_endrow		The row the find will stop looking in.	(by Reference)
//
//	Returns:  		Integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs.
//						0 if the point of no more searches has been reached.
//
//	Description:  	Determine what the Starting row and the Ending row should
//						be for the Find statement.
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

//Validate the direction attribute.
If Lower(inv_findattrib.is_direction) <> "up" And &
	Lower(inv_findattrib.is_direction) <> "down" Then
	inv_findattrib.is_direction = "Down"
End If

//Check required.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then
	Return -1
end If

//Get the current row.
al_startrow = idw_requestor.GetRow()

//Determine the start and end rows for the find.
CHOOSE CASE Lower(inv_findattrib.is_direction)
	CASE "up"
		al_endrow = 1
		If ib_ongoingfind Then 
			//For ongoing finds do not search on the current row.
			If al_startrow - 1 >= al_endrow Then
				al_startrow --
			Else
				Return 0
			End If
		End If
	CASE Else 
		// "down"
		al_endrow = idw_requestor.RowCount()		
		If ib_ongoingfind Then		
			//For ongoing finds do not search on the current row.			
			If al_startrow + 1 <= al_endrow Then
				al_startrow ++
			Else
				Return 0
			End If
		End If
END CHOOSE

Return 1
end function

protected function integer of_replace (long al_row, string as_colname, string as_replacewith);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Replace
//
//	Access:  		protected
//
//	Arguments: 	
//	al_row			The row number for the value that may be replaced.
//	as_column		The column name for the value that may be replaced.
//	as_replacewith	The value to replace with.
//
//	Returns:  		integer
//						1 if it succeeds and$$HEX1$$a000$$ENDHEX$$-1 if an error occurs. 
//
//	Description: 	Replace on a specific row and column, with a specific value.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.03 Corrected Matchcase attribute being ignored.
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

string 	ls_selectedtext
string	ls_coltype
string	ls_find
integer	li_rc=0
integer	li_count, li_i
boolean 	lb_replacechars=False
integer	li_find_startpos
string	ls_editstyle
string	ls_maskedfind, ls_maskedfind_selectedtext
integer	li_maskedfind_textlen, li_maskedfind_startpos, li_maskedfind_selectedtextlen

//Get the current column, columntype, and editstyle
ls_coltype = idw_requestor.describe(as_colname+".ColType")
ls_editstyle = idw_requestor.Describe(as_colname+".Edit.Style")

//Get the currently selected text.
ls_selectedtext = idw_requestor.SelectedText()

//Process according to the column type.
//Check that the ReplaceWith value is appropriate for the column type.
Choose Case Left(Lower(ls_coltype),4)
	Case 'numb', 'long', 'inte'
		If IsNumber(ls_selectedtext) and IsNumber(inv_findattrib.is_find) Then
			If Long(ls_selectedtext) = Long(inv_findattrib.is_find) Then
				If IsNumber(inv_findattrib.is_replacewith) Then
					li_rc = idw_requestor.SetItem(al_row, as_colname, &
					 			Long(inv_findattrib.is_replacewith))
				Else
					of_MessageBox ('pfc_find_replaceinvalidnumber', 'Replace', &
						'The Replace With value is not a valid number.', Information!, Ok!, 1)
					li_rc = -2
				End If										
			End If
		End If
		Return li_rc /* numb, long, inte */
		
	Case 'ulon'
		If IsNumber(ls_selectedtext) and IsNumber(inv_findattrib.is_find) Then
			If Long(ls_selectedtext) = Long(inv_findattrib.is_find) Then
				If IsNumber(inv_findattrib.is_replacewith) Then
					If Long(inv_findattrib.is_replacewith) > 0 Then
 						li_rc = idw_requestor.SetItem(al_row, as_colname, &
						 			Long(inv_findattrib.is_replacewith))
					Else
						of_MessageBox ('pfc_find_replaceinvalidnumber', 'Replace', &
							'The Replace With value is not a valid number.', Information!, Ok!, 1)
						li_rc = -2
					End If														
				Else
					of_MessageBox ('pfc_find_replaceinvalidnumber', 'Replace', &
						'The Replace With value is not a valid number.', Information!, Ok!, 1)					
					li_rc = -2
				End If										
			End If
		End If	
		Return li_rc /* ulon */
		
	Case 'deci'
		If IsNumber(ls_selectedtext) and IsNumber(inv_findattrib.is_find) Then
			If Dec(ls_selectedtext) = Dec(inv_findattrib.is_find) Then
				If IsNumber(inv_findattrib.is_replacewith) Then
					li_rc = idw_requestor.SetItem(al_row, as_colname, &
								Dec(inv_findattrib.is_replacewith))
				Else
					of_MessageBox ('pfc_find_replaceinvalidnumber', 'Replace', &
						'The Replace With value is not a valid number.', Information!, Ok!, 1)					
					li_rc = -2
				End If									
			End If
		End If	
		Return li_rc /* Deci */
		
	Case 'date'
		If IsDate(ls_selectedtext) and IsDate(inv_findattrib.is_find) Then
			If Date(ls_selectedtext) = Date(inv_findattrib.is_find) Then
				If IsDate(inv_findattrib.is_replacewith) Then
					li_rc = idw_requestor.SetItem(al_row, as_colname, &
								Date(inv_findattrib.is_replacewith))
				Else
					of_MessageBox ('pfc_find_replaceinvaliddate', 'Replace', &
						'The Replace With value is not a valid date.', Information!, Ok!, 1)					
					li_rc = -2
				End If								
			End If
		End If
		Return li_rc /* Date */
		
	Case 'time'	
		If IsTime(ls_selectedtext) and IsTime(inv_findattrib.is_find) Then
			If Time(ls_selectedtext) = Time(inv_findattrib.is_find) Then
				If IsTime(inv_findattrib.is_replacewith) Then
					li_rc = idw_requestor.SetItem(al_row, as_colname, &
								Time(inv_findattrib.is_replacewith))
				Else
					of_MessageBox ('pfc_find_replaceinvalidtime', 'Replace', &
						'The Replace With value is not a valid time.', Information!, Ok!, 1)					
					li_rc = -2
				End If								
			End If
		End If	
		Return li_rc /* Time */		
		
	Case 'char' 
		If of_Find(as_colname, inv_findattrib.is_find, al_row, al_row) = al_row Then
			//Get the entire string.
			ls_find = idw_requestor.GetItemString(al_row, as_colname)

			If (inv_findattrib.ib_matchcase) Then
				li_find_startpos = Pos(ls_find, inv_findattrib.is_find)
			Else
				li_find_startpos = Pos(Lower(ls_find),Lower(inv_findattrib.is_find))
			End If

			//Handle edimask fields.
			If ls_editstyle='editmask' Then
				//Check if the selected text matches the the "Find string".
				//Get "Masked Find"  and its appropriate length.
				ls_maskedfind = of_GetItem(al_row, as_colname)
				li_maskedfind_textlen = Len(ls_maskedfind)
				li_maskedfind_startpos = Pos (ls_maskedfind, ls_selectedtext)
				li_maskedfind_selectedtextlen = Len(ls_selectedtext)
				
				li_count = 1
				For li_i = 1 to li_maskedfind_textlen
					If Mid(ls_find, li_count, 1) =  Mid(ls_maskedfind, li_i, 1) Then
						If li_i >= li_maskedfind_startpos And &
							li_i <= li_maskedfind_startpos + (li_maskedfind_selectedtextlen -1) Then
							ls_maskedfind_selectedtext = ls_maskedfind_selectedtext + Mid(ls_find, li_count, 1)
						ElseIf li_i > li_maskedfind_startpos + (li_maskedfind_selectedtextlen -1) Then
								Exit
						End If
						li_count ++							
					End If
				Next 
				
				//Check if the selected text matches the the "Find string".					
				If (inv_findattrib.ib_matchcase And &
						ls_maskedfind_selectedtext = inv_findattrib.is_find) Or &
					(Not inv_findattrib.ib_matchcase And &
						Lower(ls_maskedfind_selectedtext) = Lower(inv_findattrib.is_find)) Then
					lb_replacechars = True
				End If
			Else
				//Check if the selected text matches the the "Find string".
				If (inv_findattrib.ib_matchcase And &
						ls_selectedtext = inv_findattrib.is_find) Or &
					(Not inv_findattrib.ib_matchcase And &
						Lower(ls_selectedtext) = Lower(inv_findattrib.is_find)) Then
					lb_replacechars = True
				End If
			End If
				
			If lb_replacechars Then
				//Replace the "Find" characters with the "ReplaceWith" characters.
				ls_find = Replace(ls_find, li_find_startpos, Len(inv_findattrib.is_find), &
							inv_findattrib.is_replacewith)
				li_rc = idw_requestor.SetItem(al_row, as_colname, ls_find)
			End If
		End If
		Return li_rc /* Char */
		
	Case Else
		//Code should never reach this line.		
		Return -1
End Choose

//Code should never reach this line.
Return -1
end function

public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetInfo
//
//	Access:   		Public
//
//	Arguments:		
//		anv_infoattrib	(By reference) The Information attributes.
//
//	Returns:  		Integer
//	 1 for success.
//	-1 for error.
//
//	Description:  
//	 Gets the Service Information.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0    Initial version
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

// Populate Information.
anv_infoattrib.is_name = 'Find and Replace'
anv_infoattrib.is_description = &
	'Provides Find and Find/Replace dialogs to facilitate the finding and/or '+&
	'replacing of column data.'

Return 1
end function

public function integer of_setallowfinddlg (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetAllowFindDlg
//
//	Access:    	Public
//
//	Arguments:
// ab_switch-	switch to allow the Find Dialog window.
//
//	Returns:  		Integer
// 1  if it succeeds
//	-1 if an error occurs.
//
//	Description: 	
//	Set switch to allow the Find Dialog window.
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
If IsNull(ab_switch) Then Return -1
	
ib_allowfinddlg = ab_switch
Return 1
end function

public function boolean of_isallowfinddlg ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_IsAllowFindDlg
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:  Boolean
// Switch that determines if the Find Dialog window is allowed.
//
//	Description: 	
//	Get switch that determines if the Find Dialog window is allowed.
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

Return ib_allowfinddlg
end function

public function boolean of_IsAllowReplaceDlg ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_IsAllowReplaceDlg
//
//	Access:    	Public
//
//	Arguments:	None
//
//	Returns:  Boolean
// Switch that determines if the Replace Dialog window is allowed.
//
//	Description: 	
//	Get switch that determines if the Find Replace window is allowed.
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

Return ib_allowreplacedlg
end function

public function integer of_SetAllowReplaceDlg (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  	of_SetAllowReplaceDlg
//
//	Access:    	Public
//
//	Arguments:
// ab_switch-	switch to allow the Replace Dialog window.
//
//	Returns:  		Integer
// 1  if it succeeds
//	-1 if an error occurs.
//
//	Description: 	
//	Set switch to allow the Replace Dialog window.
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
If IsNull(ab_switch) Then Return -1
	
ib_allowreplacedlg = ab_switch
Return 1
end function

public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetPropertyInfo
//
//	Access:   		Public
//
//	Arguments:		
//		anv_attrib	(By ref.) The Property Information attributes.
//
//	Returns:  		Integer
//	 1 for success.
//	-1 for error.
//
//	Description:  
//	 Gets the Service Property Information.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0    Initial version
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

n_cst_infoattrib lnv_infoattrib

// Get the first two attributes from the Main Information attributes.
of_GetInfo(lnv_infoattrib)
anv_attrib.is_name = lnv_infoattrib.is_name
anv_attrib.is_description = lnv_infoattrib.is_description

// Set the rest of the attributes.
anv_attrib.is_propertypage = {'u_tabpg_dwproperty_srvfind'}
anv_attrib.ib_switchbuttons = True

Return 1
end function

protected function long of_find ();//////////////////////////////////////////////////////////////////////////////
//	Protected Function:		of_Find
//	Arguments: 					none
//	Returns:  					long
//									row number found
//						 			0 - not found (end of search)
//	Description:					Searches datawindow using current settings and returns the	row number.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History					Version
//									5.0			Initial version
// 									5.0.02		Added SelectText() to highlight found value.
// 									7.0			Changed the datatype of li_rowfound to long to provide support for > 32K rows
//									8.0			Changed SetColumn when columnn does not have taborder.  In this case, row
//												will be highlighted instead.
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
string	ls_colname
string	ls_coleditstatus
long		ll_startrow, ll_endrow, ll_rowfound
integer	li_rc

//Check required.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then
	Return -1
end If

//Get the current column.
ls_colname = inv_findattrib.is_lookdata[inv_findattrib.ii_lookindex]

//Determine the start and end rows for the find.
li_rc = of_FindStartAndEndRows (ll_startrow, ll_endrow)
If li_rc <= 0 Then
	ib_ongoingfind	= False
	return 0
End If

//Find the row that meets the expression and the Starting and Ending rows.
ll_rowfound = idw_requestor.Find (is_findexpression, ll_startrow, ll_endrow)
If IsNull(ll_rowfound) or ll_rowfound <= 0 Then
	ib_ongoingfind	= False
	return 0
End If

//The find was successful.
ib_ongoingfind = True

//Set focus on the row/column just found.
idw_requestor.ScrollToRow (ll_rowfound)
If Integer ( idw_requestor.Describe ( ls_colname + ".tabsequence" ) ) > 0 Then
	idw_requestor.SetColumn(ls_colname)
Else
	idw_requestor.SelectRow ( ll_rowfound, True ) 
End If
idw_requestor.SetFocus()
If ls_colname = idw_requestor.GetColumnName() Then
	idw_requestor.SelectText (1, 99999)
End If

//Only select the text if the column can receive focus.
ls_coleditstatus = of_GetColumnEditStatus(ls_colname, ll_rowfound)
If ls_coleditstatus = 'editable' or ls_coleditstatus='readonly' Then
	of_SelectText(ls_colname, ll_rowfound, inv_findattrib.ib_matchcase, inv_findattrib.is_find)
End If

//Set last found row and column.
il_lastfindrow = ll_rowfound
is_lastfindcolumn = idw_requestor.GetColumnName()

//Return the found row.
return ll_rowfound
end function

public function integer of_includecomputes (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//	Public Function:			of_IncludeComputes
//	Arguments:				ab_switch 	Include Computed Columns / Fields in the Find Dialog
//	Returns:  				Integer - 1 if successful, otherwise -1
//	Description: 			Sets an indicate which when true allows computed columns to be
//								included in the Find Dialog.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History				Version
//								8.0   	Initial version
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
//Check required.
if IsNull(ab_switch) then return -1

ib_includecomputes = ab_switch

return 1
end function

protected function integer of_buildcolumnnames (boolean ab_replacelist);//////////////////////////////////////////////////////////////////////////////
//	Protected Function:	of_BuildColumnNames
//	Arguments:				ab_replacelist	Replace list of column names flag.
//	Returns:  				Integer:
//								The number of columns
//								-1 if an error is encountered.
//	Description: 			Populate the array with the column names to use for the find or find/replace dialog window. 
//								The list is different depending if it will be used with the find dialog, or if	it will be used
//								with the find/replace dialog.	This will be used with an index that is set when the user selects
//								the header label name from the dialog window.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History				Version
//								5.0   Initial version
//								8.0	   Check Option to include computes in Find Dialog List
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
integer	li_objects
integer	li_count=0
integer	li_i
string	ls_headernm
string	ls_obj_column[]
string	ls_oldlookdata
string	ls_oldfind
string	ls_oldreplacewith
string	ls_editstyle
string ls_type

//Check required.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then
	Return -1
end If

//Store the previous current look data (if any)
If inv_findattrib.ii_lookindex > 0 And &
	UpperBound(inv_findattrib.is_lookdata) >= inv_findattrib.ii_lookindex Then
	ls_oldlookdata = inv_findattrib.is_lookdata[inv_findattrib.ii_lookindex]
	ls_oldfind = inv_findattrib.is_find
	ls_oldreplacewith = inv_findattrib.is_replacewith
End If

//Reset the current index, find, and replace information.
inv_findattrib.ii_lookindex = 0
inv_findattrib.is_find = ''
inv_findattrib.is_replacewith = ''
inv_findattrib.is_lookdata = ls_obj_column[]
inv_findattrib.is_lookdisplay = ls_obj_column[]

//////////////////////////////////////////////////////////////////////////////
// populate string array for the user to select column from.
//////////////////////////////////////////////////////////////////////////////

//First get the Visible column names to use in search.
If (not ab_replacelist) and ib_includecomputes Then
	li_objects = of_GetObjects ( ls_obj_column, "*", "*", True )
Else
	li_objects = of_GetObjects ( ls_obj_column, "column", "*", True )
End If

//Get a list of all text objects associated with the column labels
FOR li_i=1 TO li_objects
	ls_type = idw_requestor.Describe(ls_obj_column[li_i]+".Type")
	If (not ab_replacelist) and ib_includecomputes Then
		If ( ls_type <> "column") And ( ls_type <> "compute") Then Continue
	End If
	//Determine if the column is of unwanted type.
	ls_editstyle = idw_requestor.Describe(ls_obj_column[li_i]+".Edit.Style")
	If ls_editstyle='checkbox' or ls_editstyle='radiobuttons' Then
		Continue
	End If
	
	//If the list is being costructed for Replace then do not show 
	//DropDownDataWindow, DropDownListBoxes, Tab=0 Columns, or Display 
	//only columns.   Protected columns will still be 
	//shown since it could be a row dependendent.
	If ab_replacelist Then
		If ls_editstyle='dddw' or &
			ls_editstyle='ddlb' or &
			idw_requestor.Describe(ls_obj_column[li_i]+".TabSequence") = "0" or &
			idw_requestor.Describe(ls_obj_column[li_i]+".Edit.DisplayOnly") = "yes" Then
			Continue
		End If
	End If
	
	//Add the column name and column label to the array	
	li_count ++
	ls_headernm= of_GetHeaderName ( ls_obj_column[li_i] )
	inv_findattrib.is_lookdata[li_count] = ls_obj_column[li_i]
	inv_findattrib.is_lookdisplay[li_count] = ls_headernm

	//Reset the Index value (if any)
	If ls_oldlookdata = inv_findattrib.is_lookdata[li_count] Then
		inv_findattrib.ii_lookindex = li_count
		inv_findattrib.is_find = ls_oldfind
		inv_findattrib.is_replacewith = ls_oldreplacewith	
	End If
NEXT

Return li_count
end function

on pfc_n_cst_dwsrv_find.destroy
call super::destroy
end on

on pfc_n_cst_dwsrv_find.create
call super::create
end on

event destructor;call super::destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			destructor
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:  	Perform cleanup.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0.03 Initial version
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

//Close any existing Dialog windows.
if IsValid(w_replace) then 
	Close(w_replace)
end if

if IsValid(w_find) then 
	Close(w_find)
end if
end event

