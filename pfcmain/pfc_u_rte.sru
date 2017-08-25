HA$PBExportHeader$pfc_u_rte.sru
$PBExportComments$PFC RichText class
forward
global type pfc_u_rte from richtextedit
end type
end forward

global type pfc_u_rte from richtextedit
integer width = 343
integer height = 244
integer taborder = 1
borderstyle borderstyle = stylelowered!
event type integer pfc_clear ( )
event type integer pfc_cut ( )
event type integer pfc_copy ( )
event type integer pfc_paste ( )
event type integer pfc_undo ( )
event type integer pfc_selectall ( )
event type integer pfc_saveas ( )
event type integer pfc_save ( )
event pfc_prermbmenu ( ref m_edit am_edit )
event type boolean pfc_printpreview ( )
event type boolean pfc_ruler ( )
event type integer pfc_firstpage ( )
event type integer pfc_lastpage ( )
event type integer pfc_nextpage ( )
event type integer pfc_previouspage ( )
event type integer pfc_insertfile ( )
event type integer pfc_insertpicture ( )
event type integer pfc_open ( )
event type integer pfc_print ( )
event type integer pfc_printimmediate ( )
event pfc_finddlg ( )
event pfc_replacedlg ( )
end type
global pfc_u_rte pfc_u_rte

type variables
Public:
n_cst_rtefind	inv_find

Protected:
boolean		ib_IsObsolete
boolean 		ib_ongoingfind
boolean		ib_ignorefileexists
boolean		ib_continuouspages
boolean		ib_rmbmenu = true
long		il_startpagenumber = 1
long		il_currentprintpage
long		il_currentinstance = 1
string		is_filename
string		is_pageinputfield
n_cst_filesrv	inv_filesrv


end variables

forward prototypes
public function integer of_opendocument (ref string as_filename)
public function integer of_InsertDocument (ref string as_filename)
public function integer of_insertpicture (ref string as_filename)
public function boolean of_getignorefileexists ()
public subroutine of_setignorefileexists (boolean ab_ignorefileexists)
public subroutine of_setfilename (string as_filename)
public function string of_getfilename ()
public subroutine of_setpageinputfield (string as_pagefield)
public function string of_getpageinputfield ()
public function boolean of_getcontinuouspages ()
public subroutine of_setcontinuouspages (boolean ab_continuouspages)
public function integer of_gettextstyle (ref n_cst_textstyleattrib anv_textstyle)
public function integer of_settextstylebold (boolean ab_bold)
public function integer of_settextstyleunderline (boolean ab_underline)
public function integer of_settextstylesubscript (boolean ab_subscript)
public function integer of_settextstylesuperscript (boolean ab_superscript)
public function integer of_settextstyleitalic (boolean ab_italic)
public function integer of_settextstylestrikeout (boolean ab_strikeout)
public function integer of_getparentwindow (ref window aw_parent)
public function integer of_setfind (boolean ab_switch)
public subroutine of_setstartpagenumber (long al_startpagenumber)
public function long of_getstartpagenumber ()
protected function integer of_messagebox (string as_id, string as_title, string as_text, icon ae_icon, button ae_button, integer ai_default)
end prototypes

event pfc_clear;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_clear
//
//	(Arguments:		None)
//
//	(Returns:  		integer
//						Return value from the PowerScript Clear function)
//
//	Description:	Clear Text (no clipboard) functionality
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

Return this.Clear()
end event

event pfc_cut;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_cut
//
//	(Arguments:		None)
//
//	(Returns:  		integer
//						Return value from the PowerScript Cut function)
//
//	Description:	Cut the text to the clipboard.
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

Return this.Cut()
end event

event pfc_copy;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_copy
//
//	(Arguments:		None)
//
//	(Returns:  		integer
//						Return value from the PowerScript Copy function)
//
//	Description:	Copy the text to the clipboard.
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

Return this.Copy()
end event

event pfc_paste;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_paste
//
//	(Arguments:		None)
//
//	(Returns:  		integer
//						Return value from the PowerScript Paste function)
//
//	Description:	Paste the text from the clipboard.
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

Return this.Paste()
end event

event pfc_undo;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_undo
//
//	Arguments:  none
//
//	Returns:  integer
//	Return value from the PowerScript Undo function
//
//	Description:	Undo last action
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

Return this.Undo()

end event

event pfc_selectall;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			pfc_selectall
//
//	(Arguments:		None)
//
//	(Returns:  		integer
//						Return value from the PowerScript SelectTextAll function)
//
//	Description:	Select all the text.
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

// Select all text
Return SelectTextAll()
end event

event pfc_saveas;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_saveas
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = successful saveas performed
//	 0 = SaveAs not perfomed
//	-1 = SaveDocument failed
//
//	Description:  Issues a SaveAs for the RTE
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

integer	li_rc
string		ls_path
string		ls_filename
string		ls_dirpath
string		ls_drive
string		ls_ext
filetype	le_filetype

ls_path = is_filename
if GetFileSaveName ("Save As", ls_path, ls_filename, "", &
	"Rich Text Format (RTF),*.rtf,Text Document,*.txt") = 1 then

	// Determine file extension used
	if Len (ls_filename) > 0 then
		f_SetFilesrv (inv_filesrv, true)
		inv_filesrv.of_ParsePath (ls_path, ls_drive, ls_dirpath, ls_filename, ls_ext)

		// Determine whether to save as rich text or text
		if Upper (ls_ext) = "RTF" then
			le_filetype = filetyperichtext!
		else
			le_filetype = filetypetext!
		end if

		if this.SaveDocument (ls_path, le_filetype) = 1 then
			is_filename = ls_path
			li_rc = 1
		else
			li_rc = -1
		end if
	else
		this.event pfc_saveas()
	end if
end if

return li_rc

end event

event pfc_save;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_save
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = successful save performed
//	 0 = Save not perfomed
//	-1 = Save failed
//
//	Description:  Issues a save for the RTE, using the is_filename property
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

integer	li_rc
string		ls_drive
string		ls_dirpath
string		ls_filename
string		ls_path
string		ls_ext
string		ls_filetosave
filetype	le_filetype

//////////////////////////////////////////////////////////////////////////////
// If filename has not been defined, then let user enter a filename
//////////////////////////////////////////////////////////////////////////////
if Len (is_filename) = 0 then
	if GetFileSaveName ("Save", ls_path, ls_filename, "", &
		"Rich Text Format (RTF),*.rtf,Text Document,*.txt") < 1 then
		return 0
	else
		ls_filetosave = ls_path
	end if
else
	ib_ignorefileexists = true
	ls_filetosave = is_filename
end if

//////////////////////////////////////////////////////////////////////////////
// Determine extension of filename to save
//////////////////////////////////////////////////////////////////////////////
f_SetFilesrv (inv_filesrv, true)
inv_filesrv.of_ParsePath (ls_filetosave, ls_drive, ls_dirpath, ls_filename, ls_ext)

//////////////////////////////////////////////////////////////////////////////
// Determine whether to save as rich text or text
//////////////////////////////////////////////////////////////////////////////
if Upper (ls_ext) = "RTF" then
	le_filetype = filetyperichtext!
else
	le_filetype = filetypetext!
end if

//////////////////////////////////////////////////////////////////////////////
// Save file
//////////////////////////////////////////////////////////////////////////////
li_rc = SaveDocument (ls_filetosave, le_filetype)
ib_ignorefileexists = false
if li_rc = 1 then
	is_filename = ls_filetosave
	return 1
else
	return li_rc
end if

end event

event pfc_printpreview;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_printpreview
//
//	Arguments:  none
//
//	Returns:  boolean
//	true = RTE is in printpreview
//	false = RTE is in editmode
//
//	Description:	Toggles the RTE in printpreview/edit mode
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

Preview (not IsPreview())
return IsPreview()

end event

event pfc_ruler;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_ruler
//
//	Arguments:  none
//
//	Returns:  boolean
//	true = RTE is displaying rulers (and tabbar)
//	false = RTE is not displaying rulers (and tabbar)
//
//	Description:	Toggles the rulerbar (and tabbar)
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

boolean	lb_display

lb_display = not this.rulerbar
this.rulerbar = lb_display
this.tabbar = lb_display

return lb_display
end event

event pfc_firstpage;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_firstpage
//
//	Arguments:  none
//
//	Returns:  integer
//	 the page number that the RTE scrolled to
//	-1 if an error occurs
//
//	Description:	Scrolls to the first page of the RTE
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

integer	li_selectedpage

li_selectedpage = this.SelectedPage()
if li_selectedpage <= 1 then
	return li_selectedpage
end if

this.SetRedraw (false)

do while li_selectedpage > 1
	this.ScrollPriorPage()
	li_selectedpage = this.SelectedPage()
loop

this.SetRedraw (true)

return this.SelectedPage()

end event

event pfc_lastpage;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_lastpage
//
//	Arguments:  none
//
//	Returns:  integer
//	the last page number of the RTE
//	-1 if an error occurs
//
//	Description:	Scrolls to the last page of the RTE
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

integer	li_pagecount
integer	li_selectedpage

li_pagecount = this.PageCount()
if li_pagecount < 0 then
	return li_pagecount
end if
li_selectedpage = this.SelectedPage()
if li_selectedpage < 0 or li_selectedpage >= li_pagecount then
	return li_selectedpage
end if

this.SetRedraw (false)

do while li_selectedpage < li_pagecount
	this.ScrollNextPage()
	li_selectedpage = this.SelectedPage()
	if li_selectedpage < 0 then
		exit
	end if
loop

this.SetRedraw (true)

return this.SelectedPage()

end event

event pfc_nextpage;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_nextpage
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:	Scrolls to the next page of the RTE
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

return this.ScrollNextPage()

end event

event pfc_previouspage;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_previouspage
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:	Scrolls to the previous page of the RTE
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

return this.ScrollPriorPage()

end event

event pfc_insertfile;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_insertfile
//
//	Arguments:  None
//
//	Returns:  integer
//	 1 = success
//	 0 = User cancelled from the fileopen dialog
//	-1 = error
//
//	Description:  Inserts the contents of a file at insertion point,
//	prompting user for which file to insert
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
string	ls_filename

return of_InsertDocument (ls_filename)
end event

event pfc_insertpicture;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_insertpicture
//
//	Arguments:  None
//
//	Returns:  integer
//	 1 = success
//	 0 = User cancelled from the fileopen dialog
//	-1 = error
//
//	Description:  Inserts a picture at insertion point,
//	prompting user for which bitmap file picture to insert
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

string	ls_filename

return of_InsertPicture (ls_filename)
end event

event pfc_open;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_open
//
//	Arguments:  None
//
//	Returns:  integer
//	 1 = success
//	 0 = User cancelled from the fileopen dialog
//	-1 = error
//
//	Description:
//	This function prompts the user to choose a file to open, then
//	it inserts the document into the RTE, clearing any previous text.
//	User will be prompted to save changes to old document if necessary.
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

string	ls_filename

return of_OpenDocument (ls_filename)
end event

event type integer pfc_print();//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_print
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:
//	Opens the print dialog to allow user to change print settings,
//	and then prints the RTE
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 9.0	Fix CR#308429
// 10.0 Use new overloaded function rte.PrintEx(showPrintDlg) which could display Print Dialog,
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
string		ls_pagerange

li_rc = this.PrintEx (true)

return li_rc

end event

event pfc_printimmediate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_printimmediate
//
//	Arguments:  none
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:  Prints the RTE (without displaying a print dialog)
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

// Reset page counters
il_currentprintpage = 0
il_currentinstance = 1

// Print
return this.Print (1, "", false, true)

end event

event pfc_finddlg;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		pfc_finddlg
//
//	Arguments:  none
//
//	Returns:  	none
//
//	Description:  Invokes the Find dialog window.
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

// Call for the Find Dialog.
If IsValid (inv_find) Then
	inv_find.Event pfc_finddlg()
end if
end event

event pfc_replacedlg;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		pfc_replacedlg
//
//	Arguments:  none
//
//	Returns:  	none
//
//	Description:  Invokes the Find/Replace dialog window.
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

// Call for the Find/Replace Dialog.
If IsValid (inv_find) Then
	inv_find.Event pfc_replacedlg()
end if
end event

public function integer of_opendocument (ref string as_filename);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_OpenDocument
//
//	Access:  public
//
//	Arguments:
//	as_filename   string that will hold filename user selected, also a default filename
//
//	Returns:  integer
//	 1 = success
//	 0 = User cancelled from FileOpen dialog
//	-1 = error
//
//	Description:
//	This function prompts the user to choose a file to open, then
//	it inserts the document into the RTE, clearing any previous text.
//	User will be prompted to save changes to old document if necessary.
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

integer	li_val
integer	li_save
string	ls_filename
string	ls_title
string	ls_docname

if GetFileOpenName ("Open", as_filename, ls_filename, "", &
	"Rich Text Format (RTF),*.rtf,Text Document,*.txt,All Files,*.*") = 1 then

	// Check to see if old document needs to be saved
	if modified then
		ls_title = gnv_app.iapp_object.displayname
		if IsNull (ls_title) or Len (ls_title) = 0 then
			ls_title = "Save"
		end if
		ls_docname = is_filename
		if Len (ls_docname) = 0 then
			ls_docname = "Document"
		end if

		li_val = of_MessageBox ("pfc_savechanges", ls_title, &
			"Save changes to " + ls_docname + "?", exclamation!, yesnocancel!, 1)
		if li_val = 1 then
			li_save = this.event pfc_save()
			if li_save < 0 then
				return -1
			end if
		else
			if li_val = 3 then
				return 0
			end if
		end if
	end if
	if InsertDocument (as_filename, true) = 1 then
		is_filename = as_filename
		return 1
	else
		return -1
	end if
else
	return 0
end if

end function

public function integer of_InsertDocument (ref string as_filename);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_InsertDocument
//
//	Access:  public
//
//	Arguments:
//	as_filename   string that will hold filename user selected, also a default filename
//
//	Returns:  integer
//	 1 = success
//	 0 = User cancelled from FileOpen dialog
//	-1 = error
//
//	Description:
//	This function prompts the user to choose a file to open, then
//	it inserts the document into the RTE.
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

string		ls_filename

if GetFileOpenName ("Insert File", as_filename, ls_filename, "", &
	"Rich Text Format (RTF),*.rtf,Text Document,*.txt,All Files,*.*") = 1 then
	return InsertDocument (as_filename, false)
else
	return 0
end if

end function

public function integer of_insertpicture (ref string as_filename);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_InsertPicture
//
//	Access:  public
//
//	Arguments:
//	as_filename   string that will hold filename user selected, also a default filename
//
//	Returns:  integer
//	 1 = success
//	 0 = User cancelled from FileOpen dialog
//	-1 = error
//
//	Description:
//	This function prompts the user to choose a bitmap file to open, then
//	it inserts the picture into the RTE.
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

string		ls_filename

if GetFileOpenName ("Insert Picture", as_filename, ls_filename, "", &
	"Bitmap,*.bmp") = 1 then
	return InsertPicture (as_filename)
else
	return 0
end if

end function

public function boolean of_getignorefileexists ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetIgnoreFileExists
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:  boolean
//
//	Description:  Gets the state of ib_ignorefileexists
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

return ib_ignorefileexists
end function

public subroutine of_setignorefileexists (boolean ab_ignorefileexists);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetIgnoreFileExists
//
//	Access:  public
//
//	Arguments:
//	ab_ignorefileexists	the value to set ib_ignorefileexists to
//
//	Returns:  none
//
//	Description:  Sets the value of ib_ignorefileexists
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

ib_ignorefileexists = ab_ignorefileexists
end subroutine

public subroutine of_setfilename (string as_filename);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetFileName
//
//	Access:  public
//
//	Arguments:
//	as_filename   current filename for the RTE
//
//	Returns:  none
//
//	Description:  Sets the current filename for the RTE
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

is_filename = as_filename
end subroutine

public function string of_getfilename ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetFileName
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:  string
//	The current filename for the RTE
//
//	Description:  Returns the current filename for the RTE
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

return is_filename
end function

public subroutine of_setpageinputfield (string as_pagefield);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetPageInputField
//
//	Access:  public
//
//	Arguments:
//	as_pagefield   name of the input field used for page numbering
//
//	Returns:  none
//
//	Description:  Specifies the name of the page number input
//	field that will be used by the RTE to control page numbering
//	when printing.
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

is_pageinputfield = as_pagefield
end subroutine

public function string of_getpageinputfield ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetPageInputField
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:  string
//
//	Description:  Returns the name of the input field that the
//	RTE is using to control page numbering when printing.
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

return is_pageinputfield
end function

public function boolean of_getcontinuouspages ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetContinuousPages
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:  boolean
//
//	Description:  Returns boolean that determines whether continuous page 
//	numbering will be used when the RTE is shared to a DataWindow
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

return ib_continuouspages
end function

public subroutine of_setcontinuouspages (boolean ab_continuouspages);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetContinuousPages
//
//	Access:  public
//
//	Arguments:
//	ab_continuouspages   Value to set continuouspages property to
//
//	Returns:  none
//
//	Description:  Sets the value of the ib_continuouspages property which
//	determines whether continuous page numbering will be used when 
//	the RTE is shared to a DataWindow
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

ib_continuouspages = ab_continuouspages
end subroutine

public function integer of_gettextstyle (ref n_cst_textstyleattrib anv_textstyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetTextStyle
//
//	Access:  public
//
//	Arguments:
//	anv_textstyle   object which will contain all textstyle settings
//	   of currently selected text in RTE
//
//	Returns:  integer
//	 1 = success
//	-1 = error
//
//	Description:  Calculates all text style settings for the currently
//	   selected text in the RTE
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

if IsValid (anv_textstyle) then
	anv_textstyle.ib_bold = GetTextStyle (bold!)
	anv_textstyle.ib_italic = GetTextStyle (italic!)
	anv_textstyle.ib_strikeout = GetTextStyle (strikeout!)
	anv_textstyle.ib_subscript = GetTextStyle (subscript!)
	anv_textstyle.ib_superscript = GetTextStyle (superscript!)
	anv_textstyle.ib_underlined = GetTextStyle (underlined!)
	return 1
else
	return -1
end if
end function

public function integer of_settextstylebold (boolean ab_bold);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetTextStyleBold
//
//	Access:  public
//
//	Arguments:
//	ab_bold   bold setting for the currently selected text
//
//	Returns:  integer
//	 1 = success
//	-1 = failure
//
//	Description:  Sets the currently selected textstyle to bold/not bold
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

n_cst_textstyleattrib	lnv_textstyle

if of_GetTextStyle (lnv_textstyle) > 0 then
	return SetTextStyle (ab_bold, lnv_textstyle.ib_underlined, lnv_textstyle.ib_subscript, &
		lnv_textstyle.ib_superscript, lnv_textstyle.ib_italic, lnv_textstyle.ib_strikeout)
else
	return -1
end if
end function

public function integer of_settextstyleunderline (boolean ab_underline);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetTextStyleUnderline
//
//	Access:  public
//
//	Arguments:
//	ab_underline   underline setting for the currently selected text
//
//	Returns:  integer
//	 1 = success
//	-1 = failure
//
//	Description:  Sets the currently selected textstyle to underlined/not underlined
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

n_cst_textstyleattrib	lnv_textstyle

if of_GetTextStyle (lnv_textstyle) > 0 then
	return SetTextStyle (lnv_textstyle.ib_bold, ab_underline, lnv_textstyle.ib_subscript, &
		lnv_textstyle.ib_superscript, lnv_textstyle.ib_italic, lnv_textstyle.ib_strikeout)
else
	return -1
end if
end function

public function integer of_settextstylesubscript (boolean ab_subscript);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetTextStyleSubscript
//
//	Access:  public
//
//	Arguments:
//	ab_subscript   subscript setting for the currently selected text
//
//	Returns:  integer
//	 1 = success
//	-1 = failure
//
//	Description:  Sets the currently selected textstyle to subscript/not subscript
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

n_cst_textstyleattrib	lnv_textstyle

if of_GetTextStyle (lnv_textstyle) > 0 then
	return SetTextStyle (lnv_textstyle.ib_bold, lnv_textstyle.ib_underlined, ab_subscript, &
		lnv_textstyle.ib_superscript, lnv_textstyle.ib_italic, lnv_textstyle.ib_strikeout)
else
	return -1
end if
end function

public function integer of_settextstylesuperscript (boolean ab_superscript);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetTextStyleSuperscript
//
//	Access:  public
//
//	Arguments:
//	ab_superscript   superscript setting for the currently selected text
//
//	Returns:  integer
//	 1 = success
//	-1 = failure
//
//	Description:  Sets the currently selected textstyle to superscript/not superscript
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

n_cst_textstyleattrib	lnv_textstyle

if of_GetTextStyle (lnv_textstyle) > 0 then
	return SetTextStyle (lnv_textstyle.ib_bold, lnv_textstyle.ib_underlined, lnv_textstyle.ib_subscript, &
		ab_superscript, lnv_textstyle.ib_italic, lnv_textstyle.ib_strikeout)
else
	return -1
end if
end function

public function integer of_settextstyleitalic (boolean ab_italic);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetTextStyleItalic
//
//	Access:  public
//
//	Arguments:
//	ab_italic   italic setting for the currently selected text
//
//	Returns:  integer
//	 1 = success
//	-1 = failure
//
//	Description:  Sets the currently selected textstyle to italic/not italic
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

n_cst_textstyleattrib	lnv_textstyle

if of_GetTextStyle (lnv_textstyle) > 0 then
	return SetTextStyle (lnv_textstyle.ib_bold, lnv_textstyle.ib_underlined, lnv_textstyle.ib_subscript, &
		lnv_textstyle.ib_superscript, ab_italic, lnv_textstyle.ib_strikeout)
else
	return -1
end if
end function

public function integer of_settextstylestrikeout (boolean ab_strikeout);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetTextStyleStrikeout
//
//	Access:  public
//
//	Arguments:
//	ab_strikeout   strikeout setting for the currently selected text
//
//	Returns:  integer
//	 1 = success
//	-1 = failure
//
//	Description:  Sets the currently selected textstyle to strikeout/not strikeout
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

n_cst_textstyleattrib	lnv_textstyle

if of_GetTextStyle (lnv_textstyle) > 0 then
	return SetTextStyle (lnv_textstyle.ib_bold, lnv_textstyle.ib_underlined, lnv_textstyle.ib_subscript, &
		lnv_textstyle.ib_superscript, lnv_textstyle.ib_italic, ab_strikeout)
else
	return -1
end if
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

public function integer of_setfind (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Event:  of_SetSearch
//
//	(Arguments: boolean
//   TRUE  - Start (create) the service
//   FALSE - Stop (destroy ) the service
//
//	(Returns:  Integer)
//
//	Description:  Starts or stops the DataWindow Search services.  
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

//Check arguments
If IsNull(ab_switch) Then
	Return -1
End If

IF ab_Switch THEN
	IF IsNull(inv_find) Or Not IsValid (inv_find) THEN
		inv_find = Create n_cst_rtefind
		inv_find.dynamic of_SetRequestor ( this )
		Return 1
	END IF
ELSE 
	IF IsValid (inv_find) THEN
		Destroy inv_find
		Return 1
	END IF	
END IF 

Return 0
end function

public subroutine of_setstartpagenumber (long al_startpagenumber);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetStartPageNumber
//
//	Access:  public
//
//	Arguments:
//	ai_startpagenumber   starting page number that will have
//	   a page number displayed when printing
//
//	Returns:  none
//
//	Description:  Sets the number of the page where page numbering
//	   will first occur when printing.
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

il_startpagenumber = al_startpagenumber
end subroutine

public function long of_getstartpagenumber ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetStartPageNumber
//
//	Access:  public
//
//	Arguments:
//	none
//
//	Returns:  long
//
//	Description:  Returns the number of the page where page 
//	numbering will first occur when printing.
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

return il_startpagenumber
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

event fileexists;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			fileexists
//
//	(Arguments:		
//	filename			Name of the file that already exists.)
//
//	(Returns:  		Integer
//						 0 Continue processing.
//						-1 Stop processing.)
//
//	Description:  Prompt user to whether to save or existing file.
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


string	ls_title

if not ib_ignorefileexists then
	ls_title = gnv_app.iapp_object.displayname
	if IsNull (ls_title) or Len (ls_title) = 0 then
		ls_title = "File Exists"
	end if

	if of_MessageBox ("pfc_replacefile", gnv_app.iapp_object.displayname, &
		"The file " + filename + " already exists.~r~n~r~nReplace existing file?", &
			exclamation!, yesno!, 2) = 1 then
		return 0
	else
		return -1
	end if
end if

return 0
end event

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  			destructor	
//
//	(Arguments:		None)
//
//	(Returns:  		None)
//
//	Description:	Perform cleanup.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.04 	Corrected fileserv cleanup.
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

of_SetFind ( False )
f_SetFilesrv (inv_filesrv, False)

end event

event printheader;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  printheader
//
//	Description:  Set page numbering
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

// Verify that a page number field has been established
if Len (is_pageinputfield) <= 0 then
	return
end if

// Determine current page number based on ib_continuouspages property
if not ib_continuouspages then
	if currentrow <> il_currentinstance then
		il_currentinstance = currentrow
		il_currentprintpage = 1
	else
		il_currentprintpage++
	end if
else
	il_currentprintpage++
end if

if il_startpagenumber <= il_currentprintpage then
	InputFieldChangeData (is_pageinputfield, String (il_currentprintpage))
else
	InputFieldChangeData (is_pageinputfield, "")
end if
end event

event rbuttonup;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  rbuttonup
//
//	Description:  Popup menu
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

boolean		lb_frame
string			ls_selectedtext
m_edit		lm_edit
window		lw_parent
window		lw_frame
window		lw_sheet
window		lw_childparent

if not ib_rmbmenu then
	return
end if

// Get the parent window.
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
	return
end if

lm_edit = create m_edit
lm_edit.of_SetParent (this)

ls_selectedtext = SelectedText()
if Len (ls_selectedtext) > 0 then
	lm_edit.m_edititem.m_cut.enabled = true
	lm_edit.m_edititem.m_copy.enabled = true
else
	lm_edit.m_edititem.m_cut.enabled = false
	lm_edit.m_edititem.m_copy.enabled = false
end if

lm_edit.m_edititem.m_paste.enabled = true
lm_edit.m_edititem.m_selectall.enabled = true

this.event pfc_prermbmenu (lm_edit)

lm_edit.m_edititem.PopMenu (lw_parent.PointerX() + 5, lw_parent.PointerY() + 10)

destroy lm_edit

end event

on pfc_u_rte.create
end on

on pfc_u_rte.destroy
end on

