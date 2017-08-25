HA$PBExportHeader$pfc_n_cst_dwsrv_report.sru
$PBExportComments$PFC DataWindow Reporting service
forward
global type pfc_n_cst_dwsrv_report from n_cst_dwsrv
end type
end forward

global type pfc_n_cst_dwsrv_report from n_cst_dwsrv
end type
global pfc_n_cst_dwsrv_report pfc_n_cst_dwsrv_report

type variables
Protected:
string		is_Undo[]
string		is_DefaultFontFace
integer		ii_ObjectNum = 1
integer		ii_UndoLevel = 0
integer		ii_DefaultFontSize
long		il_DefaultColor
long		il_DefaultBackColor
border		ibo_DefaultBorder
fontcharset	ifc_DefaultCharSet
n_cst_platform	inv_Platform

end variables

forward prototypes
public function string of_Undo (integer ai_numlevels)
public function string of_AddPicture (string as_filename, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_execute)
public function string of_AddPicture (string as_filename, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_execute)
protected function integer of_gettextsizepos (string as_text, string as_band, alignment aal_halign, vtextalign avta_valign, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, ref integer ai_height, ref integer ai_width, ref integer ai_x, ref integer ai_y)
protected function string of_AddPicture (string as_filename, string as_band, alignment aal_halign, vtextalign avta_valign, integer ai_x, integer ai_y, border abo_border, boolean ab_execute)
public function integer of_getpicturesize (string as_pictname, ref integer ai_height, ref integer ai_width)
public function integer of_GetUndoLevels ()
public function string of_prepprint (boolean ab_convertheader)
public function string of_printreport (boolean ab_convertheader, boolean ab_canceldialog)
public subroutine of_ResetUndo ()
public function string of_Undo ()
public function string of_ShiftBand (string as_band, integer ai_xunits, integer ai_yunits, boolean ab_execute)
public function string of_SetBackground (string as_filename, boolean ab_sizetofit, integer ai_x, integer ai_y, integer ai_height, integer ai_width, boolean ab_execute)
public function string of_setfont (string as_fontface, integer ai_fontsize, fontfamily aff_fontfamily, fontpitch afp_fontpitch, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_name, string as_band, boolean ab_execute)
public function string of_getdefaultfontface ()
public function integer of_getdefaultfontsize ()
public function border of_getdefaultborder ()
public function long of_getdefaultcolor ()
public function long of_getdefaultbackcolor ()
public subroutine of_setdefaultfontface (string as_FontFace)
public subroutine of_setdefaultfontsize (integer ai_FontSize)
public subroutine of_setdefaultborder (border abo_Border)
public subroutine of_setdefaultcolor (long al_Color)
public subroutine of_setdefaultbackcolor (long al_BackColor)
protected function string of_BuildTextModify (string as_type, string as_text, string as_band, integer ai_x, integer ai_y, integer ai_height, integer ai_width, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_Color, long al_BackColor)
protected function string of_addcompute (string as_expr, string as_band, alignment aal_halign, vtextalign avta_valign, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor, boolean ab_execute)
public function string of_AddCompute (string as_expr, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor, boolean ab_execute)
public function string of_AddCompute (string as_expr, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor, boolean ab_execute)
protected function string of_AddText (string as_text, string as_band, alignment aal_halign, vtextalign avta_valign, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor, boolean ab_execute)
public function string of_AddText (string as_text, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor, boolean ab_execute)
public function string of_AddText (string as_text, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor, boolean ab_execute)
protected function string of_AddLine (string as_band, linestyle als_style, integer ai_width, vtextalign avta_valign, integer ai_x1, integer ai_y1, integer ai_x2, integer ai_y2, long al_color, long al_backcolor, boolean ab_execute)
public function string of_AddLine (string as_band, linestyle als_style, integer ai_width, integer ai_x1, integer ai_y1, integer ai_x2, integer ai_y2, long al_color, long al_backcolor, boolean ab_execute)
public function string of_AddLine (string as_band, linestyle als_style, integer ai_width, vtextalign avta_valign, long al_color, long al_backcolor, boolean ab_execute)
public function integer of_createcomposite (string as_datawindow[], boolean ab_vertical, string as_trailfooter[], string as_slide[], border abo_border[])
public function string of_setrelativezoom (integer ai_zoompct)
public function string of_AddCompute (string as_expr, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor)
public function string of_AddCompute (string as_expr, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset)
public function string of_AddCompute (string as_expr, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline)
public function string of_AddCompute (string as_expr, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border)
public function string of_AddCompute (string as_expr, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor)
public function string of_AddCompute (string as_expr, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset)
public function string of_AddCompute (string as_expr, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline)
public function string of_AddCompute (string as_expr, string as_band, integer ai_x, integer ai_y)
public function string of_AddLine (string as_band, linestyle als_style, integer ai_width, integer ai_x1, integer ai_y1, integer ai_x2, integer ai_y2, long al_color, long al_backcolor)
public function string of_AddCompute (string as_expr, string as_band, integer ai_x, integer ai_y, border abo_border)
public function string of_AddLine (string as_band, linestyle als_style, integer ai_width, integer ai_x1, integer ai_y1, integer ai_x2, integer ai_y2)
public function string of_AddLine (string as_band, linestyle als_style, integer ai_width, vtextalign avta_valign, long al_color, long al_backcolor)
public function string of_AddLine (string as_band, linestyle als_style, integer ai_width, vtextalign avta_valign)
public function string of_AddPicture (string as_filename, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border)
public function string of_AddPicture (string as_filename, string as_band, alignment aal_halign, vtextalign avta_valign)
public function string of_AddPicture (string as_filename, string as_band, integer ai_x, integer ai_y, border abo_border)
public function string of_AddPicture (string as_filename, string as_band, integer ai_x, integer ai_y)
public function string of_AddText (string as_text, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor)
public function string of_AddText (string as_text, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset)
public function string of_AddText (string as_text, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline)
public function string of_AddText (string as_text, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border)
public function string of_AddText (string as_text, string as_band, alignment aal_halign, vtextalign avta_valign)
public function string of_AddText (string as_text, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor)
public function string of_AddText (string as_text, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset)
public function string of_AddText (string as_text, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline)
public function string of_AddText (string as_text, string as_band, integer ai_x, integer ai_y, border abo_border)
public function string of_AddText (string as_text, string as_band, integer ai_x, integer ai_y)
public function fontcharset of_getdefaultcharset ()
public subroutine of_setdefaultcharset (fontcharset afc_CharSet)
public function string of_PrintReport (boolean ab_convertheader)
public function string of_SetBackground (string as_filename, integer ai_x, integer ai_y, integer ai_height, integer ai_width)
public function string of_SetBackground (string as_filename, integer ai_x, integer ai_y)
public function string of_SetBackground (string as_filename, integer ai_x)
public function string of_SetBackground (string as_filename)
public function string of_SetBorder (border abo_border, string as_name)
public function string of_SetColor (long al_color, long al_backcolor, string as_name, string as_band)
public function string of_SetColor (long al_color, long al_backcolor, string as_name)
public function string of_SetColor (long al_color, long al_backcolor)
public function string of_SetBorder (border abo_border)
public function string of_SetFont (string as_fontface, integer ai_fontsize, fontfamily aff_fontfamily, fontpitch afp_fontpitch, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_name, string as_band)
public function string of_SetFont (string as_fontface, integer ai_fontsize, fontfamily aff_fontfamily, fontpitch afp_fontpitch, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_name)
public function string of_SetFont (string as_fontface, integer ai_fontsize, fontfamily aff_fontfamily, fontpitch afp_fontpitch, boolean ab_bold, boolean ab_italic, boolean ab_underline)
public function string of_SetFont (string as_fontface, integer ai_fontsize, fontfamily aff_fontfamily, fontpitch afp_fontpitch, string as_name, string as_band)
public function string of_SetFont (string as_fontface, integer ai_fontsize, fontfamily aff_fontfamily, fontpitch afp_fontpitch, string as_name)
public function string of_SetFont (string as_fontface, integer ai_fontsize, fontfamily aff_fontfamily, fontpitch afp_fontpitch)
public function string of_ShiftBand (string as_band, integer ai_xunits, integer ai_yunits)
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
public function string of_addcompute (string as_expr, string as_band, alignment aal_halign, vtextalign avta_valign)
public function string of_setborder (border abo_border, string as_name, string as_band)
public function string of_setborder (border abo_border, string as_name, string as_band, boolean ab_execute)
public function string of_setcolor (long al_color, long al_backcolor, string as_name, string as_band, boolean ab_execute)
end prototypes

public function string of_Undo (integer ai_numlevels);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Undo
//
//	Access:  public
//
//	Arguments:
//	ai_NumLevels				The number of levels of changes to undo.  If 0 is
//									passed, all changes will be undone.
//
//	Returns:		String
//					The output of the Modify command (the error text or "").
//
//	Description:	Undo changes made by the Report Service functions.
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

String	ls_Modify, ls_Return
Integer	li_Count, li_End

If ai_NumLevels = 0 Or ai_NumLevels >= ii_UndoLevel Then
	li_End = 1
Else
	li_End = (ii_UndoLevel - ai_NumLevels) + 1
End if

For li_Count = ii_UndoLevel To li_End Step -1
	ls_Modify = ls_Modify + " " + is_Undo[li_Count]
Next

If ai_NumLevels = 0 Or ai_NumLevels >= ii_UndoLevel Then
	ii_UndoLevel = 0
Else
	ii_UndoLevel = ii_UndoLevel - ai_NumLevels
End if

ls_Return = idw_Requestor.Modify(ls_Modify)

Return ls_Return

end function

public function string of_AddPicture (string as_filename, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_execute);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddPicture
//
//	Access:  public
//
//	Arguments:
//	as_FileName				The name of the BMP file.
//	as_Band					The band to add the picture to.
//	aal_HAlign					The horizontal position of the object (Left!, Right!, Center!).
//	avta_VAlign				The vertical position of the object (Bottom!, Top!, VCenter!).
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!, 
//									Raised!).
//	ab_Execute				True - execute the Modify command,
//									False - build the command but do not execute it.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a picture object to any band of a datawindow.  Existing objects
//						will be shifted to make room for the picture, unless aal_Halign and
//						avta_VAlign are both "center".  In this case, the picture will overlay
//						the existing objects.
//
//						This function overloads the real of_AddPicture, wich is protected.
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

Integer	li_X, li_Y

Return of_AddPicture(as_FileName, as_Band, aal_HAlign, avta_VAlign, li_X, li_Y, &
								abo_Border, ab_Execute)

end function

public function string of_AddPicture (string as_filename, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_execute);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddPicture
//
//	Access:  public
//
//	Arguments:
//	as_FileName				The name of the BMP file.
//	as_Band					The band to add the picture to.
//	ai_X							The X location of the BMP being placed.
//	ai_Y							The Y location of the BMP being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!, 
//									Raised!).
//	ab_Execute				True - execute the Modify command,
//									False - build the command but do not execute it.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a picture object to any band of a datawindow.  It will be placed on
//						top of any existing objects.
//
//						This function overloads the real of_AddPicture, which is protected.
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

Alignment	lal_Null
VTextAlign	lvta_Any

SetNull(lal_Null)
Return of_AddPicture(as_FileName, as_Band, lal_Null, lvta_Any, ai_X, ai_Y, &
								abo_Border, ab_Execute)

end function

protected function integer of_gettextsizepos (string as_text, string as_band, alignment aal_halign, vtextalign avta_valign, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, ref integer ai_height, ref integer ai_width, ref integer ai_x, ref integer ai_y);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetTextSizePos
//
//	Access:  protected
//
//	Arguments:
//	as_Text						The text whose size and position is to be determined.
//	as_Band					The band the object is being added to.
//	aal_HAlign					The horizontal alignment of the object being placed.
//	avta_Valign				The vertical alignment of the object being placed.
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	ai_Height					The height of the object, passed by reference.
//	ai_Width					The width of the object, passed by reference.
//	ai_X							The X position of the object, passed by reference.
//	ai_Y							The Y position of the object, passed by reference.
//
//	Returns:		Integer
//					The number of lines in the text object or -1 if an error occurrs.
//
//	Description:	Calculate the size and position of a text object.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 5.0.02 Check return value on ParseToArray to exit if no text is passed
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

String			ls_Line[], ls_Text
Integer			li_NewLines, li_Cnt, li_Line, li_LineWidth, li_CurrentHeight, li_DwWidth
window	lw_parent
n_cst_string	lnv_String

// Calculate the height and width of the new object
// Determine how many new lines are being added
li_NewLines = lnv_string.of_ParseToArray(as_Text, "~r~n", ls_Line)
If li_NewLines <= 0 or IsNull(li_NewLines) Then Return -1

// Find the longest line
For li_Cnt = 1 to li_NewLines
	If Len(ls_Line[li_Cnt]) > li_LineWidth Then
		li_LineWidth = Len(ls_Line[li_Cnt])
		li_Line = li_Cnt
	End if
Next
If Len(ls_Text) < Len(ls_Line[li_Line]) Then
	ls_Text = ls_Line[li_Line]
End if

// Verify that the Platform-Specific Services NVO is in use
If IsNull(inv_Platform) Or Not IsValid(inv_Platform) Then
	// Create the Platform-Specific Functions Service if it is not already created
	f_SetPlatform(inv_Platform, True)
End if

// Call function to calculate the text size
idw_requestor.of_GetParentWindow (lw_parent)
If inv_Platform.of_gettextsize(lw_parent, ls_Text + " ", as_FontFace, &
											ai_FontSize, ab_Bold, ab_Italic, &
											ab_Underline, ai_Height, ai_Width) = -1 Then Return -1

If idw_Requestor.Describe("Datawindow.Units") = "0" Then
	// Convert pixels to PB units
	ai_Height = PixelsToUnits(ai_Height, YPixelsToUnits!)
	ai_Width = PixelsToUnits(ai_Width, XPixelsToUnits!)
End if

ai_Height = ai_Height * li_NewLines

// Determine X and Y position
// If aal_HAlign is null, then X and Y are not needed
If IsNull(aal_HAlign) Then Return li_NewLines

If aal_HAlign = Left! Then
	ai_X = 1
Else
	// Determine the width of the datawindow
	li_dwWidth = of_GetWidth()
	If aal_HAlign = Center! Then
		ai_X = (li_dwWidth - ai_Width) / 2
	ElseIf avta_VAlign = VCenter! Then
		ai_X = li_DwWidth + 10
	Else
		ai_X = li_dwWidth - ai_Width
	End if
End if

If avta_VAlign = Top! Then
	ai_Y = 1
Else
	li_CurrentHeight = Integer(idw_Requestor.Describe("Datawindow." + as_Band + ".Height"))
	If avta_VAlign = Bottom! Then
		ai_Y = li_CurrentHeight + 1
	Else
		ai_Y = (li_CurrentHeight - ai_Height) / 2
	End If
End if

Return li_NewLines

end function

protected function string of_AddPicture (string as_filename, string as_band, alignment aal_halign, vtextalign avta_valign, integer ai_x, integer ai_y, border abo_border, boolean ab_execute);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddPicture
//
//	Access:  protected
//
//	Arguments:
//	as_FileName				The name of the BMP file.
//	as_Band					The band to add the picture to.
//	aal_HAlign					The horizontal position of the object (Left!, Right!, Center!).
//	avta_VAlign				The vertical position of the object (Bottom!, Top!, VCenter!).
//	ai_X							The X location of the BMP being placed.
//	ai_Y							The Y location of the BMP being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!, 
//									Raised!).
//	ab_Execute				True - execute the Modify command,
//									False - build the command but do not execute it.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.  Or one of the following errors:
//					"Error!  Invalid DW Unit"			-	DataWindow Unit is not PB Units or Pixels
//					"Error!  File not found"				-	The picture file does not exist
//					"Error!  Error calculating size"	-	Returned an error calculating the object size
//
//	Description:	Add a picture object to any band of a datawindow.  It will be placed on
//						top of any existing objects.  This protected function does all the work.
//						Overloaded public functions should be called.
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

String	ls_Return, ls_Modify, ls_Undo, ls_Border
Integer	li_Height, li_Width, li_CurrentHeight, li_DwWidth

// Verify that DataWindow units are either PowerBuild Units or Pixels
If idw_Requestor.Object.DataWindow.Units > "1" Then Return "Error!  Invalid DW Unit"

// Verify that the file exists
If Not FileExists(as_FileName) Then
	Return "Error!  File not found"
End if

// Determine the DataWindow Modify parameters
Choose Case abo_Border
	Case NoBorder!
		ls_Border = "0"
	Case ShadowBox!
		ls_Border = "1"
	Case Box!
		ls_Border = "2"
	Case ResizeBorder!
		ls_Border = "3"
	Case Underline!
		ls_Border = "4"
	Case Lowered!
		ls_Border = "5"
	Case Raised!
		ls_Border = "6"
End Choose

// Calculate the height and width of the new object
If of_GetPictureSize(as_FileName, li_Height, li_Width) = -1 Then Return "Error!  Error calculating size"
If idw_Requestor.Describe("Datawindow.Units") = "1" Then
	// Convert PB Units to pixels
	li_Height = UnitsToPixels(li_Height, YUnitsToPixels!)
	li_Width = UnitsToPixels(li_Width, XUnitsToPixels!)
End if

// Determine if the original objects should be shifted
If Not IsNull(aal_HAlign) Then
	If avta_VAlign <> VCenter! Then
		// Adding or inserting the object
		// Get original band height
		li_CurrentHeight = Integer(idw_Requestor.Describe("Datawindow." + as_Band + ".Height"))

		// If inserting at the top, then shift original objects down
		If avta_VAlign = Top! Then
			ls_Modify = ls_Modify + of_ShiftBand(as_Band, 0, (li_Height + 1), False)
			ls_Undo = is_Undo[ii_UndoLevel]
			ii_UndoLevel --
		Else
			// Set new band height
			ls_Modify = "Datawindow." + as_Band + ".Height=" + String(li_CurrentHeight + li_Height + 1)
			ls_Undo = "Datawindow." + as_Band + ".Height=" + String(li_CurrentHeight)
		End if

		ElseIf aal_HAlign = Left! Then
		// Shift band objects right
		ls_Modify = ls_Modify + of_ShiftBand(as_Band, (li_Width + 10), 0, False)
		ls_Undo = is_Undo[ii_UndoLevel]
		ii_UndoLevel --
	End if

	// Determine X and Y position
	If aal_HAlign = Left! Then
		ai_X = 1
	Else
		// Determine the width of the datawindow
		li_dwWidth = of_GetWidth()
		If aal_HAlign = Center! Then
			ai_X = (li_dwWidth - li_Width) / 2
		ElseIf avta_VAlign = VCenter! Then
			ai_X = li_DwWidth + 10
		Else
			ai_X = li_dwWidth - li_Width
		End if
	End if

	If avta_VAlign = Top! Then
		ai_Y = 1
	ElseIf avta_VAlign = Bottom! Then
		ai_Y = li_CurrentHeight + 1
	Else
		ai_Y = (li_CurrentHeight - li_Height) / 2
	End if
End If

// Build modify statement
ls_Modify = ls_Modify + " create bitmap(band=" + as_Band + &
			" filename='" + as_FileName + "'" + &
			" x='" + String(ai_X) + "'" + &
			" y='" + String(ai_Y) + "'" + &
			" height='" + String(li_Height) + "'" + &
			" width='" + String(li_Width) + "'" + &
			" border='" + ls_Border + "'" + &
			" name=add_obj_" + String(ii_ObjectNum) + ")"

ii_UndoLevel ++
is_Undo[ii_UndoLevel] = ls_Undo + " destroy add_obj_" + String(ii_ObjectNum)

ii_ObjectNum ++

If ab_Execute Then
	ls_Return = idw_Requestor.Modify(ls_Modify)
Else
	ls_Return = ls_Modify
End if

Return ls_Return

end function

public function integer of_getpicturesize (string as_pictname, ref integer ai_height, ref integer ai_width);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetPictureSize
//
//	Access:  public
//
//	Arguments:
//	as_PictName				The file name containing the picture.
//	ai_Height					The height of the picture in PB units, passed by reference.
//	ai_Width					The width of the picture in PB units, passed by reference.
//
//	Returns:		Integer
//					1 if successful, -1 if an error occurrs.
//
//	Description:	Calculate the size of a picture object in PowerBuilder Units.
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

Integer		li_Size, li_Height, li_Width, li_Len, li_Return
Picture		lp_Temp
Window		lw_parent

idw_requestor.of_GetParentWindow (lw_parent)

// Create a dummy Picture Object on the window
li_Return = lw_parent.OpenUserObject(lp_Temp)
If li_Return = 1 Then
	lp_Temp.Visible = False
	lp_Temp.PictureName = as_PictName
	lp_Temp.OriginalSize = True

	// Set reference arguments to the height and width
	ai_Height = lp_Temp.Height
	ai_Width = lp_Temp.Width

	li_Return = lw_parent.CloseUserObject(lp_Temp)
End if

Return li_Return

end function

public function integer of_GetUndoLevels ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_GetUndoLevels
//
//	Access:  public
//
//	Arguments:	None.
//
//	Returns:		Integer
//					The current number of undo levels (ii_UndoLevel)
//
//	Description:	Return the current number of undo levels.
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

Return ii_UndoLevel

end function

public function string of_prepprint (boolean ab_convertheader);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_PrepPrint
//
//	Access:  public
//
//	Arguments:
//	ab_ConvertHeader		True - change borders on header objects to be
//									underline.
//									False - remove header borders as well as others.
//
//	Returns:		String
//					The output of the Modify command (the error text or "").
//
//	Description:	Prepare a datawindow for printing.  Change all colors to black on white
//						and remove borders from all columns.
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

String			ls_Objects[], ls_Modify, ls_Return, ls_Undo, ls_Type, ls_Color
Integer			li_NumObjects, li_Count, li_Undo
Border			lbo_Border
n_cst_string	lnv_String
Constant Long	BLACK = 0
Constant	Long	WHITE = RGB(255, 255, 255)

// Set the color of the datawindow to white
ls_Color = idw_Requestor.Describe("Datawindow.Color")
If Long(ls_Color) <> WHITE Then
	ls_Modify = "Datawindow.Color=" + String(WHITE)
	ls_Undo = "Datawindow.Color=" + ls_Color
End if

// Change all colors to black on white
ls_Color = of_SetColor(BLACK, WHITE, "*", "*", False)
If ls_Color <> "" Then
	ls_Modify = ls_Modify + " " + ls_Color
	ls_Undo = ls_Undo + " " + is_Undo[ii_UndoLevel]
	ii_UndoLevel --
End if

// Change the borders
// First, get all visible objects
li_NumObjects = of_GetObjects(ls_Objects, "*", "*", True)

// Determine the type of border the header objects should have
If ab_ConvertHeader Then
	lbo_Border = Underline!
Else
	lbo_Border = NoBorder!
End if

li_Undo = ii_UndoLevel

For li_Count = 1 To li_NumObjects
	// Call the change border function for each object
	If idw_Requestor.Describe(ls_Objects[li_Count] + ".Band") = "header" And &
		Right(ls_Objects[li_Count], 2) = is_defaultheadersuffix Then
		// The header border is determined by ab_ConvertHeader
		ls_Modify = ls_Modify + of_SetBorder(lbo_Border, ls_Objects[li_Count], "", False)
	Else
		// All other objects should have no border
		ls_Modify = ls_Modify + of_SetBorder(NoBorder!, ls_Objects[li_Count], "", False)
	End if
Next

// Combine each object's undo statement into one
li_Undo ++
For li_Count = (li_Undo + 1) To ii_UndoLevel
	is_Undo[li_Undo] = is_Undo[li_Undo] + " " + is_Undo[li_Count]
Next
ii_UndoLevel = li_Undo

is_Undo[ii_UndoLevel] = ls_Undo + is_Undo[ii_UndoLevel]
is_Undo[ii_UndoLevel] = lnv_string.of_GlobalReplace (is_Undo[ii_UndoLevel], "~"", "", FALSE)

ls_Return = idw_Requestor.Modify(ls_Modify)

Return ls_Return

end function

public function string of_printreport (boolean ab_convertheader, boolean ab_canceldialog);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_PrintReport
//
//	Access:  public
//
//	Arguments:
//	ab_ConvertHeader		True - change borders on header objects to be
//									underline.
//	ab_CancelDialog		True - display dialog enabling the user to cancel the
//									print job,
//									False - do not display the cancel dialog.
//
//	Returns:		String
//					The output of the Modify command (the error text or "").
//
//	Description:	Prepare a datawindow for printing, print it, and restore it to its original
//						state.  This function calls of_PrepPrint.
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

String	ls_Return

// Prepare for printing
ls_Return = of_PrepPrint(ab_ConvertHeader)
If ls_Return <> "" Then
	Return ls_Return
End if

// Print report
idw_Requestor.Print(ab_CancelDialog)

// Undo changes
ls_Return = of_Undo(1)

Return ls_Return

end function

public subroutine of_ResetUndo ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ResetUndo
//
//	Access:  public
//
//	Arguments:	None.
//
//	Returns:		None
//
//	Description:	Reset the number of undo levels to 0.
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

ii_UndoLevel = 0

end subroutine

public function string of_Undo ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Undo
//
//	Access:  public
//
//	Arguments:	None.
//
//	Returns:		String
//					The output of the Modify command (the error text or "").
//
//	Description:	Undo all changes made by the Report Service functions.
//
//						This function overloads the real of_Undo function to allow
//						the parameter to be optional.
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

Return of_Undo(0)

end function

public function string of_ShiftBand (string as_band, integer ai_xunits, integer ai_yunits, boolean ab_execute);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ShiftBand
//
//	Access:  public
//
//	Arguments:
//	as_Band					The band to shift, pass "*" to shift the entire datawindow.
//	ai_XUnits					The number of horizontal units to shift the objects right, 
//									pass a negative number to shift left.
//	ai_YUnits					The number of vertical units to shift the objects down, 
//									pass a negative number to shift up.
//	ab_Execute				True - execute the Modify command,
//									False - build the command but do not execute it.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.  Or the following error:
//					"Error!  Invalid DataWindow Shift"	-	Attempted to shift the object beyond
//																			the top or left side of the page (X or
//																			Y became negative)
//
//	Description:	Shift the objects in the given band of the datawindow horizontally
//						or vertically a specified number of units.
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

String	ls_Objects[], ls_Modify, ls_Undo, ls_Return
Integer	li_CurrentHeight, li_NumObjects, li_Count, li_X, li_OriginalX, li_Y, li_OriginalY

// If band is being shifted up or down, change the height of the band
If Abs(ai_YUnits) > 0 Then
	If as_Band <> "*" Then
		li_CurrentHeight = Integer(idw_Requestor.Describe("Datawindow." + as_Band + ".Height"))
		ls_Modify = "Datawindow." + as_Band + ".Height=" + String(li_CurrentHeight + ai_YUnits)
		ls_Undo = "Datawindow." + as_Band + ".Height=" + String(li_CurrentHeight)

	Else	// Shift all bands
		li_CurrentHeight = Integer(idw_Requestor.Describe("Datawindow.Header.Height"))
		ls_Modify = "Datawindow.Header.Height=" + String(li_CurrentHeight + ai_YUnits)
		ls_Undo = "Datawindow.Header.Height=" + String(li_CurrentHeight)

		li_CurrentHeight = Integer(idw_Requestor.Describe("Datawindow.Detail.Height"))
		ls_Modify = "Datawindow.Detail.Height=" + String(li_CurrentHeight + ai_YUnits)
		ls_Undo = ls_Undo + " Datawindow.Detail.Height=" + String(li_CurrentHeight)

		li_CurrentHeight = Integer(idw_Requestor.Describe("Datawindow.Footer.Height"))
		ls_Modify = "Datawindow.Footer.Height=" + String(li_CurrentHeight + ai_YUnits)
		ls_Undo = ls_Undo + " Datawindow.Footer.Height=" + String(li_CurrentHeight)

		li_CurrentHeight = Integer(idw_Requestor.Describe("Datawindow.Summary.Height"))
		ls_Modify = "Datawindow.Summary.Height=" + String(li_CurrentHeight + ai_YUnits)
		ls_Undo = ls_Undo + " Datawindow.Summary.Height=" + String(li_CurrentHeight)
	End if
End if

// Get the names of all the visible objects in the datawindow band
li_NumObjects = of_GetObjects(ls_Objects, "*", as_Band, True)

For li_Count = 1 To li_NumObjects

	// Determine if the object is a line
	If idw_Requestor.Describe(ls_Objects[li_Count] + ".type") = "line" Then
		// Lines have X1, Y1 and X2, Y2 attributes
		If abs(ai_XUnits) > 0 Then
			li_OriginalX = Integer(idw_Requestor.Describe(ls_Objects[li_Count] + ".x1"))
			li_X = li_OriginalX + ai_XUnits

			// Check for shifting beyond the left side of the page
			If li_X < 0 Then
				Return "Error!  Invalid DataWindow Shift"
			End if

			ls_Modify = ls_Modify + " " + ls_Objects[li_Count] + ".x1='" + String(li_X) + "'"
			ls_Undo = ls_Undo + " " + ls_Objects[li_Count] + ".x1='" + String(li_OriginalX) + "'"

			// Change the X2 attribute
			li_OriginalX = Integer(idw_Requestor.Describe(ls_Objects[li_Count] + ".x2"))
			li_X = li_OriginalX + ai_XUnits

			// Check for shifting beyond the left side of the page
			If li_X < 0 Then
				Return "Error!  Invalid DataWindow Shift"
			End if

			ls_Modify = ls_Modify + " " + ls_Objects[li_Count] + ".x2='" + String(li_X) + "'"
			ls_Undo = ls_Undo + " " + ls_Objects[li_Count] + ".x2='" + String(li_OriginalX) + "'"
		End if
		If abs(ai_YUnits) > 0 Then
			li_OriginalY = Integer(idw_Requestor.Describe(ls_Objects[li_Count] + ".y1"))
			li_Y = li_OriginalY + ai_YUnits

			// Check for shifting beyond the top of the page
			If li_Y < 0 Then
				Return "Error!  Invalid DataWindow Shift"
			End if

			ls_Modify = ls_Modify + " " + ls_Objects[li_Count] + ".y1='" + String(li_Y) + "'"
			ls_Undo = ls_Undo + " " + ls_Objects[li_Count] + ".y1='" + String(li_OriginalY) + "'"

			// Change the Y2 attribute
			li_OriginalY = Integer(idw_Requestor.Describe(ls_Objects[li_Count] + ".y2"))
			li_Y = li_OriginalY + ai_YUnits

			// Check for shifting beyond the top of the page
			If li_Y < 0 Then
				Return "Error!  Invalid DataWindow Shift"
			End if

			ls_Modify = ls_Modify + " " + ls_Objects[li_Count] + ".y2='" + String(li_Y) + "'"
			ls_Undo = ls_Undo + " " + ls_Objects[li_Count] + ".y2='" + String(li_OriginalY) + "'"
		End if

	Else	// all other objects have only one X and Y attribute
		If abs(ai_XUnits) > 0 Then
			li_OriginalX = Integer(idw_Requestor.Describe(ls_Objects[li_Count] + ".x"))
			li_X = li_OriginalX + ai_XUnits

			// Check for shifting beyond the left side of the page
			If li_X < 0 Then
				Return "Error!  Invalid DataWindow Shift"
			End if

			ls_Modify = ls_Modify + " " + ls_Objects[li_Count] + ".x='" + String(li_X) + "'"
			ls_Undo = ls_Undo + " " + ls_Objects[li_Count] + ".x='" + String(li_OriginalX) + "'"
		End if
		If abs(ai_YUnits) > 0 Then
			li_OriginalY = Integer(idw_Requestor.Describe(ls_Objects[li_Count] + ".y"))
			li_Y = li_OriginalY + ai_YUnits

			// Check for shifting beyond the top of the page
			If li_Y < 0 Then
				Return "Error!  Invalid DataWindow Shift"
			End if

			ls_Modify = ls_Modify + " " + ls_Objects[li_Count] + ".y='" + String(li_Y) + "'"
			ls_Undo = ls_Undo + " " + ls_Objects[li_Count] + ".y='" + String(li_OriginalY) + "'"
		End if
	End if
Next

ii_UndoLevel ++
is_Undo[ii_UndoLevel] = ls_Undo

If ab_Execute Then
	ls_Return = idw_Requestor.Modify(ls_Modify)
Else
	ls_Return = ls_Modify
End if

Return ls_Return

end function

public function string of_SetBackground (string as_filename, boolean ab_sizetofit, integer ai_x, integer ai_y, integer ai_height, integer ai_width, boolean ab_execute);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetBackground
//
//	Access:  public
//
//	Arguments:
//	as_FileName				The name of the file containing the bitmap to display.
//	ab_SizeToFit				True - set the width of the picture to be the width of the
//									DataWindow and use the ai_Height/ai_Width ratio to
//									calculate the height (ai_X, ai_Y, ai_Height, and ai_Width
//									will be ignored).
//									False - use ai_X, aiY, ai_Height, and ai_Width.
//	ai_X							The X location of the bitmap being placed, it will be
//									centered horizontally if 0 is passed.
//	ai_Y							The Y location of the bitmap being placed, it will be
//									centered vertically if 0 is passed.
//	ai_Height					The height of the bitmap being placed, it will be calculated
//									if 0 is passed.
//	ai_Width					The width of the bitmap being placed, it will be calculated
//									if 0 is passed.
//	ab_Execute				True - execute the Modify command,
//									False - build the command but do not execute it
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.  Or one of the following errors:
//					"Error!  Invalid DW Unit"			-	DataWindow Unit is not PB Units or Pixels
//					"Error!  File not found"				-	The picture file does not exist
//					"Error!  Error calculating size"	-	Returned an error calculating the object size
//
//	Description:	Place a picture in the background of the DataWindow.
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

String	ls_Return, ls_Modify
Integer	li_Height, li_Width

// Verify that DataWindow units are either PowerBuild Units or Pixels
If idw_Requestor.Object.DataWindow.Units > "1" Then Return "Error!  Invalid DW Unit"

// Verify that the file exists
If Not FileExists(as_FileName) Then
	Return "Error!  File not found"
End if

If ab_SizeToFit  Or ai_Height = 0 Or ai_Width = 0 Then
	// Calculate the size of the picture
	If of_GetPictureSize(as_FileName, ai_Height, ai_Width) = -1 Then Return "Error!  Error calculating size"
	If idw_Requestor.Describe("Datawindow.Units") = "1" Then
		// Convert PB units to pixels
		ai_Height = UnitsToPixels(ai_Height, YUnitsToPixels!)
		ai_Width = UnitsToPixels(ai_Width, XUnitsToPixels!)
	End if
End If

If ab_SizeToFit Then
	// Calculate the height and width
	// Width = the width of the datawindow - whitespace
	// whitespace is the X value
	li_Width = of_GetWidth() - (ai_X * 2)
	li_Height = li_Width * (ai_Height / ai_Width)
Else
	li_Height = ai_Height
	li_Width = ai_Width
End if

// Determine the X and Y values
If ai_X = 0 Then
	// Center the bmp horizontally
	ai_X = (of_GetWidth() - li_Width) / 2
End If

If ai_Y = 0 Then
	// Center the bmp vertically
	ai_Y = (of_GetHeight() - li_Height) / 2
End If

// Build modify statement to create the picture object
ls_Modify = ls_Modify + " create bitmap(band=background" + &
			" filename='" + as_FileName + "'" + &
			" x='" + String(ai_X) + "' y='" + String(ai_Y) +"'" + &
			" height='" + String(li_Height) + "' width='" + String(li_Width) + "'" + &
			" name=add_obj_" + String(ii_ObjectNum) + ")"

ii_UndoLevel ++
is_Undo[ii_UndoLevel] = "destroy add_obj_" + String(ii_ObjectNum)

ii_ObjectNum ++

If ab_Execute Then
	ls_Return = idw_Requestor.Modify(ls_Modify)
Else
	ls_Return = ls_Modify
End if

Return ls_Return

end function

public function string of_setfont (string as_fontface, integer ai_fontsize, fontfamily aff_fontfamily, fontpitch afp_fontpitch, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_name, string as_band, boolean ab_execute);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetFont
//
//	Access:  public
//
//	Arguments:
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	aff_FontFamily			The font family (AnyFont!, Roman!, Swiss!, Modern!, 
//									Script!, Decorative!)
//	afp_FontPitch				The pitch of the font (Default!, Fixed!, Variable!)
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_Name					The name of the object to change, "*" will cause all
//									objects in the band to be changed.
//	as_Band					The band in which to change the objecs, "*" will call
//									the entire datawindow to be changed.  This argument is
//									ignored if a name is passed in as_Name.
//	ab_Execute				True - execute the Modify command,
//									False - build the command but do not execute it
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Change the font of an object in the datawindow.
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

String			ls_FontFace, ls_Modify, ls_Objects[], ls_Undo, ls_FontSize, &
					ls_FontFamily, ls_OldFamily, ls_FontPitch, ls_OldPitch, ls_FontWeight, &
					ls_OldWeight, ls_Italic, ls_OldItalic, ls_Underline, ls_OldUnderline, ls_Return
Integer			li_NumObjects, li_Count, li_Undo
n_cst_string	lnv_String

// Determine the DataWindow Modify parameters
Choose Case aff_FontFamily
	Case AnyFont!
		ls_FontFamily = "0"
	Case Roman!
		ls_FontFamily = "1"
	Case Swiss!
		ls_FontFamily = "2"
	Case Modern!
		ls_FontFamily = "3"
	Case Script!
		ls_FontFamily = "4"
	Case Decorative!
		ls_FontFamily = "5"
End Choose

Choose Case afp_FontPitch
	Case Default!
		ls_FontPitch = "0"
	Case Fixed!
		ls_FontPitch = "1"
	Case Variable!
		ls_FontPitch = "2"
End Choose

If ab_Bold Then
	ls_FontWeight = "700"
Else
	ls_FontWeight = "400"
End If

If ab_Italic Then
	ls_Italic = "1"
Else
	ls_Italic = "0"
End If

If ab_Underline Then
	ls_Underline = "1"
Else
	ls_Underline = "0"
End If

If as_Name = "*" Then
	// All visible objects in the as_Band band are to be changed
	li_NumObjects = of_GetObjects(ls_Objects, "*", as_Band, True)

	li_Undo = ii_UndoLevel

	For li_Count = 1 To li_NumObjects
		// Call this function for each object
		ls_Modify = ls_Modify + of_SetFont(as_FontFace, ai_FontSize, aff_FontFamily, &
														afp_FontPitch, ab_Bold, ab_Italic, ab_Underline, &
														ls_Objects[li_Count], "",  False)
	Next

	// Combine each object's undo statement into one
	li_Undo ++
	For li_Count = (li_Undo + 1) To ii_UndoLevel
		is_Undo[li_Undo] = is_Undo[li_Undo] + " " + is_Undo[li_Count]
	Next
	ii_UndoLevel = li_Undo

Else
	ls_FontSize = idw_Requestor.Describe(as_Name + ".Font.Height")
	If Not IsNumber(ls_FontSize) Then
		// This is not a text or column object
		Return ""
	End if

	// Change font size
	If Not IsNull(ai_FontSize) And ai_FontSize <> Integer(ls_FontSize) Then
		ls_Modify = " " + as_Name + ".Font.Height='-" + String(ai_FontSize) + "'"
		ls_Undo = " " + as_Name + ".Font.Height='" + ls_FontSize + "'"
	End if

	// Change font face
	If Not IsNull(as_FontFace) Then
		ls_FontFace = idw_Requestor.Describe(as_Name + ".Font.Face")
		If as_FontFace <> ls_FontFace Then
			ls_Modify =  ls_Modify + " " + as_Name + ".Font.Face='" + as_FontFace + "'"
			ls_Undo =  ls_Undo + as_Name + ".Font.Face='" + ls_FontFace + "'"
		End if
	End if

	// Change font family
	If Not IsNull(aff_FontFamily) Then
		ls_OldFamily = idw_Requestor.Describe(as_Name + ".Font.Family")
		If ls_FontFamily <> ls_OldFamily Then
			ls_Modify =  ls_Modify + " " + as_Name + ".Font.Family='" + ls_FontFamily + "'"
			ls_Undo =  ls_Undo + as_Name + ".Font.Family='" + ls_OldFamily + "'"
		End if
	End if

	// Change font pitch
	If Not IsNull(afp_FontPitch) Then
		ls_OldPitch = idw_Requestor.Describe(as_Name + ".Font.Pitch")
		If ls_FontPitch <> ls_OldPitch Then
			ls_Modify =  ls_Modify + " " + as_Name + ".Font.Pitch='" + ls_FontPitch + "'"
			ls_Undo =  ls_Undo + as_Name + ".Font.Pitch='" + ls_OldPitch + "'"
		End if
	End if

	// Change font weight
	If Not IsNull(ab_Bold) Then
		ls_OldWeight = idw_Requestor.Describe(as_Name + ".Font.Weight")
		If ls_FontWeight <> ls_OldWeight Then
			ls_Modify = ls_Modify + " " + as_Name + ".Font.Weight='" + ls_FontWeight + "'"
			ls_Undo = ls_Undo + " " + as_Name + ".Font.Weight='" + ls_OldWeight + "'"
		End if
	End if

	// Change italic
	If Not IsNull(ab_Italic) Then
		If idw_Requestor.Describe(as_Name + ".Font.Italic") <> "1" Then
			ls_OldItalic = "0"
		Else
			ls_OldItalic = "1"
		End If
		If ls_Italic <> ls_OldItalic Then
			ls_Modify = ls_Modify + " " + as_Name + ".Font.Italic='" + ls_Italic + "'"
			ls_Undo = ls_Undo + " " + as_Name + ".Font.Italic='" + ls_OldItalic + "'"
		End if
	End if

	// Change underline
	If Not IsNull(ab_Underline) Then
		If idw_Requestor.Describe(as_Name + ".Font.Underline") <> "1" Then
			ls_OldUnderline = "0"
		Else
			ls_OldUnderline = "1"
		End If
		If ls_Underline <> ls_OldUnderline Then
			ls_Modify = ls_Modify + " " + as_Name + ".Font.Underline='" + ls_Underline + "'"
			ls_Undo = ls_Undo + " " + as_Name + ".Font.Underline='" + ls_OldUnderline + "'"
		End if
	End if

	ls_Undo = lnv_string.of_GlobalReplace (ls_Undo, "~"", "", FALSE)
	ii_UndoLevel ++
	is_Undo[ii_UndoLevel] = ls_Undo
End if

If ab_Execute Then
	ls_Return = idw_Requestor.Modify(ls_Modify)
Else
	ls_Return = ls_Modify
End if

Return ls_Return

end function

public function string of_getdefaultfontface ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_getdefaultfontface
//
//	Access:  public
//
//	Arguments:	None.
//
//	Returns:		String
//					The current default font face used by these functions.
//
//	Description:	Get the current default font face (is_DefaultFontFace).
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

Return is_DefaultFontFace

end function

public function integer of_getdefaultfontsize ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_getdefaultfontsize
//
//	Access:  public
//
//	Arguments:	None.
//
//	Returns:		Integer
//					The current default font size used by these functions.
//
//	Description:	Get the current default font size (ii_DefaultFontSize).
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

Return ii_DefaultFontSize

end function

public function border of_getdefaultborder ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_getdefaultborder
//
//	Access:  public
//
//	Arguments:	None.
//
//	Returns:		Border
//					The current default border style used by these functions.
//
//	Description:	Get the current default border style (ibo_Border).
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

Return ibo_DefaultBorder

end function

public function long of_getdefaultcolor ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_getdefaultcolor
//
//	Access:  public
//
//	Arguments:	None.
//
//	Returns:		Long
//					The current default color used by these functions.
//
//	Description:	Get the current default color (il_DefaultColor).
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

Return il_DefaultColor

end function

public function long of_getdefaultbackcolor ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_getdefaultbackcolor
//
//	Access:  public
//
//	Arguments:	None.
//
//	Returns:		Long
//					The current default background color used by these functions.
//
//	Description:	Get the current default background color (il_DefaultBackColor).
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

Return il_DefaultBackColor

end function

public subroutine of_setdefaultfontface (string as_FontFace);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_setdefaultfontface
//
//	Access:  public
//
//	Arguments:
//	as_FontFace				The new default font face.
//
//	Returns:		None.
//
//	Description:	Set the new default font face (is_DefaultFontFace).
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

is_DefaultFontFace = as_FontFace

end subroutine

public subroutine of_setdefaultfontsize (integer ai_FontSize);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_setdefaultfontsize
//
//	Access:  public
//
//	Arguments:
//	ai_FontSize				The new default font size.
//
//	Returns:		None.
//
//	Description:	Set the new default font size (ii_DefaultFontSize).
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

ii_DefaultFontSize = ai_FontSize

end subroutine

public subroutine of_setdefaultborder (border abo_Border);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_setdefaultborder
//
//	Access:  public
//
//	Arguments:
//	abo_Border				The new default border style.
//
//	Returns:		None.
//
//	Description:	Set the new default border style (ibo_DefaultBorder).
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

ibo_DefaultBorder = abo_Border

end subroutine

public subroutine of_setdefaultcolor (long al_Color);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_setdefaultcolor
//
//	Access:  public
//
//	Arguments:
//	al_Color							The new default color.
//
//	Returns:		None.
//
//	Description:	Set the new default color (il_DefaultColor).
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

il_DefaultColor = al_Color

end subroutine

public subroutine of_setdefaultbackcolor (long al_BackColor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_setdefaultbackcolor
//
//	Access:  public
//
//	Arguments:
//	al_BackColor					The new default background color.  If
//										Null is passed in, the background mode
//										will be set to Transparent.
//
//	Returns:		None.
//
//	Description:	Set the new default background color (il_DefaultBackColor).
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

il_DefaultBackColor = al_BackColor

end subroutine

protected function string of_BuildTextModify (string as_type, string as_text, string as_band, integer ai_x, integer ai_y, integer ai_height, integer ai_width, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_Color, long al_BackColor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_BuildTextModify
//
//	Access:  protected
//
//	Arguments:
//	as_Type						The type of object ("text" or "compute") being added.
//	as_Text						The text to be added.
//	as_Band					The band to add it to.
//	ai_X							The X location of the object being placed.
//	ai_Y							The Y location of the object being placed.
//	ai_Height					The weight of the object.
//	ai_Width					The width of the object.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	afc_CharSet				The character set to use (Ansi!, DefaultCharSet!, Symbol!, 
//									Shiftjis!, OEM!)
//	al_Color						The foreground color.
//	al_BackColor				The background color.
//
//	Returns:		String
//					The text of the Modify command to add the object.
//
//	Description:	Build the modify syntax to create a text object.
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

String	ls_Modify, ls_CharSet, ls_Border, ls_FontWeight, ls_Italic, ls_Underline

// Determine the DataWindow Modify parameters
Choose Case afc_CharSet
	Case Ansi!
		ls_CharSet = "0"
	Case Symbol!
		ls_CharSet = "2"
	Case Shiftjis!
		ls_CharSet = "128"
	Case OEM!
		ls_CharSet = "255"
	Case Else
		ls_CharSet = "1"
End Choose

Choose Case abo_Border
	Case NoBorder!
		ls_Border = "0"
	Case ShadowBox!
		ls_Border = "1"
	Case Box!
		ls_Border = "2"
	Case ResizeBorder!
		ls_Border = "3"
	Case Underline!
		ls_Border = "4"
	Case Lowered!
		ls_Border = "5"
	Case Raised!
		ls_Border = "6"
End Choose

If ab_Bold Then
	ls_FontWeight = "700"
Else
	ls_FontWeight = "400"
End If

If ab_Italic Then
	ls_Italic = "1"
Else
	ls_Italic = "0"
End If

If ab_Underline Then
	ls_Underline = "1"
Else
	ls_Underline = "0"
End If

// Build modify statement
ls_Modify = " create " + as_Type + "(band=" + as_Band

If as_Type = "compute" Then
	ls_Modify = ls_Modify + " expression=~"" + as_Text + "~""
Else
	ls_Modify = ls_Modify + " text='" + as_Text + "'"
End If

ls_Modify = ls_Modify + " x='" + String(ai_X) + "'" + &
			" y='" + String(ai_Y) + "'" + &
			" height='" + String(ai_Height) + "'" + &
			" width='" + String(ai_Width) + "'" + &
			" border='" + ls_Border + "'" + &
			" name=add_obj_" + String(ii_ObjectNum) + &
			" font.face='" + as_FontFace + "'" + &
			" font.charset='" + ls_CharSet + "'" + &
			" font.height='-" + String(ai_FontSize) + "'" + &
			" font.weight='" + ls_FontWeight + "'" + &
			" font.italic='" + ls_Italic + "'" + &
			" font.underline='" + ls_Underline + "'" + &
			" color='" + String(al_Color) + "'"

If IsNull(al_BackColor) Then
	ls_Modify = ls_Modify + " background.mode='1' background.color='536870912')"
Else
	ls_Modify = ls_Modify + " background.color='" + String(al_BackColor) + "')"
End If

Return ls_Modify

end function

protected function string of_addcompute (string as_expr, string as_band, alignment aal_halign, vtextalign avta_valign, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor, boolean ab_execute);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddCompute
//
//	Access:  protected
//
//	Arguments:
//	as_Expr						The expression to be added as the computed column.
//	as_Band					The band to add it to.
//	aal_HAlign					The horizontal alignment of the object being placed.
//	avta_Valign				The vertical alignment of the object being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ai_X							The X position of the object.
//	ai_Y							The Y position of the object.
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	afc_CharSet				The character set to use (Ansi!, DefaultCharSet!, Symbol!, 
//									Shiftjis!, OEM!)
//	al_Color						The color of the object.
//	al_BackColor				The background color of the object.
//	ab_Execute				True - execute the Modify command,
//									False - build the command but do not execute it
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.  Or one of the following errors:
//					"Error!  Invalid DW Unit"			-	DataWindow Unit is not PB Units or Pixels
//					"Error!  Invalid Expression"		-	The expression passed in was invalid
//					"Error!  Error calculating size"	-	Returned an error calculating the object size
//
//	Description:	Add a computed column to any band of a datawindow.  This protected
//						function does all the work.  Overloaded functions should be called.
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

String			ls_Return, ls_Modify, ls_Undo, ls_Line[], ls_Text
Integer			li_NewLines, li_Cnt, li_Line, li_Height, li_Width, &
					li_CurrentHeight, li_DwWidth, li_Shift
n_cst_string	lnv_String

// Verify that DataWindow units are either PowerBuild Units or Pixels
If idw_Requestor.Object.DataWindow.Units > "1" Then Return "Error!  Invalid DW Unit"

// Change all " to ~" because it will be imbedded in quotes
as_Expr = lnv_string.of_GlobalReplace (as_Expr, "~"", "~~~"", FALSE)

// Evaluate the expression to be used in calculating the object width
ls_Text = idw_Requestor.Describe("Evaluate('" + as_Expr + "', 1)")
If ls_Text = "!" Then
	Return "Error!  Invalid Expression"
End if

// Calculate the height, width and position of the new object (for the text: #11009)
li_NewLines = of_GetTextSizePos(ls_Text, as_Band, aal_HAlign, avta_VAlign, ab_Bold, &
												ab_Italic, ab_Underline, as_FontFace, ai_FontSize, li_Height, &
												li_Width, ai_X, ai_Y)
If li_NewLines = -1 Then Return "Error!  Error calculating size"

// Determine if existing objects should be shifted
If Not IsNull(aal_HAlign) Then
	If avta_VAlign <> VCenter! Then
		// Adding or inserting the object
		// Get original band height
		li_CurrentHeight = Integer(idw_Requestor.Describe("Datawindow." + as_Band + ".Height"))

		// Calculate the new height of the band
		li_Shift = (li_Height * (li_NewLines + 0.4))

		// If inserting at the top, then shift original objects down
		If avta_VAlign = Top! Then
			ls_Modify = ls_Modify + of_ShiftBand(as_Band, 0, li_Shift, False)
			ls_Undo = is_Undo[ii_UndoLevel]
			ii_UndoLevel --
		Else
			// Set new band height
			ls_Modify = "Datawindow." + as_Band + ".Height=" + String(li_CurrentHeight + li_Shift)
			ls_Undo = "Datawindow." + as_Band + ".Height=" + String(li_CurrentHeight)
		End if

	ElseIf aal_HAlign = Left! Then
		// Shift band objects right
		ls_Modify = ls_Modify + of_ShiftBand(as_Band, (li_Width + 10), 0, False)
		ls_Undo = is_Undo[ii_UndoLevel]
		ii_UndoLevel --
	End if
End If

// Build modify statement
ls_Modify = ls_Modify + of_BuildTextModify("compute", as_Expr, as_Band, ai_X, ai_Y, li_Height, li_Width, &
															abo_Border, ab_Bold, ab_Italic, ab_Underline, as_FontFace, &
															ai_FontSize, afc_CharSet, al_Color, al_BackColor)

ii_UndoLevel ++
is_Undo[ii_UndoLevel] = ls_Undo + " destroy add_obj_" + String(ii_ObjectNum)

ii_ObjectNum ++

If ab_Execute Then
	ls_Return = idw_Requestor.Modify(ls_Modify)
Else
	ls_Return = ls_Modify
End if

Return ls_Return

end function

public function string of_AddCompute (string as_expr, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor, boolean ab_execute);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddCompute
//
//	Access:  public
//
//	Arguments:
//	as_Expr						The expression to be added as the computed column.
//	as_Band					The band to add it to.
//	aal_HAlign					The horizontal alignment of the object being placed.
//	avta_Valign				The vertical alignment of the object being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	afc_CharSet				The character set to use (Ansi!, DefaultCharSet!, Symbol!, 
//									Shiftjis!, OEM!)
//	al_Color						The color of the object.
//	al_BackColor				The background color of the object.
//	ab_Execute				True - execute the Modify command,
//									False - build the command but do not execute it
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a computed column to any band of a datawindow.
//
//						This function overloads the real of_AddCompute, which is protected.
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

Integer	li_X, li_Y

Return of_AddCompute(as_Expr, as_Band, aal_HAlign, avta_VAlign, li_X, li_Y, abo_Border, &
								ab_Bold, ab_Italic, ab_Underline, as_FontFace, ai_FontSize, afc_CharSet, &
								al_Color, al_BackColor, ab_Execute)

end function

public function string of_AddCompute (string as_expr, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor, boolean ab_execute);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddCompute
//
//	Access:  public
//
//	Arguments:
//	as_Expr						The expression to be added as the computed column.
//	as_Band					The band to add it to.
//	ai_X							The X location of the object being placed.
//	ai_Y							The Y location of the object being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	afc_CharSet				The character set to use (Ansi!, DefaultCharSet!, Symbol!, 
//									Shiftjis!, OEM!)
//	al_Color						The color of the object.
//	al_BackColor				The background color of the object.
//	ab_Execute				True - execute the Modify command,
//									False - build the command but do not execute it
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a computed column to any band of a datawindow.
//
//						This function overloads the real of_AddCompute, which is protected.
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

Alignment		lal_Null
VTextAlign		lvta_Any

SetNull(lal_Null)
Return of_AddCompute(as_Expr, as_Band, lal_Null, lvta_Any, ai_X, ai_Y, abo_Border, ab_Bold, &
								ab_Italic, ab_Underline, as_FontFace, ai_FontSize, afc_CharSet, al_Color, &
								al_BackColor, ab_Execute)

end function

protected function string of_AddText (string as_text, string as_band, alignment aal_halign, vtextalign avta_valign, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor, boolean ab_execute);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddText
//
//	Access:  protected
//
//	Arguments:
//	as_Text						The text to be added.
//	as_Band					The band to add it to.
//	aal_HAlign					The horizontal alignment of the object.
//	avta_VAlign				The vertical alignment of the object.
//	ai_X							The X position of the object.
//	ai_Y							The Y position of the object.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	afc_CharSet				The character set to use (Ansi!, DefaultCharSet!, Symbol!, 
//									Shiftjis!, OEM!)
//	al_Color						The color of the object.
//	al_BackColor				The background color of the object.
//	ab_Execute				True - execute the Modify command,
//									False - build the command but do not execute it
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.  Or one of the following errors:
//					"Error!  Invalid DW Unit"			-	DataWindow Unit is not PB Units or Pixels
//					"Error!  Error calculating size"	-	Returned an error calculating the object size
//
//	Description:	Add a text object to any band of a datawindow.  This protected
//						function does all the work.  Overloaded public functions should
//						be called.
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

String			ls_Return, ls_Modify, ls_Undo, ls_Line[]
Integer			li_NewLines, li_CurrentHeight, li_dwWidth, li_Shift, &
					li_Cnt, li_Line, li_Height, li_Width
n_cst_string	lnv_String

// Verify that DataWindow units are either PowerBuild Units or Pixels
If idw_Requestor.Object.DataWindow.Units > "1" Then Return "Error!  Invalid DW Unit"

// Calculate the height, width and position of the new object
li_NewLines = of_GetTextSizePos(as_Text, as_Band, aal_HAlign, avta_VAlign, ab_Bold, &
												ab_Italic, ab_Underline, as_FontFace, ai_FontSize, li_Height, &
												li_Width, ai_X, ai_Y)
If li_NewLines = -1 Then Return "Error!  Error calculating size"

// Shift existing objects as necessary
If Not IsNull(aal_HAlign) Then
	If avta_VAlign <> VCenter! Then
		// Adding or inserting the text
		// Get original band height and Datawindow color
		li_CurrentHeight = Integer(idw_Requestor.Describe("Datawindow." + as_Band + ".Height"))

		// Calculate the new height of the band
		li_Shift = (li_Height * (li_NewLines + 0.4))

		// If inserting, then shift original header down
		If avta_VAlign = Top! Then
			ls_Modify = ls_Modify + of_ShiftBand(as_Band, 0, li_Shift, False)
			ls_Undo = is_Undo[ii_UndoLevel]
			ii_UndoLevel --
		Else
			// Set new band height
			ls_Modify = "Datawindow." + as_Band + ".Height=" + String(li_CurrentHeight + li_Shift)
			ls_Undo = "Datawindow." + as_Band + ".Height=" + String(li_CurrentHeight)
		End if
	
	ElseIf aal_HAlign = Left! Then
		// Shift band objects right
		ls_Modify = ls_Modify + of_ShiftBand(as_Band, (li_Width + 10), 0, False)
		ls_Undo = is_Undo[ii_UndoLevel]
		ii_UndoLevel --
	End if
End If

// Build modify statement
ls_Modify = ls_Modify + of_BuildTextModify("text", as_Text, as_Band, ai_X, ai_Y, li_Height, li_Width, &
															abo_Border, ab_Bold, ab_Italic, ab_Underline, &
															as_FontFace, ai_FontSize, afc_CharSet, al_Color, al_BackColor)

ii_UndoLevel ++
is_Undo[ii_UndoLevel] = ls_Undo + " destroy add_obj_" + String(ii_ObjectNum)

ii_ObjectNum ++

If ab_Execute Then
	ls_Return = idw_Requestor.Modify(ls_Modify)
Else
	ls_Return = ls_Modify
End if

Return ls_Return

end function

public function string of_AddText (string as_text, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor, boolean ab_execute);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddText
//
//	Access:  public
//
//	Arguments:
//	as_Text						The text to be added.
//	as_Band					The band to add it to.
//	aal_HAlign					The horizontal alignment of the object.
//	avta_VAlign				The vertical alignment of the object.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	afc_CharSet				The character set to use (Ansi!, DefaultCharSet!, Symbol!, 
//									Shiftjis!, OEM!)
//	al_Color						The color of the object.
//	al_BackColor				The background color of the object.
//	ab_Execute				True - execute the Modify command,
//									False - build the command but do not execute it
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a text object to any band of a datawindow.
//
//						This function overloads the real of_AddText, which is protected.
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

Integer	li_X, li_Y

Return of_AddText(as_Text, as_Band, aal_HAlign, avta_VAlign, li_X, li_Y, abo_Border, ab_Bold, &
							ab_Italic, ab_Underline, as_FontFace, ai_FontSize, afc_CharSet, al_Color, &
							al_BackColor, ab_Execute)

end function

public function string of_AddText (string as_text, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor, boolean ab_execute);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddText
//
//	Access:  public
//
//	Arguments:
//	as_Text						The text to be added.
//	as_Band					The band to add it to.
//	ai_X							The X location of the object being placed.
//	ai_Y							The Y location of the object being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	afc_CharSet				The character set to use (Ansi!, DefaultCharSet!, Symbol!, 
//									Shiftjis!, OEM!)
//	al_Color						The color of the object.
//	al_BackColor				The background color of the object.
//	ab_Execute				True - execute the Modify command,
//									False - build the command but do not execute it
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a text object to any band of a datawindow.
//
//						This function overloads the real of_AddText, which is protected.
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

Alignment	lal_Null
VTextAlign	lvta_Any

SetNull(lal_Null)
Return of_AddText(as_Text, as_Band, lal_Null, lvta_Any, ai_X, ai_Y, abo_Border, ab_Bold, &
							ab_Italic, ab_Underline, as_FontFace, ai_FontSize, afc_CharSet, al_Color, &
							al_BackColor, ab_Execute)

end function

protected function string of_AddLine (string as_band, linestyle als_style, integer ai_width, vtextalign avta_valign, integer ai_x1, integer ai_y1, integer ai_x2, integer ai_y2, long al_color, long al_backcolor, boolean ab_execute);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddLine
//
//	Access:  protected
//
//	Arguments:
//	as_Band					The band to add the line to.
//	als_Style					The pen style of the line (Continuous!, Dash!, DashDot!,
//									DashDotDot!,  Dot!).
//	ai_Width					The pen width of the line.
//	ai_X1							The X1 point of the line.
//	ai_Y1							The Y1 point of the line.
//	ai_X2							The X2 point of the line, if 0 is passed it will 
//									be set to the width of the datawindow.
//	ai_Y2							The Y2 point of the line.
//	al_Color						The color of the line.
//	al_BackColor				The background color of the line.
//	ab_Execute				True - execute the Modify command,
//									False - build the command but do not execute it.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a line to any band of a datawindow.  This protected function
//						does all the work.  Overloaded public functions should be called.
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

String	ls_Return, ls_Modify, ls_Undo, ls_X1, ls_X2, ls_Y1, ls_Y2, ls_Style
Integer	li_CurrentHeight

// Set function defaults for parameters not passed
If ai_Width = 0 Then ai_Width = 4

// Set DataWindow Modify values
Choose Case als_Style
	Case Dash!
		ls_Style = "1"
	Case Dot!
		ls_Style = "2"
	Case DashDot!
		ls_Style = "3"
	Case DashDotDot!
		ls_Style = "4"
	Case Else
		ls_Style = "0"
End Choose

// Determine whether to shift existing objects
If Not IsNull(avta_VAlign) Then
	// Get original band height and Datawindow color
	li_CurrentHeight = Integer(idw_Requestor.Describe("Datawindow." + as_Band + ".Height"))
	
	If avta_VAlign <> VCenter! Then
		// Adding or inserting the line
		// If inserting, then shift original band down
		If avta_VAlign = Top! Then
			ls_Modify = ls_Modify + of_ShiftBand(as_Band, 0, (ai_Width + 4), False)
			ls_Undo = is_Undo[ii_UndoLevel]
			ii_UndoLevel --
		Else
			// Set new band height
			ls_Modify = "Datawindow." + as_Band + ".Height=" + String(li_CurrentHeight + ai_Width + 4)
			ls_Undo = "Datawindow." + as_Band + ".Height=" + String(li_CurrentHeight)
		End if
	End if

	// Determine line points
	ls_X1 = "1"

	// Determine the width of the datawindow
	ls_X2 = String(of_GetWidth())

	If avta_VAlign = Top! Then
		ls_Y1 = String((ai_Width / 2) + 2)
	ElseIf avta_VAlign = Bottom! Then
		ls_Y1 = String(li_CurrentHeight + ((ai_Width / 2) + 2))
	Else
		ls_Y1 = String((li_CurrentHeight / 2) - ((ai_Width / 2) + 2))
	End if

	ls_Y2 = ls_Y1

Else
	// Determine line points
	ls_X1 = String(ai_X1)

	If ai_X2 = 0 Then
		// Determine the width of the datawindow
		ls_X2 = String(of_GetWidth())
	Else
		ls_X2 = String(ai_X2)
	End if

	ls_Y1 = String(ai_Y1)
	ls_Y2 = String(ai_Y2)
End If

// Build modify statement
ls_Modify = ls_Modify + " create line(band=" + as_Band + &
			" x1='" + ls_X1 + "'" + &
			" y1='" + ls_Y1 + "'" + &
			" x2='" + ls_X2 + "'" + &
			" y2='" + ls_Y2 + "'" + &
			" pen.style='" + ls_Style + "'" + &
			" pen.width='" + String(ai_Width) + "'" + &
			" name=add_obj_" + String(ii_ObjectNum) + &
			" pen.color='" + String(al_Color) + "'"
			
If IsNull(al_BackColor) Then
	ls_Modify = ls_Modify + " background.mode='1' background.color='536870912')"
Else
	ls_Modify = ls_Modify + " background.color='" + String(al_BackColor) + "')"
End If

ii_UndoLevel ++
is_Undo[ii_UndoLevel] = ls_Undo + " destroy add_obj_" + String(ii_ObjectNum)

ii_ObjectNum ++

If ab_Execute Then
	ls_Return = idw_Requestor.Modify(ls_Modify)
Else
	ls_Return = ls_Modify
End if

Return ls_Return

end function

public function string of_AddLine (string as_band, linestyle als_style, integer ai_width, integer ai_x1, integer ai_y1, integer ai_x2, integer ai_y2, long al_color, long al_backcolor, boolean ab_execute);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddLine
//
//	Access:  public
//
//	Arguments:
//	as_Band					The band to add the line to.
//	als_Style					The pen style of the line (Continuous!, Dash!, DashDot!,
//									DashDotDot!,  Dot!).
//	ai_Width					The pen width of the line.
//	ai_X1							The X1 point of the line.
//	ai_Y1							The Y1 point of the line.
//	ai_X2							The X2 point of the line, if 0 is passed it will 
//									be set to the width of the datawindow.
//	ai_Y2							The Y2 point of the line.
//	al_Color						The color of the line.
//	al_BackColor				The background color of the line.
//	ab_Execute				True - execute the Modify command,
//									False - build the command but do not execute it.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a line to any band of a datawindow.
//
//						This function overloads the real of_AddLine which is protecred.
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

VTextAlign		lvta_Null

SetNull(lvta_Null)
Return of_AddLine(as_Band, als_Style, ai_Width, lvta_Null, ai_X1, ai_Y1, ai_X2, ai_Y2, al_Color, al_BackColor, ab_Execute)

end function

public function string of_AddLine (string as_band, linestyle als_style, integer ai_width, vtextalign avta_valign, long al_color, long al_backcolor, boolean ab_execute);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddLine
//
//	Access:  public
//
//	Arguments:
//	as_Band					The band to add the picture to.
//	als_Style					The pen style of the line (Continuous!, Dash!, DashDot!,
//									DashDotDot!,  Dot!).
//	ai_Width					The pen width of the line.
//	avta_VAlign				The position within the band to draw the line (Top!,
//									VCenter!, Bottom!).  If Top! all objects in the band will be
//									shifted down to make room.
//	al_Color						The color of the line.
//	al_BackColor				The background color of the line.
//	ab_Execute				True - execute the Modify command,
//									False - build the command but do not execute it.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a horizontal line to any band of a datawindow.
//
//						This function overloads the real of_AddLine, which is protected.
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

Integer	li_X1, li_Y1, li_X2, li_Y2

Return of_AddLine(as_Band, als_Style, ai_Width, avta_VAlign, li_X1, li_Y1, li_X2, li_Y2, al_Color, al_BackColor, ab_Execute)

end function

public function integer of_createcomposite (string as_datawindow[], boolean ab_vertical, string as_trailfooter[], string as_slide[], border abo_border[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_createcomposite
//
//	Access:  public
//
//	Arguments:
//	as_Expr						The expression to be added as the computed column.
//	as_DataWindow[]		An array of DataWindows to place on the composite.
//	ab_Vertical				True - arrange the DataWindows vertically down the page,
//									False - arrange the DataWindows horizontally.
//	as_TrailFooter[]			An array of values ("yes" or "no") to set the individual 
//									trail_footer attributes for each DataWindow.
//	as_NewPage[]			An array of values ("yes" or "no") to set the individual 
//									NewPage attributes for each DataWindow.
//	as_Slide[]					An array of values to set the individual slide attributes
//									for each DataWindow; if ab_Vertical is true this sets SlideUp
//									and valid values are "AboveAll", "DirectlyAbove" or "No;
//									if ab_Vertical is false this sets SlideLeft and valid values are
//									"yes" or "no".
//	abo_Border[]				An array of values (NoBorder!, ShadowBox!, Box!, 
//									ResizeBorder!, Underline!, Lowered!, Raised!) to use as 
//									the border for each DataWindow.
//
//	Returns:		Integer
//					1 if successful, -1 if an error occurrs.
//
//	Description:	Create a composite DataWindow from an array of DataWindows.
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

String	ls_Modify, ls_Version, ls_TrailFooter, ls_NewPage, ls_Slide, ls_Border
Integer	li_Return, li_NumDWs, li_Count, li_Width, li_X = 1, li_Y = 1, &
			li_NumTrail, li_NumSlide, li_NumBorder

idw_Requestor.SetRedraw(False)

li_NumDWs = UpperBound(as_Datawindow[])
li_NumTrail = UpperBound(as_TrailFooter[])
li_NumSlide = UpperBound(as_Slide[])
li_NumBorder = UpperBound(abo_Border[])

// Build Modify syntax to create the new DataWindow
ls_Version = String(gnv_App.ienv_Object.pbmajorrevision)
ls_Modify = "Release " + ls_Version + ";"

ls_Modify = ls_Modify + " datawindow(units=0 color=16777215 processing=5 print.orientation = 0 ) " + &
								"detail(height=289 color='16777215'  height.autosize=yes) " + &
								"table(column=(type=char(10) name=a dbname='a' ) unbound = 'yes') "

For li_Count = 1 To li_NumDWs
	
	// Add each report to the composite
	idw_Requestor.DataObject = as_Datawindow[li_Count]
	li_Width = of_GetWidth()
	ls_Modify = ls_Modify + " report(band=detail dataobject='" + as_Datawindow[li_Count] + "'" + &
				" x='" + String(li_X) + "' y='" + String(li_Y) + "' height='97' width='" + String(li_Width) + "'" + &
				" height.autosize=yes criteria=''"

	If li_Count <= li_NumBorder Then
		Choose Case abo_Border[li_Count]
			Case NoBorder!
				ls_Border = "0"
			Case ShadowBox!
				ls_Border = "1"
			Case Box!
				ls_Border = "2"
			Case ResizeBorder!
				ls_Border = "3"
			Case Underline!
				ls_Border = "4"
			Case Lowered!
				ls_Border = "5"
			Case Raised!
				ls_Border = "6"
		End Choose
	Else
		ls_Border = "0"
	End If
	
	ls_Modify = ls_Modify + " border='" + ls_Border + "'"
	
	If li_Count <= li_NumTrail Then
		If as_TrailFooter[li_Count] = "" Then
			ls_TrailFooter = "yes"
		Else
			ls_TrailFooter = as_TrailFooter[li_Count]
		End if
	Else
		ls_TrailFooter = "yes"
	End if

	ls_Modify = ls_Modify + " trail_footer=" + ls_TrailFooter

	If ab_Vertical Then
		li_Y = li_Y + 100

		If li_Count <= li_NumSlide Then
			If as_Slide[li_Count] = "" Then
				ls_Slide = "AboveAll"
			Else
				ls_Slide = as_Slide[li_Count]
			End if
		Else
			ls_Slide = "AboveAll"
		End if

		ls_Modify = ls_Modify + " slideup=" + ls_Slide + ")"

	Else
		li_X = li_X + li_Width + 20

		If li_Count <= li_NumSlide Then
			If as_Slide[li_Count] = "" Then
				ls_Slide = "yes"
			Else
				ls_Slide = as_Slide[li_Count]
			End if
		Else
			ls_Slide = "yes"
		End if

		ls_Modify = ls_Modify + " slideleft=" + ls_Slide + ")"
	End if
Next

li_Return = idw_Requestor.Create(ls_Modify)

idw_Requestor.SetRedraw(True)

Return li_Return

end function

public function string of_setrelativezoom (integer ai_zoompct);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetrelativeZoom
//
//	Access:  public
//
//	Arguments:
//	ai_XoomPct				The percentage change to the report.
//
//	Returns:		String
//					The output of the Modify command (the error text or "").
//
//	Description:	Increase or decrease the size of a report.  The zoom will
//						be relative to its current zoom percentage.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   		Initial version
//	5.0.02	Fixed error setting li_CurrentZoom
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

Integer	li_Pct, li_CurrentZoom
String	ls_Return

li_CurrentZoom = Integer(idw_Requestor.Object.DataWindow.Zoom)

li_Pct = li_CurrentZoom * (ai_ZoomPct / 100)

ls_Return = idw_Requestor.Modify("Datawindow.Zoom=" + String(li_Pct))

ii_UndoLevel ++
is_Undo[ii_UndoLevel] = "datawindow.zoom=" + String(li_CurrentZoom)

Return ls_Return

end function

public function string of_AddCompute (string as_expr, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddCompute
//
//	Access:  public
//
//	Arguments:
//	as_Expr						The expression to be added as the computed column.
//	as_Band					The band to add it to.
//	aal_HAlign					The horizontal alignment of the object being placed.
//	avta_Valign				The vertical alignment of the object being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	afc_CharSet				The character set to use (Ansi!, DefaultCharSet!, Symbol!, 
//									Shiftjis!, OEM!)
//	al_Color						The color of the object.
//	al_BackColor				The background color of the object.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a computed column to any band of a datawindow.
//
//						This function overloads the real of_AddCompute, which is protected.
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

Integer	li_X, li_Y

Return of_AddCompute(as_Expr, as_Band, aal_HAlign, avta_VAlign, li_X, li_Y, abo_Border, &
								ab_Bold, ab_Italic, ab_Underline, as_FontFace, ai_FontSize, afc_CharSet, &
								al_Color, al_BackColor, True)

end function

public function string of_AddCompute (string as_expr, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddCompute
//
//	Access:  public
//
//	Arguments:
//	as_Expr						The expression to be added as the computed column.
//	as_Band					The band to add it to.
//	aal_HAlign					The horizontal alignment of the object being placed.
//	avta_Valign				The vertical alignment of the object being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	afc_CharSet				The character set to use (Ansi!, DefaultCharSet!, Symbol!, 
//									Shiftjis!, OEM!)
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a computed column to any band of a datawindow.
//
//						This function overloads the real of_AddCompute, which is protected.
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

Integer	li_X, li_Y

Return of_AddCompute(as_Expr, as_Band, aal_HAlign, avta_VAlign, li_X, li_Y, abo_Border, &
								ab_Bold, ab_Italic, ab_Underline, as_FontFace, ai_FontSize, afc_CharSet, &
								il_DefaultColor, il_DefaultBackColor, True)

end function

public function string of_AddCompute (string as_expr, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddCompute
//
//	Access:  public
//
//	Arguments:
//	as_Expr						The expression to be added as the computed column.
//	as_Band					The band to add it to.
//	aal_HAlign					The horizontal alignment of the object being placed.
//	avta_Valign				The vertical alignment of the object being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a computed column to any band of a datawindow.
//
//						This function overloads the real of_AddCompute, which is protected.
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

Integer	li_X, li_Y

Return of_AddCompute(as_Expr, as_Band, aal_HAlign, avta_VAlign, li_X, li_Y, abo_Border, &
								ab_Bold, ab_Italic, ab_Underline, is_DefaultFontFace, ii_DefaultFontSize, &
								ifc_DefaultCharSet, il_DefaultColor, il_DefaultBackColor, True)

end function

public function string of_AddCompute (string as_expr, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddCompute
//
//	Access:  public
//
//	Arguments:
//	as_Expr						The expression to be added as the computed column.
//	as_Band					The band to add it to.
//	aal_HAlign					The horizontal alignment of the object being placed.
//	avta_Valign				The vertical alignment of the object being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a computed column to any band of a datawindow.
//
//						This function overloads the real of_AddCompute, which is protected.
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

Integer	li_X, li_Y

Return of_AddCompute(as_Expr, as_Band, aal_HAlign, avta_VAlign, li_X, li_Y, abo_Border, &
								False, False, False, is_DefaultFontFace, ii_DefaultFontSize, &
								ifc_DefaultCharSet, il_DefaultColor, il_DefaultBackColor, True)

end function

public function string of_AddCompute (string as_expr, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddCompute
//
//	Access:  public
//
//	Arguments:
//	as_Expr						The expression to be added as the computed column.
//	as_Band					The band to add it to.
//	ai_X							The X location of the object being placed.
//	ai_Y							The Y location of the object being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	afc_CharSet				The character set to use (Ansi!, DefaultCharSet!, Symbol!, 
//									Shiftjis!, OEM!)
//	al_Color						The color of the object.
//	al_BackColor				The background color of the object.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a computed column to any band of a datawindow.
//
//						This function overloads the real of_AddCompute, which is protected.
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

Alignment		lal_Null
VTextAlign		lvta_Any

SetNull(lal_Null)
Return of_AddCompute(as_Expr, as_Band, lal_Null, lvta_Any, ai_X, ai_Y, abo_Border, ab_Bold, &
								ab_Italic, ab_Underline, as_FontFace, ai_FontSize, afc_CharSet, al_Color, &
								al_BackColor, True)

end function

public function string of_AddCompute (string as_expr, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddCompute
//
//	Access:  public
//
//	Arguments:
//	as_Expr						The expression to be added as the computed column.
//	as_Band					The band to add it to.
//	ai_X							The X location of the object being placed.
//	ai_Y							The Y location of the object being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	afc_CharSet				The character set to use (Ansi!, DefaultCharSet!, Symbol!, 
//									Shiftjis!, OEM!)
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a computed column to any band of a datawindow.
//
//						This function overloads the real of_AddCompute, which is protected.
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

Alignment		lal_Null
VTextAlign		lvta_Any

SetNull(lal_Null)
Return of_AddCompute(as_Expr, as_Band, lal_Null, lvta_Any, ai_X, ai_Y, abo_Border, ab_Bold, &
								ab_Italic, ab_Underline, as_FontFace, ai_FontSize, afc_CharSet, Il_DefaultColor, &
								il_DefaultBackColor, True)

end function

public function string of_AddCompute (string as_expr, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddCompute
//
//	Access:  public
//
//	Arguments:
//	as_Expr						The expression to be added as the computed column.
//	as_Band					The band to add it to.
//	ai_X							The X location of the object being placed.
//	ai_Y							The Y location of the object being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a computed column to any band of a datawindow.
//
//						This function overloads the real of_AddCompute, which is protected.
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

Alignment		lal_Null
VTextAlign		lvta_Any

SetNull(lal_Null)
Return of_AddCompute(as_Expr, as_Band, lal_Null, lvta_Any, ai_X, ai_Y, abo_Border, ab_Bold, &
								ab_Italic, ab_Underline, is_DefaultFontFace, ii_DefaultFontSize, ifc_DefaultCharSet, &
								Il_DefaultColor, il_DefaultBackColor, True)

end function

public function string of_AddCompute (string as_expr, string as_band, integer ai_x, integer ai_y);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddCompute
//
//	Access:  public
//
//	Arguments:
//	as_Expr						The expression to be added as the computed column.
//	as_Band					The band to add it to.
//	ai_X							The X location of the object being placed.
//	ai_Y							The Y location of the object being placed.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a computed column to any band of a datawindow.
//
//						This function overloads the real of_AddCompute, which is protected.
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

Alignment		lal_Null
VTextAlign		lvta_Any

SetNull(lal_Null)
Return of_AddCompute(as_Expr, as_Band, lal_Null, lvta_Any, ai_X, ai_Y, ibo_DefaultBorder, False, &
								False, False, is_DefaultFontFace, ii_DefaultFontSize, ifc_DefaultCharSet, &
								Il_DefaultColor, il_DefaultBackColor, True)

end function

public function string of_AddLine (string as_band, linestyle als_style, integer ai_width, integer ai_x1, integer ai_y1, integer ai_x2, integer ai_y2, long al_color, long al_backcolor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddLine
//
//	Access:  public
//
//	Arguments:
//	as_Band					The band to add the line to.
//	als_Style					The pen style of the line (Continuous!, Dash!, DashDot!,
//									DashDotDot!,  Dot!).
//	ai_Width					The pen width of the line.
//	ai_X1							The X1 point of the line.
//	ai_Y1							The Y1 point of the line.
//	ai_X2							The X2 point of the line, if 0 is passed it will 
//									be set to the width of the datawindow.
//	ai_Y2							The Y2 point of the line.
//	al_Color						The color of the line.
//	al_BackColor				The background color of the line.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a line to any band of a datawindow.
//
//						This function overloads the real of_AddLine which is protecred.
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

VTextAlign		lvta_Null

SetNull(lvta_Null)
Return of_AddLine(as_Band, als_Style, ai_Width, lvta_Null, ai_X1, ai_Y1, ai_X2, ai_Y2, al_Color, &
							al_BackColor, True)

end function

public function string of_AddCompute (string as_expr, string as_band, integer ai_x, integer ai_y, border abo_border);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddCompute
//
//	Access:  public
//
//	Arguments:
//	as_Expr						The expression to be added as the computed column.
//	as_Band					The band to add it to.
//	ai_X							The X location of the object being placed.
//	ai_Y							The Y location of the object being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a computed column to any band of a datawindow.
//
//						This function overloads the real of_AddCompute, which is protected.
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

Alignment		lal_Null
VTextAlign		lvta_Any

SetNull(lal_Null)
Return of_AddCompute(as_Expr, as_Band, lal_Null, lvta_Any, ai_X, ai_Y, abo_Border, False, &
								False, False, is_DefaultFontFace, ii_DefaultFontSize, ifc_DefaultCharSet, &
								Il_DefaultColor, il_DefaultBackColor, True)

end function

public function string of_AddLine (string as_band, linestyle als_style, integer ai_width, integer ai_x1, integer ai_y1, integer ai_x2, integer ai_y2);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddLine
//
//	Access:  public
//
//	Arguments:
//	as_Band					The band to add the line to.
//	als_Style					The pen style of the line (Continuous!, Dash!, DashDot!,
//									DashDotDot!,  Dot!).
//	ai_Width					The pen width of the line.
//	ai_X1							The X1 point of the line.
//	ai_Y1							The Y1 point of the line.
//	ai_X2							The X2 point of the line, if 0 is passed it will 
//									be set to the width of the datawindow.
//	ai_Y2							The Y2 point of the line.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a line to any band of a datawindow.
//
//						This function overloads the real of_AddLine which is protecred.
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

VTextAlign		lvta_Null

SetNull(lvta_Null)
Return of_AddLine(as_Band, als_Style, ai_Width, lvta_Null, ai_X1, ai_Y1, ai_X2, ai_Y2, il_DefaultColor, &
							il_DefaultBackColor, True)

end function

public function string of_AddLine (string as_band, linestyle als_style, integer ai_width, vtextalign avta_valign, long al_color, long al_backcolor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddLine
//
//	Access:  public
//
//	Arguments:
//	as_Band					The band to add the picture to.
//	als_Style					The pen style of the line (Continuous!, Dash!, DashDot!,
//									DashDotDot!,  Dot!).
//	ai_Width					The pen width of the line.
//	avta_VAlign				The position within the band to draw the line (Top!,
//									VCenter!, Bottom!).  If Top! all objects in the band will be
//									shifted down to make room.
//	al_Color						The color of the line.
//	al_BackColor				The background color of the line.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a horizontal line to any band of a datawindow.
//
//						This function overloads the real of_AddLine, which is protected.
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

Integer	li_X1, li_Y1, li_X2, li_Y2

Return of_AddLine(as_Band, als_Style, ai_Width, avta_VAlign, li_X1, li_Y1, li_X2, li_Y2, al_Color, al_BackColor, True)

end function

public function string of_AddLine (string as_band, linestyle als_style, integer ai_width, vtextalign avta_valign);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddLine
//
//	Access:  public
//
//	Arguments:
//	as_Band					The band to add the picture to.
//	als_Style					The pen style of the line (Continuous!, Dash!, DashDot!,
//									DashDotDot!,  Dot!).
//	ai_Width					The pen width of the line.
//	avta_VAlign				The position within the band to draw the line (Top!,
//									VCenter!, Bottom!).  If Top! all objects in the band will be
//									shifted down to make room.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a horizontal line to any band of a datawindow.
//
//						This function overloads the real of_AddLine, which is protected.
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

Integer	li_X1, li_Y1, li_X2, li_Y2

Return of_AddLine(as_Band, als_Style, ai_Width, avta_VAlign, li_X1, li_Y1, li_X2, li_Y2, il_DefaultColor, &
							il_DefaultBackColor, True)

end function

public function string of_AddPicture (string as_filename, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddPicture
//
//	Access:  public
//
//	Arguments:
//	as_FileName				The name of the BMP file.
//	as_Band					The band to add the picture to.
//	aal_HAlign					The horizontal position of the object (Left!, Right!, Center!).
//	avta_VAlign				The vertical position of the object (Bottom!, Top!, VCenter!).
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!, 
//									Raised!).
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a picture object to any band of a datawindow.  Existing objects
//						will be shifted to make room for the picture, unless aal_Halign and
//						avta_VAlign are both "center".  In this case, the picture will overlay
//						the existing objects.
//
//						This function overloads the real of_AddPicture, wich is protected.
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

Integer	li_X, li_Y

Return of_AddPicture(as_FileName, as_Band, aal_HAlign, avta_VAlign, li_X, li_Y, &
								abo_Border, True)

end function

public function string of_AddPicture (string as_filename, string as_band, alignment aal_halign, vtextalign avta_valign);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddPicture
//
//	Access:  public
//
//	Arguments:
//	as_FileName				The name of the BMP file.
//	as_Band					The band to add the picture to.
//	aal_HAlign					The horizontal position of the object (Left!, Right!, Center!).
//	avta_VAlign				The vertical position of the object (Bottom!, Top!, VCenter!).
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a picture object to any band of a datawindow.  Existing objects
//						will be shifted to make room for the picture, unless aal_Halign and
//						avta_VAlign are both "center".  In this case, the picture will overlay
//						the existing objects.
//
//						This function overloads the real of_AddPicture, wich is protected.
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

Integer	li_X, li_Y

Return of_AddPicture(as_FileName, as_Band, aal_HAlign, avta_VAlign, li_X, li_Y, &
								ibo_DefaultBorder, True)

end function

public function string of_AddPicture (string as_filename, string as_band, integer ai_x, integer ai_y, border abo_border);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddPicture
//
//	Access:  public
//
//	Arguments:
//	as_FileName				The name of the BMP file.
//	as_Band					The band to add the picture to.
//	ai_X							The X location of the BMP being placed.
//	ai_Y							The Y location of the BMP being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!, 
//									Raised!).
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a picture object to any band of a datawindow.  It will be placed on
//						top of any existing objects.
//
//						This function overloads the real of_AddPicture, which is protected.
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

Alignment	lal_Null
VTextAlign	lvta_Any

SetNull(lal_Null)
Return of_AddPicture(as_FileName, as_Band, lal_Null, lvta_Any, ai_X, ai_Y, &
								abo_Border, True)

end function

public function string of_AddPicture (string as_filename, string as_band, integer ai_x, integer ai_y);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddPicture
//
//	Access:  public
//
//	Arguments:
//	as_FileName				The name of the BMP file.
//	as_Band					The band to add the picture to.
//	ai_X							The X location of the BMP being placed.
//	ai_Y							The Y location of the BMP being placed.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a picture object to any band of a datawindow.  It will be placed on
//						top of any existing objects.
//
//						This function overloads the real of_AddPicture, which is protected.
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

Alignment	lal_Null
VTextAlign	lvta_Any

SetNull(lal_Null)
Return of_AddPicture(as_FileName, as_Band, lal_Null, lvta_Any, ai_X, ai_Y, &
								ibo_DefaultBorder, True)

end function

public function string of_AddText (string as_text, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddText
//
//	Access:  public
//
//	Arguments:
//	as_Text						The text to be added.
//	as_Band					The band to add it to.
//	aal_HAlign					The horizontal alignment of the object.
//	avta_VAlign				The vertical alignment of the object.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	afc_CharSet				The character set to use (Ansi!, DefaultCharSet!, Symbol!, 
//									Shiftjis!, OEM!)
//	al_Color						The color of the object.
//	al_BackColor				The background color of the object.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a text object to any band of a datawindow.
//
//						This function overloads the real of_AddText, which is protected.
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

Integer	li_X, li_Y

Return of_AddText(as_Text, as_Band, aal_HAlign, avta_VAlign, li_X, li_Y, abo_Border, ab_Bold, &
							ab_Italic, ab_Underline, as_FontFace, ai_FontSize, afc_CharSet, al_Color, &
							al_BackColor, True)

end function

public function string of_AddText (string as_text, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddText
//
//	Access:  public
//
//	Arguments:
//	as_Text						The text to be added.
//	as_Band					The band to add it to.
//	aal_HAlign					The horizontal alignment of the object.
//	avta_VAlign				The vertical alignment of the object.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	afc_CharSet				The character set to use (Ansi!, DefaultCharSet!, Symbol!, 
//									Shiftjis!, OEM!)
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a text object to any band of a datawindow.
//
//						This function overloads the real of_AddText, which is protected.
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

Integer	li_X, li_Y

Return of_AddText(as_Text, as_Band, aal_HAlign, avta_VAlign, li_X, li_Y, abo_Border, ab_Bold, &
							ab_Italic, ab_Underline, as_FontFace, ai_FontSize, afc_CharSet, il_DefaultColor, &
							il_DefaultBackColor, True)

end function

public function string of_AddText (string as_text, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddText
//
//	Access:  public
//
//	Arguments:
//	as_Text						The text to be added.
//	as_Band					The band to add it to.
//	aal_HAlign					The horizontal alignment of the object.
//	avta_VAlign				The vertical alignment of the object.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a text object to any band of a datawindow.
//
//						This function overloads the real of_AddText, which is protected.
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

Integer	li_X, li_Y

Return of_AddText(as_Text, as_Band, aal_HAlign, avta_VAlign, li_X, li_Y, abo_Border, ab_Bold, &
							ab_Italic, ab_Underline, is_DefaultFontFace, ii_DefaultFontSize, ifc_DefaultCharSet, &
							il_DefaultColor, il_DefaultBackColor, True)

end function

public function string of_AddText (string as_text, string as_band, alignment aal_halign, vtextalign avta_valign, border abo_border);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddText
//
//	Access:  public
//
//	Arguments:
//	as_Text						The text to be added.
//	as_Band					The band to add it to.
//	aal_HAlign					The horizontal alignment of the object.
//	avta_VAlign				The vertical alignment of the object.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a text object to any band of a datawindow.
//
//						This function overloads the real of_AddText, which is protected.
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

Integer	li_X, li_Y

Return of_AddText(as_Text, as_Band, aal_HAlign, avta_VAlign, li_X, li_Y, abo_Border, False, &
							False, False, is_DefaultFontFace, ii_DefaultFontSize, ifc_DefaultCharSet, &
							il_DefaultColor, il_DefaultBackColor, True)

end function

public function string of_AddText (string as_text, string as_band, alignment aal_halign, vtextalign avta_valign);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddText
//
//	Access:  public
//
//	Arguments:
//	as_Text						The text to be added.
//	as_Band					The band to add it to.
//	aal_HAlign					The horizontal alignment of the object.
//	avta_VAlign				The vertical alignment of the object.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a text object to any band of a datawindow.
//
//						This function overloads the real of_AddText, which is protected.
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

Integer	li_X, li_Y

Return of_AddText(as_Text, as_Band, aal_HAlign, avta_VAlign, li_X, li_Y, ibo_DefaultBorder, False, &
							False, False, is_DefaultFontFace, ii_DefaultFontSize, ifc_DefaultCharSet, &
							il_DefaultColor, il_DefaultBackColor, True)

end function

public function string of_AddText (string as_text, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset, long al_color, long al_backcolor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddText
//
//	Access:  public
//
//	Arguments:
//	as_Text						The text to be added.
//	as_Band					The band to add it to.
//	ai_X							The X location of the object being placed.
//	ai_Y							The Y location of the object being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	afc_CharSet				The character set to use (Ansi!, DefaultCharSet!, Symbol!, 
//									Shiftjis!, OEM!)
//	al_Color						The color of the object.
//	al_BackColor				The background color of the object.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a text object to any band of a datawindow.
//
//						This function overloads the real of_AddText, which is protected.
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

Alignment	lal_Null
VTextAlign	lvta_Any

SetNull(lal_Null)
Return of_AddText(as_Text, as_Band, lal_Null, lvta_Any, ai_X, ai_Y, abo_Border, ab_Bold, &
							ab_Italic, ab_Underline, as_FontFace, ai_FontSize, afc_CharSet, al_Color, &
							al_BackColor, True)

end function

public function string of_AddText (string as_text, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_fontface, integer ai_fontsize, fontcharset afc_charset);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddText
//
//	Access:  public
//
//	Arguments:
//	as_Text						The text to be added.
//	as_Band					The band to add it to.
//	ai_X							The X location of the object being placed.
//	ai_Y							The Y location of the object being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	afc_CharSet				The character set to use (Ansi!, DefaultCharSet!, Symbol!, 
//									Shiftjis!, OEM!)
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a text object to any band of a datawindow.
//
//						This function overloads the real of_AddText, which is protected.
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

Alignment	lal_Null
VTextAlign	lvta_Any

SetNull(lal_Null)
Return of_AddText(as_Text, as_Band, lal_Null, lvta_Any, ai_X, ai_Y, abo_Border, ab_Bold, &
							ab_Italic, ab_Underline, as_FontFace, ai_FontSize, afc_CharSet, il_DefaultColor, &
							il_DefaultBackColor, True)

end function

public function string of_AddText (string as_text, string as_band, integer ai_x, integer ai_y, border abo_border, boolean ab_bold, boolean ab_italic, boolean ab_underline);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddText
//
//	Access:  public
//
//	Arguments:
//	as_Text						The text to be added.
//	as_Band					The band to add it to.
//	ai_X							The X location of the object being placed.
//	ai_Y							The Y location of the object being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a text object to any band of a datawindow.
//
//						This function overloads the real of_AddText, which is protected.
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

Alignment	lal_Null
VTextAlign	lvta_Any

SetNull(lal_Null)
Return of_AddText(as_Text, as_Band, lal_Null, lvta_Any, ai_X, ai_Y, abo_Border, ab_Bold, &
							ab_Italic, ab_Underline, is_DefaultFontFace, ii_DefaultFontSize, ifc_DefaultCharSet, &
							il_DefaultColor, il_DefaultBackColor, True)

end function

public function string of_AddText (string as_text, string as_band, integer ai_x, integer ai_y, border abo_border);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddText
//
//	Access:  public
//
//	Arguments:
//	as_Text						The text to be added.
//	as_Band					The band to add it to.
//	ai_X							The X location of the object being placed.
//	ai_Y							The Y location of the object being placed.
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a text object to any band of a datawindow.
//
//						This function overloads the real of_AddText, which is protected.
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

Alignment	lal_Null
VTextAlign	lvta_Any

SetNull(lal_Null)
Return of_AddText(as_Text, as_Band, lal_Null, lvta_Any, ai_X, ai_Y, abo_Border, False, &
							False, False, is_DefaultFontFace, ii_DefaultFontSize, ifc_DefaultCharSet, &
							il_DefaultColor, il_DefaultBackColor, True)

end function

public function string of_AddText (string as_text, string as_band, integer ai_x, integer ai_y);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddText
//
//	Access:  public
//
//	Arguments:
//	as_Text						The text to be added.
//	as_Band					The band to add it to.
//	ai_X							The X location of the object being placed.
//	ai_Y							The Y location of the object being placed.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a text object to any band of a datawindow.
//
//						This function overloads the real of_AddText, which is protected.
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

Alignment	lal_Null
VTextAlign	lvta_Any

SetNull(lal_Null)
Return of_AddText(as_Text, as_Band, lal_Null, lvta_Any, ai_X, ai_Y, ibo_DefaultBorder, False, &
							False, False, is_DefaultFontFace, ii_DefaultFontSize, ifc_DefaultCharSet, &
							il_DefaultColor, il_DefaultBackColor, True)

end function

public function fontcharset of_getdefaultcharset ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_getdefaultcharset
//
//	Access:  public
//
//	Arguments:	None.
//
//	Returns:		FontCharSet
//					The current default font character set used by these functions.
//
//	Description:	Get the current default font character set (ifc_DefaultCharSet).
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

Return ifc_DefaultCharSet

end function

public subroutine of_setdefaultcharset (fontcharset afc_CharSet);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_setdefaultcharset
//
//	Access:  public
//
//	Arguments:
//	afc_CharSet				The new default font character set.
//
//	Returns:		None.
//
//	Description:	Set the new default font character set (ifc_DefaultCharSet).
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

ifc_DefaultCharSet = afc_CharSet

end subroutine

public function string of_PrintReport (boolean ab_convertheader);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_PrintReport
//
//	Access:  public
//
//	Arguments:
//	ab_ConvertHeader		True - change borders on header objects to be
//									underline.  NOTE:  only objects whose name end
//									with "_t" (column headings) will be changed.
//									False - remove header borders as well as others.
//
//	Returns:		String
//					The output of the Modify command (the error text or "").
//
//	Description:	Prepare a datawindow for printing, print it, and restore it to its original
//						state.  This function calls of_PrepPrint.
//
//						This function overloads the real of_PrintReport to allow the last parameter 
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

Return of_PrintReport(ab_ConvertHeader, False)

end function

public function string of_SetBackground (string as_filename, integer ai_x, integer ai_y, integer ai_height, integer ai_width);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetBackground
//
//	Access:  public
//
//	Arguments:
//	as_FileName				The name of the file containing the bitmap to display.
//	ai_X							The X location of the bitmap being placed, it will be
//									centered horizontally if 0 is passed.
//	ai_Y							The Y location of the bitmap being placed, it will be
//									centered vertically if 0 is passed.
//	ai_Height					The height of the bitmap being placed, it will be calculated
//									if 0 is passed.
//	ai_Width					The width of the bitmap being placed, it will be calculated
//									if 0 is passed.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.  Or one of the following errors:
//					"Error!  Invalid DW Unit"			-	DataWindow Unit is not PB Units or Pixels
//					"Error!  File not found"				-	The picture file does not exist
//					"Error!  Error calculating size"	-	Returned an error calculating the object size
//
//	Description:	Place a picture in the background of the DataWindow.
//
//						This function overloads the real of_SetBackground to allow parameters to
//						be optional.  This version of the function assumes "SizeToFit" is False.
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


Return of_SetBackground(as_FileName, False, ai_X, ai_Y, ai_Height, ai_Width, True)

end function

public function string of_SetBackground (string as_filename, integer ai_x, integer ai_y);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetBackground
//
//	Access:  public
//
//	Arguments:
//	as_FileName				The name of the file containing the bitmap to display.
//	ai_X							The X location of the bitmap being placed, it will be
//									centered horizontally if 0 is passed.
//	ai_Y							The Y location of the bitmap being placed, it will be
//									centered vertically if 0 is passed.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.  Or one of the following errors:
//					"Error!  Invalid DW Unit"			-	DataWindow Unit is not PB Units or Pixels
//					"Error!  File not found"				-	The picture file does not exist
//					"Error!  Error calculating size"	-	Returned an error calculating the object size
//
//	Description:	Place a picture in the background of the DataWindow.
//
//						This function overloads the real of_SetBackground to allow parameters to
//						be optional.  This version of the function assumes "SizeToFit" is False.
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

Return of_SetBackground(as_FileName, False, ai_X, ai_Y, 0, 0, True)

end function

public function string of_SetBackground (string as_filename, integer ai_x);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetBackground
//
//	Access:  public
//
//	Arguments:
//	as_FileName				The name of the file containing the bitmap to display.
//	ai_X							The X location of the bitmap being placed, it will be
//									used for horizontal and vertical white-space.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.  Or one of the following errors:
//					"Error!  Invalid DW Unit"			-	DataWindow Unit is not PB Units or Pixels
//					"Error!  File not found"				-	The picture file does not exist
//					"Error!  Error calculating size"	-	Returned an error calculating the object size
//
//	Description:	Place a picture in the background of the DataWindow.
//
//						This function overloads the real of_SetBackground to allow parameters to be
//						optional.  This version of the function assumes "SizeToFit" is True.
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

Return of_SetBackground(as_FileName, True, ai_X, 0, 0, 0, True)

end function

public function string of_SetBackground (string as_filename);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetBackground
//
//	Access:  public
//
//	Arguments:
//	as_FileName				The name of the file containing the bitmap to display.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.  Or one of the following errors:
//					"Error!  Invalid DW Unit"			-	DataWindow Unit is not PB Units or Pixels
//					"Error!  File not found"				-	The picture file does not exist
//					"Error!  Error calculating size"	-	Returned an error calculating the object size
//
//	Description:	Place a picture in the background of the DataWindow.
//
//						This function overloads the real of_SetBackground to allow parameters to be
//						optional.  This version of the function assumes "SizeToFit" is True.
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

Return of_SetBackground(as_FileName, True, 0, 0, 0, 0, True)

end function

public function string of_SetBorder (border abo_border, string as_name);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetBorder
//
//	Access:  public
//
//	Arguments:
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	as_Name					The name of the object to change.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Change the border on an object in the datawindow.
//
//						This function overloads the real of_SetBorder to allow parameters
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

Return of_SetBorder(abo_Border, as_Name, "*", True)

end function

public function string of_SetColor (long al_color, long al_backcolor, string as_name, string as_band);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetColor
//
//	Access:  public
//
//	Arguments:
//	al_Color						The new color.  If Null is passed, it will not be changed.
//	al_BackColor				The new background color.  If Null is passed, it will not
//									be changed.
//	as_Name					The name of the object to change, "*" will cause all
//									objects in the band to be changed.
//	as_Band					The band in which to change the objecs, "*" will call
//									the entire datawindow to be changed.  This argument is
//									ignored if a name is passed in as_Name.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Change the color and background color (if applicable) of an object 
//						in the datawindow.
//
//						This function overloads the real of_SetColor to allow parameters
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

Return of_SetColor(al_Color, al_BackColor, as_Name, as_Band, True)

end function

public function string of_SetColor (long al_color, long al_backcolor, string as_name);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetColor
//
//	Access:  public
//
//	Arguments:
//	al_Color						The new color.  If Null is passed, it will not be changed.
//	al_BackColor				The new background color.  If Null is passed, it will not
//									be changed.
//	as_Name					The name of the object to change.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Change the color and background color (if applicable) of an object 
//						in the datawindow.
//
//						This function overloads the real of_SetColor to allow parameters
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

Return of_SetColor(al_Color, al_BackColor, as_Name, "*", True)

end function

public function string of_SetColor (long al_color, long al_backcolor);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetColor
//
//	Access:  public
//
//	Arguments:
//	al_Color						The new color.  If Null is passed, it will not be changed.
//	al_BackColor				The new background color.  If Null is passed, it will not
//									be changed.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Change the color and background color (if applicable) of an object 
//						in the datawindow.
//
//						This function overloads the real of_SetColor to allow parameters
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

Return of_SetColor(al_Color, al_BackColor, "*", "*", True)

end function

public function string of_SetBorder (border abo_border);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetBorder
//
//	Access:  public
//
//	Arguments:
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Change the border on an object in the datawindow.
//
//						This function overloads the real of_SetBorder to allow parameters
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

Return of_SetBorder(abo_Border, "*", "*", True)

end function

public function string of_SetFont (string as_fontface, integer ai_fontsize, fontfamily aff_fontfamily, fontpitch afp_fontpitch, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_name, string as_band);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetFont
//
//	Access:  public
//
//	Arguments:
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	aff_FontFamily			The font family (AnyFont!, Roman!, Swiss!, Modern!, 
//									Script!, Decorative!)
//	afp_FontPitch				The pitch of the font (Default!, Fixed!, Variable!)
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_Name					The name of the object to change, "*" will cause all
//									objects in the band to be changed.
//	as_Band					The band in which to change the objecs, "*" will call
//									the entire datawindow to be changed.  This argument is
//									ignored if a name is passed in as_Name.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Change the font of an object in the datawindow.
//
//						This function overloads the real of_SetFont to allow parameters
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

Return of_SetFont(as_FontFace, ai_FontSize, aff_FontFamily, afp_FontPitch, ab_Bold, ab_Italic, &
						ab_Underline, as_Name, as_Band, True)

end function

public function string of_SetFont (string as_fontface, integer ai_fontsize, fontfamily aff_fontfamily, fontpitch afp_fontpitch, boolean ab_bold, boolean ab_italic, boolean ab_underline, string as_name);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetFont
//
//	Access:  public
//
//	Arguments:
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	aff_FontFamily			The font family (AnyFont!, Roman!, Swiss!, Modern!, 
//									Script!, Decorative!)
//	afp_FontPitch				The pitch of the font (Default!, Fixed!, Variable!)
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//	as_Name					The name of the object to change.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Change the font of an object in the datawindow.
//
//						This function overloads the real of_SetFont to allow parameters
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

Return of_SetFont(as_FontFace, ai_FontSize, aff_FontFamily, afp_FontPitch, ab_Bold, ab_Italic, &
						ab_Underline, as_Name, "*", True)

end function

public function string of_SetFont (string as_fontface, integer ai_fontsize, fontfamily aff_fontfamily, fontpitch afp_fontpitch, boolean ab_bold, boolean ab_italic, boolean ab_underline);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetFont
//
//	Access:  public
//
//	Arguments:
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	aff_FontFamily			The font family (AnyFont!, Roman!, Swiss!, Modern!, 
//									Script!, Decorative!)
//	afp_FontPitch				The pitch of the font (Default!, Fixed!, Variable!)
//	ab_Bold						True - Bold, False - Normal.
//	ab_Italic					True - Yes, False - No.
//	ab_Underline				True - Yes, False - No.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Change the font of an object in the datawindow.
//
//						This function overloads the real of_SetFont to allow parameters
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

Return of_SetFont(as_FontFace, ai_FontSize, aff_FontFamily, afp_FontPitch, ab_Bold, ab_Italic, &
						ab_Underline, "*", "*", True)

end function

public function string of_SetFont (string as_fontface, integer ai_fontsize, fontfamily aff_fontfamily, fontpitch afp_fontpitch, string as_name, string as_band);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetFont
//
//	Access:  public
//
//	Arguments:
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	aff_FontFamily			The font family (AnyFont!, Roman!, Swiss!, Modern!, 
//									Script!, Decorative!)
//	afp_FontPitch				The pitch of the font (Default!, Fixed!, Variable!)
//	as_Name					The name of the object to change, "*" will cause all
//									objects in the band to be changed.
//	as_Band					The band in which to change the objecs, "*" will call
//									the entire datawindow to be changed.  This argument is
//									ignored if a name is passed in as_Name.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Change the font of an object in the datawindow.
//
//						This function overloads the real of_SetFont to allow parameters
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

Boolean		lb_Null

SetNull(lb_Null)
Return of_SetFont(as_FontFace, ai_FontSize, aff_FontFamily, afp_FontPitch, lb_Null, lb_Null, &
						lb_Null, as_Name, as_Band, True)

end function

public function string of_SetFont (string as_fontface, integer ai_fontsize, fontfamily aff_fontfamily, fontpitch afp_fontpitch, string as_name);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetFont
//
//	Access:  public
//
//	Arguments:
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	aff_FontFamily			The font family (AnyFont!, Roman!, Swiss!, Modern!, 
//									Script!, Decorative!)
//	afp_FontPitch				The pitch of the font (Default!, Fixed!, Variable!)
//	as_Name					The name of the object to change.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Change the font of an object in the datawindow.
//
//						This function overloads the real of_SetFont to allow parameters
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

Boolean		lb_Null

SetNull(lb_Null)
Return of_SetFont(as_FontFace, ai_FontSize, aff_FontFamily, afp_FontPitch, lb_Null, lb_Null, &
						lb_Null, as_Name, "*", True)

end function

public function string of_SetFont (string as_fontface, integer ai_fontsize, fontfamily aff_fontfamily, fontpitch afp_fontpitch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetFont
//
//	Access:  public
//
//	Arguments:
//	as_FontFace				The font to use (i.e. "MS Sans Serif")
//	ai_FontSize				The point size of the font.
//	aff_FontFamily			The font family (AnyFont!, Roman!, Swiss!, Modern!, 
//									Script!, Decorative!)
//	afp_FontPitch				The pitch of the font (Default!, Fixed!, Variable!)
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Change the font of an object in the datawindow.
//
//						This function overloads the real of_SetFont to allow parameters
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

Boolean		lb_Null

SetNull(lb_Null)
Return of_SetFont(as_FontFace, ai_FontSize, aff_FontFamily, afp_FontPitch, lb_Null, lb_Null, &
						lb_Null, "*", "*", True)

end function

public function string of_ShiftBand (string as_band, integer ai_xunits, integer ai_yunits);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ShiftBand
//
//	Access:  public
//
//	Arguments:
//	as_Band					The band to shift, pass "*" to shift the entire datawindow.
//	ai_XUnits					The number of horizontal units to shift the objects right, 
//									pass a negative number to shift left.
//	ai_YUnits					The number of vertical units to shift the objects down, 
//									pass a negative number to shift up.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.  Or the following error:
//					"Error!  Invalid DataWindow Shift"	-	Attempted to shift the object beyond
//																			the top or left side of the page (X or
//																			Y became negative)
//
//	Description:	Shift the objects in the given band of the datawindow horizontally
//						or vertically a specified number of units.
//
//						This function overloads the real of_ShiftBand to allow the last
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

Return of_ShiftBand(as_Band, ai_XUnits, ai_YUnits, True)

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
anv_infoattrib.is_name = 'Reporting'
anv_infoattrib.is_description = 'Facilitates datawindow reporting and printing.'

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
anv_attrib.is_propertypage = {'u_tabpg_dwproperty_srvreport'}
anv_attrib.ib_switchbuttons = True

Return 1
end function

public function string of_addcompute (string as_expr, string as_band, alignment aal_halign, vtextalign avta_valign);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_AddCompute
//
//	Access:  public
//
//	Arguments:
//	as_Expr						The expression to be added as the computed column.
//	as_Band					The band to add it to.
//	aal_HAlign					The horizontal alignment of the object being placed.
//	avta_Valign				The vertical alignment of the object being placed.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Add a computed column to any band of a datawindow.
//
//						This function overloads the real of_AddCompute, which is protected.
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

Integer	li_X, li_Y

Return of_AddCompute(as_Expr, as_Band, aal_HAlign, avta_VAlign, li_X, li_Y, ibo_DefaultBorder, &
								False, False, False, is_DefaultFontFace, ii_DefaultFontSize, &
								ifc_DefaultCharSet, il_DefaultColor, il_DefaultBackColor, True)

end function

public function string of_setborder (border abo_border, string as_name, string as_band);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetBorder
//
//	Access:  public
//
//	Arguments:
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	as_Name					The name of the object to change, "*" will cause all
//									objects in the band to be changed.
//	as_Band					The band in which to change the objects, "*" will call
//									the entire datawindow to be changed.  This argument is
//									ignored if a name is passed in as_Name.
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Change the border on an object in the datawindow.
//
//						This function overloads the real of_SetBorder to allow parameters
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

Return of_SetBorder(abo_Border, as_Name, as_Band, True)

end function

public function string of_setborder (border abo_border, string as_name, string as_band, boolean ab_execute);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetBorder
//
//	Access:  public
//
//	Arguments:
//	abo_Border				The border to place around the object added (NoBorder!, 
//									ShadowBox!, Box!, ResizeBorder!, Underline!, Lowered!
//									Raised!).
//	as_Name					The name of the object to change, "*" will cause all
//									objects in the band to be changed.
//	as_Band					The band in which to change the objects, "*" will call
//									the entire datawindow to be changed.  This argument is
//									ignored if a name is passed in as_Name.
//	ab_Execute				True - execute the Modify command,
//									False - build the command but do not execute it
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Change the border on an object in the datawindow.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 7.0	Fix to allow for expressions in the border attribute
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

String			ls_Border, ls_OldBorder, ls_Modify, ls_Objects[], ls_Undo, ls_Return
Integer			li_NumObjects, li_Count, li_Undo
n_cst_string	lnv_String

Choose Case abo_Border
	Case NoBorder!
		ls_Border = "0"
	Case ShadowBox!
		ls_Border = "1"
	Case Box!
		ls_Border = "2"
	Case ResizeBorder!
		ls_Border = "3"
	Case Underline!
		ls_Border = "4"
	Case Lowered!
		ls_Border = "5"
	Case Raised!
		ls_Border = "6"
End Choose

If as_Name = "*" Then
	// All visible objects in the as_Band band are to be changed
	li_NumObjects = of_GetObjects(ls_Objects, "*", as_Band, True)

	li_Undo = ii_UndoLevel

	For li_Count = 1 To li_NumObjects
		// Call this function for each object
		ls_Modify = ls_Modify + of_SetBorder(abo_Border, ls_Objects[li_Count], "", False)
	Next

	// Combine each object's undo statement into one
	li_Undo ++
	For li_Count = (li_Undo + 1) To ii_UndoLevel
		is_Undo[li_Undo] = is_Undo[li_Undo] + " " + is_Undo[li_Count]
	Next
	ii_UndoLevel = li_Undo

Else
	ls_OldBorder = idw_Requestor.Describe(as_Name + ".Border")
	If ls_OldBorder = "!" Then
		// This is type of object does not have a border
		Return ""
	End if

	// Change border
	If ls_Border <> ls_OldBorder Then
		ls_Modify = ls_Modify + " " + as_Name + ".Border='" + ls_Border + "'"
		ls_Undo = ls_Undo + " " + as_Name + ".Border='" + ls_OldBorder + "'"

		ls_Undo = lnv_string.of_GlobalReplace (ls_Undo, "~"", "", FALSE)
		ii_UndoLevel ++
		is_Undo[ii_UndoLevel] = ls_Undo
	End if
End if

If ab_Execute Then
	ls_Return = idw_Requestor.Modify(ls_Modify)
Else
	ls_Return = ls_Modify
End if

Return ls_Return

end function

public function string of_setcolor (long al_color, long al_backcolor, string as_name, string as_band, boolean ab_execute);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_SetColor
//
//	Access:  public
//
//	Arguments:
//	al_Color						The new color.  If Null is passed, it will not be changed.
//	al_BackColor				The new background color.  If Null is passed, it will not
//									be changed.
//	as_Name					The name of the object to change, "*" will cause all
//									objects in the band to be changed.
//	as_Band					The band in which to change the objecs, "*" will call
//									the entire datawindow to be changed.  This argument is
//									ignored if a name is passed in as_Name.
//	ab_Execute				True - execute the Modify command,
//									False - build the command but do not execute it
//
//	Returns:		String
//					The output of the Modify command (the error text or "") if True
//					was passed for ab_Execute; the text of the Modify command
//					to add the object if False was passed.
//
//	Description:	Change the color and background color (if applicable) of an object 
//						in the datawindow.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
// 7.0 Fix to allow for expressions in the color attribute
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

String			ls_Modify, ls_Objects[], ls_Undo, ls_Type, ls_BackMode, ls_Return, ls_color
Integer			li_NumObjects, li_Count, li_Undo
n_cst_string	lnv_String

If as_Name = "*" Then
	// All visible objects in the as_Band band are to be changed
	li_NumObjects = of_GetObjects(ls_Objects, "*", as_Band, True)

	li_Undo = ii_UndoLevel

	For li_Count = 1 To li_NumObjects
		// Call this function for each object
		ls_Modify = ls_Modify + of_SetColor(al_Color, al_BackColor, ls_Objects[li_Count], "", False)
	Next

	// Combine each object's undo statement into one
	li_Undo ++
	For li_Count = (li_Undo + 1) To ii_UndoLevel
		is_Undo[li_Undo] = is_Undo[li_Undo] + " " + is_Undo[li_Count]
	Next
	ii_UndoLevel = li_Undo

Else
	ls_Type = idw_Requestor.Describe(as_Name + ".Type")
	ls_BackMode = idw_Requestor.Describe(as_Name + ".Background.Mode")

	Choose Case ls_Type
		Case "line"
			ls_color = idw_Requestor.Describe(as_Name + ".Background.Color")
			If Not IsNull(al_BackColor) And Long ( ls_color ) <> al_BackColor Then
				ls_Modify = ls_Modify + " " + as_Name + ".Background.Color='" + String(al_BackColor) + "'"
				ls_Undo = ls_Undo + " " + as_Name + ".Background.Color='" + ls_Color + "'"
				If al_BackColor <> 536870912 And ls_BackMode = "1" Then
					// Background mode is transparent, must not be to change the background color

					ls_Modify = ls_Modify + " " + as_Name + ".Background.Mode='2'"
					ls_Undo = ls_Undo + " " + as_Name + ".Background.Mode='1'"
				End if
			End if
			ls_Color = idw_Requestor.Describe(as_Name + ".Pen.Color")
			If Not IsNull(al_Color) And Long ( ls_color ) <> al_Color Then
				ls_Modify = ls_Modify + " " + as_Name + ".Pen.Color='" + String(al_Color) + "'"
				ls_Undo = ls_Undo + " " + as_Name + ".Pen.Color='" + ls_Color + "'"
			End if
			
		Case "elipse", "rectangle", "roundrectangle"
			ls_Color = idw_Requestor.Describe(as_Name + ".Background.Color")
			If Not IsNull(al_BackColor) And Long ( ls_color ) <> al_BackColor Then
				ls_Modify = ls_Modify + " " + as_Name + ".Background.Color='" + String(al_BackColor) + "'"
				ls_Undo = ls_Undo + " " + as_Name + ".Background.Color='" + ls_Color + "'"
				If al_BackColor <> 536870912 And ls_BackMode = "1" Then
					// Background mode is transparent, must not be to change the background color
					ls_Modify = ls_Modify + " " + as_Name + ".Background.Mode='2'"
					ls_Undo = ls_Undo + " " + as_Name + ".Background.Mode='1'"
				End if
			End if
			ls_Color = idw_Requestor.Describe(as_Name + ".Brush.Color")
			If Not IsNull(al_Color) And Long ( ls_color ) <> al_Color Then
				ls_Modify = ls_Modify + " " + as_Name + ".Brush.Color='" + String(al_Color) + "'"
				ls_Undo = ls_Undo + " " + as_Name + ".Brush.Color='" + ls_Color + "'"
			End if
			
		Case "column", "compute", "text"
			ls_Color = idw_Requestor.Describe(as_Name + ".Background.Color")
			If Not IsNull(al_BackColor) And Long ( ls_color ) <> al_BackColor Then
				ls_Modify = ls_Modify + " " + as_Name + ".Background.Color='" + String(al_BackColor) + "'"
				ls_Undo = ls_Undo + " " + as_Name + ".Background.Color='" + ls_Color + "'"
				If al_BackColor <> 536870912 And ls_BackMode = "1" Then
					// Background mode is transparent, must not be to change the background color
					ls_Modify = ls_Modify + " " + as_Name + ".Background.Mode='2'"
					ls_Undo = ls_Undo + " " + as_Name + ".Background.Mode='1'"
				End if
			End if
			ls_Color = idw_Requestor.Describe(as_Name + ".Color")
			If Not IsNull(al_Color) And Long ( ls_color ) <> al_Color Then
				ls_Modify = ls_Modify + " " + as_Name + ".Color='" + String(al_Color) + "'"
				ls_Undo = ls_Undo + " " + as_Name + ".Color='" + ls_Color + "'"
			End if
	End Choose

	ls_Undo = lnv_string.of_GlobalReplace (ls_Undo, "~"", "", FALSE)
	ii_UndoLevel ++
	is_Undo[ii_UndoLevel] = ls_Undo
End if

If ab_Execute Then
	ls_Return = idw_Requestor.Modify(ls_Modify)
Else
	ls_Return = ls_Modify
End if

Return ls_Return

end function

event destructor;call n_cst_dwsrv::destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Destructor
//
//	Description:	Turn the platform service off.
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

If IsValid(inv_Platform) Then
	f_SetPlatform(inv_Platform, False)
End if

end event

on pfc_n_cst_dwsrv_report.create
call super::create
end on

on pfc_n_cst_dwsrv_report.destroy
call super::destroy
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Constructor
//
//	Description:	Set the default values for this service.
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

ibo_DefaultBorder = NoBorder!

is_DefaultFontFace = "MS Sans Serif"
ii_DefaultFontSize = 8
ifc_DefaultCharSet = DefaultCharSet!

il_DefaultColor = 0	// Black
SetNull(il_DefaultBackColor)		// Null will be interpreted as Transparent)

end event

