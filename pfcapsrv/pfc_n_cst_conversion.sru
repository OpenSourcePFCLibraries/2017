HA$PBExportHeader$pfc_n_cst_conversion.sru
$PBExportComments$PFC Conversion service class
forward
global type pfc_n_cst_conversion from n_base
end type
end forward

global type pfc_n_cst_conversion from n_base autoinstantiate
end type

forward prototypes
public function boolean of_boolean (string as_val)
public function string of_string (boolean ab_parm)
public function string of_string (toolbaralignment ae_alignment)
public function integer of_integer (boolean ab_arg)
public function string of_string (boolean ab_parm, string as_type)
public function string of_string (sqlpreviewtype a_sqlpreviewtype)
public function string of_string (ostypes ae_ostype)
public function integer of_sqlpreviewtype (string as_source, ref sqlpreviewtype a_sqlpreviewtype)
public function integer of_windowstate (string as_windowstate, ref windowstate aws_windowstate)
public function string of_string (windowstate aws_windowstate)
public function string of_string (icon ae_icon)
public function string of_string (button ae_button)
public function integer of_icon (string as_source, ref icon ae_icon)
public function integer of_button (string as_source, ref button ae_button)
public function integer of_ostype (string as_source, ref ostypes ae_ostype)
public function date of_date (string as_datetime)
public function string of_string (dwitemstatus ae_dwitemstatus)
public function integer of_toolbaralignment (string as_align, ref toolbaralignment ae_toolbaralign)
public function integer of_dwitemstatus (string as_status, ref dwitemstatus ae_dwitemstatus)
public function time of_time (string as_datetime)
public function boolean of_boolean (integer ai_val)
public function integer of_accessiblerole (string as_source, ref accessiblerole ae_accessiblerole)
public function string of_string (accessiblerole ae_accessiblerole)
public function integer of_alignment (string as_source, ref alignment ae_alignment)
public function string of_string (argcallingconvention ae_argcallingconvention)
public function integer of_argcallingconvention (string as_source, ref argcallingconvention ae_argcallingconvention)
public function integer of_arrangeopen (string as_source, ref arrangeopen ae_arrangeopen)
public function string of_string (arrangeopen ae_arrangeopen)
public function integer of_arrangetypes (string as_source, ref arrangetypes ae_arrangetypes)
public function integer of_band (string as_source, ref band ae_band)
public function string of_string (band ae_band)
public function string of_string (border ae_border)
public function integer of_border (string as_source, ref border ae_border)
public function integer of_borderstyle (string as_source, ref borderstyle ae_borderstyle)
public function string of_string (borderstyle ae_borderstyle)
public function string of_string (charset ae_charset)
public function string of_string (arrangetypes ae_arrangetypes)
public function string of_string (clipboardformat ae_clipboardformat)
public function integer of_clipboardformat (string as_source, ref clipboardformat ae_clipboardformat)
public function string of_string (connectprivilege ae_connectprivilege)
public function integer of_connectprivilege (string as_source, ref connectprivilege ae_connectprivilege)
public function string of_string (converttype ae_converttype)
public function integer of_converttype (string as_source, ref converttype ae_converttype)
public function string of_string (cputypes ae_cputypes)
public function integer of_cputypes (string as_source, ref cputypes ae_cputypes)
public function string of_string (datetimeformat ae_datetimeformat)
public function integer of_datetimeformat (string as_source, ref datetimeformat ae_datetimeformat)
public function integer of_dbnotification (string as_source, ref dbnotification ae_dbnotification)
public function string of_string (dbnotification ae_dbnotification)
public function string of_string (direction ae_direction)
public function integer of_direction (string as_source, ref direction ae_direction)
public function integer of_displaysizemode (string as_source, ref displaysizemode ae_displaysizemode)
public function string of_string (displaysizemode ae_displaysizemode)
public function integer of_dragmodes (string as_source, ref dragmodes ae_dragmodes)
public function string of_string (alignment ae_alignment)
public function integer of_dwbuffer (string as_source, ref dwbuffer ae_dwbuffer)
public function string of_string (dwbuffer ae_dwbuffer)
public function string of_string (encoding ae_encoding)
public function integer of_errorreturn (string as_source, ref errorreturn ae_errorreturn)
public function string of_string (errorreturn ae_errorreturn)
public function integer of_dwconflictresolution (string as_source, ref dwconflictresolution ae_dwconflictresolution)
public function string of_string (dwconflictresolution ae_dwconflictresolution)
public function integer of_encoding (string as_source, ref encoding ae_encoding)
public function integer of_fileaccess (string as_source, ref fileaccess ae_fileaccess)
public function string of_string (fileaccess ae_fileaccess)
public function integer of_filemode (string as_source, ref filemode ae_filemode)
public function string of_string (filemode ae_filemode)
public function integer of_filetype (string as_source, ref filetype ae_filetype)
public function string of_string (filetype ae_filetype)
public function integer of_filelock (string as_source, ref filelock ae_filelock)
public function string of_string (filelock ae_filelock)
public function integer of_exceptionaction (string as_source, ref exceptionaction ae_exceptionaction)
public function string of_string (exceptionaction ae_exceptionaction)
public function integer of_fillpattern (string as_source, ref fillpattern ae_fillpattern)
public function string of_string (fillpattern ae_fillpattern)
public function integer of_flowdirection (string as_source, ref flowdirection ae_flowdirection)
public function string of_string (flowdirection ae_flowdirection)
public function integer of_fontcharset (string as_source, ref fontcharset ae_fontcharset)
public function string of_string (fontcharset ae_fontcharset)
public function integer of_fontfamily (string as_source, ref fontfamily ae_fontfamily)
public function string of_string (fontfamily ae_fontfamily)
public function integer of_fontpitch (string as_source, ref fontpitch ae_fontpitch)
public function string of_string (fontpitch ae_fontpitch)
public function integer of_graxisdatatype (string as_source, ref graxisdatatype ae_graxisdatatype)
public function string of_string (graxisdatatype ae_graxisdatatype)
public function string of_string (grcolortype ae_grcolortype)
public function integer of_grdatatype (string as_source, ref grdatatype ae_grdatatype)
public function string of_string (grdatatype ae_grdatatype)
public function integer of_grcolortype (string as_source, ref grcolortype ae_grcolortype)
public function integer of_grgraphtype (string as_source, ref grgraphtype ae_grgraphtype)
public function string of_string (grgraphtype ae_grgraphtype)
public function integer of_grlegendtype (string as_source, ref grlegendtype ae_grlegendtype)
public function string of_string (grlegendtype ae_grlegendtype)
public function integer of_grobjecttype (string as_source, ref grobjecttype ae_grobjecttype)
public function string of_string (grobjecttype ae_grobjecttype)
public function integer of_grresettype (string as_source, ref grresettype ae_grresettype)
public function integer of_grroundtotype (string as_source, ref grroundtotype ae_grroundtotype)
public function string of_string (grresettype ae_grresettype)
public function string of_string (grroundtotype ae_grroundtotype)
public function integer of_grscaletype (string as_source, ref grscaletype ae_grscaletype)
public function integer of_grscalevalue (string as_source, ref grscalevalue ae_grscalevalue)
public function string of_string (grscalevalue ae_grscalevalue)
public function string of_string (grscaletype ae_grscaletype)
public function integer of_grsorttype (string as_source, ref grsorttype ae_grsorttype)
public function string of_string (grsorttype ae_grsorttype)
public function integer of_grsymboltype (string as_source, ref grsymboltype ae_grsymboltype)
public function string of_string (grsymboltype ae_grsymboltype)
public function integer of_grtictype (string as_source, ref grtictype ae_grtictype)
public function string of_string (grtictype ae_grtictype)
public function integer of_helpcommand (string as_source, ref helpcommand ae_helpcommand)
public function string of_string (helpcommand ae_helpcommand)
public function integer of_htickmarks (string as_source, ref htickmarks ae_htickmarks)
public function string of_string (htickmarks ae_htickmarks)
public function integer of_inkcollectionmode (string as_source, ref inkcollectionmode ae_inkcollectionmode)
public function string of_string (inkcollectionmode ae_inkcollectionmode)
public function integer of_inkcompressionmode (string as_source, ref inkcompressionmode ae_inkcompressionmode)
public function string of_string (inkcompressionmode ae_inkcompressionmode)
public function integer of_inkeditstatus (string as_source, ref inkeditstatus ae_inkeditstatus)
public function string of_string (inkeditstatus ae_inkeditstatus)
public function integer of_inkmode (string as_source, ref inkmode ae_inkmode)
public function string of_string (inkmode ae_inkmode)
public function integer of_inkpentip (string as_source, ref inkpentip ae_inkpentip)
public function string of_string (inkpentip ae_inkpentip)
public function integer of_inkpersistenceformat (string as_source, ref inkpersistenceformat ae_inkpersistenceformat)
public function string of_string (inkpersistenceformat ae_inkpersistenceformat)
public function integer of_inkpiceditmode (string as_source, ref inkpiceditmode ae_inkpiceditmode)
public function string of_string (inkpiceditmode ae_inkpiceditmode)
public function integer of_inkpicstatus (string as_source, ref inkpicstatus ae_inkpicstatus)
public function string of_string (inkpicstatus ae_inkpicstatus)
public function integer of_languageid (string as_source, ref languageid ae_languageid)
public function string of_string (languageid ae_languageid)
public function integer of_keycode (string as_source, ref keycode ae_keycode)
public function string of_string (keycode ae_keycode)
public function integer of_languagesortid (string as_source, ref languagesortid ae_languagesortid)
public function string of_string (languagesortid ae_languagesortid)
public function integer of_libdirtype (string as_source, ref libdirtype ae_libdirtype)
public function string of_string (libdirtype ae_libdirtype)
public function integer of_libexporttype (string as_source, ref libexporttype ae_libexporttype)
public function string of_string (libexporttype ae_libexporttype)
public function integer of_libimporttype (string as_source, ref libimporttype ae_libimporttype)
public function string of_string (libimporttype ae_libimporttype)
public function integer of_linestyle (string as_source, ref linestyle ae_linestyle)
public function string of_string (linestyle ae_linestyle)
public function integer of_listviewview (string as_source, ref listviewview ae_listviewview)
public function string of_string (listviewview ae_listviewview)
public function integer of_location (string as_source, ref location ae_location)
public function string of_string (location ae_location)
public function integer of_mailfiletype (string as_source, ref mailfiletype ae_mailfiletype)
public function string of_string (mailfiletype ae_mailfiletype)
public function integer of_maillogonoption (string as_source, ref maillogonoption ae_maillogonoption)
public function string of_string (maillogonoption ae_maillogonoption)
public function integer of_mailreadoption (string as_source, ref mailreadoption ae_mailreadoption)
public function string of_string (mailreadoption ae_mailreadoption)
public function integer of_mailrecipienttype (string as_source, ref mailrecipienttype ae_mailrecipienttype)
public function string of_string (mailrecipienttype ae_mailrecipienttype)
public function integer of_mailreturncode (string as_source, ref mailreturncode ae_mailreturncode)
public function string of_string (mailreturncode ae_mailreturncode)
public function integer of_maskdatatype (string as_source, ref maskdatatype ae_maskdatatype)
public function string of_string (maskdatatype ae_maskdatatype)
public function integer of_menuitemtype (string as_source, ref menuitemtype ae_menuitemtype)
public function string of_string (menuitemtype ae_menuitemtype)
public function integer of_menumergeoption (string as_source, ref menumergeoption ae_menumergeoption)
public function string of_string (menumergeoption ae_menumergeoption)
public function integer of_menustyle (string as_source, ref menustyle ae_menustyle)
public function string of_string (menustyle ae_menustyle)
public function integer of_metadatatype (string as_source, ref metadatatype ae_metadatatype)
public function string of_string (metadatatype ae_metadatatype)
public function integer of_moncaldisplaystate (string as_source, ref moncaldisplaystate ae_moncaldisplaystate)
public function string of_string (moncaldisplaystate ae_moncaldisplaystate)
public function integer of_moncalrepeattype (string as_source, ref moncalrepeattype ae_moncalrepeattype)
public function string of_string (moncalrepeattype ae_moncalrepeattype)
public function integer of_object (string as_source, ref object ae_object)
public function string of_string (object ae_object)
public function integer of_olefunctioncalltype (string as_source, ref olefunctioncalltype ae_olefunctioncalltype)
public function string of_string (olefunctioncalltype ae_olefunctioncalltype)
public function integer of_omactivatetype (string as_source, ref omactivatetype ae_omactivatetype)
public function string of_string (omactivatetype ae_omactivatetype)
public function integer of_omactivation (string as_source, ref omactivation ae_omactivation)
public function string of_string (omactivation ae_omactivation)
public function integer of_omcontentsallowed (string as_source, ref omcontentsallowed ae_omcontentsallowed)
public function string of_string (omcontentsallowed ae_omcontentsallowed)
public function integer of_omdisplaytype (string as_source, ref omdisplaytype ae_omdisplaytype)
public function string of_string (omdisplaytype ae_omdisplaytype)
public function integer of_omlinkupdateoptions (string as_source, ref omlinkupdateoptions ae_omlinkupdateoptions)
public function string of_string (omlinkupdateoptions ae_omlinkupdateoptions)
public function integer of_orientationtype (string as_source, ref orientationtype ae_orientationtype)
public function string of_string (orientationtype ae_orientationtype)
public function integer of_paragraphsetting (string as_source, ref paragraphsetting ae_paragraphsetting)
public function string of_string (paragraphsetting ae_paragraphsetting)
public function integer of_parmtype (string as_source, ref parmtype ae_parmtype)
public function string of_string (parmtype ae_parmtype)
public function integer of_pbtypes (string as_source, ref pbtypes ae_pbtypes)
public function string of_string (pbtypes ae_pbtypes)
public function integer of_pdfmethod (string as_source, ref pdfmethod ae_pdfmethod)
public function string of_string (pdfmethod ae_pdfmethod)
public function integer of_pointer (string as_source, ref pointer ae_pointer)
public function string of_string (pointer ae_pointer)
public function integer of_profileroutinekind (string as_source, ref profileroutinekind ae_profileroutinekind)
public function string of_string (profileroutinekind ae_profileroutinekind)
public function integer of_registryvaluetype (string as_source, ref registryvaluetype ae_registryvaluetype)
public function string of_string (registryvaluetype ae_registryvaluetype)
public function integer of_richtexttoolbaractivation (string as_source, ref richtexttoolbaractivation ae_richtexttoolbaractivation)
public function string of_string (richtexttoolbaractivation ae_richtexttoolbaractivation)
public function integer of_rowfocusind (string as_source, ref rowfocusind ae_rowfocusind)
public function string of_string (rowfocusind ae_rowfocusind)
public function integer of_saveastype (string as_source, ref saveastype ae_saveastype)
public function string of_string (saveastype ae_saveastype)
public function integer of_savemetadata (string as_source, ref savemetadata ae_savemetadata)
public function string of_string (savemetadata ae_savemetadata)
public function integer of_scriptkind (string as_source, ref scriptkind ae_scriptkind)
public function string of_string (scriptkind ae_scriptkind)
public function string of_string (seektype ae_seektype)
public function integer of_setpostype (string as_source, ref setpostype ae_setpostype)
public function string of_string (setpostype ae_setpostype)
public function integer of_sizemode (string as_source, ref sizemode ae_sizemode)
public function string of_string (sizemode ae_sizemode)
public function integer of_spacing (string as_source, ref spacing ae_spacing)
public function string of_string (spacing ae_spacing)
public function integer of_sqlfunction (string as_source, ref sqlfunction ae_sqlfunction)
public function string of_string (sqlfunction ae_sqlfunction)
public function integer of_sqlpreviewfunction (string as_source, ref sqlpreviewfunction ae_sqlpreviewfunction)
public function string of_string (sqlpreviewfunction ae_sqlpreviewfunction)
public function integer of_stgreadmode (string as_source, ref stgreadmode ae_stgreadmode)
public function string of_string (stgreadmode ae_stgreadmode)
public function integer of_stgsharemode (string as_source, ref stgsharemode ae_stgsharemode)
public function string of_string (stgsharemode ae_stgsharemode)
public function integer of_syncprocesstype (string as_source, ref syncprocesstype ae_syncprocesstype)
public function string of_string (syncprocesstype ae_syncprocesstype)
public function string of_string (tabposition ae_tabposition)
public function integer of_textcase (string as_source, ref textcase ae_textcase)
public function string of_textcase (textcase ae_textcase)
public function integer of_textstyle (string as_source, ref textstyle ae_textstyle)
public function string of_string (textstyle ae_textstyle)
public function integer of_timerkind (string as_source, ref timerkind ae_timerkind)
public function string of_string (timerkind ae_timerkind)
public function integer of_toolbarstyle (string as_source, ref toolbarstyle ae_toolbarstyle)
public function string of_string (toolbarstyle ae_toolbarstyle)
public function integer of_traceactivity (string as_source, ref traceactivity ae_traceactivity)
public function string of_string (traceactivity ae_traceactivity)
public function integer of_tracecategory (string as_source, ref tracecategory ae_tracecategory)
public function string of_string (tracecategory ae_tracecategory)
public function integer of_treenavigation (string as_source, ref treenavigation ae_treenavigation)
public function string of_string (treenavigation ae_treenavigation)
public function integer of_trigevent (string as_source, ref trigevent ae_trigevent)
public function string of_string (trigevent ae_trigevent)
public function integer of_typecategory (string as_source, ref typecategory ae_typecategory)
public function string of_string (typecategory ae_typecategory)
public function integer of_userobjects (string as_source, ref userobjects ae_userobjects)
public function string of_string (userobjects ae_userobjects)
public function integer of_valschemetype (string as_source, ref valschemetype ae_valschemetype)
public function string of_string (valschemetype ae_valschemetype)
public function integer of_varaccess (string as_source, ref varaccess ae_varaccess)
public function string of_string (varaccess ae_varaccess)
public function integer of_variablecardinalitytype (string as_source, ref variablecardinalitytype ae_variablecardinalitytype)
public function string of_string (variablecardinalitytype ae_variablecardinalitytype)
public function integer of_variablekind (string as_source, ref variablekind ae_variablekind)
public function string of_string (variablekind ae_variablekind)
public function integer of_vtextalign (string as_source, ref vtextalign ae_vtextalign)
public function string of_string (vtextalign ae_vtextalign)
public function integer of_vtickmarks (string as_source, ref vtickmarks ae_vtickmarks)
public function string of_string (vtickmarks ae_vtickmarks)
public function integer of_webpagingmethod (string as_source, ref webpagingmethod ae_webpagingmethod)
public function string of_string (webpagingmethod ae_webpagingmethod)
public function integer of_weekday (string as_source, ref weekday ae_weekday)
public function string of_string (weekday ae_weekday)
public function integer of_windowanimationstyle (string as_source, ref windowanimationstyle ae_windowanimationstyle)
public function string of_string (windowanimationstyle ae_windowanimationstyle)
public function integer of_windowtype (string as_source, ref windowtype ae_windowtype)
public function string of_string (windowtype ae_windowtype)
public function integer of_writemode (string as_source, ref writemode ae_writemode)
public function string of_string (writemode ae_writemode)
end prototypes

public function boolean of_boolean (string as_val);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Boolean
//
//	Access:  		public
//
//	Arguments:
//	as_val			The string to be converted to a boolean value.
//
//	Returns: 		boolean
// 					The boolean value of the string.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns NULL.
//
//	Description:  	Converts a string value to a boolean value.
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

Boolean lb_null
SetNull(lb_null)


//Check parameters
If IsNull(as_val) Then
	Return lb_null
End If

//Convert to uppercase
as_val = Upper(as_val)

Choose Case as_val
	Case 'TRUE', 'T', 'YES', 'Y', '1', 'ON'
		Return True
	Case 'FALSE', 'F', 'NO', 'N', '0','OFF'
		Return False
End Choose

//Invalid input parameter
Return lb_null

end function

public function string of_string (boolean ab_parm);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ab_parm			The boolean value to be converted to a string.
//
//	Returns:  		string	
//						The string value of the passed boolean argument.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Returns the passed boolean value as a string.
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

//Check parameters
If IsNull(ab_parm) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Return of_String(ab_parm, 'TRUEFALSE')

end function

public function string of_string (toolbaralignment ae_alignment);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_alignment	The toolbaralignment value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the toolbaralignment value.
//						If ae_alignment is NULL, the function returns NULL.
//						If ae_alignment is Invalid, the function returns '!'.
//
//	Description:	Converts the toolbaralignment enumerated datatype to a 
//						readable string representation.
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

//Check parameters
If IsNull(ae_alignment) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_alignment

	Case alignattop!
		Return "Top"

	Case alignatbottom!
		Return "Bottom"

	Case alignatright!
		Return "Right"

	Case alignatleft!
		Return "Left"

	Case floating!
		Return "Floating"
	
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_integer (boolean ab_arg);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_Integer
//
//	Access: 		 	public
//
//	Arguments:
//	ab_arg			The boolean argument to be converted to an integer value.
//
//	Returns: 		integer
//						The integer representation of the boolean value.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:	Converts a boolean value to an integer value.
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

//Check parameters
If IsNull(ab_arg) Then
	Integer li_null
	SetNull(li_null)
	Return li_null
End If

If ab_arg Then
	//True
	Return 1
End If

//False
Return 0

end function

public function string of_string (boolean ab_parm, string as_type);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ab_parm			The boolean value to be converted to a string.
//	as_type			The string containing the desired return value
//						i.e., TrueFalse, TF, YesNo, YN, ZEROONE
//
//	Returns:  		string	
//						The string value of the passed boolean argument.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns '!'.
//
//	Description:  Returns the passed boolean value as a string.
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

String ls_true, ls_false

//Check parameters
If IsNull(ab_parm) or IsNull(as_type) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

//Convert to uppercase
as_type = Upper(as_type)

//Check valid type and define true and false return values
Choose Case as_type
	Case 'TRUEFALSE'
		ls_true = 'TRUE'
		ls_false = 'FALSE'
	Case 'TF'
		ls_true = 'T'
		ls_false = 'F'
	Case 'YESNO'
		ls_true = 'YES'
		ls_false = 'NO'		
	Case 'YN'
		ls_true = 'Y'
		ls_false = 'N'
	Case 'ZEROONE'
		ls_true = '1'
		ls_false = '0'		
	Case Else
		Return '!'
End Choose
	
If ab_parm Then 
	Return ls_true
End If

Return ls_false

end function

public function string of_string (sqlpreviewtype a_sqlpreviewtype);//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_String
//
//	Access:  		public
//
//	Arguments:
//	a_sqlpreviewtype		The sqlpreviewtype that needs conversion.
//
//	Returns:  		string
//						A string representation of the sqlpreviewtype value.
//						If ae_alignment is NULL, the function returns NULL.
//						If ae_alignment is Invalid, the function returns '!'.
//
//	Description:  	Converts the sqlpreviewtype enumerated datatype to a 
//						readable string representation.
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

If IsNull(a_sqlpreviewtype) Then
	String ls_null
	SetNull (ls_null)
	Return ls_null
End If
	
Choose Case a_sqlpreviewtype
	Case PreviewInsert!
		Return 'Insert'
	Case PreviewDelete!
		Return 'Delete'
	Case PreviewUpdate!
		Return 'Update'
	Case PreviewSelect!
		Return 'Retrieve'
End Choose

//Invalid parameter
Return '!'
end function

public function string of_string (ostypes ae_ostype);//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_String
//
//	Access:  		public
//
//	Arguments:
//	ae_ostype		The ostype that needs conversion.
//
//	Returns:  		string
//						A string representation of the ostype value.
//						If ae_ostype is NULL, the function returns NULL.
//						If ae_ostype is Invalid, the function returns '!'.
//
//	Description:  	Converts the ostype enumerated datatype to a 
//						readable string representation.
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

String ls_null

If IsNull(ae_ostype) Then
	SetNull (ls_null)
	Return ls_null
End If
	
Choose Case ae_ostype
	Case aix!
		Return 'aix'
	Case hpux!
		Return 'hpux'
	Case macintosh!
		Return 'macintosh'
	Case osf1!
		Return 'osf1'
	Case sol2!
		Return 'sol2'
	Case windows!
		Return 'windows'
	Case windowsnt!
		Return 'windowsnt'
End Choose

//Invalid parameter
Return '!'
end function

public function integer of_sqlpreviewtype (string as_source, ref sqlpreviewtype a_sqlpreviewtype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_SQLPreviewType
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to SQLPreviewType
//							datatype value.
//	a_sqlpreviewtype	A SQLPreviewType variable passed by reference which will
//							hold the SQLPreviewType value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns NULL.
//						If as_source value is Invalid, function returns -1.
//
//	Description:  Converts a string value to a SQLPreviewType data type value.
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

//Check parameters
If IsNull(as_source) Then
	Integer li_null
	SetNull(li_null)
	Return li_null
End If

//Convert to lowercase
as_source = Lower (as_source)

If Pos (as_source, "insert") > 0 Then
	a_sqlpreviewtype = PreviewInsert!
	Return 1
ElseIf Pos (as_source, "delete") > 0 Then
	a_sqlpreviewtype = PreviewDelete!
	Return 1
ElseIf Pos (as_source, "update") > 0 Then
	a_sqlpreviewtype = PreviewUpdate!
	Return 1
ElseIf Pos (as_source, "retrieve") > 0 or &
		Pos (as_source, "select") > 0 Then
	a_sqlpreviewtype = PreviewSelect!
	Return 1
End If

//Invalid parameter.
Return -1

end function

public function integer of_windowstate (string as_windowstate, ref windowstate aws_windowstate);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_WindowState
//
//	Access:  		public
//
//	Arguments:
//	as_windowstate		The string value to be converted to windowstate data type value.
//	aws_windowstate		A windowstate variable passed by reference which will hold the
//								windowstate value that the string value was converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_windowstate value is NULL, function returns NULL.
//						If as_windowstate value is Invalid, function returns -1.
//
//	Description:  Converts a string value to a windowstate data type value.
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

//Convert to lowercase
as_windowstate = Lower (as_windowstate)

//Check parameters
If IsNull(as_windowstate) Then
	Integer li_null
	SetNull(li_null)
	Return li_null
End If

If Pos (as_windowstate, "maximized") > 0 Then
	aws_windowstate = Maximized!
	Return 1
	
ElseIf Pos (as_windowstate, "minimized") > 0 Then
	aws_windowstate = Minimized!
	Return 1
	
ElseIf Pos (as_windowstate, "normal") > 0 Then
	aws_windowstate = Normal!
	Return 1
	
End If

//Invalid parameter.
Return -1
end function

public function string of_string (windowstate aws_windowstate);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	aws_windowstate	The windowstate value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the windowstate value.
//						If aws_windowstate is NULL, the function returns NULL.
//						If aws_windowstate is Invalid, the function returns '!'.
//
//	Description:	Converts the windowstate enumerated datatype to a 
//						readable string representation.
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

//Check parameters
If IsNull(aws_windowstate) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case aws_windowstate

	Case Normal!
		Return "normal"

	Case Maximized!
		Return "maximized"

	Case Minimized!
		Return "minimized"

End Choose

//Invalid parameter value
Return "!"
end function

public function string of_string (icon ae_icon);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_icon			The icon value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the icon value.
//						If ae_icon is NULL, the function returns NULL.
//						If ae_icon is Invalid, the function returns '!'.
//
//	Description:	Converts the icon enumerated datatype to a 
//						readable string representation.
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

//Check parameters
If IsNull(ae_icon) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_icon

	Case None!
		Return "None"

	Case Question!
		Return "Question"

	Case Information!
		Return "Information"

	Case StopSign!
		Return "StopSign"

	Case exclamation!
		Return "Exclamation"
	
End Choose

//Invalid parameter value
Return "!"
end function

public function string of_string (button ae_button);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_button	The button value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the button value.
//						If ae_button is NULL, the function returns NULL.
//						If ae_button is Invalid, the function returns '!'.
//
//	Description:	Converts the button enumerated datatype to a 
//						readable string representation.
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

//Check parameters
If IsNull(ae_button) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_button

	Case OK!
		Return "OK"

	Case OKCancel!
		Return "OKCancel"

	Case YesNo!
		Return "YesNo"

	Case YesNoCancel!
		Return "YesNoCancel"

	Case RetryCancel!
		Return "RetryCancel"

	Case AbortRetryIgnore!
		Return "AbortRetryIgnore"
	
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_icon (string as_source, ref icon ae_icon);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Icon
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to Icon datatype value.
//	a_sqlpreviewtype	A icon variable passed by reference which will
//							hold the icon value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a icon data type value.
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

//Check parameters
If IsNull(as_source) Then
	Return -1
End If

//Convert to lowercase
as_source = Lower (as_source)

Choose Case as_source
	Case "none", "none!"
		ae_icon = None!

	Case "question", "question!"
		ae_icon = Question!

	Case "information", "information!"
		ae_icon = Information!

	Case "stopsign", "stopsign!"
		ae_icon = StopSign!

	Case "exclamation", "exclamation!"
		ae_icon = Exclamation!
		
	Case Else
		Return -1
End Choose

Return 1

end function

public function integer of_button (string as_source, ref button ae_button);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_button
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to button	datatype value.
//	ae_button			A button variable passed by reference which will
//							hold the button value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a button data type value.
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

//Check parameters
If IsNull(as_source) Then
	Return -1
End If

//Convert to lowercase
as_source = Lower (as_source)

Choose Case as_source
	Case "ok", "ok!"
		ae_button = OK!

	Case "okcancel", "okcancel!"
		ae_button = OKCancel!

	Case "yesno", "yesno!"
		ae_button = YesNo!

	Case "yesnocancel", "yesnocancel!"
		ae_button = YesNoCancel!

	Case "retrycancel", "retrycancel!"
		ae_button = RetryCancel!

	Case "abortretryignore", "abortretryignore!"
		ae_button = AbortRetryIgnore!
		
	Case Else
		Return -1
End Choose

Return 1

end function

public function integer of_ostype (string as_source, ref ostypes ae_ostype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_OSType
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to an ostype
//							datatype value.
//	ae_ostype			An ostypes variable passed by reference which will
//							hold the ostype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns NULL.
//						If as_source value is Invalid, function returns -1.
//
//	Description:  Converts a string value to an ostype data type value.
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

//Check parameters
If IsNull(as_source) Then
	Return -1
End If

//Convert to lowercase
as_source = Lower (as_source)

Choose Case as_source
	Case "aix", "aix!"
		ae_ostype = AIX!

	Case "hpux", "hpux!"
		ae_ostype = HPUX!

	Case "macintosh", "macintosh!"
		ae_ostype = MACINTOSH!

	Case "osf1", "osf1!"
		ae_ostype = OSF1!

	Case "sol2", "sol2!"
		ae_ostype = SOL2!

	Case "windows", "windows!"
		ae_ostype = WINDOWS!
	
	Case "windowsnt", "windowsnt!"
		ae_ostype = WINDOWSNT!
		
	Case Else
		Return -1
End Choose

Return 1
end function

public function date of_date (string as_datetime);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Date
//
//	Access:  public
//
//	Arguments:
//	as_datetime   Datetime value as a string
//
//	Returns:  date
//	If as_datetime does not contain a valid datetime value, return date
//	is 1900-01-01.  If as_datetime is NULL, function returns NULL.
//
//	Description:
//	Converts a string whose value is a valid datetime to a date
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0.02   Initial version
// 5.0.04	Enhanced to handle to more cases.
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

date	ld_rc = 1900-01-01
long	ll_count
string	ls_datetime[]
n_cst_string	lnv_string

// Check arguments
if IsNull (as_datetime) then
	SetNull (ld_rc)
	return ld_rc
end if

// Validate datetime string ("1/1/95", "1/1/95 8:00", "1/1/95 8:00 PM")
ll_count = lnv_string.of_ParseToArray (as_datetime, " ", ls_datetime)
if ll_count <= 0 or ll_count > 3 then
	return ld_rc
end if

// Date string passed in
if ll_count = 1 then
	return Date (as_datetime)
end if

// Datetime string passed in
if ll_count = 2 or ll_count = 3 then
	return Date (ls_datetime[1])
end if

return ld_rc


end function

public function string of_string (dwitemstatus ae_dwitemstatus);//////////////////////////////////////////////////////////////////////////////
//
//	Function: 		of_String
//
//	Access:  		public
//
//	Arguments:
//	ae_dwitemstatus	The dwitemstatus that needs conversion.
//
//	Returns:  		string
//						A string representation of the dwitemstatus value.
//						If ae_dwitemstatus is NULL or Invalid, the function returns '!'.
//
//	Description:  	Converts the dwitemstatus enumerated datatype to a 
//						readable string representation.
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

If IsNull(ae_dwitemstatus) Then
	Return '!'
End If
	
Choose Case ae_dwitemstatus
	Case NotModified!
		Return 'NotModified'
	Case DataModified!
		Return 'DataModified'
	Case New!
		Return 'New'
	Case NewModified!
		Return 'NewModified'
End Choose

//Invalid parameter
Return '!'
end function

public function integer of_toolbaralignment (string as_align, ref toolbaralignment ae_toolbaralign);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_ToolbarAlignment
//
//	Access:  		public
//
//	Arguments:
//	as_align				The string value to be converted to toolbaralignment data type value
//	ae_toolbaralign		A toolbaralignment variable passed by reference which will hold the
//							toolbaralignment value that the string value was converted to
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_align value is NULL, function returns NULL.
//						If as_align value is Invalid, function returns -1.
//
//	Description:  Converts a string value to a toolbaralignment data type value.
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

//Convert to lowercase
as_align = Lower (as_align)

//Check parameters
If IsNull(as_align) Then
	Integer li_null
	SetNull(li_null)
	Return li_null
End If

If Pos (as_align, "top") > 0 Then
	ae_toolbaralign = alignattop!
	Return 1
	
ElseIf Pos (as_align, "bottom") > 0 Then
	ae_toolbaralign = alignatbottom!
	Return 1
	
ElseIf Pos (as_align, "left") > 0 Then
	ae_toolbaralign = alignatleft!
	Return 1
	
ElseIf Pos (as_align, "right") > 0 Then
	ae_toolbaralign = alignatright!
	Return 1
	
ElseIf Pos (as_align, "floating") > 0 Then
	ae_toolbaralign = floating!
	Return 1
	
End If

//Invalid parameter.
Return -1
end function

public function integer of_dwitemstatus (string as_status, ref dwitemstatus ae_dwitemstatus);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_dwItemStatus
//
//	Access:  		public
//
//	Arguments:
//	as_status			The string value to be converted to dwItemStatus data type value
//	ae_dwItemStatus	A dwItemStatus variable passed by reference which will hold the
//							dwItemStatus value that the string value was converted to
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_status value is Invalid, function returns -1.
//
//	Description:  Converts a string value to a dwItemStatus data type value.
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

//Convert to lowercase
as_status = Lower (as_status)

//Check parameters
If IsNull(as_status) Then
	Return -1
End If

CHOOSE CASE as_status
	CASE "notmodified", "notmodified!"
		ae_dwItemStatus = NotModified!
		Return 1
	CASE "datamodified", "datamodified!"
		ae_dwItemStatus = DataModified!
		Return 1
	CASE "new", "new!"
		ae_dwItemStatus = New!
		Return 1
	CASE "newmodified", "newmodified!"
		ae_dwItemStatus = NewModified!
		Return 1		
END CHOOSE

//Invalid parameter.
Return -1
end function

public function time of_time (string as_datetime);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Time
//
//	Access:  public
//
//	Arguments:
//	as_datetime   Datetime value as a string
//
//	Returns:  time
//	If as_datetime does not contain a valid datetime value, return time
//	is 00:00:00.000000.  If as_datetime is NULL, function returns NULL.
//
//	Description:
//	Converts a string whose value is a valid datetime to a time value
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0.02   Initial version
// 5.0.04 	Enhanced to handle more cases.
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

time	ltm_rc = 00:00:00.000000
long	ll_count
string	ls_datetime[]
n_cst_string	lnv_string

// Check arguments
if IsNull (as_datetime) then
	SetNull (ltm_rc)
	return ltm_rc
end if

// Validate datetime string
ll_count = lnv_string.of_ParseToArray (as_datetime, " ", ls_datetime)
if ll_count <= 0 or ll_count > 3 then
	return ltm_rc
end if

// Date string passed in ("8:00pm")
if ll_count = 1 then
	return Time (as_datetime)
end if

// Datetime string passed in ("1/1/95 8:00pm")
if ll_count = 2 then
	return Time (ls_datetime[2])
end if

// Datetime string passed in ("1/1/95 8:00 pm")
if ll_count = 3 then
	return Time (ls_datetime[2]+' '+ls_datetime[3])
end if

return ltm_rc
end function

public function boolean of_boolean (integer ai_val);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Boolean
//
//	Access:			public
//
//	Arguments: 
//	ai_val			The integer to be converted to a boolean value.
//
//	Returns:  		boolean
//						The boolean representation of the integer value.
//						If any argument's value is NULL, function returns NULL.
//						If any argument's value is Invalid, function returns NULL.
//
//	Description:  Converts a integer value to a boolean.
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

//Check parameters
If IsNull(ai_val) or (ai_val>1) or (ai_val<0) Then
	Boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

If ai_val=1 Then
	Return True
End If

Return False

end function

public function integer of_accessiblerole (string as_source, ref accessiblerole ae_accessiblerole);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_AccessibleRole
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to AccessibleRole datatype value.
//	ae_accessiblerole	A AccessibleRole variable passed by reference which will
//							hold the AccessibleRole value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a AccessibleRole data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_accessiblerole)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String
Choose Case as_source
	Case "alertrole"
		ae_accessiblerole = alertrole!
	
	Case "animationrole"
		ae_accessiblerole = animationrole!
	
	Case "applicationrole"
		ae_accessiblerole = applicationrole!

	Case "borderrole"	
		ae_accessiblerole = borderrole!

	Case "buttondropdowngridrole"
		ae_accessiblerole = buttondropdowngridrole!

	Case "buttondropdownrole"
		ae_accessiblerole = buttondropdownrole!
	
	Case "buttonmenurole"		
		ae_accessiblerole = buttonmenurole!
		
	Case "caretrole"	
		ae_accessiblerole = caretrole!

	Case "cellrole!"		
		ae_accessiblerole = cellrole!
	
	Case "characterrole"
		ae_accessiblerole = characterrole!

	Case "chartrole"		
		ae_accessiblerole = chartrole!
		
	Case "checkbuttonrole"
		ae_accessiblerole = checkbuttonrole!
				
	Case "clientrole"
		ae_accessiblerole = clientrole!
				
	Case "clockrole"
		ae_accessiblerole = clockrole!
		
	Case "columnheaderrole"
		ae_accessiblerole = columnheaderrole!
				
	Case "columnrole"
		ae_accessiblerole = columnrole!
				
	Case "comboboxrole"
		ae_accessiblerole = comboboxrole!
				
	Case "cursorrole"
		ae_accessiblerole = cursorrole!
				
	Case "defaultrole"
		ae_accessiblerole = defaultrole!
				
	Case "diagramrole"
		ae_accessiblerole = diagramrole!
				
	Case "dialogrole"
		ae_accessiblerole = dialogrole!
				
	Case "documentrole"
		ae_accessiblerole = documentrole!
				
	Case "droplistrole"
		ae_accessiblerole = droplistrole!
				
	Case "equationrole!"
		ae_accessiblerole = equationrole!
				
	Case "graphicrole"
		ae_accessiblerole = graphicrole!
				
	Case "griprole"
		ae_accessiblerole = griprole!
		
	Case "groupingrole"
		ae_accessiblerole = groupingrole!
				
	Case "helpballoonrole"
		ae_accessiblerole = helpballoonrole!
				
	Case "hotkeyfieldrole"
		ae_accessiblerole = hotkeyfieldrole!
				
	Case "indicatorrole"
		ae_accessiblerole = indicatorrole!
		
	Case "linkrole"
		ae_accessiblerole = linkrole!
				
	Case "listrole"
		ae_accessiblerole = listrole!
			
	Case "menubarrole"
		ae_accessiblerole = menubarrole!
				
	Case "menuitemrole"
		ae_accessiblerole = menuitemrole!
				
	Case "menupopuprole"
		ae_accessiblerole = menupopuprole!
				
	Case "outlinebuttonrole"
		ae_accessiblerole = outlinebuttonrole!
			
	Case "outlineitemrole"
		ae_accessiblerole = outlineitemrole!
				
	Case "outlinerole"
		ae_accessiblerole = outlinerole!
				
	Case "pagetablistrole"
		ae_accessiblerole = pagetablistrole!
				
	Case "pagetabrole"
		ae_accessiblerole = pagetabrole!
		
	Case "panerole"
		ae_accessiblerole = panerole!
				
	Case "progressbarrole"
		ae_accessiblerole = progressbarrole!
				
	Case "propertypagerole"
		ae_accessiblerole = propertypagerole!
				
	Case "pushbuttonrole"	
		ae_accessiblerole = pushbuttonrole!
			
	Case "radiobuttonrole"
		ae_accessiblerole = radiobuttonrole!
				
	Case "rowheaderrole"
		ae_accessiblerole = rowheaderrole!
				
	Case "rowrole!"
		ae_accessiblerole = rowrole!
				
	Case "scrollbarrole"
		ae_accessiblerole = scrollbarrole!
			
	Case "separatorrole"
		ae_accessiblerole = separatorrole!
				
	Case "sliderrole"
		ae_accessiblerole = sliderrole!
				
	Case "soundrole"
		ae_accessiblerole = soundrole!
				
	Case "spinbuttonrole"
		ae_accessiblerole = spinbuttonrole!
			
	Case "splitbuttonrole"
		ae_accessiblerole = splitbuttonrole!
				
	Case "statictextrole!"
		ae_accessiblerole = statictextrole!
				
	Case "statusbarrole"
		ae_accessiblerole = statusbarrole!
				
	Case "tablerole"
		ae_accessiblerole = tablerole!
			
	Case "textrole"
		ae_accessiblerole = textrole!
				
	Case "titlebarrole"
		ae_accessiblerole = titlebarrole!
				
	Case "toolbarrole"
		ae_accessiblerole = toolbarrole!
				
	Case "tooltiprole"
		ae_accessiblerole = tooltiprole!
			
	Case "whitespacerole"
		ae_accessiblerole = whitespacerole!
				
	Case "windowrole"
		ae_accessiblerole = windowrole!
	
	Case else
		//Invalid String value
		Return -1				
End Choose

// Conversion done
Return 1
end function

public function string of_string (accessiblerole ae_accessiblerole);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_accessiblerole	The accessible role value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the accessible role value.
//						If ae_accessiblerole is NULL, the function returns NULL.
//						If ae_accessiblerole is Invalid, the function returns '!'.
//
//	Description:	Converts the accessible role enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_accessiblerole) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_accessiblerole

	Case alertrole!
		Return "alertrole"

	Case animationrole!
		Return "animationrole"

	Case applicationrole!
		Return "applicationrole"

	Case borderrole!
		Return "borderrole"

	Case buttondropdowngridrole!
		Return "buttondropdowngridrole"

	Case buttondropdownrole!
		Return "buttondropdownrole"

	Case buttonmenurole!
		Return "buttonmenurole"
		
	Case caretrole!
		Return "caretrole"
		
	Case cellrole!
		Return "cellrole!"
		
	Case characterrole!
		Return "characterrole"
		
	Case chartrole!
		Return "chartrole"
		
	Case checkbuttonrole!
		Return "checkbuttonrole"
		
	Case clientrole!
		Return "clientrole"
		
	Case clockrole!
		Return "clockrole"
		
	Case columnheaderrole!
		Return "columnheaderrole"
		
	Case columnrole!
		Return "columnrole"
		
	Case comboboxrole!
		Return "comboboxrole"
		
	Case cursorrole!
		Return "cursorrole"
		
	Case defaultrole!
		Return "defaultrole"
		
	Case diagramrole!
		Return "diagramrole"
		
	Case dialogrole!
		Return "dialogrole"
		
	Case documentrole!
		Return "documentrole"
		
	Case droplistrole!
		Return "droplistrole"
		
	Case equationrole!
		Return "equationrole!"
		
	Case graphicrole!
		Return "graphicrole"
		
	Case griprole!
		Return "griprole"
		
	Case groupingrole!
		Return "groupingrole"
		
	Case helpballoonrole!
		Return "helpballoonrole"
		
	Case hotkeyfieldrole!
		Return "hotkeyfieldrole"
		
	Case indicatorrole!
		Return "indicatorrole"
		
	Case linkrole!
		Return "linkrole"
		
	Case listrole!
		Return "listrole	"
	
	Case menubarrole!
		Return "menubarrole"
		
	Case menuitemrole!
		Return "menuitemrole"
		
	Case menupopuprole!
		Return "menupopuprole"
		
	Case outlinebuttonrole!
		Return "outlinebuttonrole"	
	
	Case outlineitemrole!
		Return "outlineitemrole"
		
	Case outlinerole!
		Return "outlinerole"
		
	Case pagetablistrole!
		Return "pagetablistrole"
		
	Case pagetabrole!
		Return "pagetabrole"	
	
	Case panerole!
		Return "panerole"
		
	Case progressbarrole!
		Return "progressbarrole"
		
	Case propertypagerole!
		Return "propertypagerole!"
		
	Case pushbuttonrole!
		Return "pushbuttonrole"	
	
	Case radiobuttonrole!
		Return "radiobuttonrole"
		
	Case rowheaderrole!
		Return "rowheaderrole"
		
	Case rowrole!
		Return "rowrole!"
		
	Case scrollbarrole!
		Return "scrollbarrole"	
	
	Case separatorrole!
		Return "separatorrole"
		
	Case sliderrole!
		Return "sliderrole"
		
	Case soundrole!
		Return "soundrole"
		
	Case spinbuttonrole!
		Return "spinbuttonrole"
	
	Case splitbuttonrole!
		Return "splitbuttonrole"
		
	Case statictextrole!
		Return "statictextrole!"
		
	Case statusbarrole!
		Return "statusbarrole"
		
	Case tablerole!
		Return "tablerole"	
	
	Case textrole!
		Return "textrole"
		
	Case titlebarrole!
		Return "titlebarrole"
		
	Case toolbarrole!
		Return "toolbarrole"
		
	Case tooltiprole!
		Return "tooltiprole"	
	
	Case whitespacerole!
		Return "whitespacerole"
		
	Case windowrole!
		Return "windowrole"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_alignment (string as_source, ref alignment ae_alignment);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Alignment
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to Alignment datatype value.
//	ae_alignment		A Alignment variable passed by reference which will
//							hold the Alignment value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a Alignment data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_alignment)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "center"
		ae_alignment = center!

	Case "justify"
		ae_alignment = justify!

	Case "left"
		ae_alignment = left!

	Case "right"
		ae_alignment = right!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (argcallingconvention ae_argcallingconvention);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_argcallingconvention	The argcallingconvention value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the argcallingconvention value.
//						If ae_argcallingconvention is NULL, the function returns NULL.
//						If ae_argcallingconvention is Invalid, the function returns '!'.
//
//	Description:	Converts the argcallingconvention enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_argcallingconvention) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_argcallingconvention

	Case byreferenceargument!
		Return "byreferenceargument"

	Case byvalueargument!
		Return "byvalueargument"

	Case readonlyargument!
		Return "readonlyargument"

	Case varlistargument!
		Return "varlistargument"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_argcallingconvention (string as_source, ref argcallingconvention ae_argcallingconvention);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_argcallingconvention
//
//	Access:  		public
//
//	Arguments:
//	as_source					The string value to be converted to argcallingconventiont datatype value.
//	ae_argcallingconvention	A argcallingconventiont variable passed by reference which will
//									hold the argcallingconvention value that the string value was
//									converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a argcallingconvention data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_argcallingconvention)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "byreferenceargument"
		ae_argcallingconvention = byreferenceargument!

	Case "byvalueargument"
		ae_argcallingconvention = byvalueargument!

	Case "readonlyargument"
		ae_argcallingconvention = readonlyargument!

	Case "varlistargument"
		ae_argcallingconvention = varlistargument!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function integer of_arrangeopen (string as_source, ref arrangeopen ae_arrangeopen);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Arrangeopen
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to Alignment datatype value.
//	ae_arrangeopen	A Arrangeopen variable passed by reference which will
//							hold the Arrangeopen value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a Arrangeopen data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_arrangeopen)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "cascaded"
		ae_arrangeopen = cascaded!

	Case "layered"
		ae_arrangeopen = layered!

	Case "original"
		ae_arrangeopen = original!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (arrangeopen ae_arrangeopen);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_arrangeopen	The arrangeopen value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the arrangeopen value.
//						If ae_arrangeopen is NULL, the function returns NULL.
//						If ae_arrangeopen is Invalid, the function returns '!'.
//
//	Description:	Converts the arrangeopen enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_arrangeopen) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_arrangeopen

	Case cascaded!
		Return "cascaded"

	Case layered!
		Return "layered"

	Case original!
		Return "original"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_arrangetypes (string as_source, ref arrangetypes ae_arrangetypes);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_arrangetypes
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to arrangetypes datatype value.
//	ae_arrangetypes	A arrangetypes variable passed by reference which will
//							hold the arrangetypes value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a arrangetypes data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_arrangetypes)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "cascade"
		ae_arrangetypes = cascade!

	Case "icons"
		ae_arrangetypes = icons!

	Case "layer"
		ae_arrangetypes = layer!

	Case "tile"
		ae_arrangetypes = tile!

	Case "tilehorizontal"
		ae_arrangetypes = tilehorizontal!
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function integer of_band (string as_source, ref band ae_band);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Band
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to Band datatype value.
//	ae_Band				A Band variable passed by reference which will
//							hold the Band value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a Band data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_Band)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String
Choose Case as_source
	Case "detail"
		ae_Band = detail!
	
	Case "footer"
		ae_Band = footer!
	
	Case "header"
		ae_Band = header!

	Case else
		//Invalid String value
		Return -1				
End Choose

// Conversion done
Return 1
end function

public function string of_string (band ae_band);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_band	The band value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the Band value.
//						If ae_band is NULL, the function returns NULL.
//						If ae_band is Invalid, the function returns '!'.
//
//	Description:	Converts the Band enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_Band) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_Band

	Case detail!
		Return "detail"

	Case footer!
		Return "footer"

	Case header!
		Return "header"

End Choose

//Invalid parameter value
Return "!"
end function

public function string of_string (border ae_border);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_border	The border role value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the border value.
//						If ae_border is NULL, the function returns NULL.
//						If ae_border is Invalid, the function returns '!'.
//
//	Description:	Converts the border enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_border) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_border

	Case box!
		Return "box"

	Case lowered!
		Return "lowered"

	Case noborder!
		Return "noborder"

	Case raised!
		Return "raised"

	Case resizeborder!
		Return "resizeborder"
		
	Case shadowbox!
		Return "shadowbox"

	Case underline!
		Return "underline"
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_border (string as_source, ref border ae_border);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Band
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to Border datatype value.
//	ae_Border			A Border variable passed by reference which will
//							hold the Border value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a Border data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_Border)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String
Choose Case as_source
	Case "box"
		ae_Border = box!
	
	Case "lowered"
		ae_Border = lowered!
	
	Case "noborder"
		ae_Border = noborder!

	Case "raised"
		ae_Border = raised!
	
	Case "resizeborder"
		ae_Border = resizeborder!
	
	Case "shadowbox"
		ae_Border = shadowbox!

	Case "underline"
		ae_Border = underline!
		
	Case else
		//Invalid String value
		Return -1				
End Choose

// Conversion done
Return 1
end function

public function integer of_borderstyle (string as_source, ref borderstyle ae_borderstyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_Borderstyle
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to Borderstyle datatype value.
//	ae_Borderstyle			A Borderstyle variable passed by reference which will
//							hold the Borderstyle value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a Borderstyle data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_Borderstyle)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String
Choose Case as_source
	Case "stylebox"
		ae_Borderstyle = stylebox!
	
	Case "stylelowered"
		ae_Borderstyle = stylelowered!
	
	Case "styleraised"
		ae_Borderstyle = styleraised!
	
	Case "styleshadowbox"
		ae_Borderstyle = styleshadowbox!

	Case else
		//Invalid String value
		Return -1				
End Choose

// Conversion done
Return 1
end function

public function string of_string (borderstyle ae_borderstyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_Borderstyle	The Borderstyle role value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the Borderstyle value.
//						If ae_Borderstyle is NULL, the function returns NULL.
//						If ae_Borderstyle is Invalid, the function returns '!'.
//
//	Description:	Converts the Borderstyle enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_Borderstyle) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_Borderstyle

	Case stylebox!
		Return "stylebox"

	Case stylelowered!
		Return "stylelowered"

	Case styleraised!
		Return "styleraised"
		
	Case styleshadowbox!
		Return "styleshadowbox"

End Choose

//Invalid parameter value
Return "!"
end function

public function string of_string (charset ae_charset);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_Charset	The Charset role value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the Charset value.
//						If ae_Charset is NULL, the function returns NULL.
//						If ae_Charset is Invalid, the function returns '!'.
//
//	Description:	Converts the Charset enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_Charset) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_Charset

	Case charsetansi!
		Return "charsetansi"

	Case charsetansiarabic!
		Return "charsetansiarabic"

	Case charsetansihebrew!
		Return "charsetansihebrew"
		
	Case charsetdbcs!
		Return "charsetdbcs"

	Case charsetdbcsjapanese!
		Return "charsetdbcsjapanese"
		
	Case charsetunicode!
		Return "charsetunicode"

End Choose

//Invalid parameter value
Return "!"
end function

public function string of_string (arrangetypes ae_arrangetypes);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_arrangetypes	The arrangetypes role value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the arrangetypes value.
//						If ae_accessiblerole is NULL, the function returns NULL.
//						If ae_accessiblerole is Invalid, the function returns '!'.
//
//	Description:	Converts the arrangetypes enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_arrangetypes) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_arrangetypes

	Case cascade!
		Return "cascade"

	Case icons!
		Return "icons"

	Case layer!
		Return "layer"

	Case tile!
		Return "tile"

	Case tilehorizontal!
		Return "tilehorizontal"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function string of_string (clipboardformat ae_clipboardformat);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_clipboardformat	The clipboardformat role value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the clipboardformat value.
//						If ae_accessiblerole is NULL, the function returns NULL.
//						If ae_accessiblerole is Invalid, the function returns '!'.
//
//	Description:	Converts the clipboardformat enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_clipboardformat) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_clipboardformat

	Case clipformatbitmap!
		Return "clipformatbitmap"

	Case clipformatdib!
		Return "clipformatdib"

	Case clipformatdif!
		Return "clipformatdif"

	Case clipformatenhmetafile!
		Return "clipformatenhmetafile"

	Case clipformathdrop!
		Return "clipformathdrop"
	
	Case clipformatlocale!
		Return "clipformatlocale"

	Case clipformatmetafilepict!
		Return "clipformatmetafilepict"

	Case clipformatoemtext!
		Return "clipformatoemtext"

	Case clipformatpalette!
		Return "clipformatpalette"

	Case clipformatpendata!
		Return "clipformatpendata"
	
	Case clipformatriff!
		Return "clipformatriff"

	Case clipformatsylk!
		Return "clipformatsylk"

	Case clipformattext!
		Return "clipformattext"

	Case clipformattiff!
		Return "clipformattiff"

	Case clipformatunicodetext!
		Return "clipformatunicodetext"

	Case clipformatwave!
		Return "clipformatwave"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_clipboardformat (string as_source, ref clipboardformat ae_clipboardformat);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_clipboardformat
//
//	Access:  		public
//
//	Arguments:
//	as_source				The string value to be converted to clipboardformat datatype value.
//	ae_clipboardformat	A clipboardformat variable passed by reference which will
//								hold the clipboardformat value that the string value was
//								converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a clipboardformat data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_clipboardformat)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "clipformatbitmap"
		ae_clipboardformat = clipformatbitmap!

	Case "clipformatdib"
		ae_clipboardformat = clipformatdib!

	Case "clipformatdif"
		ae_clipboardformat = clipformatdif!

	Case "clipformatenhmetafile"
		ae_clipboardformat = clipformatenhmetafile!

	Case "clipformathdrop"
		ae_clipboardformat = clipformathdrop!
		
	Case "clipformatlocale"
		ae_clipboardformat = clipformatlocale!

	Case "clipformatmetafilepict"
		ae_clipboardformat = clipformatmetafilepict!

	Case "clipformatoemtext"
		ae_clipboardformat = clipformatoemtext!

	Case "clipformatpalette"
		ae_clipboardformat = clipformatpalette!
		
	Case "clipformatpendata"
		ae_clipboardformat = clipformatpendata!

	Case "clipformatriff"
		ae_clipboardformat = clipformatriff!

	Case "clipformatsylk"
		ae_clipboardformat = clipformatsylk!

	Case "clipformattext"
		ae_clipboardformat = clipformattext!
	
	Case "clipformattiff"
		ae_clipboardformat = clipformattiff!

	Case "clipformatunicodetext"
		ae_clipboardformat = clipformatunicodetext!

	Case "clipformatwave"
		ae_clipboardformat = clipformatwave!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (connectprivilege ae_connectprivilege);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_connectprivilege	The connectprivilege value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the connectprivilege value.
//						If ae_connectprivilege is NULL, the function returns NULL.
//						If ae_connectprivilege is Invalid, the function returns '!'.
//
//	Description:	Converts the connectprivilege enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_connectprivilege) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_connectprivilege

	Case connectprivilege!
		Return "connectprivilege"

	Case connectwithadminprivilege!
		Return "connectwithadminprivilege"

	Case noconnectprivilege!
		Return "noconnectprivilege"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_connectprivilege (string as_source, ref connectprivilege ae_connectprivilege);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_connectprivilege
//
//	Access:  		public
//
//	Arguments:
//	as_source				The string value to be converted to connectprivilege datatype value.
//	ae_connectprivilege	A connectprivilege variable passed by reference which will
//								hold the connectprivilege value that the string value was
//								converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a connectprivilege data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_connectprivilege)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "connectprivilege"
		ae_connectprivilege = connectprivilege!

	Case "connectwithadminprivilege"
		ae_connectprivilege = connectwithadminprivilege!

	Case "noconnectprivilege"
		ae_connectprivilege = noconnectprivilege!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (converttype ae_converttype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_converttype	The converttype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the converttype value.
//						If ae_converttype is NULL, the function returns NULL.
//						If ae_converttype is Invalid, the function returns '!'.
//
//	Description:	Converts the converttype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_converttype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_converttype

	Case xpixelstounits!
		Return "xpixelstounits"

	Case xunitstopixels!
		Return "xunitstopixels"

	Case ypixelstounits!
		Return "ypixelstounits"

	Case yunitstopixels!
		Return "yunitstopixels"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_converttype (string as_source, ref converttype ae_converttype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_converttype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to converttype datatype value.
//	ae_converttype		A converttype variable passed by reference which will
//							hold the converttype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a converttype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_converttype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "xpixelstounits"
		ae_converttype = xpixelstounits!

	Case "xunitstopixels"
		ae_converttype = xunitstopixels!

	Case "ypixelstounits"
		ae_converttype = ypixelstounits!

	Case "yunitstopixels"
		ae_converttype = yunitstopixels!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (cputypes ae_cputypes);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_cputypes		The cputypes value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the cputypes value.
//						If ae_cputypesis NULL, the function returns NULL.
//						If ae_cputypesis Invalid, the function returns '!'.
//
//	Description:	Converts the cputypesenumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_cputypes) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_cputypes

	Case alpha!
		Return "alpha"

	Case arm!
		Return "arm"

	Case hppa!
		Return "hppa"

	Case i286!
		Return "i286"

	Case i386!
		Return "i386"

	Case i486!
		Return "i486"

	Case ia64!
		Return "ia64"
		
	Case m68000!
		Return "m68000"
		
	Case m68020!
		Return "m68020!"
		
	Case m68030!
		Return "m68030"
		
	Case m68040!
		Return "m68040"
		
	Case mips!
		Return "mips"
		
	Case pentium!
		Return "pentium"
		
	Case powerpc!
		Return "powerpc"
		
	Case powerrs!
		Return "powerrs"
		
	Case ppc601!
		Return "ppc601"
		
	Case ppc603!
		Return "ppc603"
		
	Case ppc604!
		Return "ppc604"
		
	Case sparc!
		Return "sparc"
		
	Case ultrasparc!
		Return "ultrasparc"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_cputypes (string as_source, ref cputypes ae_cputypes);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_cputypes
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to cputypes datatype value.
//	ae_cputypes			A cputypes variable passed by reference which will
//							hold the cputypes value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a cputypes data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_cputypes)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String
Choose Case as_source
	Case "alpha"
		ae_cputypes = alpha!

	Case "arm"
		ae_cputypes =  arm!

	Case "hppa"
		ae_cputypes =  hppa!

	Case "i286"
		ae_cputypes =  i286!

	Case "i386"
		ae_cputypes =  i386!

	Case "i486"
		ae_cputypes =  i486!

	Case "ia64"
		ae_cputypes =  ia64!
		
	Case "m68000"
		ae_cputypes =  m68000!
		
	Case "m68020!"
		ae_cputypes =  m68020!
		
	Case "m68030"
		ae_cputypes =  m68030!
		
	Case "m68040"
		ae_cputypes =  m68040!
		
	Case "mips"
		ae_cputypes =  mips!
		
	Case "pentium"
		ae_cputypes =  pentium!
		
	Case "powerpc"
		ae_cputypes =  powerpc!
		
	Case "powerrs"
		ae_cputypes =  powerrs!
		
	Case "ppc601"
		ae_cputypes =  ppc601!
		
	Case "ppc603"
		ae_cputypes =  ppc603!
		
	Case "ppc604"
		ae_cputypes =  ppc604!
		
	Case "sparc"
		ae_cputypes =  sparc!
		
	Case "ultrasparc"
		ae_cputypes =  ultrasparc!
	
	Case else
		//Invalid String value
		Return -1				
End Choose

// Conversion done
Return 1
end function

public function string of_string (datetimeformat ae_datetimeformat);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_datetimeformat	The datetimeformat value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the datetimeformat value.
//						If ae_datetimeformat is NULL, the function returns NULL.
//						If ae_datetimeformat is Invalid, the function returns '!'.
//
//	Description:	Converts the datetimeformat enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_datetimeformat) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_datetimeformat

	Case dtfcustom!
		Return "dtfcustom"

	Case dtflongdate!
		Return "dtflongdate"

	Case dtfshortdate!
		Return "dtfshortdate"

	Case dtftime!
		Return "dtftime"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_datetimeformat (string as_source, ref datetimeformat ae_datetimeformat);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_datetimeformat
//
//	Access:  		public
//
//	Arguments:
//	as_source				The string value to be converted to datetimeformat datatype value.
//	ae_datetimeformat	A datetimeformat variable passed by reference which will
//								hold the datetimeformat value that the string value was
//								converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a datetimeformat data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_datetimeformat)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "dtfcustom"
		ae_datetimeformat = dtfcustom!

	Case "dtflongdate"
		ae_datetimeformat = dtflongdate!

	Case "dtfshortdate"
		ae_datetimeformat = dtfshortdate!

	Case "ridtftime"
		ae_datetimeformat = dtftime!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function integer of_dbnotification (string as_source, ref dbnotification ae_dbnotification);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_dbnotification
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to dbnotification datatype value.
//	ae_dbnotification	A dbnotification variable passed by reference which will
//							hold the dbnotification value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a dbnotification data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_dbnotification)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "dbdatatruncate"
		ae_dbnotification = dbdatatruncate!

	Case "dbfailover"
		ae_dbnotification = dbfailover!

	Case "dbnonotification"
		ae_dbnotification = dbnonotification!

	Case "dbserverdown"
		ae_dbnotification = dbserverdown!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (dbnotification ae_dbnotification);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_dbnotification	The dbnotification value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the dbnotification value.
//						If ae_dbnotification is NULL, the function returns NULL.
//						If ae_dbnotification is Invalid, the function returns '!'.
//
//	Description:	Converts the dbnotification enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_dbnotification) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_dbnotification

	Case dbdatatruncate!
		Return "dbdatatruncate"

	Case dbfailover!
		Return "dbfailover"

	Case dbnonotification!
		Return "dbnonotification"

	Case dbserverdown!
		Return "dbserverdown"

End Choose

//Invalid parameter value
Return "!"
end function

public function string of_string (direction ae_direction);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_direction		The direction value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the direction value.
//						If ae_direction is NULL, the function returns NULL.
//						If ae_direction is Invalid, the function returns '!'.
//
//	Description:	Converts the direction enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_direction) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_direction

	Case directionall!
		Return "directionall"

	Case directiondown!
		Return "directiondown"

	Case directionleft!
		Return "dbnonotification"

	Case directionright!
		Return "directionright"

	Case directionup!
		Return "directionup"


End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_direction (string as_source, ref direction ae_direction);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_direction
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to direction datatype value.
//	ae_direction			A direction variable passed by reference which will
//							hold the direction value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a direction data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_direction)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "directionall"
		ae_direction = directionall!

	Case "directiondown"
		ae_direction = directiondown!

	Case "directionleft"
		ae_direction = directionleft!

	Case "directionright"
		ae_direction = directionright!
	
	Case "directionup"
		ae_direction = directionup!
		
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function integer of_displaysizemode (string as_source, ref displaysizemode ae_displaysizemode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_displaysizemode
//
//	Access:  		public
//
//	Arguments:
//	as_source					The string value to be converted to displaysizemode datatype value.
//	ae_displaysizemode		A displaysizemode variable passed by reference which will
//									hold the displaysizemode value that the string value was
//									converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a displaysizemode data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_displaysizemode)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "inkpicautosize"
		ae_displaysizemode = inkpicautosize!

	Case "inkpiccentered"
		ae_displaysizemode = inkpiccentered!

	Case "inkpicnormal"
		ae_displaysizemode = inkpicnormal!

	Case "inkpicstretched!"
		ae_displaysizemode = inkpicstretched!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (displaysizemode ae_displaysizemode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_displaysizemode	The displaysizemode value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the displaysizemode value.
//						If ae_displaysizemode is NULL, the function returns NULL.
//						If ae_displaysizemode is Invalid, the function returns '!'.
//
//	Description:	Converts the displaysizemode enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_displaysizemode) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_displaysizemode

	Case inkpicautosize!
		Return "inkpicautosize"

	Case inkpiccentered!
		Return "inkpiccentered"

	Case inkpicnormal!
		Return "inkpicnormal"

	Case inkpicstretched!
		Return "inkpicstretched"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_dragmodes (string as_source, ref dragmodes ae_dragmodes);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_dragmodes
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to dragmodes datatype value.
//	ae_dragmodes		A dragmodes variable passed by reference which will
//							hold the dragmodes value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a dragmodes data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_dragmodes)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "begin"
		ae_dragmodes = begin!

	Case "cancel"
		ae_dragmodes = cancel!

	Case "end"
		ae_dragmodes = end!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (alignment ae_alignment);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_alignment	The alignment value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the alignment value.
//						If ae_alignment is NULL, the function returns NULL.
//						If ae_alignment is Invalid, the function returns '!'.
//
//	Description:	Converts the alignment enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_alignment) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_alignment

	Case center!
		Return "center"

	Case justify!
		Return "justify"

	Case left!
		Return "left"
	
	Case right!
		Return "right"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_dwbuffer (string as_source, ref dwbuffer ae_dwbuffer);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_dwbuffer
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to dwbuffer datatype value.
//	ae_dwbuffer		A dwbuffer variable passed by reference which will
//							hold the dwbuffer value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a dwbuffer data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_dwbuffer)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "delete"
		ae_dwbuffer = delete!

	Case "filter"
		ae_dwbuffer = filter!

	Case "primary"
		ae_dwbuffer = primary!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (dwbuffer ae_dwbuffer);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_dwbuffer	The dwbuffer value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the dwbuffer value.
//						If ae_dwbuffer is NULL, the function returns NULL.
//						If ae_dwbuffer is Invalid, the function returns '!'.
//
//	Description:	Converts the dwbuffer enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_dwbuffer) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_dwbuffer

	Case delete!
		Return "delete"

	Case filter!
		Return "filter"

	Case primary!
		Return "primary"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function string of_string (encoding ae_encoding);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_encoding	The encoding value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the encoding value.
//						If ae_encoding is NULL, the function returns NULL.
//						If ae_encoding is Invalid, the function returns '!'.
//
//	Description:	Converts the encoding enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_encoding) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_encoding

	Case encodingansi!
		Return "encodingansi"

	Case encodingutf16be!
		Return "encodingutf16be"

	Case encodingutf16le!
		Return "encodingutf16le"
	
	Case encodingutf8!
		Return "encodingutf8"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_errorreturn (string as_source, ref errorreturn ae_errorreturn);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_AccessibleRole
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to errorreturndatatype value.
//	ae_accessiblerole	A errorreturnvariable passed by reference which will
//							hold the errorreturnvalue that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a errorreturndata type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_errorreturn )
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String
Choose Case as_source
	Case "enterpriseonlyfeature"
		ae_errorreturn= enterpriseonlyfeature!
	
	Case "eventnotexisterror"
		ae_errorreturn= eventnotexisterror!
	
	Case "eventwrongprototypeerror"
		ae_errorreturn= eventwrongprototypeerror!

	Case "featurenotsupportederror"	
		ae_errorreturn= featurenotsupportederror!

	Case "filealreadyopenerror"
		ae_errorreturn= filealreadyopenerror!

	Case "filecloseerror"
		ae_errorreturn= filecloseerror!
	
	Case "fileinvalidformaterror"		
		ae_errorreturn= fileinvalidformaterror!
		
	Case "filenotopenerror"	
		ae_errorreturn= filenotopenerror!

	Case "filenotseterror!"		
		ae_errorreturn= filenotseterror!
	
	Case "fileopenerror"
		ae_errorreturn= fileopenerror!

	Case "filereaderror"		
		ae_errorreturn= filereaderror!
		
	Case "filewriteerror"
		ae_errorreturn= filewriteerror!
				
	Case "modelexistserror"
		ae_errorreturn= modelexistserror!
				
	Case "modelnotexistserror"
		ae_errorreturn= modelnotexistserror!
		
	Case "mutexcreateerror"
		ae_errorreturn= mutexcreateerror!
				
	Case "sharedobjectcreateinstanceerror"
		ae_errorreturn= sharedobjectcreateinstanceerror!
				
	Case "sharedobjectcreatepbsessionerror"
		ae_errorreturn= sharedobjectcreatepbsessionerror!
				
	Case "sharedobjectexistserror"
		ae_errorreturn= sharedobjectexistserror!
				
	Case "sharedobjectnotexistserror"
		ae_errorreturn= sharedobjectnotexistserror!
				
	Case "sourcepblerror"
		ae_errorreturn= sourcepblerror!
				
	Case "success"
		ae_errorreturn= success!
				
	Case "tracegeneralerror"
		ae_errorreturn= tracegeneralerror!
				
	Case "tracenomorenodes"
		ae_errorreturn= tracenomorenodes!
				
	Case "tracenotstartederror!"
		ae_errorreturn= tracenotstartederror!
				
	Case "tracestartederror"
		ae_errorreturn= tracestartederror!

	Case else
		//Invalid String value
		Return -1				
End Choose

// Conversion done
Return 1
end function

public function string of_string (errorreturn ae_errorreturn);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_errorreturn	The errorreturn value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the accessible role value.
//						If ae_errorreturnis NULL, the function returns NULL.
//						If ae_errorreturnis Invalid, the function returns '!'.
//
//	Description:	Converts the accessible role enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_errorreturn) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_errorreturn

	Case enterpriseonlyfeature!
		Return "enterpriseonlyfeature"

	Case eventnotexisterror!
		Return "eventnotexisterror"

	Case eventwrongprototypeerror!
		Return "eventwrongprototypeerror"

	Case featurenotsupportederror!
		Return "borderrole"

	Case featurenotsupportederror!
		Return "buttondropdowngridrole"

	Case filealreadyopenerror!
		Return "filealreadyopenerror"

	Case filecloseerror!
		Return "filecloseerror"
		
	Case fileinvalidformaterror!
		Return "fileinvalidformaterror"
		
	Case filenotopenerror!
		Return "filenotopenerror!"
		
	Case filenotseterror!
		Return "filenotseterror"
		
	Case fileopenerror!
		Return "fileopenerror"
		
	Case filereaderror!
		Return "filereaderror"
		
	Case filewriteerror!
		Return "filewriteerror"
		
	Case modelexistserror!
		Return "modelexistserror"
		
	Case modelnotexistserror!
		Return "modelnotexistserror"
		
	Case mutexcreateerror!
		Return "mutexcreateerror"
		
	Case sharedobjectcreateinstanceerror!
		Return "sharedobjectcreateinstanceerror"
		
	Case sharedobjectcreatepbsessionerror!
		Return "sharedobjectcreatepbsessionerror"
		
	Case sharedobjectexistserror!
		Return "sharedobjectexistserror"
		
	Case sharedobjectnotexistserror!
		Return "sharedobjectnotexistserror"
		
	Case success!
		Return "success"
		
	Case tracegeneralerror!
		Return "tracegeneralerror"
		
	Case tracenomorenodes!
		Return "tracenomorenodes"
		
	Case tracenotstartederror!
		Return "tracenotstartederror!"
		
	Case tracestartederror!
		Return "tracestartederror"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_dwconflictresolution (string as_source, ref dwconflictresolution ae_dwconflictresolution);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_dwconflictresolution
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to dwconflictresolution datatype value.
//	ae_dwconflictresolution		A dwconflictresolution variable passed by reference which will
//							hold the dwconflictresolution value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a dwconflictresolution data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_dwconflictresolution)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "allowpartialchanges"
		ae_dwconflictresolution = allowpartialchanges!

	Case "failonanyconflict"
		ae_dwconflictresolution = failonanyconflict!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (dwconflictresolution ae_dwconflictresolution);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_dwconflictresolution	The dwconflictresolution value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the dwconflictresolution value.
//						If ae_dwconflictresolution is NULL, the function returns NULL.
//						If ae_dwconflictresolution is Invalid, the function returns '!'.
//
//	Description:	Converts the dwconflictresolution enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_dwconflictresolution) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_dwconflictresolution

	Case allowpartialchanges!
		Return "allowpartialchanges"

	Case failonanyconflict!
		Return "failonanyconflict"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_encoding (string as_source, ref encoding ae_encoding);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_encoding
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to encoding datatype value.
//	ae_encoding		A encoding variable passed by reference which will
//							hold the encoding value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a encoding data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_encoding)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "encodingansi"
		ae_encoding = encodingansi!

	Case "encodingutf16be"
		ae_encoding = encodingutf16be!

	Case "encodingutf16le"
		ae_encoding = encodingutf16le!

	Case "encodingutf8"
		ae_encoding = encodingutf8!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function integer of_fileaccess (string as_source, ref fileaccess ae_fileaccess);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_fileaccess
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to fileaccess datatype value.
//	ae_fileaccess		A fileaccess variable passed by reference which will
//							hold the fileaccess value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a fileaccess data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_fileaccess)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "read"
		ae_fileaccess = read!

	Case "write"
		ae_fileaccess = write!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (fileaccess ae_fileaccess);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_fileaccess	The fileaccess value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the fileaccess value.
//						If ae_fileaccess is NULL, the function returns NULL.
//						If ae_fileaccess is Invalid, the function returns '!'.
//
//	Description:	Converts the fileaccess enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_fileaccess) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_fileaccess

	Case read!
		Return "read"

	Case write!
		Return "write!"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_filemode (string as_source, ref filemode ae_filemode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_filemode
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to filemode datatype value.
//	ae_filemode		A filemode variable passed by reference which will
//							hold the filemode value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a filemode data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_filemode)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "linemode"
		ae_filemode = linemode!

	Case "streammode"
		ae_filemode = streammode!

	Case "textmode"
		ae_filemode = textmode!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (filemode ae_filemode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_filemode	The filemode value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the filemode value.
//						If ae_filemode is NULL, the function returns NULL.
//						If ae_filemode is Invalid, the function returns '!'.
//
//	Description:	Converts the filemode enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_filemode) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_filemode

	Case linemode!
		Return "linemode"

	Case streammode!
		Return "streammode"

	Case textmode!
		Return "textmode"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_filetype (string as_source, ref filetype ae_filetype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_filetype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to filetype datatype value.
//	ae_filetype		A filetype variable passed by reference which will
//							hold the filetype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a filetype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_filetype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "filetypedoc"
		ae_filetype = filetypedoc!

	Case "filetypehtml"
		ae_filetype = filetypehtml!

	Case "filetypepdf"
		ae_filetype = filetypepdf!

	Case "filetyperichtext"
		ae_filetype = filetyperichtext!

	Case "filetypetext"
		ae_filetype = filetypetext!
		
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (filetype ae_filetype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_filetype	The filetype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the filetype value.
//						If ae_filetype is NULL, the function returns NULL.
//						If ae_filetype is Invalid, the function returns '!'.
//
//	Description:	Converts the filetype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_filetype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_filetype

	Case filetypedoc!
		Return "filetypedoc"

	Case filetypehtml!
		Return "filetypehtml"

	Case filetypepdf!
		Return "filetypepdf"
	
	Case filetyperichtext!
		Return "filetyperichtext"

	Case filetypetext!
		Return "filetypetext"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_filelock (string as_source, ref filelock ae_filelock);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_filelock
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to filelock datatype value.
//	ae_filelock		A filelock variable passed by reference which will
//							hold the filelock value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a filelock data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_filelock)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "lockread"
		ae_filelock = lockread!

	Case "lockreadwrite"
		ae_filelock = lockreadwrite!

	Case "lockwrite"
		ae_filelock = lockwrite!

	Case "shared"
		ae_filelock = shared!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (filelock ae_filelock);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_filelock	The filelock value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the filelock value.
//						If ae_filelock is NULL, the function returns NULL.
//						If ae_filelock is Invalid, the function returns '!'.
//
//	Description:	Converts the filelock enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_filelock) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_filelock

	Case lockread!
		Return "lockread"

	Case lockreadwrite!
		Return "lockreadwrite"

	Case lockwrite!
		Return "lockwrite"
	
	Case shared!
		Return "shared"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_exceptionaction (string as_source, ref exceptionaction ae_exceptionaction);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_exceptionaction
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to exceptionaction datatype value.
//	ae_exceptionaction		A exceptionaction variable passed by reference which will
//							hold the exceptionaction value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a exceptionaction data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_exceptionaction)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "exceptionfail"
		ae_exceptionaction = exceptionfail!

	Case "exceptionignore"
		ae_exceptionaction = exceptionignore!

	Case "exceptionretry"
		ae_exceptionaction = exceptionretry!

	Case "exceptionsubstitutereturnvalue"
		ae_exceptionaction = exceptionsubstitutereturnvalue!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (exceptionaction ae_exceptionaction);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_exceptionaction	The exceptionaction value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the exceptionaction value.
//						If ae_exceptionaction is NULL, the function returns NULL.
//						If ae_exceptionaction is Invalid, the function returns '!'.
//
//	Description:	Converts the exceptionaction enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_exceptionaction) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_exceptionaction

	Case exceptionfail!
		Return "exceptionfail"

	Case exceptionignore!
		Return "exceptionignore"

	Case exceptionretry!
		Return "exceptionretry"
	
	Case exceptionsubstitutereturnvalue!
		Return "exceptionsubstitutereturnvalue"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_fillpattern (string as_source, ref fillpattern ae_fillpattern);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_fillpattern
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to fillpattern datatype value.
//	ae_fillpattern		A fillpattern variable passed by reference which will
//							hold the fillpattern value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a fillpattern data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_fillpattern)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "bdiagonal"
		ae_fillpattern = bdiagonal!

	Case "diamond"
		ae_fillpattern = diamond!

	Case "fdiagonal"
		ae_fillpattern = fdiagonal!

	Case "horizontal"
		ae_fillpattern = horizontal!
	
	Case "solid"
		ae_fillpattern = solid!

	Case "square"
		ae_fillpattern = square!

	Case "vertical"
		ae_fillpattern = vertical!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (fillpattern ae_fillpattern);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_fillpattern	The fillpattern value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the fillpattern value.
//						If ae_fillpattern is NULL, the function returns NULL.
//						If ae_fillpattern is Invalid, the function returns '!'.
//
//	Description:	Converts the fillpattern enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_fillpattern) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_fillpattern

	Case bdiagonal!
		Return "bdiagonal"

	Case diamond!
		Return "diamond"

	Case fdiagonal!
		Return "fdiagonal"
	
	Case horizontal!
		Return "horizontal"

	Case solid!
		Return "solid"

	Case square!
		Return "square"
	
	Case vertical!
		Return "vertical"		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_flowdirection (string as_source, ref flowdirection ae_flowdirection);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_flowdirection
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to flowdirection datatype value.
//	ae_flowdirection		A flowdirection variable passed by reference which will
//							hold the flowdirection value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a flowdirection data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_flowdirection)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "lefttoright"
		ae_flowdirection = lefttoright!

	Case "righttoleft"
		ae_flowdirection = righttoleft!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (flowdirection ae_flowdirection);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_flowdirection	The flowdirection value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the flowdirection value.
//						If ae_flowdirection is NULL, the function returns NULL.
//						If ae_flowdirection is Invalid, the function returns '!'.
//
//	Description:	Converts the flowdirection enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_flowdirection) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_flowdirection

	Case lefttoright!
		Return "lefttoright"

	Case righttoleft!
		Return "righttoleft"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_fontcharset (string as_source, ref fontcharset ae_fontcharset);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_fontcharset
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to fontcharset datatype value.
//	ae_fontcharset	A fontcharset variable passed by reference which will
//							hold the fontcharset value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a fontcharset data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_fontcharset)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String
Choose Case as_source
	Case "ansi"
		ae_fontcharset = ansi!
	
	Case "arabiccharset"
		ae_fontcharset = arabiccharset!
	
	Case "balticcharset"
		ae_fontcharset = balticcharset!

	Case "chinesebig5"	
		ae_fontcharset = chinesebig5!

	Case "defaultcharset"
		ae_fontcharset = defaultcharset!

	Case "easteuropecharset"
		ae_fontcharset = easteuropecharset!
	
	Case "gb2312charset"		
		ae_fontcharset = gb2312charset!
		
	Case "greekcharset"	
		ae_fontcharset = greekcharset!

	Case "hangeul!"		
		ae_fontcharset = hangeul!
	
	Case "hebrewcharset"
		ae_fontcharset = hebrewcharset!

	Case "johabcharset"
		ae_fontcharset = johabcharset!
				
	Case "maccharset"
		ae_fontcharset = maccharset!
		
	Case "oem"
		ae_fontcharset = oem!
				
	Case "russiancharset"
		ae_fontcharset = russiancharset!
				
	Case "shiftjis"
		ae_fontcharset = shiftjis!
				
	Case "symbol"
		ae_fontcharset = symbol!
				
	Case "thaicharset"
		ae_fontcharset = thaicharset!
				
	Case "turkishcharset"
		ae_fontcharset = turkishcharset!
				
	Case "vietnamesecharset"
		ae_fontcharset = vietnamesecharset!

	Case else
		//Invalid String value
		Return -1				
End Choose

// Conversion done
Return 1
end function

public function string of_string (fontcharset ae_fontcharset);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_fontcharset	The accessible role value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the accessible role value.
//						If ae_fontcharset is NULL, the function returns NULL.
//						If ae_fontcharset is Invalid, the function returns '!'.
//
//	Description:	Converts the accessible role enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_fontcharset) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_fontcharset

	Case ansi!
		Return "ansi"

	Case arabiccharset!
		Return "arabiccharset"

	Case balticcharset!
		Return "balticcharset"

	Case chinesebig5!
		Return "chinesebig5"

	Case defaultcharset!
		Return "defaultcharset"

	Case easteuropecharset!
		Return "easteuropecharset"

	Case gb2312charset!
		Return "gb2312charset"
		
	Case greekcharset!
		Return "greekcharset"
		
	Case hangeul!
		Return "hangeul!"
		
	Case hebrewcharset!
		Return "hebrewcharset"
		
	Case johabcharset!
		Return "johabcharset"
		
	Case maccharset!
		Return "maccharset"
		
	Case oem!
		Return "oem"
		
	Case russiancharset!
		Return "russiancharset"
		
	Case shiftjis!
		Return "shiftjis"
		
	Case symbol!
		Return "symbol"
		
	Case thaicharset!
		Return "thaicharset"
		
	Case turkishcharset!
		Return "turkishcharset"
		
	Case vietnamesecharset!
		Return "vietnamesecharset"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_fontfamily (string as_source, ref fontfamily ae_fontfamily);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_fontfamily
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to fontfamily datatype value.
//	ae_fontfamily		A fontfamily variable passed by reference which will
//							hold the fontfamily value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a fontfamily data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_fontfamily)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "anyfont"
		ae_fontfamily = anyfont!

	Case "decorative"
		ae_fontfamily = decorative!

	Case "modern"
		ae_fontfamily = modern!

	Case "roman"
		ae_fontfamily = roman!
	
	Case "script"
		ae_fontfamily = script!

	Case "swiss"
		ae_fontfamily = swiss!
		
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (fontfamily ae_fontfamily);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_fontfamily	The fontfamily value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the fontfamily value.
//						If ae_fontfamily is NULL, the function returns NULL.
//						If ae_fontfamily is Invalid, the function returns '!'.
//
//	Description:	Converts the fontfamily enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_fontfamily) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_fontfamily

	Case anyfont!
		Return "anyfont"

	Case decorative!
		Return "decorative"

	Case modern!
		Return "modern"
	
	Case roman!
		Return "roman"
		
	Case script!
		Return "script"
	
	Case swiss!
		Return "swiss"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_fontpitch (string as_source, ref fontpitch ae_fontpitch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_fontpitch
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to fontpitch datatype value.
//	ae_fontpitch		A fontpitch variable passed by reference which will
//							hold the fontpitch value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a fontpitch data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_fontpitch)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "default"
		ae_fontpitch = default!

	Case "fixed"
		ae_fontpitch = fixed!

	Case "variable"
		ae_fontpitch = variable!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (fontpitch ae_fontpitch);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_fontpitch	The fontpitch value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the fontpitch value.
//						If ae_fontpitch is NULL, the function returns NULL.
//						If ae_fontpitch is Invalid, the function returns '!'.
//
//	Description:	Converts the fontpitch enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_fontpitch) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_fontpitch

	Case default!
		Return "default"

	Case fixed!
		Return "fixed"

	Case variable!
		Return "variable"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_graxisdatatype (string as_source, ref graxisdatatype ae_graxisdatatype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_graxisdatatype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to graxisdatatype datatype value.
//	ae_graxisdatatype		A graxisdatatype variable passed by reference which will
//							hold the graxisdatatype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a graxisdatatype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_graxisdatatype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "adtdate"
		ae_graxisdatatype = adtdate!

	Case "adtdatetime"
		ae_graxisdatatype = adtdatetime!

	Case "adtdefault"
		ae_graxisdatatype = adtdefault!

	Case "adtdouble"
		ae_graxisdatatype = adtdouble!
	
	Case "adttext"
		ae_graxisdatatype = adttext!

	Case "adttime"
		ae_graxisdatatype = adttime!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (graxisdatatype ae_graxisdatatype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_graxisdatatype	The graxisdatatype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the graxisdatatype value.
//						If ae_graxisdatatype is NULL, the function returns NULL.
//						If ae_graxisdatatype is Invalid, the function returns '!'.
//
//	Description:	Converts the graxisdatatype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_graxisdatatype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_graxisdatatype

	Case adtdate!
		Return "adtdate"

	Case adtdatetime!
		Return "adtdatetime"

	Case adtdefault!
		Return "adtdefault"
	
	Case adtdouble!
		Return "adtdouble"
		
	Case adttext!
		Return "adttext"
	
	Case adttime!
		Return "adttime"

End Choose

//Invalid parameter value
Return "!"
end function

public function string of_string (grcolortype ae_grcolortype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_grcolortype	The grcolortype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the grcolortype value.
//						If ae_grcolortype is NULL, the function returns NULL.
//						If ae_grcolortype is Invalid, the function returns '!'.
//
//	Description:	Converts the grcolortype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_grcolortype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_grcolortype

	Case background!
		Return "background"

	Case foreground!
		Return "foreground"

	Case linecolor!
		Return "linecolor"
	
	Case shade!
		Return "shade"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_grdatatype (string as_source, ref grdatatype ae_grdatatype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_grdatatype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to grdatatype datatype value.
//	ae_grdatatype		A grdatatype variable passed by reference which will
//							hold the grdatatype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a grdatatype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_grdatatype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "xvalue"
		ae_grdatatype = xvalue!

	Case "yvalue"
		ae_grdatatype = yvalue!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (grdatatype ae_grdatatype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_grdatatype	The grdatatype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the grdatatype value.
//						If ae_grdatatype is NULL, the function returns NULL.
//						If ae_grdatatype is Invalid, the function returns '!'.
//
//	Description:	Converts the grdatatype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_grdatatype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_grdatatype

	Case xvalue!
		Return "xvalue"

	Case yvalue!
		Return "yvalue"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_grcolortype (string as_source, ref grcolortype ae_grcolortype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_grcolortype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to grcolortype datatype value.
//	ae_grcolortype		A grcolortype variable passed by reference which will
//							hold the grcolortype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a grcolortype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_grcolortype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "background"
		ae_grcolortype = background!

	Case "foreground"
		ae_grcolortype = foreground!

	Case "linecolor"
		ae_grcolortype = linecolor!

	Case "shade"
		ae_grcolortype = shade!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function integer of_grgraphtype (string as_source, ref grgraphtype ae_grgraphtype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_grgraphtype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to grgraphtype datatype value.
//	ae_grgraphtype	A grgraphtype variable passed by reference which will
//							hold the grgraphtype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a grgraphtype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_grgraphtype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String
Choose Case as_source
	Case "area3d"
		ae_grgraphtype = area3d!
	
	Case "areagraph"
		ae_grgraphtype = areagraph!
	
	Case "bar3dgraph"
		ae_grgraphtype = bar3dgraph!

	Case "bar3dobjgraph"	
		ae_grgraphtype = bar3dobjgraph!

	Case "bargraph"
		ae_grgraphtype = bargraph!

	Case "barstack3dobjgraph"
		ae_grgraphtype = barstack3dobjgraph!
	
	Case "barstackgraph"		
		ae_grgraphtype = barstackgraph!
		
	Case "col3dgraph"	
		ae_grgraphtype = col3dgraph!

	Case "col3dobjgraph!"		
		ae_grgraphtype = col3dobjgraph!
	
	Case "colgraph"
		ae_grgraphtype = colgraph!

	Case "colstack3dobjgraph"		
		ae_grgraphtype = colstack3dobjgraph!
		
	Case "colstackgraph"
		ae_grgraphtype = colstackgraph!
				
	Case "line3d"
		ae_grgraphtype = line3d!
				
	Case "linegraph"
		ae_grgraphtype = linegraph!
		
	Case "pie3d"
		ae_grgraphtype = pie3d!
				
	Case "piegraph"
		ae_grgraphtype = piegraph!
				
	Case "scattergraph"
		ae_grgraphtype = scattergraph!
				
	Case else
		//Invalid String value
		Return -1				
End Choose

// Conversion done
Return 1
end function

public function string of_string (grgraphtype ae_grgraphtype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_grgraphtype	The accessible role value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the accessible role value.
//						If ae_grgraphtype is NULL, the function returns NULL.
//						If ae_grgraphtype is Invalid, the function returns '!'.
//
//	Description:	Converts the accessible role enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_grgraphtype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_grgraphtype

		Case area3d!
		Return "area3d" 
	
	Case areagraph!
		Return "areagraph" 
	
	Case bar3dgraph!
		Return "bar3dgraph" 

	Case bar3dobjgraph!
		Return "bar3dobjgraph"	 

	Case bargraph!
		Return "bargraph" 

	Case barstack3dobjgraph!
		Return "barstack3dobjgraph" 
	
	Case barstackgraph!
		Return "barstackgraph"		 
		
	Case col3dgraph!
		Return "col3dgraph"	 

	Case col3dobjgraph!
		Return "col3dobjgraph!"		 
	
	Case colgraph!
		Return "colgraph" 

	Case colstack3dobjgraph!
		Return "colstack3dobjgraph"		 
		
	Case colstackgraph!
		Return "colstackgraph" 
				
	Case line3d!
		Return "line3d" 
				
	Case linegraph!
		Return "linegraph" 
		
	Case pie3d!
		Return "pie3d" 
				
	Case piegraph!
		Return "piegraph" 
				
	Case scattergraph!
		Return "scattergraph" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_grlegendtype (string as_source, ref grlegendtype ae_grlegendtype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_grlegendtype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to grlegendtype datatype value.
//	ae_grlegendtype		A grlegendtype variable passed by reference which will
//							hold the grlegendtype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a grlegendtype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_grlegendtype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "atbottom"
		ae_grlegendtype = atbottom!

	Case "atleft"
		ae_grlegendtype = atleft!

	Case "atright"
		ae_grlegendtype = atright!

	Case "attop"
		ae_grlegendtype = attop!
	
	Case "nolegend"
		ae_grlegendtype = nolegend!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (grlegendtype ae_grlegendtype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_grlegendtype	The grlegendtype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the grlegendtype value.
//						If ae_grlegendtype is NULL, the function returns NULL.
//						If ae_grlegendtype is Invalid, the function returns '!'.
//
//	Description:	Converts the grlegendtype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_grlegendtype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_grlegendtype

	Case atbottom!
		Return "atbottom" 

	Case atleft!
		Return "atleft" 

	Case atright!
		Return "atright" 

	Case attop!
		Return "attop" 
	
	Case nolegend!
		Return "nolegend" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_grobjecttype (string as_source, ref grobjecttype ae_grobjecttype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_grobjecttype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to grobjecttype datatype value.
//	ae_grobjecttype	A grobjecttype variable passed by reference which will
//							hold the grobjecttype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a grobjecttype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_grobjecttype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String
Choose Case as_source
	Case "typecategory"
		ae_grobjecttype = typecategory!
	
	Case "typecategoryaxis"
		ae_grobjecttype = typecategoryaxis!
	
	Case "typecategorylabel"
		ae_grobjecttype = typecategorylabel!

	Case "typedata"	
		ae_grobjecttype = typedata!

	Case "typegraph"
		ae_grobjecttype = typegraph!

	Case "typelegend"
		ae_grobjecttype = typelegend!
	
	Case "typeseries"		
		ae_grobjecttype = typeseries!
		
	Case "typeseriesaxis"	
		ae_grobjecttype = typeseriesaxis!

	Case "typeserieslabel!"		
		ae_grobjecttype = typeserieslabel!
	
	Case "typetitle"
		ae_grobjecttype = typetitle!

	Case "typevalueaxis"		
		ae_grobjecttype = typevalueaxis!
		
	Case "typevaluelabel"
		ae_grobjecttype = typevaluelabel!
				
	Case else
		//Invalid String value
		Return -1				
End Choose

// Conversion done
Return 1
end function

public function string of_string (grobjecttype ae_grobjecttype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_grobjecttype	The accessible role value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the accessible role value.
//						If ae_grobjecttype is NULL, the function returns NULL.
//						If ae_grobjecttype is Invalid, the function returns '!'.
//
//	Description:	Converts the accessible role enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_grobjecttype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_grobjecttype

	Case typecategory!
		Return "typecategory" 
	
	Case typecategoryaxis!
		Return "typecategoryaxis" 
	
	Case typecategorylabel!
		Return "typecategorylabel" 

	Case typedata!
		Return "typedata"	 

	Case typegraph!
		Return "typegraph" 

	Case typelegend!
		Return "typelegend" 
	
	Case typeseries!
		Return "typeseries"		 
		
	Case typeseriesaxis!
		Return "typeseriesaxis"	 

	Case typeserieslabel!
		Return "typeserieslabel!"		 
	
	Case typetitle!
		Return "typetitle" 

	Case typevalueaxis!
		Return "typevalueaxis"		 
		
	Case typevaluelabel!
		Return "typevaluelabel" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_grresettype (string as_source, ref grresettype ae_grresettype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_grresettype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to grresettype datatype value.
//	ae_grresettype		A grresettype variable passed by reference which will
//							hold the grresettype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a grresettype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_grresettype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "all"
		ae_grresettype = all!

	Case "category"
		ae_grresettype = category!

	Case "data"
		ae_grresettype = data!

	Case "series"
		ae_grresettype = series!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function integer of_grroundtotype (string as_source, ref grroundtotype ae_grroundtotype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_grroundtotype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to grroundtotype datatype value.
//	ae_grroundtotype		A grroundtotype variable passed by reference which will
//							hold the grroundtotype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a grroundtotype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_grroundtotype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "rnddays"
		ae_grroundtotype = rnddays!

	Case "rnddefault"
		ae_grroundtotype = rnddefault!

	Case "rndhours"
		ae_grroundtotype = rndhours!

	Case "rndmicroseconds"
		ae_grroundtotype = rndmicroseconds!
	
	Case "rndminutes"
		ae_grroundtotype = rndminutes!

	Case "rndmonths"
		ae_grroundtotype = rndmonths!

	Case "rndnumber"
		ae_grroundtotype = rndnumber!

	Case "rndseconds"
		ae_grroundtotype = rndseconds!

	Case "rndyears"
		ae_grroundtotype = rndyears!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (grresettype ae_grresettype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_grresettype	The grresettype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the grresettype value.
//						If ae_grresettype is NULL, the function returns NULL.
//						If ae_grresettype is Invalid, the function returns '!'.
//
//	Description:	Converts the grresettype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_grresettype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_grresettype

	Case all!
		Return "all" 

	Case category!
		Return "category" 

	Case data!
		Return "data" 

	Case series!
		Return "series" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function string of_string (grroundtotype ae_grroundtotype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_grroundtotype	The grroundtotype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the grroundtotype value.
//						If ae_grroundtotype is NULL, the function returns NULL.
//						If ae_grroundtotype is Invalid, the function returns '!'.
//
//	Description:	Converts the grroundtotype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_grroundtotype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_grroundtotype

	Case rnddays!
		Return "rnddays" 

	Case rnddefault!
		Return "rnddefault" 

	Case rndhours!
		Return "rndhours" 

	Case rndmicroseconds!
		Return "rndmicroseconds" 
	
	Case rndminutes!
		Return "rndminutes" 

	Case rndmonths!
		Return "rndmonths" 

	Case rndnumber!
		Return "rndnumber" 

	Case rndseconds!
		Return "rndseconds" 

	Case rndyears!
		Return "rndyears" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_grscaletype (string as_source, ref grscaletype ae_grscaletype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_grscaletype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to grscaletype datatype value.
//	ae_grscaletype		A grscaletype variable passed by reference which will
//							hold the grscaletype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a grscaletype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_grscaletype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "linear"
		ae_grscaletype = linear!

	Case "log10"
		ae_grscaletype = log10!

	Case "loge"
		ae_grscaletype = loge!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function integer of_grscalevalue (string as_source, ref grscalevalue ae_grscalevalue);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_grscalevalue
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to grscalevalue datatype value.
//	ae_grscalevalue		A grscalevalue variable passed by reference which will
//							hold the grscalevalue value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a grscalevalue data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_grscalevalue)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "actual"
		ae_grscalevalue = actual!

	Case "cumulative"
		ae_grscalevalue = cumulative!

	Case "cumulativepercent"
		ae_grscalevalue = cumulativepercent!

	Case "percentage"
		ae_grscalevalue = percentage!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (grscalevalue ae_grscalevalue);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_grscalevalue	The grscalevalue value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the grscalevalue value.
//						If ae_grscalevalue is NULL, the function returns NULL.
//						If ae_grscalevalue is Invalid, the function returns '!'.
//
//	Description:	Converts the grscalevalue enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_grscalevalue) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_grscalevalue

	Case actual!
		Return "actual" 

	Case cumulative!
		Return "cumulative" 

	Case cumulativepercent!
		Return "cumulativepercent" 

	Case percentage!
		Return "percentage" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function string of_string (grscaletype ae_grscaletype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_grscaletype	The grscaletype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the grscaletype value.
//						If ae_grscaletype is NULL, the function returns NULL.
//						If ae_grscaletype is Invalid, the function returns '!'.
//
//	Description:	Converts the grscaletype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_grscaletype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_grscaletype

	Case linear!
		Return "linear" 

	Case log10!
		Return "log10" 

	Case loge!
		Return "loge" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_grsorttype (string as_source, ref grsorttype ae_grsorttype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_grsorttype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to grsorttype datatype value.
//	ae_grsorttype		A grsorttype variable passed by reference which will
//							hold the grsorttype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a grsorttype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_grsorttype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "ascending"
		ae_grsorttype = ascending!

	Case "descending"
		ae_grsorttype = descending!

	Case "unsorted"
		ae_grsorttype = unsorted!

	Case "userdefinedsort"
		ae_grsorttype = userdefinedsort!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (grsorttype ae_grsorttype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_grsorttype	The grsorttype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the grsorttype value.
//						If ae_grsorttype is NULL, the function returns NULL.
//						If ae_grsorttype is Invalid, the function returns '!'.
//
//	Description:	Converts the grsorttype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_grsorttype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_grsorttype

	Case ascending!
		Return "ascending" 

	Case descending!
		Return "descending" 

	Case unsorted!
		Return "unsorted" 

	Case userdefinedsort!
		Return "userdefinedsort" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_grsymboltype (string as_source, ref grsymboltype ae_grsymboltype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_grsymboltype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to grsymboltype datatype value.
//	ae_grsymboltype		A grsymboltype variable passed by reference which will
//							hold the grsymboltype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a grsymboltype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_grsymboltype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "nosymbol"
		ae_grsymboltype = nosymbol!

	Case "symbolhollowbox"
		ae_grsymboltype = symbolhollowbox!

	Case "symbolhollowcircle"
		ae_grsymboltype = symbolhollowcircle!

	Case "symbolhollowdiamond"
		ae_grsymboltype = symbolhollowdiamond!

	Case "symbolhollowdownarrow"
		ae_grsymboltype = symbolhollowdownarrow!

	Case "symbolhollowuparrow"
		ae_grsymboltype = symbolhollowuparrow!

	Case "symbolplus"
		ae_grsymboltype = symbolplus!

	Case "symbolsolidbox"
		ae_grsymboltype = symbolsolidbox!
		
	Case "symbolsolidcircle"
		ae_grsymboltype = symbolsolidcircle!

	Case "symbolsoliddiamond"
		ae_grsymboltype = symbolsoliddiamond!

	Case "symbolsoliddownarrow"
		ae_grsymboltype = symbolsoliddownarrow!

	Case "symbolsoliduparrow"
		ae_grsymboltype = symbolsoliduparrow!

	Case "symbolstar"
		ae_grsymboltype = symbolstar!

	Case "symbolx"
		ae_grsymboltype = symbolx!
				
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (grsymboltype ae_grsymboltype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_grsymboltype	The grsymboltype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the grsymboltype value.
//						If ae_grsymboltype is NULL, the function returns NULL.
//						If ae_grsymboltype is Invalid, the function returns '!'.
//
//	Description:	Converts the grsymboltype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_grsymboltype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_grsymboltype

	Case nosymbol!
		Return "nosymbol" 

	Case symbolhollowbox!
		Return "symbolhollowbox" 

	Case symbolhollowcircle!
		Return "symbolhollowcircle" 

	Case symbolhollowdiamond!
		Return "symbolhollowdiamond" 

	Case symbolhollowdownarrow!
		Return "symbolhollowdownarrow" 

	Case symbolhollowuparrow!
		Return "symbolhollowuparrow" 

	Case symbolplus!
		Return "symbolplus" 

	Case symbolsolidbox!
		Return "symbolsolidbox" 
		
	Case symbolsolidcircle!
		Return "symbolsolidcircle" 

	Case symbolsoliddiamond!
		Return "symbolsoliddiamond" 

	Case symbolsoliddownarrow!
		Return "symbolsoliddownarrow" 

	Case symbolsoliduparrow!
		Return "symbolsoliduparrow" 

	Case symbolstar!
		Return "symbolstar" 

	Case symbolx!
		Return "symbolx" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_grtictype (string as_source, ref grtictype ae_grtictype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_grtictype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to grtictype datatype value.
//	ae_grtictype		A grtictype variable passed by reference which will
//							hold the grtictype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a grtictype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_grtictype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "inside"
		ae_grtictype = inside!

	Case "notic"
		ae_grtictype = notic!

	Case "outside"
		ae_grtictype = outside!

	Case "straddle"
		ae_grtictype = straddle!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (grtictype ae_grtictype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_grtictype	The grtictype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the grtictype value.
//						If ae_grtictype is NULL, the function returns NULL.
//						If ae_grtictype is Invalid, the function returns '!'.
//
//	Description:	Converts the grtictype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_grtictype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_grtictype

	Case inside!
		Return "inside" 

	Case notic!
		Return "notic" 

	Case outside!
		Return "outside" 

	Case straddle!
		Return "straddle" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_helpcommand (string as_source, ref helpcommand ae_helpcommand);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_helpcommand
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to helpcommand datatype value.
//	ae_helpcommand		A helpcommand variable passed by reference which will
//							hold the helpcommand value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a helpcommand data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_helpcommand)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "finder"
		ae_helpcommand = finder!

	Case "index"
		ae_helpcommand = index!

	Case "keyword"
		ae_helpcommand = keyword!

	Case "topic"
		ae_helpcommand = topic!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (helpcommand ae_helpcommand);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_helpcommand	The helpcommand value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the helpcommand value.
//						If ae_helpcommand is NULL, the function returns NULL.
//						If ae_helpcommand is Invalid, the function returns '!'.
//
//	Description:	Converts the helpcommand enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_helpcommand) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_helpcommand

	Case finder!
		Return "finder" 

	Case index!
		Return "index" 

	Case keyword!
		Return "keyword" 

	Case topic!
		Return "topic" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_htickmarks (string as_source, ref htickmarks ae_htickmarks);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_htickmarks
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to htickmarks datatype value.
//	ae_htickmarks		A htickmarks variable passed by reference which will
//							hold the htickmarks value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a htickmarks data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_htickmarks)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "hticksonboth"
		ae_htickmarks = hticksonboth!

	Case "hticksonbottom"
		ae_htickmarks = hticksonbottom!

	Case "hticksonneither"
		ae_htickmarks = hticksonneither!

	Case "hticksontop"
		ae_htickmarks = hticksontop!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (htickmarks ae_htickmarks);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_htickmarks	The htickmarks value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the htickmarks value.
//						If ae_htickmarks is NULL, the function returns NULL.
//						If ae_htickmarks is Invalid, the function returns '!'.
//
//	Description:	Converts the htickmarks enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_htickmarks) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_htickmarks

	Case hticksonboth!
		Return "hticksonboth" 

	Case hticksonbottom!
		Return "hticksonbottom" 

	Case hticksonneither!
		Return "hticksonneither" 

	Case hticksontop!
		Return "hticksontop" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_inkcollectionmode (string as_source, ref inkcollectionmode ae_inkcollectionmode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_inkcollectionmode
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to inkcollectionmode datatype value.
//	ae_inkcollectionmode		A inkcollectionmode variable passed by reference which will
//							hold the inkcollectionmode value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a inkcollectionmode data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_inkcollectionmode)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "gestureonly"
		ae_inkcollectionmode = gestureonly!

	Case "inkandgesture"
		ae_inkcollectionmode = inkandgesture!

	Case "inkonly"
		ae_inkcollectionmode = inkonly!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (inkcollectionmode ae_inkcollectionmode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_inkcollectionmode	The inkcollectionmode value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the inkcollectionmode value.
//						If ae_inkcollectionmode is NULL, the function returns NULL.
//						If ae_inkcollectionmode is Invalid, the function returns '!'.
//
//	Description:	Converts the inkcollectionmode enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_inkcollectionmode) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_inkcollectionmode

	Case gestureonly!
		Return "gestureonly" 

	Case inkandgesture!
		Return "inkandgesture" 

	Case inkonly!
		Return "inkonly" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_inkcompressionmode (string as_source, ref inkcompressionmode ae_inkcompressionmode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_inkcompressionmode
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to inkcompressionmode datatype value.
//	ae_inkcompressionmode		A inkcompressionmode variable passed by reference which will
//							hold the inkcompressionmode value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a inkcompressionmode data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_inkcompressionmode)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "defaultcompression"
		ae_inkcompressionmode = defaultcompression!

	Case "maximumcompression"
		ae_inkcompressionmode = maximumcompression!

	Case "nocompression"
		ae_inkcompressionmode = nocompression!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (inkcompressionmode ae_inkcompressionmode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_inkcompressionmode	The inkcompressionmode value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the inkcompressionmode value.
//						If ae_inkcompressionmode is NULL, the function returns NULL.
//						If ae_inkcompressionmode is Invalid, the function returns '!'.
//
//	Description:	Converts the inkcompressionmode enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_inkcompressionmode) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_inkcompressionmode

	Case defaultcompression!
		Return "defaultcompression" 

	Case maximumcompression!
		Return "maximumcompression" 

	Case nocompression!
		Return "nocompression" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_inkeditstatus (string as_source, ref inkeditstatus ae_inkeditstatus);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_inkeditstatus
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to inkeditstatus datatype value.
//	ae_inkeditstatus		A inkeditstatus variable passed by reference which will
//							hold the inkeditstatus value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a inkeditstatus data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_inkeditstatus)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "inkeditcollectingink"
		ae_inkeditstatus = inkeditcollectingink!

	Case "inkeditidle"
		ae_inkeditstatus = inkeditidle!

	Case "inkeditrecognizingink"
		ae_inkeditstatus = inkeditrecognizingink!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (inkeditstatus ae_inkeditstatus);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_inkeditstatus	The inkeditstatus value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the inkeditstatus value.
//						If ae_inkeditstatus is NULL, the function returns NULL.
//						If ae_inkeditstatus is Invalid, the function returns '!'.
//
//	Description:	Converts the inkeditstatus enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_inkeditstatus) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_inkeditstatus

	Case inkeditcollectingink!
		Return "inkeditcollectingink" 

	Case inkeditidle!
		Return "inkeditidle" 

	Case inkeditrecognizingink!
		Return "inkeditrecognizingink" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_inkmode (string as_source, ref inkmode ae_inkmode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_inkmode
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to inkmode datatype value.
//	ae_inkmode		A inkmode variable passed by reference which will
//							hold the inkmode value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a inkmode data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_inkmode)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "collectink"
		ae_inkmode = collectink!

	Case "collectinkandgestures"
		ae_inkmode = collectinkandgestures!

	Case "inkdisabled"
		ae_inkmode = inkdisabled!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (inkmode ae_inkmode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_inkmode	The inkmode value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the inkmode value.
//						If ae_inkmode is NULL, the function returns NULL.
//						If ae_inkmode is Invalid, the function returns '!'.
//
//	Description:	Converts the inkmode enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_inkmode) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_inkmode

	Case collectink!
		Return "collectink" 

	Case collectinkandgestures!
		Return "collectinkandgestures" 

	Case inkdisabled!
		Return "inkdisabled" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_inkpentip (string as_source, ref inkpentip ae_inkpentip);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_inkpentip
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to inkpentip datatype value.
//	ae_inkpentip		A inkpentip variable passed by reference which will
//							hold the inkpentip value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a inkpentip data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_inkpentip)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "pentipball"
		ae_inkpentip = pentipball!

	Case "pentiprectangle"
		ae_inkpentip = pentiprectangle!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (inkpentip ae_inkpentip);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_inkpentip	The inkpentip value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the inkpentip value.
//						If ae_inkpentip is NULL, the function returns NULL.
//						If ae_inkpentip is Invalid, the function returns '!'.
//
//	Description:	Converts the inkpentip enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_inkpentip) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_inkpentip

	Case pentipball!
		Return "pentipball" 

	Case pentiprectangle!
		Return "pentiprectangle" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_inkpersistenceformat (string as_source, ref inkpersistenceformat ae_inkpersistenceformat);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_inkpersistenceformat
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to inkpersistenceformat datatype value.
//	ae_inkpersistenceformat		A inkpersistenceformat variable passed by reference which will
//							hold the inkpersistenceformat value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a inkpersistenceformat data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_inkpersistenceformat)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "base64gifformat"
		ae_inkpersistenceformat = base64gifformat!

	Case "base64inkserializedformat"
		ae_inkpersistenceformat = base64inkserializedformat!

	Case "gifformat"
		ae_inkpersistenceformat = gifformat!

	Case "inkserializedformat"
		ae_inkpersistenceformat = inkserializedformat!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (inkpersistenceformat ae_inkpersistenceformat);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_inkpersistenceformat	The inkpersistenceformat value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the inkpersistenceformat value.
//						If ae_inkpersistenceformat is NULL, the function returns NULL.
//						If ae_inkpersistenceformat is Invalid, the function returns '!'.
//
//	Description:	Converts the inkpersistenceformat enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_inkpersistenceformat) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_inkpersistenceformat

	Case base64gifformat!
		Return "base64gifformat" 

	Case base64inkserializedformat!
		Return "base64inkserializedformat" 

	Case gifformat!
		Return "gifformat" 

	Case inkserializedformat!
		Return "inkserializedformat" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_inkpiceditmode (string as_source, ref inkpiceditmode ae_inkpiceditmode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_inkpiceditmode
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to inkpiceditmode datatype value.
//	ae_inkpiceditmode		A inkpiceditmode variable passed by reference which will
//							hold the inkpiceditmode value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a inkpiceditmode data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_inkpiceditmode)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "inkpicdeletemode"
		ae_inkpiceditmode = inkpicdeletemode!

	Case "inkpicinkmode"
		ae_inkpiceditmode = inkpicinkmode!

	Case "inkpicselectmode"
		ae_inkpiceditmode = inkpicselectmode!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (inkpiceditmode ae_inkpiceditmode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_inkpiceditmode	The inkpiceditmode value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the inkpiceditmode value.
//						If ae_inkpiceditmode is NULL, the function returns NULL.
//						If ae_inkpiceditmode is Invalid, the function returns '!'.
//
//	Description:	Converts the inkpiceditmode enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_inkpiceditmode) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_inkpiceditmode

	Case inkpicdeletemode!
		Return "inkpicdeletemode" 

	Case inkpicinkmode!
		Return "inkpicinkmode" 

	Case inkpicselectmode!
		Return "inkpicselectmode" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_inkpicstatus (string as_source, ref inkpicstatus ae_inkpicstatus);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_inkpicstatus
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to inkpicstatus datatype value.
//	ae_inkpicstatus		A inkpicstatus variable passed by reference which will
//							hold the inkpicstatus value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a inkpicstatus data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_inkpicstatus)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "inkpiccollectingink"
		ae_inkpicstatus = inkpiccollectingink!

	Case "inkpicidle"
		ae_inkpicstatus = inkpicidle!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (inkpicstatus ae_inkpicstatus);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_inkpicstatus	The inkpicstatus value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the inkpicstatus value.
//						If ae_inkpicstatus is NULL, the function returns NULL.
//						If ae_inkpicstatus is Invalid, the function returns '!'.
//
//	Description:	Converts the inkpicstatus enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_inkpicstatus) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_inkpicstatus

	Case inkpiccollectingink!
		Return "inkpiccollectingink" 

	Case inkpicidle!
		Return "inkpicidle" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_languageid (string as_source, ref languageid ae_languageid);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_languageid
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to languageid datatype value.
//	ae_languageid		A languageid variable passed by reference which will
//							hold the languageid value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a languageid data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_languageid)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

		Case "languageafrikaans"
			ae_languageid = languageafrikaans!
		
		Case "languagealbanian"
			ae_languageid = languagealbanian!
		
		Case "languagearabicalgeria"
			ae_languageid = languagearabicalgeria!
		
		Case "languagearabicbahrain"
			ae_languageid = languagearabicbahrain!
		
		Case "languagearabicegypt"
			ae_languageid = languagearabicegypt!
		
		Case "languagearabiciraq"
			ae_languageid = languagearabiciraq!
		
		Case "languagearabicjordan"
			ae_languageid = languagearabicjordan!
		
		Case "languagearabickuwait"
			ae_languageid = languagearabickuwait!
		
		Case "languagearabiclebanon"
			ae_languageid = languagearabiclebanon!
		
		Case "languagearabiclibya"
			ae_languageid = languagearabiclibya!
		
		Case "languagearabicmorocco"
			ae_languageid = languagearabicmorocco!
		
		Case "languagearabicoman"
			ae_languageid = languagearabicoman!
		
		Case "languagearabicqatar"
			ae_languageid = languagearabicqatar!
		
		Case "languagearabicsaudiarabia"
			ae_languageid = languagearabicsaudiarabia!
		
		Case "languagearabicsyria"
			ae_languageid = languagearabicsyria!
		
		Case "languagearabictunisia"
			ae_languageid = languagearabictunisia!
		
		Case "languagearabicuae"
			ae_languageid = languagearabicuae!
		
		Case "languagearabicyemen"
			ae_languageid = languagearabicyemen!
		
		Case "languagebasque"
			ae_languageid = languagebasque!
		
		Case "languagebulgarian"
			ae_languageid = languagebulgarian!
		
		Case "languagebyelorussian"
			ae_languageid = languagebyelorussian!
		
		Case "languagecatalan"
			ae_languageid = languagecatalan!
		
		Case "languagechinese"
			ae_languageid = languagechinese!
		
		Case "languagechinesehongkong"
			ae_languageid = languagechinesehongkong!
		
		Case "languagechinesesimplified"
			ae_languageid = languagechinesesimplified!
		
		Case "languagechinesesingapore"
			ae_languageid = languagechinesesingapore!
		
		Case "languagechinesetraditional"
			ae_languageid = languagechinesetraditional!
		
		Case "languagecroatian"
			ae_languageid = languagecroatian!
		
		Case "languageczech"
			ae_languageid = languageczech!
		
		Case "languagedanish"
			ae_languageid = languagedanish!
		
		Case "languagedutch"
			ae_languageid = languagedutch!
		
		Case "languagedutchbelgian"
			ae_languageid = languagedutchbelgian!
		
		Case "languagedutchneutral"
			ae_languageid = languagedutchneutral!
		
		Case "languageenglish"
			ae_languageid = languageenglish!
		
		Case "languageenglishaustralian"
			ae_languageid = languageenglishaustralian!
		
		Case "languageenglishcanadian"
			ae_languageid = languageenglishcanadian!
		
		Case "languageenglishirish"
			ae_languageid = languageenglishirish!
		
		Case "languageenglishnewzealand"
			ae_languageid = languageenglishnewzealand!
		
		Case "languageenglishsouthafrica"
			ae_languageid = languageenglishsouthafrica!
		
		Case "languageenglishuk"
			ae_languageid = languageenglishuk!
		
		Case "languageenglishus"
			ae_languageid = languageenglishus!
		
		Case "languageestonian"
			ae_languageid = languageestonian!
		
		Case "languagefaeroese"
			ae_languageid = languagefaeroese!
		
		Case "languagefarsi"
			ae_languageid = languagefarsi!
		
		Case "languagefinnish"
			ae_languageid = languagefinnish!
		
		Case "languagefrench"
			ae_languageid = languagefrench!
		
		Case "languagefrenchbelgian"
			ae_languageid = languagefrenchbelgian!
		
		Case "languagefrenchcanadian"
			ae_languageid = languagefrenchcanadian!
		
		Case "languagefrenchluxembourg"
			ae_languageid = languagefrenchluxembourg!
		
		Case "languagefrenchneutral"
			ae_languageid = languagefrenchneutral!
		
		Case "languagefrenchswiss"
			ae_languageid = languagefrenchswiss!
		
		Case "languagegerman"
			ae_languageid = languagegerman!
		
		Case "languagegermanaustrian"
			ae_languageid = languagegermanaustrian!
		
		Case "languagegermanliechtenstein"
			ae_languageid = languagegermanliechtenstein!
		
		Case "languagegermanluxembourg"
			ae_languageid = languagegermanluxembourg!
		
		Case "languagegermanneutral"
			ae_languageid = languagegermanneutral!
		
		Case "languagegermanswiss"
			ae_languageid = languagegermanswiss!
		
		Case "languagegreek"
			ae_languageid = languagegreek!
		
		Case "languagehebrew"
			ae_languageid = languagehebrew!
		
		Case "languagehindi"
			ae_languageid = languagehindi!
		
		Case "languagehungarian"
			ae_languageid = languagehungarian!
		
		Case "languageicelandic"
			ae_languageid = languageicelandic!
		
		Case "languageindonesian"
			ae_languageid = languageindonesian!
		
		Case "languageitalian"
			ae_languageid = languageitalian!
		
		Case "languageitalianneutral"
			ae_languageid = languageitalianneutral!
		
		Case "languageitalianswiss"
			ae_languageid = languageitalianswiss!
		
		Case "languagejapanese"
			ae_languageid = languagejapanese!
		
		Case "languagekorean"
			ae_languageid = languagekorean!
		
		Case "languagekoreanjohab"
			ae_languageid = languagekoreanjohab!
		
		Case "languagelatvian"
			ae_languageid = languagelatvian!
		
		Case "languagelithuanian"
			ae_languageid = languagelithuanian!
		
		Case "languagemacedonian"
			ae_languageid = languagemacedonian!
		
		Case "languagemaltese"
			ae_languageid = languagemaltese!
		
		Case "languageneutral"
			ae_languageid = languageneutral!
		
		Case "languagenorwegian"
			ae_languageid = languagenorwegian!
		
		Case "languagenorwegianbokmal"
			ae_languageid = languagenorwegianbokmal!
		
		Case "languagenorwegiannynorsk"
			ae_languageid = languagenorwegiannynorsk!
		
		Case "languagepolish"
			ae_languageid = languagepolish!
		
		Case "languageportuguese"
			ae_languageid = languageportuguese!
		
		Case "languageportuguese_brazilian"
			ae_languageid = languageportuguese_brazilian!
		
		Case "languageportugueseneutral"
			ae_languageid = languageportugueseneutral!
		
		Case "languagerhaetoromanic"
			ae_languageid = languagerhaetoromanic!
		
		Case "languageromanian"
			ae_languageid = languageromanian!
		
		Case "languageromanianmoldavia"
			ae_languageid = languageromanianmoldavia!
		
		Case "languagerussian"
			ae_languageid = languagerussian!
		
		Case "languagerussianmoldavia"
			ae_languageid = languagerussianmoldavia!
		
		Case "languagesami"
			ae_languageid = languagesami!
		
		Case "languageserbian"
			ae_languageid = languageserbian!
		
		Case "languageslovak"
			ae_languageid = languageslovak!
		
		Case "languageslovenian"
			ae_languageid = languageslovenian!
		
		Case "languagesorbian"
			ae_languageid = languagesorbian!
		
		Case "languagespanish"
			ae_languageid = languagespanish!
		
		Case "languagespanishcastilian"
			ae_languageid = languagespanishcastilian!
		
		Case "languagespanishmexican"
			ae_languageid = languagespanishmexican!
		
		Case "languagespanishmodern"
			ae_languageid = languagespanishmodern!
		
		Case "languagesutu"
			ae_languageid = languagesutu!
		
		Case "languageswedish"
			ae_languageid = languageswedish!
		
		Case "languagesystemdefault"
			ae_languageid = languagesystemdefault!
		
		Case "languagethai"
			ae_languageid = languagethai!
		
		Case "languagetsonga"
			ae_languageid = languagetsonga!
		
		Case "languagetswana"
			ae_languageid = languagetswana!
		
		Case "languageturkish"
			ae_languageid = languageturkish!
		
		Case "languageukrainian"
			ae_languageid = languageukrainian!
		
		Case "languageurdu"
			ae_languageid = languageurdu!
		
		Case "languageuserdefault"
			ae_languageid = languageuserdefault!
		
		Case "languagevenda"
			ae_languageid = languagevenda!
		
		Case "languagexhosa"
			ae_languageid = languagexhosa!
		
		Case "languagezulu"
			ae_languageid = languagezulu!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (languageid ae_languageid);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_languageid	The languageid value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the languageid value.
//						If ae_languageid is NULL, the function returns NULL.
//						If ae_languageid is Invalid, the function returns '!'.
//
//	Description:	Converts the languageid enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_languageid) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_languageid

		Case languageafrikaans!
			Return "languageafrikaans" 
		
		Case languagealbanian!
			Return "languagealbanian" 
		
		Case languagearabicalgeria!
			Return "languagearabicalgeria" 
		
		Case languagearabicbahrain!
			Return "languagearabicbahrain" 
		
		Case languagearabicegypt!
			Return "languagearabicegypt" 
		
		Case languagearabiciraq!
			Return "languagearabiciraq" 
		
		Case languagearabicjordan!
			Return "languagearabicjordan" 
		
		Case languagearabickuwait!
			Return "languagearabickuwait" 
		
		Case languagearabiclebanon!
			Return "languagearabiclebanon" 
		
		Case languagearabiclibya!
			Return "languagearabiclibya" 
		
		Case languagearabicmorocco!
			Return "languagearabicmorocco" 
		
		Case languagearabicoman!
			Return "languagearabicoman" 
		
		Case languagearabicqatar!
			Return "languagearabicqatar" 
		
		Case languagearabicsaudiarabia!
			Return "languagearabicsaudiarabia" 
		
		Case languagearabicsyria!
			Return "languagearabicsyria" 
		
		Case languagearabictunisia!
			Return "languagearabictunisia" 
		
		Case languagearabicuae!
			Return "languagearabicuae" 
		
		Case languagearabicyemen!
			Return "languagearabicyemen" 
		
		Case languagebasque!
			Return "languagebasque" 
		
		Case languagebulgarian!
			Return "languagebulgarian" 
		
		Case languagebyelorussian!
			Return "languagebyelorussian" 
		
		Case languagecatalan!
			Return "languagecatalan" 
		
		Case languagechinese!
			Return "languagechinese" 
		
		Case languagechinesehongkong!
			Return "languagechinesehongkong" 
		
		Case languagechinesesimplified!
			Return "languagechinesesimplified" 
		
		Case languagechinesesingapore!
			Return "languagechinesesingapore" 
		
		Case languagechinesetraditional!
			Return "languagechinesetraditional" 
		
		Case languagecroatian!
			Return "languagecroatian" 
		
		Case languageczech!
			Return "languageczech" 
		
		Case languagedanish!
			Return "languagedanish" 
		
		Case languagedutch!
			Return "languagedutch" 
		
		Case languagedutchbelgian!
			Return "languagedutchbelgian" 
		
		Case languagedutchneutral!
			Return "languagedutchneutral" 
		
		Case languageenglish!
			Return "languageenglish" 
		
		Case languageenglishaustralian!
			Return "languageenglishaustralian" 
		
		Case languageenglishcanadian!
			Return "languageenglishcanadian" 
		
		Case languageenglishirish!
			Return "languageenglishirish" 
		
		Case languageenglishnewzealand!
			Return "languageenglishnewzealand" 
		
		Case languageenglishsouthafrica!
			Return "languageenglishsouthafrica" 
		
		Case languageenglishuk!
			Return "languageenglishuk" 
		
		Case languageenglishus!
			Return "languageenglishus" 
		
		Case languageestonian!
			Return "languageestonian" 
		
		Case languagefaeroese!
			Return "languagefaeroese" 
		
		Case languagefarsi!
			Return "languagefarsi" 
		
		Case languagefinnish!
			Return "languagefinnish" 
		
		Case languagefrench!
			Return "languagefrench" 
		
		Case languagefrenchbelgian!
			Return "languagefrenchbelgian" 
		
		Case languagefrenchcanadian!
			Return "languagefrenchcanadian" 
		
		Case languagefrenchluxembourg!
			Return "languagefrenchluxembourg" 
		
		Case languagefrenchneutral!
			Return "languagefrenchneutral" 
		
		Case languagefrenchswiss!
			Return "languagefrenchswiss" 
		
		Case languagegerman!
			Return "languagegerman" 
		
		Case languagegermanaustrian!
			Return "languagegermanaustrian" 
		
		Case languagegermanliechtenstein!
			Return "languagegermanliechtenstein" 
		
		Case languagegermanluxembourg!
			Return "languagegermanluxembourg" 
		
		Case languagegermanneutral!
			Return "languagegermanneutral" 
		
		Case languagegermanswiss!
			Return "languagegermanswiss" 
		
		Case languagegreek!
			Return "languagegreek" 
		
		Case languagehebrew!
			Return "languagehebrew" 
		
		Case languagehindi!
			Return "languagehindi" 
		
		Case languagehungarian!
			Return "languagehungarian" 
		
		Case languageicelandic!
			Return "languageicelandic" 
		
		Case languageindonesian!
			Return "languageindonesian" 
		
		Case languageitalian!
			Return "languageitalian" 
		
		Case languageitalianneutral!
			Return "languageitalianneutral" 
		
		Case languageitalianswiss!
			Return "languageitalianswiss" 
		
		Case languagejapanese!
			Return "languagejapanese" 
		
		Case languagekorean!
			Return "languagekorean" 
		
		Case languagekoreanjohab!
			Return "languagekoreanjohab" 
		
		Case languagelatvian!
			Return "languagelatvian" 
		
		Case languagelithuanian!
			Return "languagelithuanian" 
		
		Case languagemacedonian!
			Return "languagemacedonian" 
		
		Case languagemaltese!
			Return "languagemaltese" 
		
		Case languageneutral!
			Return "languageneutral" 
		
		Case languagenorwegian!
			Return "languagenorwegian" 
		
		Case languagenorwegianbokmal!
			Return "languagenorwegianbokmal" 
		
		Case languagenorwegiannynorsk!
			Return "languagenorwegiannynorsk" 
		
		Case languagepolish!
			Return "languagepolish" 
		
		Case languageportuguese!
			Return "languageportuguese" 
		
		Case languageportuguese_brazilian!
			Return "languageportuguese_brazilian" 
		
		Case languageportugueseneutral!
			Return "languageportugueseneutral" 
		
		Case languagerhaetoromanic!
			Return "languagerhaetoromanic" 
		
		Case languageromanian!
			Return "languageromanian" 
		
		Case languageromanianmoldavia!
			Return "languageromanianmoldavia" 
		
		Case languagerussian!
			Return "languagerussian" 
		
		Case languagerussianmoldavia!
			Return "languagerussianmoldavia" 
		
		Case languagesami!
			Return "languagesami" 
		
		Case languageserbian!
			Return "languageserbian" 
		
		Case languageslovak!
			Return "languageslovak" 
		
		Case languageslovenian!
			Return "languageslovenian" 
		
		Case languagesorbian!
			Return "languagesorbian" 
		
		Case languagespanish!
			Return "languagespanish" 
		
		Case languagespanishcastilian!
			Return "languagespanishcastilian" 
		
		Case languagespanishmexican!
			Return "languagespanishmexican" 
		
		Case languagespanishmodern!
			Return "languagespanishmodern" 
		
		Case languagesutu!
			Return "languagesutu" 
		
		Case languageswedish!
			Return "languageswedish" 
		
		Case languagesystemdefault!
			Return "languagesystemdefault" 
		
		Case languagethai!
			Return "languagethai" 
		
		Case languagetsonga!
			Return "languagetsonga" 
		
		Case languagetswana!
			Return "languagetswana" 
		
		Case languageturkish!
			Return "languageturkish" 
		
		Case languageukrainian!
			Return "languageukrainian" 
		
		Case languageurdu!
			Return "languageurdu" 
		
		Case languageuserdefault!
			Return "languageuserdefault" 
		
		Case languagevenda!
			Return "languagevenda" 
		
		Case languagexhosa!
			Return "languagexhosa" 
		
		Case languagezulu!
			Return "languagezulu" 
	
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_keycode (string as_source, ref keycode ae_keycode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_keycode
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to keycode datatype value.
//	ae_keycode		A keycode variable passed by reference which will
//							hold the keycode value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a keycode data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_keycode)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

		Case "key0"
			ae_keycode = key0! 
		
		Case "key1"
			ae_keycode = key1! 
		
		Case "key2"
			ae_keycode = key2! 
		
		Case "key3"
			ae_keycode = key3! 
		
		Case "key4"
			ae_keycode = key4! 
		
		Case "key5"
			ae_keycode = key5! 
		
		Case "key6"
			ae_keycode = key6! 
		
		Case "key7"
			ae_keycode = key7! 
		
		Case "key8"
			ae_keycode = key8! 
		
		Case "key9"
			ae_keycode = key9! 
		
		Case "keya"
			ae_keycode = keya! 
		
		Case "keyadd"
			ae_keycode = keyadd! 
		
		Case "keyalt"
			ae_keycode = keyalt! 
		
		Case "keyapps"
			ae_keycode = keyapps! 
		
		Case "keyb"
			ae_keycode = keyb! 
		
		Case "keyback"
			ae_keycode = keyback! 
		
		Case "keybackquote"
			ae_keycode = keybackquote! 
		
		Case "keybackslash"
			ae_keycode = keybackslash! 
		
		Case "keyc"
			ae_keycode = keyc! 
		
		Case "keycapslock"
			ae_keycode = keycapslock! 
		
		Case "keycomma"
			ae_keycode = keycomma! 
		
		Case "keycontrol"
			ae_keycode = keycontrol! 
		
		Case "keyd"
			ae_keycode = keyd! 
		
		Case "keydash"
			ae_keycode = keydash! 
		
		Case "keydecimal"
			ae_keycode = keydecimal! 
		
		Case "keydelete"
			ae_keycode = keydelete! 
		
		Case "keydivide"
			ae_keycode = keydivide! 
		
		Case "keydownarrow"
			ae_keycode = keydownarrow! 
		
		Case "keye"
			ae_keycode = keye! 
		
		Case "keyend"
			ae_keycode = keyend! 
		
		Case "keyenter"
			ae_keycode = keyenter! 
		
		Case "keyequal"
			ae_keycode = keyequal! 
		
		Case "keyescape"
			ae_keycode = keyescape! 
		
		Case "keyf"
			ae_keycode = keyf! 
		
		Case "keyf1"
			ae_keycode = keyf1! 
		
		Case "keyf10"
			ae_keycode = keyf10! 
		
		Case "keyf11"
			ae_keycode = keyf11! 
		
		Case "keyf12"
			ae_keycode = keyf12! 
		
		Case "keyf2"
			ae_keycode = keyf2! 
		
		Case "keyf3"
			ae_keycode = keyf3! 
		
		Case "keyf4"
			ae_keycode = keyf4! 
		
		Case "keyf5"
			ae_keycode = keyf5! 
		
		Case "keyf6"
			ae_keycode = keyf6! 
		
		Case "keyf7"
			ae_keycode = keyf7! 
		
		Case "keyf8"
			ae_keycode = keyf8! 
		
		Case "keyf9"
			ae_keycode = keyf9! 
		
		Case "keyg"
			ae_keycode = keyg! 
		
		Case "keyh"
			ae_keycode = keyh! 
		
		Case "keyhome"
			ae_keycode = keyhome! 
		
		Case "keyi"
			ae_keycode = keyi! 
		
		Case "keyinsert"
			ae_keycode = keyinsert! 
		
		Case "keyj"
			ae_keycode = keyj! 
		
		Case "keyk"
			ae_keycode = keyk! 
		
		Case "keyl"
			ae_keycode = keyl! 
		
		Case "keyleftarrow"
			ae_keycode = keyleftarrow! 
		
		Case "keyleftbracket"
			ae_keycode = keyleftbracket! 
		
		Case "keyleftbutton"
			ae_keycode = keyleftbutton! 
		
		Case "keyleftwindows"
			ae_keycode = keyleftwindows! 
		
		Case "keym"
			ae_keycode = keym! 
		
		Case "keymiddlebutton"
			ae_keycode = keymiddlebutton! 
		
		Case "keymultiply"
			ae_keycode = keymultiply! 
		
		Case "keyn"
			ae_keycode = keyn! 
		
		Case "keynull"
			ae_keycode = keynull! 
		
		Case "keynumlock"
			ae_keycode = keynumlock! 
		
		Case "keynumpad0"
			ae_keycode = keynumpad0! 
		
		Case "keynumpad1"
			ae_keycode = keynumpad1! 
		
		Case "keynumpad2"
			ae_keycode = keynumpad2! 
		
		Case "keynumpad3"
			ae_keycode = keynumpad3! 
		
		Case "keynumpad4"
			ae_keycode = keynumpad4! 
		
		Case "keynumpad5"
			ae_keycode = keynumpad5! 
		
		Case "keynumpad6"
			ae_keycode = keynumpad6! 
		
		Case "keynumpad7"
			ae_keycode = keynumpad7! 
		
		Case "keynumpad8"
			ae_keycode = keynumpad8! 
		
		Case "keynumpad9"
			ae_keycode = keynumpad9! 
		
		Case "keyo"
			ae_keycode = keyo! 
		
		Case "keyp"
			ae_keycode = keyp! 
		
		Case "keypagedown"
			ae_keycode = keypagedown! 
		
		Case "keypageup"
			ae_keycode = keypageup! 
		
		Case "keypause"
			ae_keycode = keypause! 
		
		Case "keyperiod"
			ae_keycode = keyperiod! 
		
		Case "keyprintscreen"
			ae_keycode = keyprintscreen! 
		
		Case "keyq"
			ae_keycode = keyq! 
		
		Case "keyquote"
			ae_keycode = keyquote! 
		
		Case "keyr"
			ae_keycode = keyr! 
		
		Case "keyrightarrow"
			ae_keycode = keyrightarrow! 
		
		Case "keyrightbracket"
			ae_keycode = keyrightbracket! 
		
		Case "keyrightbutton"
			ae_keycode = keyrightbutton! 
		
		Case "keyrightwindows"
			ae_keycode = keyrightwindows! 
		
		Case "keys"
			ae_keycode = keys! 
		
		Case "keyscrolllock"
			ae_keycode = keyscrolllock! 
		
		Case "keysemicolon"
			ae_keycode = keysemicolon! 
		
		Case "keyshift"
			ae_keycode = keyshift! 
		
		Case "keyslash"
			ae_keycode = keyslash! 
		
		Case "keyspacebar"
			ae_keycode = keyspacebar! 
		
		Case "keysubtract"
			ae_keycode = keysubtract! 
		
		Case "keyt"
			ae_keycode = keyt! 
		
		Case "keytab"
			ae_keycode = keytab! 
		
		Case "keyu"
			ae_keycode = keyu! 
		
		Case "keyuparrow"
			ae_keycode = keyuparrow! 
		
		Case "keyv"
			ae_keycode = keyv! 
		
		Case "keyw"
			ae_keycode = keyw! 
		
		Case "keyx"
			ae_keycode = keyx! 
		
		Case "keyy"
			ae_keycode = keyy! 
		
		Case "keyz"
			ae_keycode = keyz! 

	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (keycode ae_keycode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_keycode	The keycode value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the keycode value.
//						If ae_keycode is NULL, the function returns NULL.
//						If ae_keycode is Invalid, the function returns '!'.
//
//	Description:	Converts the keycode enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_keycode) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_keycode

		Case key0!
			Return "key0"  
		
		Case key1!
			Return "key1"  
		
		Case key2!
			Return "key2"  
		
		Case key3!
			Return "key3"  
		
		Case key4!
			Return "key4"  
		
		Case key5!
			Return "key5"  
		
		Case key6!
			Return "key6"  
		
		Case key7!
			Return "key7"  
		
		Case key8!
			Return "key8"  
		
		Case key9!
			Return "key9"  
		
		Case keya!
			Return "keya"  
		
		Case keyadd!
			Return "keyadd"  
		
		Case keyalt!
			Return "keyalt"  
		
		Case keyapps!
			Return "keyapps"  
		
		Case keyb!
			Return "keyb"  
		
		Case keyback!
			Return "keyback"  
		
		Case keybackquote!
			Return "keybackquote"  
		
		Case keybackslash!
			Return "keybackslash"  
		
		Case keyc!
			Return "keyc"  
		
		Case keycapslock!
			Return "keycapslock"  
		
		Case keycomma!
			Return "keycomma"  
		
		Case keycontrol!
			Return "keycontrol"  
		
		Case keyd!
			Return "keyd"  
		
		Case keydash!
			Return "keydash"  
		
		Case keydecimal!
			Return "keydecimal"  
		
		Case keydelete!
			Return "keydelete"  
		
		Case keydivide!
			Return "keydivide"  
		
		Case keydownarrow!
			Return "keydownarrow"  
		
		Case keye!
			Return "keye"  
		
		Case keyend!
			Return "keyend"  
		
		Case keyenter!
			Return "keyenter"  
		
		Case keyequal!
			Return "keyequal"  
		
		Case keyescape!
			Return "keyescape"  
		
		Case keyf!
			Return "keyf"  
		
		Case keyf1!
			Return "keyf1"  
		
		Case keyf10!
			Return "keyf10"  
		
		Case keyf11!
			Return "keyf11"  
		
		Case keyf12!
			Return "keyf12"  
		
		Case keyf2!
			Return "keyf2"  
		
		Case keyf3!
			Return "keyf3"  
		
		Case keyf4!
			Return "keyf4"  
		
		Case keyf5!
			Return "keyf5"  
		
		Case keyf6!
			Return "keyf6"  
		
		Case keyf7!
			Return "keyf7"  
		
		Case keyf8!
			Return "keyf8"  
		
		Case keyf9!
			Return "keyf9"  
		
		Case keyg!
			Return "keyg"  
		
		Case keyh!
			Return "keyh"  
		
		Case keyhome!
			Return "keyhome"  
		
		Case keyi!
			Return "keyi"  
		
		Case keyinsert!
			Return "keyinsert"  
		
		Case keyj!
			Return "keyj"  
		
		Case keyk!
			Return "keyk"  
		
		Case keyl!
			Return "keyl"  
		
		Case keyleftarrow!
			Return "keyleftarrow"  
		
		Case keyleftbracket!
			Return "keyleftbracket"  
		
		Case keyleftbutton!
			Return "keyleftbutton"  
		
		Case keyleftwindows!
			Return "keyleftwindows"  
		
		Case keym!
			Return "keym"  
		
		Case keymiddlebutton!
			Return "keymiddlebutton"  
		
		Case keymultiply!
			Return "keymultiply"  
		
		Case keyn!
			Return "keyn"  
		
		Case keynull!
			Return "keynull"  
		
		Case keynumlock!
			Return "keynumlock"  
		
		Case keynumpad0!
			Return "keynumpad0"  
		
		Case keynumpad1!
			Return "keynumpad1"  
		
		Case keynumpad2!
			Return "keynumpad2"  
		
		Case keynumpad3!
			Return "keynumpad3"  
		
		Case keynumpad4!
			Return "keynumpad4"  
		
		Case keynumpad5!
			Return "keynumpad5"  
		
		Case keynumpad6!
			Return "keynumpad6"  
		
		Case keynumpad7!
			Return "keynumpad7"  
		
		Case keynumpad8!
			Return "keynumpad8"  
		
		Case keynumpad9!
			Return "keynumpad9"  
		
		Case keyo!
			Return "keyo"  
		
		Case keyp!
			Return "keyp"  
		
		Case keypagedown!
			Return "keypagedown"  
		
		Case keypageup!
			Return "keypageup"  
		
		Case keypause!
			Return "keypause"  
		
		Case keyperiod!
			Return "keyperiod"  
		
		Case keyprintscreen!
			Return "keyprintscreen"  
		
		Case keyq!
			Return "keyq"  
		
		Case keyquote!
			Return "keyquote"  
		
		Case keyr!
			Return "keyr"  
		
		Case keyrightarrow!
			Return "keyrightarrow"  
		
		Case keyrightbracket!
			Return "keyrightbracket"  
		
		Case keyrightbutton!
			Return "keyrightbutton"  
		
		Case keyrightwindows!
			Return "keyrightwindows"  
		
		Case keys!
			Return "keys"  
		
		Case keyscrolllock!
			Return "keyscrolllock"  
		
		Case keysemicolon!
			Return "keysemicolon"  
		
		Case keyshift!
			Return "keyshift"  
		
		Case keyslash!
			Return "keyslash"  
		
		Case keyspacebar!
			Return "keyspacebar"  
		
		Case keysubtract!
			Return "keysubtract"  
		
		Case keyt!
			Return "keyt"  
		
		Case keytab!
			Return "keytab"  
		
		Case keyu!
			Return "keyu"  
		
		Case keyuparrow!
			Return "keyuparrow"  
		
		Case keyv!
			Return "keyv"  
		
		Case keyw!
			Return "keyw"  
		
		Case keyx!
			Return "keyx"  
		
		Case keyy!
			Return "keyy"  
		
		Case keyz!
			Return "keyz"  

		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_languagesortid (string as_source, ref languagesortid ae_languagesortid);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_languagesortid
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to languagesortid datatype value.
//	ae_languagesortid		A languagesortid variable passed by reference which will
//							hold the languagesortid value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a languagesortid data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_languagesortid)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "languagesortnative"
		ae_languagesortid = languagesortnative!

	Case "languagesortunicode"
		ae_languagesortid = languagesortunicode!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (languagesortid ae_languagesortid);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_languagesortid	The languagesortid value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the languagesortid value.
//						If ae_languagesortid is NULL, the function returns NULL.
//						If ae_languagesortid is Invalid, the function returns '!'.
//
//	Description:	Converts the languagesortid enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_languagesortid) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_languagesortid

	Case languagesortnative!
		Return "languagesortnative" 

	Case languagesortunicode!
		Return "languagesortunicode" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_libdirtype (string as_source, ref libdirtype ae_libdirtype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_libdirtype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to libdirtype datatype value.
//	ae_libdirtype		A libdirtype variable passed by reference which will
//							hold the libdirtype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a libdirtype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_libdirtype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

		Case "dirall"
			ae_libdirtype = dirall! 
		
		Case "dirapplication"
			ae_libdirtype = dirapplication! 
		
		Case "dirdatawindow"
			ae_libdirtype = dirdatawindow! 
		
		Case "dirfunction"
			ae_libdirtype = dirfunction! 
		
		Case "dirmenu"
			ae_libdirtype = dirmenu! 
		
		Case "dirpipeline"
			ae_libdirtype = dirpipeline! 
		
		Case "dirproject"
			ae_libdirtype = dirproject! 
		
		Case "dirquery"
			ae_libdirtype = dirquery! 
		
		Case "dirstructure"
			ae_libdirtype = dirstructure! 
		
		Case "diruserobject"
			ae_libdirtype = diruserobject! 
		
		Case "dirwindow"
			ae_libdirtype = dirwindow! 	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (libdirtype ae_libdirtype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_libdirtype	The libdirtype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the libdirtype value.
//						If ae_libdirtype is NULL, the function returns NULL.
//						If ae_libdirtype is Invalid, the function returns '!'.
//
//	Description:	Converts the libdirtype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_libdirtype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_libdirtype

		Case dirall!
			Return "dirall"  
		
		Case dirapplication!
			Return "dirapplication"  
		
		Case dirdatawindow!
			Return "dirdatawindow"  
		
		Case dirfunction!
			Return "dirfunction"  
		
		Case dirmenu!
			Return "dirmenu"  
		
		Case dirpipeline!
			Return "dirpipeline"  
		
		Case dirproject!
			Return "dirproject"  
		
		Case dirquery!
			Return "dirquery"  
		
		Case dirstructure!
			Return "dirstructure"  
		
		Case diruserobject!
			Return "diruserobject"  
		
		Case dirwindow!
			Return "dirwindow"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_libexporttype (string as_source, ref libexporttype ae_libexporttype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_libexporttype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to libexporttype datatype value.
//	ae_libexporttype		A libexporttype variable passed by reference which will
//							hold the libexporttype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a libexporttype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_libexporttype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

		Case "exportapplication"
			ae_libexporttype = exportapplication! 
		
		Case "exportdatawindow"
			ae_libexporttype = exportdatawindow! 
		
		Case "exportfunction"
			ae_libexporttype = exportfunction! 
		
		Case "exportmenu"
			ae_libexporttype = exportmenu! 
		
		Case "exportpipeline"
			ae_libexporttype = exportpipeline! 
		
		Case "exportproject"
			ae_libexporttype = exportproject! 
		
		Case "exportquery"
			ae_libexporttype = exportquery! 
		
		Case "exportstructure"
			ae_libexporttype = exportstructure! 
		
		Case "exportuserobject"
			ae_libexporttype = exportuserobject! 
		
		Case "exportwindow"
			ae_libexporttype = exportwindow! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (libexporttype ae_libexporttype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_libexporttype	The libexporttype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the libexporttype value.
//						If ae_libexporttype is NULL, the function returns NULL.
//						If ae_libexporttype is Invalid, the function returns '!'.
//
//	Description:	Converts the libexporttype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_libexporttype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_libexporttype 	

		Case exportapplication!
			Return "exportapplication"  
		
		Case exportdatawindow!
			Return "exportdatawindow"  
		
		Case exportfunction!
			Return "exportfunction"  
		
		Case exportmenu!
			Return "exportmenu"  
		
		Case exportpipeline!
			Return "exportpipeline"  
		
		Case exportproject!
			Return "exportproject"  
		
		Case exportquery!
			Return "exportquery"  
		
		Case exportstructure!
			Return "exportstructure"  
		
		Case exportuserobject!
			Return "exportuserobject"  
		
		Case exportwindow!
			Return "exportwindow"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_libimporttype (string as_source, ref libimporttype ae_libimporttype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_libimporttype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to libimporttype datatype value.
//	ae_libimporttype		A libimporttype variable passed by reference which will
//							hold the libimporttype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a libimporttype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_libimporttype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "importdatawindow"
		ae_libimporttype = importdatawindow!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (libimporttype ae_libimporttype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_libimporttype	The libimporttype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the libimporttype value.
//						If ae_libimporttype is NULL, the function returns NULL.
//						If ae_libimporttype is Invalid, the function returns '!'.
//
//	Description:	Converts the libimporttype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_libimporttype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_libimporttype

	Case importdatawindow!
		Return "importdatawindow" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_linestyle (string as_source, ref linestyle ae_linestyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_linestyle
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to linestyle datatype value.
//	ae_linestyle		A linestyle variable passed by reference which will
//							hold the linestyle value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a linestyle data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_linestyle)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

		Case "continuous"
			ae_linestyle = continuous! 
		
		Case "dash"
			ae_linestyle = dash! 
		
		Case "dashdot"
			ae_linestyle = dashdot! 
		
		Case "dashdotdot"
			ae_linestyle = dashdotdot! 
		
		Case "dot"
			ae_linestyle = dot! 
		
		Case "transparent"
			ae_linestyle = transparent! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (linestyle ae_linestyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_linestyle	The linestyle value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the linestyle value.
//						If ae_linestyle is NULL, the function returns NULL.
//						If ae_linestyle is Invalid, the function returns '!'.
//
//	Description:	Converts the linestyle enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_linestyle) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_linestyle

		Case continuous!
			Return "continuous"  
		
		Case dash!
			Return "dash"  
		
		Case dashdot!
			Return "dashdot"  
		
		Case dashdotdot!
			Return "dashdotdot"  
		
		Case dot!
			Return "dot"  
		
		Case transparent!
			Return "transparent"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_listviewview (string as_source, ref listviewview ae_listviewview);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_listviewview
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to listviewview datatype value.
//	ae_listviewview		A listviewview variable passed by reference which will
//							hold the listviewview value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a listviewview data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_listviewview)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

		Case "listviewlargeicon"
			ae_listviewview = listviewlargeicon! 
		
		Case "listviewlist"
			ae_listviewview = listviewlist! 
		
		Case "listviewreport"
			ae_listviewview = listviewreport! 
		
		Case "listviewsmallicon"
			ae_listviewview = listviewsmallicon!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (listviewview ae_listviewview);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_listviewview	The listviewview value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the listviewview value.
//						If ae_listviewview is NULL, the function returns NULL.
//						If ae_listviewview is Invalid, the function returns '!'.
//
//	Description:	Converts the listviewview enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_listviewview) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_listviewview

		Case listviewlargeicon!
			Return "listviewlargeicon"  
		
		Case listviewlist!
			Return "listviewlist"  
		
		Case listviewreport!
			Return "listviewreport"  
		
		Case listviewsmallicon!
			Return "listviewsmallicon" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_location (string as_source, ref location ae_location);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_location
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to location datatype value.
//	ae_location		A location variable passed by reference which will
//							hold the location value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a location data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_location)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

		Case "first"
			ae_location = first! 
		
		Case "last"
			ae_location = last! 
		
		Case "next"
			ae_location = next! 
		
		Case "prior"
			ae_location = prior! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (location ae_location);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_location	The location value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the location value.
//						If ae_location is NULL, the function returns NULL.
//						If ae_location is Invalid, the function returns '!'.
//
//	Description:	Converts the location enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_location) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_location

		Case first!
			Return "first"  
		
		Case last!
			Return "last"  
		
		Case next!
			Return "next"  
		
		Case prior!
			Return "prior"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_mailfiletype (string as_source, ref mailfiletype ae_mailfiletype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_mailfiletype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to mailfiletype datatype value.
//	ae_mailfiletype		A mailfiletype variable passed by reference which will
//							hold the mailfiletype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a mailfiletype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_mailfiletype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

		Case "mailattach"
			ae_mailfiletype = mailattach! 
		
		Case "mailole"
			ae_mailfiletype = mailole! 
		
		Case "mailolestatic"
			ae_mailfiletype = mailolestatic! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (mailfiletype ae_mailfiletype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_mailfiletype	The mailfiletype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the mailfiletype value.
//						If ae_mailfiletype is NULL, the function returns NULL.
//						If ae_mailfiletype is Invalid, the function returns '!'.
//
//	Description:	Converts the mailfiletype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_mailfiletype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_mailfiletype

		Case mailattach!
			Return "mailattach"  
		
		Case mailole!
			Return "mailole"  
		
		Case mailolestatic!
			Return "mailolestatic"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_maillogonoption (string as_source, ref maillogonoption ae_maillogonoption);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_maillogonoption
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to maillogonoption datatype value.
//	ae_maillogonoption		A maillogonoption variable passed by reference which will
//							hold the maillogonoption value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a maillogonoption data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_maillogonoption)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

		Case "maildownload"
			ae_maillogonoption = maildownload! 
		
		Case "mailnewsession"
			ae_maillogonoption = mailnewsession! 
		
		Case "mailnewsessionwithdownload"
			ae_maillogonoption = mailnewsessionwithdownload! 

	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (maillogonoption ae_maillogonoption);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_maillogonoption	The maillogonoption value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the maillogonoption value.
//						If ae_maillogonoption is NULL, the function returns NULL.
//						If ae_maillogonoption is Invalid, the function returns '!'.
//
//	Description:	Converts the maillogonoption enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_maillogonoption) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_maillogonoption

	Case maildownload!
		Return "maildownload"  
	
	Case mailnewsession!
		Return "mailnewsession"  
	
	Case mailnewsessionwithdownload!
		Return "mailnewsessionwithdownload"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_mailreadoption (string as_source, ref mailreadoption ae_mailreadoption);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_mailreadoption
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to mailreadoption datatype value.
//	ae_mailreadoption		A mailreadoption variable passed by reference which will
//							hold the mailreadoption value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a mailreadoption data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_mailreadoption)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "mailbodyasfile"
		ae_mailreadoption = mailbodyasfile! 
	
	Case "mailentiremessage"
		ae_mailreadoption = mailentiremessage! 
	
	Case "mailenvelopeonly"
		ae_mailreadoption = mailenvelopeonly! 
	
	Case "mailsuppressattachments"
		ae_mailreadoption = mailsuppressattachments! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (mailreadoption ae_mailreadoption);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_mailreadoption	The mailreadoption value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the mailreadoption value.
//						If ae_mailreadoption is NULL, the function returns NULL.
//						If ae_mailreadoption is Invalid, the function returns '!'.
//
//	Description:	Converts the mailreadoption enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_mailreadoption) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_mailreadoption

	Case mailbodyasfile!
		Return "mailbodyasfile"  
	
	Case mailentiremessage!
		Return "mailentiremessage"  
	
	Case mailenvelopeonly!
		Return "mailenvelopeonly"  
	
	Case mailsuppressattachments!
		Return "mailsuppressattachments"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_mailrecipienttype (string as_source, ref mailrecipienttype ae_mailrecipienttype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_mailrecipienttype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to mailrecipienttype datatype value.
//	ae_mailrecipienttype		A mailrecipienttype variable passed by reference which will
//							hold the mailrecipienttype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a mailrecipienttype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_mailrecipienttype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "mailbcc"
		ae_mailrecipienttype = mailbcc! 
	
	Case "mailcc"
		ae_mailrecipienttype = mailcc! 
	
	Case "mailoriginator"
		ae_mailrecipienttype = mailoriginator! 
	
	Case "mailto"
		ae_mailrecipienttype = mailto! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (mailrecipienttype ae_mailrecipienttype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_mailrecipienttype	The mailrecipienttype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the mailrecipienttype value.
//						If ae_mailrecipienttype is NULL, the function returns NULL.
//						If ae_mailrecipienttype is Invalid, the function returns '!'.
//
//	Description:	Converts the mailrecipienttype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_mailrecipienttype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_mailrecipienttype

		Case mailbcc!
			Return "mailbcc"  
		
		Case mailcc!
			Return "mailcc"  
		
		Case mailoriginator!
			Return "mailoriginator"  
		
		Case mailto!
			Return "mailto"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_mailreturncode (string as_source, ref mailreturncode ae_mailreturncode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_mailreturncode
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to mailreturncode datatype value.
//	ae_mailreturncode		A mailreturncode variable passed by reference which will
//							hold the mailreturncode value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a mailreturncode data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_mailreturncode)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

		Case "mailreturnaccessdenied"
			ae_mailreturncode = mailreturnaccessdenied! 
		
		Case "mailreturnattachmentnotfound"
			ae_mailreturncode = mailreturnattachmentnotfound! 
		
		Case "mailreturnattachmentopenfailure"
			ae_mailreturncode = mailreturnattachmentopenfailure! 
		
		Case "mailreturnattachmentwritefailure"
			ae_mailreturncode = mailreturnattachmentwritefailure! 
		
		Case "mailreturndiskfull"
			ae_mailreturncode = mailreturndiskfull! 
		
		Case "mailreturnfailure"
			ae_mailreturncode = mailreturnfailure! 
		
		Case "mailreturninsufficientmemory"
			ae_mailreturncode = mailreturninsufficientmemory! 
		
		Case "mailreturninvalidmessage"
			ae_mailreturncode = mailreturninvalidmessage! 
		
		Case "mailreturnloginfailure"
			ae_mailreturncode = mailreturnloginfailure! 
		
		Case "mailreturnmessageinuse"
			ae_mailreturncode = mailreturnmessageinuse! 
		
		Case "mailreturnnomessages"
			ae_mailreturncode = mailreturnnomessages! 
		
		Case "mailreturnsuccess"
			ae_mailreturncode = mailreturnsuccess! 
		
		Case "mailreturntexttoolarge"
			ae_mailreturncode = mailreturntexttoolarge! 
		
		Case "mailreturntoomanyfiles"
			ae_mailreturncode = mailreturntoomanyfiles! 
		
		Case "mailreturntoomanyrecipients"
			ae_mailreturncode = mailreturntoomanyrecipients! 
		
		Case "mailreturntoomanysessions"
			ae_mailreturncode = mailreturntoomanysessions! 
		
		Case "mailreturnunknownrecipient"
			ae_mailreturncode = mailreturnunknownrecipient! 
		
		Case "mailreturnuserabort"
			ae_mailreturncode = mailreturnuserabort! 
				
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (mailreturncode ae_mailreturncode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_mailreturncode	The mailreturncode value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the mailreturncode value.
//						If ae_mailreturncode is NULL, the function returns NULL.
//						If ae_mailreturncode is Invalid, the function returns '!'.
//
//	Description:	Converts the mailreturncode enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_mailreturncode) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_mailreturncode

		Case mailreturnaccessdenied!
			Return "mailreturnaccessdenied"  
		
		Case mailreturnattachmentnotfound!
			Return "mailreturnattachmentnotfound"  
		
		Case mailreturnattachmentopenfailure!
			Return "mailreturnattachmentopenfailure"  
		
		Case mailreturnattachmentwritefailure!
			Return "mailreturnattachmentwritefailure"  
		
		Case mailreturndiskfull!
			Return "mailreturndiskfull"  
		
		Case mailreturnfailure!
			Return "mailreturnfailure"  
		
		Case mailreturninsufficientmemory!
			Return "mailreturninsufficientmemory"  
		
		Case mailreturninvalidmessage!
			Return "mailreturninvalidmessage"  
		
		Case mailreturnloginfailure!
			Return "mailreturnloginfailure"  
		
		Case mailreturnmessageinuse!
			Return "mailreturnmessageinuse"  
		
		Case mailreturnnomessages!
			Return "mailreturnnomessages"  
		
		Case mailreturnsuccess!
			Return "mailreturnsuccess"  
		
		Case mailreturntexttoolarge!
			Return "mailreturntexttoolarge"  
		
		Case mailreturntoomanyfiles!
			Return "mailreturntoomanyfiles"  
		
		Case mailreturntoomanyrecipients!
			Return "mailreturntoomanyrecipients"  
		
		Case mailreturntoomanysessions!
			Return "mailreturntoomanysessions"  
		
		Case mailreturnunknownrecipient!
			Return "mailreturnunknownrecipient"  
		
		Case mailreturnuserabort!
			Return "mailreturnuserabort"  
				
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_maskdatatype (string as_source, ref maskdatatype ae_maskdatatype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_maskdatatype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to maskdatatype datatype value.
//	ae_maskdatatype		A maskdatatype variable passed by reference which will
//							hold the maskdatatype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a maskdatatype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_maskdatatype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "datemask"
		ae_maskdatatype = datemask! 
	
	Case "datetimemask"
		ae_maskdatatype = datetimemask! 
	
	Case "decimalmask"
		ae_maskdatatype = decimalmask! 
	
	Case "numericmask"
		ae_maskdatatype = numericmask! 
	
	Case "stringmask"
		ae_maskdatatype = stringmask! 
	
	Case "timemask"
		
		ae_maskdatatype = timemask!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (maskdatatype ae_maskdatatype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_maskdatatype	The maskdatatype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the maskdatatype value.
//						If ae_maskdatatype is NULL, the function returns NULL.
//						If ae_maskdatatype is Invalid, the function returns '!'.
//
//	Description:	Converts the maskdatatype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_maskdatatype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_maskdatatype

	Case datemask!
		Return "datemask"  
	
	Case datetimemask!
		Return "datetimemask"  
	
	Case decimalmask!
		Return "decimalmask"  
	
	Case numericmask!
		Return "numericmask"  
	
	Case stringmask!
		Return "stringmask"  
	
	Case timemask!
		Return "timemask" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_menuitemtype (string as_source, ref menuitemtype ae_menuitemtype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_menuitemtype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to menuitemtype datatype value.
//	ae_menuitemtype		A menuitemtype variable passed by reference which will
//							hold the menuitemtype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a menuitemtype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_menuitemtype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "menuitemtypeabout"
		ae_menuitemtype = menuitemtypeabout! 
	
	Case "menuitemtypeexit"
		ae_menuitemtype = menuitemtypeexit! 
	
	Case "menuitemtypehelp"
		ae_menuitemtype = menuitemtypehelp! 
	
	Case "menuitemtypenormal"
		ae_menuitemtype = menuitemtypenormal! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (menuitemtype ae_menuitemtype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_menuitemtype	The menuitemtype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the menuitemtype value.
//						If ae_menuitemtype is NULL, the function returns NULL.
//						If ae_menuitemtype is Invalid, the function returns '!'.
//
//	Description:	Converts the menuitemtype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_menuitemtype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_menuitemtype

	Case menuitemtypeabout!
		Return "menuitemtypeabout"  
	
	Case menuitemtypeexit!
		Return "menuitemtypeexit"  
	
	Case menuitemtypehelp!
		Return "menuitemtypehelp"  
	
	Case menuitemtypenormal!
		Return "menuitemtypenormal"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_menumergeoption (string as_source, ref menumergeoption ae_menumergeoption);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_menumergeoption
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to menumergeoption datatype value.
//	ae_menumergeoption		A menumergeoption variable passed by reference which will
//							hold the menumergeoption value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a menumergeoption data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_menumergeoption)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "editmenu"
		ae_menumergeoption = editmenu! 
	
	Case "exclude"
		ae_menumergeoption = exclude! 
	
	Case "filemenu"
		ae_menumergeoption = filemenu! 
	
	Case "helpmenu"
		ae_menumergeoption = helpmenu! 
	
	Case "merge"
		ae_menumergeoption = merge! 
	
	Case "windowmenu"
		ae_menumergeoption = windowmenu! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (menumergeoption ae_menumergeoption);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_menumergeoption	The menumergeoption value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the menumergeoption value.
//						If ae_menumergeoption is NULL, the function returns NULL.
//						If ae_menumergeoption is Invalid, the function returns '!'.
//
//	Description:	Converts the menumergeoption enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_menumergeoption) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_menumergeoption

	Case editmenu!
		Return "editmenu"  
	
	Case exclude!
		Return "exclude"  
	
	Case filemenu!
		Return "filemenu"  
	
	Case helpmenu!
		Return "helpmenu"  
	
	Case merge!
		Return "merge"  
	
	Case windowmenu!
		Return "windowmenu"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_menustyle (string as_source, ref menustyle ae_menustyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_menustyle
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to menustyle datatype value.
//	ae_menustyle		A menustyle variable passed by reference which will
//							hold the menustyle value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a menustyle data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_menustyle)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "contemporarymenu"
		ae_menustyle = contemporarymenu!

	Case "traditionalmenu"
		ae_menustyle = traditionalmenu!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (menustyle ae_menustyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_menustyle	The menustyle value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the menustyle value.
//						If ae_menustyle is NULL, the function returns NULL.
//						If ae_menustyle is Invalid, the function returns '!'.
//
//	Description:	Converts the menustyle enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_menustyle) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_menustyle

	Case contemporarymenu!
		Return "contemporarymenu"

	Case traditionalmenu!
		Return "traditionalmenu"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_metadatatype (string as_source, ref metadatatype ae_metadatatype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_metadatatype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to metadatatype datatype value.
//	ae_metadatatype		A metadatatype variable passed by reference which will
//							hold the metadatatype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a metadatatype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_metadatatype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "xmldtd"
		ae_metadatatype = xmldtd! 
	
	Case "xmlnone"
		ae_metadatatype = xmlnone! 
	
	Case "xmlschema"
		ae_metadatatype = xmlschema! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (metadatatype ae_metadatatype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_metadatatype	The metadatatype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the metadatatype value.
//						If ae_metadatatype is NULL, the function returns NULL.
//						If ae_metadatatype is Invalid, the function returns '!'.
//
//	Description:	Converts the metadatatype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_metadatatype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_metadatatype

	Case xmldtd!
		Return "xmldtd"  
	
	Case xmlnone!
		Return "xmlnone"  
	
	Case xmlschema!
		Return "xmlschema"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_moncaldisplaystate (string as_source, ref moncaldisplaystate ae_moncaldisplaystate);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_moncaldisplaystate
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to moncaldisplaystate datatype value.
//	ae_moncaldisplaystate		A moncaldisplaystate variable passed by reference which will
//							hold the moncaldisplaystate value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a moncaldisplaystate data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_moncaldisplaystate)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "entirelydisplayed"
		ae_moncaldisplaystate = entirelydisplayed!

	Case "partlydisplayed"
		ae_moncaldisplaystate = partlydisplayed!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (moncaldisplaystate ae_moncaldisplaystate);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_moncaldisplaystate	The moncaldisplaystate value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the moncaldisplaystate value.
//						If ae_moncaldisplaystate is NULL, the function returns NULL.
//						If ae_moncaldisplaystate is Invalid, the function returns '!'.
//
//	Description:	Converts the moncaldisplaystate enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_moncaldisplaystate) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_moncaldisplaystate

	Case entirelydisplayed!
		Return "entirelydisplayed"

	Case partlydisplayed!
		Return "partlydisplayed"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_moncalrepeattype (string as_source, ref moncalrepeattype ae_moncalrepeattype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_moncalrepeattype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to moncalrepeattype datatype value.
//	ae_moncalrepeattype		A moncalrepeattype variable passed by reference which will
//							hold the moncalrepeattype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a moncalrepeattype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_moncalrepeattype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "monthly"
		ae_moncalrepeattype = monthly! 
	
	Case "once"
		ae_moncalrepeattype = once! 
	
	Case "yearly"
		ae_moncalrepeattype = yearly! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (moncalrepeattype ae_moncalrepeattype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_moncalrepeattype	The moncalrepeattype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the moncalrepeattype value.
//						If ae_moncalrepeattype is NULL, the function returns NULL.
//						If ae_moncalrepeattype is Invalid, the function returns '!'.
//
//	Description:	Converts the moncalrepeattype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_moncalrepeattype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_moncalrepeattype

	Case monthly!
		Return "monthly"  
	
	Case once!
		Return "once"  
	
	Case yearly!
		Return "yearly"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_object (string as_source, ref object ae_object);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_object
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to object datatype value.
//	ae_object		A object variable passed by reference which will
//							hold the object value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a object data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_object)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "adoresultset"
		ae_object = adoresultset! 
	
	Case "animation"
		ae_object = animation! 
	
	Case "any"
		ae_object = any! 
	
	Case "application"
		ae_object = application! 
	
	Case "arraybounds"
		ae_object = arraybounds! 
	
	Case "blob"
		ae_object = blob! 
	
	Case "boolean"
		ae_object = boolean! 
	
	Case "character"
		ae_object = character! 
	
	Case "checkbox"
		ae_object = checkbox! 
	
	Case "classdefinition"
		ae_object = classdefinition! 
	
	Case "classdefinitionobject"
		ae_object = classdefinitionobject! 
	
	Case "commandbutton"
		ae_object = commandbutton! 
	
	Case "connection"
		ae_object = connection! 
	
	Case "connectioninfo"
		ae_object = connectioninfo! 
	
	Case "connectobject"
		ae_object = connectobject! 
	
	Case "contextinformation"
		ae_object = contextinformation! 
	
	Case "contextkeyword"
		ae_object = contextkeyword! 
	
	Case "corbacurrent"
		ae_object = corbacurrent! 
	
	Case "corbaobject"
		ae_object = corbaobject! 
	
	Case "corbaunion"
		ae_object = corbaunion! 
	
	Case "cplusplus"
		ae_object = cplusplus! 
	
	Case "datastore"
		ae_object = datastore! 
	
	Case "datawindow"
		ae_object = datawindow! 
	
	Case "datawindowchild"
		ae_object = datawindowchild! 
	
	Case "date"
		ae_object = date! 
	
	Case "datepicker"
		ae_object = datepicker! 
	
	Case "datetime"
		ae_object = datetime! 
	
	Case "decimal"
		ae_object = decimal! 
	
	Case "double"
		ae_object = double! 
	
	Case "dragobject"
		ae_object = dragobject! 
	
	Case "drawobject"
		ae_object = drawobject! 
	
	Case "dropdownlistbox"
		ae_object = dropdownlistbox! 
	
	Case "dropdownpicturelistbox"
		ae_object = dropdownpicturelistbox! 
	
	Case "dwobject"
		ae_object = dwobject! 
	
	Case "dynamicdescriptionarea"
		ae_object = dynamicdescriptionarea! 
	
	Case "dynamicstagingarea"
		ae_object = dynamicstagingarea! 
	
	Case "editmask"
		ae_object = editmask! 
	
	Case "enumerationdefinition"
		ae_object = enumerationdefinition! 
	
	Case "enumerationitemdefinition"
		ae_object = enumerationitemdefinition! 
	
	Case "environment"
		ae_object = environment! 
	
	Case "error"
		ae_object = error! 
	
	Case "errorlogging"
		ae_object = errorlogging! 
	
	Case "extobject"
		ae_object = extobject! 
	
	Case "functionobject"
		ae_object = functionobject! 
	
	Case "graph"
		ae_object = graph! 
	
	Case "graphicobject"
		ae_object = graphicobject! 
	
	Case "graxis"
		ae_object = graxis! 
	
	Case "grdispattr"
		ae_object = grdispattr! 
	
	Case "groupbox"
		ae_object = groupbox! 
	
	Case "hprogressbar"
		ae_object = hprogressbar! 
	
	Case "hscrollbar"
		ae_object = hscrollbar! 
	
	Case "htrackbar"
		ae_object = htrackbar! 
	
	Case "inet"
		ae_object = inet! 
	
	Case "inkedit"
		ae_object = inkedit! 
	
	Case "inkpicture"
		ae_object = inkpicture! 
	
	Case "integer"
		ae_object = integer! 
	
	Case "internetresult"
		ae_object = internetresult! 
	
	Case "jaguarorb"
		ae_object = jaguarorb! 
	
	Case "line"
		ae_object = line! 
	
	Case "listbox"
		ae_object = listbox! 
	
	Case "listview"
		ae_object = listview! 
	
	Case "listviewitem"
		ae_object = listviewitem! 
	
	Case "long"
		ae_object = long! 
	
	Case "mailfiledescription"
		ae_object = mailfiledescription! 
	
	Case "mailmessage"
		ae_object = mailmessage! 
	
	Case "mailrecipient"
		ae_object = mailrecipient! 
	
	Case "mailsession"
		ae_object = mailsession! 
	
	Case "mdiclient"
		ae_object = mdiclient! 
	
	Case "menu"
		ae_object = menu! 
	
	Case "menucascade"
		ae_object = menucascade! 
	
	Case "message"
		ae_object = message! 
	
	Case "mlsync"
		ae_object = mlsync! 
	
	Case "mlsynchronization"
		ae_object = mlsynchronization! 
	
	Case "monthcalendar"
		ae_object = monthcalendar! 
	
	Case "multilineedit"
		ae_object = multilineedit! 
	
	Case "nonvisualobject"
		ae_object = nonvisualobject! 
	
	Case "notype"
		ae_object = notype! 
	
	Case "objhandle"
		ae_object = objhandle! 
	
	Case "olecontrol"
		ae_object = olecontrol! 
	
	Case "olecustomcontrol"
		ae_object = olecustomcontrol! 
	
	Case "oleobject"
		ae_object = oleobject! 
	
	Case "olestorage"
		ae_object = olestorage! 
	
	Case "olestream"
		ae_object = olestream! 
	
	Case "oletxnobject"
		ae_object = oletxnobject! 
	
	Case "omcontrol"
		ae_object = omcontrol! 
	
	Case "omcustomcontrol"
		ae_object = omcustomcontrol! 
	
	Case "omembeddedcontrol"
		ae_object = omembeddedcontrol! 
	
	Case "omobject"
		ae_object = omobject! 
	
	Case "omstorage"
		ae_object = omstorage! 
	
	Case "omstream"
		ae_object = omstream! 
	
	Case "orb"
		ae_object = orb! 
	
	Case "oval"
		ae_object = oval! 
	
	Case "pbtocppobject"
		ae_object = pbtocppobject! 
	
	Case "picture"
		ae_object = picture! 
	
	Case "picturebutton"
		ae_object = picturebutton! 
	
	Case "picturehyperlink"
		ae_object = picturehyperlink! 
	
	Case "picturelistbox"
		ae_object = picturelistbox! 
	
	Case "pipeline"
		ae_object = pipeline! 
	
	Case "powerobject"
		ae_object = powerobject! 
	
	Case "profilecall"
		ae_object = profilecall! 
	
	Case "profileclass"
		ae_object = profileclass! 
	
	Case "profileline"
		ae_object = profileline! 
	
	Case "profileroutine"
		ae_object = profileroutine! 
	
	Case "profiling"
		ae_object = profiling! 
	
	Case "radiobutton"
		ae_object = radiobutton! 
	
	Case "real"
		ae_object = real! 
	
	Case "rectangle"
		ae_object = rectangle! 
	
	Case "remoteobject"
		ae_object = remoteobject! 
	
	Case "resultset"
		ae_object = resultset! 
	
	Case "resultsets"
		ae_object = resultsets! 
	
	Case "richtextedit"
		ae_object = richtextedit! 
	
	Case "roundrectangle"
		ae_object = roundrectangle! 
	
	Case "scriptdefinition"
		ae_object = scriptdefinition! 
	
	Case "service"
		ae_object = service! 
	
	Case "simpletypedefinition"
		ae_object = simpletypedefinition! 
	
	Case "singlelineedit"
		ae_object = singlelineedit! 
	
	Case "sslcallback"
		ae_object = sslcallback! 
	
	Case "sslserviceprovider"
		ae_object = sslserviceprovider! 
	
	Case "statichyperlink"
		ae_object = statichyperlink! 
	
	Case "statictext"
		ae_object = statictext! 
	
	Case "string"
		ae_object = string! 
	
	Case "structure"
		ae_object = structure! 
	
	Case "syncparm"
		ae_object = syncparm! 
	
	Case "systemfunctions"
		ae_object = systemfunctions! 
	
	Case "tab"
		ae_object = tab! 
	
	Case "time"
		ae_object = time! 
	
	Case "timing"
		ae_object = timing! 
	
	Case "traceactivitynode"
		ae_object = traceactivitynode! 
	
	Case "tracebeginend"
		ae_object = tracebeginend! 
	
	Case "traceerror"
		ae_object = traceerror! 
	
	Case "traceesql"
		ae_object = traceesql! 
	
	Case "tracefile"
		ae_object = tracefile! 
	
	Case "tracegarbagecollect"
		ae_object = tracegarbagecollect! 
	
	Case "traceline"
		ae_object = traceline! 
	
	Case "traceobject"
		ae_object = traceobject! 
	
	Case "traceroutine"
		ae_object = traceroutine! 
	
	Case "tracetree"
		ae_object = tracetree! 
	
	Case "tracetreeerror"
		ae_object = tracetreeerror! 
	
	Case "tracetreeesql"
		ae_object = tracetreeesql! 
	
	Case "tracetreegarbagecollect"
		ae_object = tracetreegarbagecollect! 
	
	Case "tracetreeline"
		ae_object = tracetreeline! 
	
	Case "tracetreenode"
		ae_object = tracetreenode! 
	
	Case "tracetreeobject"
		ae_object = tracetreeobject! 
	
	Case "tracetreeroutine"
		ae_object = tracetreeroutine! 
	
	Case "tracetreeuser"
		ae_object = tracetreeuser! 
	
	Case "traceuser"
		ae_object = traceuser! 
	
	Case "transaction"
		ae_object = transaction! 
	
	Case "transactionserver"
		ae_object = transactionserver! 
	
	Case "treeview"
		ae_object = treeview! 
	
	Case "treeviewitem"
		ae_object = treeviewitem! 
	
	Case "typedefinition"
		ae_object = typedefinition! 
	
	Case "ulsync"
		ae_object = ulsync! 
	
	Case "unsignedinteger"
		ae_object = unsignedinteger! 
	
	Case "unsignedlong"
		ae_object = unsignedlong! 
	
	Case "userobject"
		ae_object = userobject! 
	
	Case "variablecardinalitydefinition"
		ae_object = variablecardinalitydefinition! 
	
	Case "variabledefinition"
		ae_object = variabledefinition! 
	
	Case "vprogressbar"
		ae_object = vprogressbar! 
	
	Case "vscrollbar"
		ae_object = vscrollbar! 
	
	Case "vtrackbar"
		ae_object = vtrackbar! 
	
	Case "window"
		ae_object = window! 
	
	Case "windowobject"
		ae_object = windowobject! 
	
	Case "wsconnection"
		ae_object = wsconnection! 

			
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (object ae_object);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_object	The object value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the object value.
//						If ae_object is NULL, the function returns NULL.
//						If ae_object is Invalid, the function returns '!'.
//
//	Description:	Converts the object enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_object) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_object

	Case adoresultset!
		Return "adoresultset"  
	
	Case animation!
		Return "animation"  
	
	Case any!
		Return "any"  
	
	Case application!
		Return "application"  
	
	Case arraybounds!
		Return "arraybounds"  
	
	Case blob!
		Return "blob"  
	
	Case boolean!
		Return "boolean"  
	
	Case character!
		Return "character"  
	
	Case checkbox!
		Return "checkbox"  
	
	Case classdefinition!
		Return "classdefinition"  
	
	Case classdefinitionobject!
		Return "classdefinitionobject"  
	
	Case commandbutton!
		Return "commandbutton"  
	
	Case connection!
		Return "connection"  
	
	Case connectioninfo!
		Return "connectioninfo"  
	
	Case connectobject!
		Return "connectobject"  
	
	Case contextinformation!
		Return "contextinformation"  
	
	Case contextkeyword!
		Return "contextkeyword"  
	
	Case corbacurrent!
		Return "corbacurrent"  
	
	Case corbaobject!
		Return "corbaobject"  
	
	Case corbaunion!
		Return "corbaunion"  
	
	Case cplusplus!
		Return "cplusplus"  
	
	Case datastore!
		Return "datastore"  
	
	Case datawindow!
		Return "datawindow"  
	
	Case datawindowchild!
		Return "datawindowchild"  
	
	Case date!
		Return "date"  
	
	Case datepicker!
		Return "datepicker"  
	
	Case datetime!
		Return "datetime"  
	
	Case decimal!
		Return "decimal"  
	
	Case double!
		Return "double"  
	
	Case dragobject!
		Return "dragobject"  
	
	Case drawobject!
		Return "drawobject"  
	
	Case dropdownlistbox!
		Return "dropdownlistbox"  
	
	Case dropdownpicturelistbox!
		Return "dropdownpicturelistbox"  
	
	Case dwobject!
		Return "dwobject"  
	
	Case dynamicdescriptionarea!
		Return "dynamicdescriptionarea"  
	
	Case dynamicstagingarea!
		Return "dynamicstagingarea"  
	
	Case editmask!
		Return "editmask"  
	
	Case enumerationdefinition!
		Return "enumerationdefinition"  
	
	Case enumerationitemdefinition!
		Return "enumerationitemdefinition"  
	
	Case environment!
		Return "environment"  
	
	Case error!
		Return "error"  
	
	Case errorlogging!
		Return "errorlogging"  
	
	Case extobject!
		Return "extobject"  
	
	Case functionobject!
		Return "functionobject"  
	
	Case graph!
		Return "graph"  
	
	Case graphicobject!
		Return "graphicobject"  
	
	Case graxis!
		Return "graxis"  
	
	Case grdispattr!
		Return "grdispattr"  
	
	Case groupbox!
		Return "groupbox"  
	
	Case hprogressbar!
		Return "hprogressbar"  
	
	Case hscrollbar!
		Return "hscrollbar"  
	
	Case htrackbar!
		Return "htrackbar"  
	
	Case inet!
		Return "inet"  
	
	Case inkedit!
		Return "inkedit"  
	
	Case inkpicture!
		Return "inkpicture"  
	
	Case integer!
		Return "integer"  
	
	Case internetresult!
		Return "internetresult"  
	
	Case jaguarorb!
		Return "jaguarorb"  
	
	Case line!
		Return "line"  
	
	Case listbox!
		Return "listbox"  
	
	Case listview!
		Return "listview"  
	
	Case listviewitem!
		Return "listviewitem"  
	
	Case long!
		Return "long"  
	
	Case mailfiledescription!
		Return "mailfiledescription"  
	
	Case mailmessage!
		Return "mailmessage"  
	
	Case mailrecipient!
		Return "mailrecipient"  
	
	Case mailsession!
		Return "mailsession"  
	
	Case mdiclient!
		Return "mdiclient"  
	
	Case menu!
		Return "menu"  
	
	Case menucascade!
		Return "menucascade"  
	
	Case message!
		Return "message"  
	
	Case mlsync!
		Return "mlsync"  
	
	Case mlsynchronization!
		Return "mlsynchronization"  
	
	Case monthcalendar!
		Return "monthcalendar"  
	
	Case multilineedit!
		Return "multilineedit"  
	
	Case nonvisualobject!
		Return "nonvisualobject"  
	
	Case notype!
		Return "notype"  
	
	Case objhandle!
		Return "objhandle"  
	
	Case olecontrol!
		Return "olecontrol"  
	
	Case olecustomcontrol!
		Return "olecustomcontrol"  
	
	Case oleobject!
		Return "oleobject"  
	
	Case olestorage!
		Return "olestorage"  
	
	Case olestream!
		Return "olestream"  
	
	Case oletxnobject!
		Return "oletxnobject"  
	
	Case omcontrol!
		Return "omcontrol"  
	
	Case omcustomcontrol!
		Return "omcustomcontrol"  
	
	Case omembeddedcontrol!
		Return "omembeddedcontrol"  
	
	Case omobject!
		Return "omobject"  
	
	Case omstorage!
		Return "omstorage"  
	
	Case omstream!
		Return "omstream"  
	
	Case orb!
		Return "orb"  
	
	Case oval!
		Return "oval"  
	
	Case pbtocppobject!
		Return "pbtocppobject"  
	
	Case picture!
		Return "picture"  
	
	Case picturebutton!
		Return "picturebutton"  
	
	Case picturehyperlink!
		Return "picturehyperlink"  
	
	Case picturelistbox!
		Return "picturelistbox"  
	
	Case pipeline!
		Return "pipeline"  
	
	Case powerobject!
		Return "powerobject"  
	
	Case profilecall!
		Return "profilecall"  
	
	Case profileclass!
		Return "profileclass"  
	
	Case profileline!
		Return "profileline"  
	
	Case profileroutine!
		Return "profileroutine"  
	
	Case profiling!
		Return "profiling"  
	
	Case radiobutton!
		Return "radiobutton"  
	
	Case real!
		Return "real"  
	
	Case rectangle!
		Return "rectangle"  
	
	Case remoteobject!
		Return "remoteobject"  
	
	Case resultset!
		Return "resultset"  
	
	Case resultsets!
		Return "resultsets"  
	
	Case richtextedit!
		Return "richtextedit"  
	
	Case roundrectangle!
		Return "roundrectangle"  
	
	Case scriptdefinition!
		Return "scriptdefinition"  
	
	Case service!
		Return "service"  
	
	Case simpletypedefinition!
		Return "simpletypedefinition"  
	
	Case singlelineedit!
		Return "singlelineedit"  
	
	Case sslcallback!
		Return "sslcallback"  
	
	Case sslserviceprovider!
		Return "sslserviceprovider"  
	
	Case statichyperlink!
		Return "statichyperlink"  
	
	Case statictext!
		Return "statictext"  
	
	Case string!
		Return "string"  
	
	Case structure!
		Return "structure"  
	
	Case syncparm!
		Return "syncparm"  
	
	Case systemfunctions!
		Return "systemfunctions"  
	
	Case tab!
		Return "tab"  
	
	Case time!
		Return "time"  
	
	Case timing!
		Return "timing"  
	
	Case traceactivitynode!
		Return "traceactivitynode"  
	
	Case tracebeginend!
		Return "tracebeginend"  
	
	Case traceerror!
		Return "traceerror"  
	
	Case traceesql!
		Return "traceesql"  
	
	Case tracefile!
		Return "tracefile"  
	
	Case tracegarbagecollect!
		Return "tracegarbagecollect"  
	
	Case traceline!
		Return "traceline"  
	
	Case traceobject!
		Return "traceobject"  
	
	Case traceroutine!
		Return "traceroutine"  
	
	Case tracetree!
		Return "tracetree"  
	
	Case tracetreeerror!
		Return "tracetreeerror"  
	
	Case tracetreeesql!
		Return "tracetreeesql"  
	
	Case tracetreegarbagecollect!
		Return "tracetreegarbagecollect"  
	
	Case tracetreeline!
		Return "tracetreeline"  
	
	Case tracetreenode!
		Return "tracetreenode"  
	
	Case tracetreeobject!
		Return "tracetreeobject"  
	
	Case tracetreeroutine!
		Return "tracetreeroutine"  
	
	Case tracetreeuser!
		Return "tracetreeuser"  
	
	Case traceuser!
		Return "traceuser"  
	
	Case transaction!
		Return "transaction"  
	
	Case transactionserver!
		Return "transactionserver"  
	
	Case treeview!
		Return "treeview"  
	
	Case treeviewitem!
		Return "treeviewitem"  
	
	Case typedefinition!
		Return "typedefinition"  
	
	Case ulsync!
		Return "ulsync"  
	
	Case unsignedinteger!
		Return "unsignedinteger"  
	
	Case unsignedlong!
		Return "unsignedlong"  
	
	Case userobject!
		Return "userobject"  
	
	Case variablecardinalitydefinition!
		Return "variablecardinalitydefinition"  
	
	Case variabledefinition!
		Return "variabledefinition"  
	
	Case vprogressbar!
		Return "vprogressbar"  
	
	Case vscrollbar!
		Return "vscrollbar"  
	
	Case vtrackbar!
		Return "vtrackbar"  
	
	Case window!
		Return "window"  
	
	Case windowobject!
		Return "windowobject"  
	
	Case wsconnection!
		Return "wsconnection"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_olefunctioncalltype (string as_source, ref olefunctioncalltype ae_olefunctioncalltype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_olefunctioncalltype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to olefunctioncalltype datatype value.
//	ae_olefunctioncalltype		A olefunctioncalltype variable passed by reference which will
//							hold the olefunctioncalltype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a olefunctioncalltype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_olefunctioncalltype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "asstatement"
		ae_olefunctioncalltype = asstatement!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (olefunctioncalltype ae_olefunctioncalltype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_olefunctioncalltype	The olefunctioncalltype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the olefunctioncalltype value.
//						If ae_olefunctioncalltype is NULL, the function returns NULL.
//						If ae_olefunctioncalltype is Invalid, the function returns '!'.
//
//	Description:	Converts the olefunctioncalltype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_olefunctioncalltype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_olefunctioncalltype

	Case asstatement!
		Return "asstatement"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_omactivatetype (string as_source, ref omactivatetype ae_omactivatetype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_omactivatetype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to omactivatetype datatype value.
//	ae_omactivatetype		A omactivatetype variable passed by reference which will
//							hold the omactivatetype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a omactivatetype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_omactivatetype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "inplace"
		ae_omactivatetype = inplace!

	Case "offsite"
		ae_omactivatetype = offsite!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (omactivatetype ae_omactivatetype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_omactivatetype	The omactivatetype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the omactivatetype value.
//						If ae_omactivatetype is NULL, the function returns NULL.
//						If ae_omactivatetype is Invalid, the function returns '!'.
//
//	Description:	Converts the omactivatetype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_omactivatetype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_omactivatetype

	Case inplace!
		Return "inplace"

	Case offsite!
		Return "offsite"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_omactivation (string as_source, ref omactivation ae_omactivation);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_omactivation
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to omactivation datatype value.
//	ae_omactivation		A omactivation variable passed by reference which will
//							hold the omactivation value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a omactivation data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_omactivation)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "activatemanually"
		ae_omactivation = activatemanually!

	Case "activateondoubleclick"
		ae_omactivation = activateondoubleclick!

	Case "activateongetfocus"
		ae_omactivation = activateongetfocus!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (omactivation ae_omactivation);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_omactivation	The omactivation value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the omactivation value.
//						If ae_omactivation is NULL, the function returns NULL.
//						If ae_omactivation is Invalid, the function returns '!'.
//
//	Description:	Converts the omactivation enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_omactivation) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_omactivation

	Case activatemanually!
		Return "activatemanually"

	Case activateondoubleclick!
		Return "activateondoubleclick"

	Case activateongetfocus!
		Return "activateongetfocus"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_omcontentsallowed (string as_source, ref omcontentsallowed ae_omcontentsallowed);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_omcontentsallowed
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to omcontentsallowed datatype value.
//	ae_omcontentsallowed		A omcontentsallowed variable passed by reference which will
//							hold the omcontentsallowed value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a omcontentsallowed data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_omcontentsallowed)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "containsany"
		ae_omcontentsallowed = containsany!

	Case "containsembeddedonly"
		ae_omcontentsallowed = containsembeddedonly!

	Case "containslinkedonly"
		ae_omcontentsallowed = containslinkedonly!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (omcontentsallowed ae_omcontentsallowed);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_omcontentsallowed	The omcontentsallowed value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the omcontentsallowed value.
//						If ae_omcontentsallowed is NULL, the function returns NULL.
//						If ae_omcontentsallowed is Invalid, the function returns '!'.
//
//	Description:	Converts the omcontentsallowed enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_omcontentsallowed) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_omcontentsallowed

	Case containsany!
		Return "containsany"

	Case containsembeddedonly!
		Return "containsembeddedonly"

	Case containslinkedonly!
		Return "containslinkedonly"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_omdisplaytype (string as_source, ref omdisplaytype ae_omdisplaytype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_omdisplaytype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to omdisplaytype datatype value.
//	ae_omdisplaytype		A omdisplaytype variable passed by reference which will
//							hold the omdisplaytype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a omdisplaytype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_omdisplaytype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "displayasactivexdocument"
		ae_omdisplaytype = displayasactivexdocument!

	Case "displayascontent"
		ae_omdisplaytype = displayascontent!

	Case "displayasicon"
		ae_omdisplaytype = displayasicon!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (omdisplaytype ae_omdisplaytype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_omdisplaytype	The omdisplaytype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the omdisplaytype value.
//						If ae_omdisplaytype is NULL, the function returns NULL.
//						If ae_omdisplaytype is Invalid, the function returns '!'.
//
//	Description:	Converts the omdisplaytype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_omdisplaytype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_omdisplaytype

	Case displayasactivexdocument!
		Return "displayasactivexdocument"

	Case displayascontent!
		Return "displayascontent"

	Case displayasicon!
		Return "displayasicon"
	
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_omlinkupdateoptions (string as_source, ref omlinkupdateoptions ae_omlinkupdateoptions);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_omlinkupdateoptions
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to omlinkupdateoptions datatype value.
//	ae_omlinkupdateoptions		A omlinkupdateoptions variable passed by reference which will
//							hold the omlinkupdateoptions value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a omlinkupdateoptions data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_omlinkupdateoptions)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "linkupdateautomatic"
		ae_omlinkupdateoptions = linkupdateautomatic!

	Case "linkupdatemanual"
		ae_omlinkupdateoptions = linkupdatemanual!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (omlinkupdateoptions ae_omlinkupdateoptions);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_omlinkupdateoptions	The omlinkupdateoptions value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the omlinkupdateoptions value.
//						If ae_omlinkupdateoptions is NULL, the function returns NULL.
//						If ae_omlinkupdateoptions is Invalid, the function returns '!'.
//
//	Description:	Converts the omlinkupdateoptions enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_omlinkupdateoptions) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_omlinkupdateoptions

	Case linkupdateautomatic!
		Return "linkupdateautomatic"

	Case linkupdatemanual!
		Return "linkupdatemanual"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_orientationtype (string as_source, ref orientationtype ae_orientationtype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_omlinkupdateoptions
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to omlinkupdateoptions datatype value.
//	ae_omlinkupdateoptions		A omlinkupdateoptions variable passed by reference which will
//							hold the omlinkupdateoptions value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a omlinkupdateoptions data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_orientationtype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "paperlandscape"
		ae_orientationtype = paperlandscape!

	Case "paperportrait"
		ae_orientationtype = paperportrait!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (orientationtype ae_orientationtype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_orientationtype	The orientationtype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the orientationtype value.
//						If ae_orientationtype is NULL, the function returns NULL.
//						If ae_orientationtype is Invalid, the function returns '!'.
//
//	Description:	Converts the orientationtype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_orientationtype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_orientationtype

	Case paperlandscape!
		Return "paperlandscape"

	Case paperportrait!
		Return "paperportrait"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_paragraphsetting (string as_source, ref paragraphsetting ae_paragraphsetting);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_paragraphsetting
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to paragraphsetting datatype value.
//	ae_paragraphsetting		A paragraphsetting variable passed by reference which will
//							hold the paragraphsetting value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a paragraphsetting data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_paragraphsetting)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "indent"
		ae_paragraphsetting = indent! 
	
	Case "leftmargin"
		ae_paragraphsetting = leftmargin! 
	
	Case "rightmargin"
		ae_paragraphsetting = rightmargin! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (paragraphsetting ae_paragraphsetting);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_paragraphsetting	The paragraphsetting value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the paragraphsetting value.
//						If ae_paragraphsetting is NULL, the function returns NULL.
//						If ae_paragraphsetting is Invalid, the function returns '!'.
//
//	Description:	Converts the paragraphsetting enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_paragraphsetting) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_paragraphsetting

	Case indent!
		Return "indent"  
	
	Case leftmargin!
		Return "leftmargin"  
	
	Case rightmargin!
		Return "rightmargin"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_parmtype (string as_source, ref parmtype ae_parmtype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_parmtype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to parmtype datatype value.
//	ae_parmtype		A parmtype variable passed by reference which will
//							hold the parmtype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a parmtype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_parmtype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "typeboolean"
		ae_parmtype = typeboolean! 
	
	Case "typebyte"
		ae_parmtype = typebyte! 
	
	Case "typedate"
		ae_parmtype = typedate! 
	
	Case "typedatetime"
		ae_parmtype = typedatetime! 
	
	Case "typedecimal"
		ae_parmtype = typedecimal! 
	
	Case "typedouble"
		ae_parmtype = typedouble! 
	
	Case "typeinteger"
		ae_parmtype = typeinteger! 
	
	Case "typelong"
		ae_parmtype = typelong! 
	
	Case "typelonglong"
		ae_parmtype = typelonglong! 
	
	Case "typereal"
		ae_parmtype = typereal! 
	
	Case "typestring"
		ae_parmtype = typestring! 
	
	Case "typetime"
		ae_parmtype = typetime! 
	
	Case "typeuint"
		ae_parmtype = typeuint! 
	
	Case "typeulong"
		ae_parmtype = typeulong! 
	
	Case "typeunknown"
		ae_parmtype = typeunknown! 

		
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (parmtype ae_parmtype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_parmtype	The parmtype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the parmtype value.
//						If ae_parmtype is NULL, the function returns NULL.
//						If ae_parmtype is Invalid, the function returns '!'.
//
//	Description:	Converts the parmtype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_parmtype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_parmtype

	Case typeboolean!
		Return "typeboolean"  
	
	Case typebyte!
		Return "typebyte"  
	
	Case typedate!
		Return "typedate"  
	
	Case typedatetime!
		Return "typedatetime"  
	
	Case typedecimal!
		Return "typedecimal"  
	
	Case typedouble!
		Return "typedouble"  
	
	Case typeinteger!
		Return "typeinteger"  
	
	Case typelong!
		Return "typelong"  
	
	Case typelonglong!
		Return "typelonglong"  
	
	Case typereal!
		Return "typereal"  
	
	Case typestring!
		Return "typestring"  
	
	Case typetime!
		Return "typetime"  
	
	Case typeuint!
		Return "typeuint"  
	
	Case typeulong!
		Return "typeulong"  
	
	Case typeunknown!
		Return "typeunknown"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_pbtypes (string as_source, ref pbtypes ae_pbtypes);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pbtypes
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to pbtypes datatype value.
//	ae_pbtypes		A pbtypes variable passed by reference which will
//							hold the pbtypes value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a pbtypes data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_pbtypes)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "desktop"
		ae_pbtypes = desktop!

	Case "enterprise"
		ae_pbtypes = enterprise!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (pbtypes ae_pbtypes);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_pbtypes	The pbtypes value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the pbtypes value.
//						If ae_pbtypes is NULL, the function returns NULL.
//						If ae_pbtypes is Invalid, the function returns '!'.
//
//	Description:	Converts the pbtypes enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_pbtypes) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_pbtypes

	Case desktop!
		Return "desktop"

	Case enterprise!
		Return "enterprise"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_pdfmethod (string as_source, ref pdfmethod ae_pdfmethod);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pdfmethod
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to pdfmethod datatype value.
//	ae_pdfmethod		A pdfmethod variable passed by reference which will
//							hold the pdfmethod value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a pdfmethod data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_pdfmethod)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "distill"
		ae_pdfmethod = distill!

	Case "xslfop"
		ae_pdfmethod = xslfop!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (pdfmethod ae_pdfmethod);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_pdfmethod	The pdfmethod value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the pdfmethod value.
//						If ae_pdfmethod is NULL, the function returns NULL.
//						If ae_pdfmethod is Invalid, the function returns '!'.
//
//	Description:	Converts the pdfmethod enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_pdfmethod) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_pdfmethod

	Case distill!
		Return "distill"

	Case xslfop!
		Return "xslfop"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_pointer (string as_source, ref pointer ae_pointer);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_pointer
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to pointer datatype value.
//	ae_pointer		A pointer variable passed by reference which will
//							hold the pointer value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a pointer data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_pointer)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "appstarting"
		ae_pointer = appstarting! 
	
	Case "arrow"
		ae_pointer = arrow! 
	
	Case "beam"
		ae_pointer = beam! 
	
	Case "cross"
		ae_pointer = cross! 
	
	Case "help"
		ae_pointer = help! 
	
	Case "hourglass"
		ae_pointer = hourglass! 
	
	Case "hyperlink"
		ae_pointer = hyperlink! 
	
	Case "icon"
		ae_pointer = icon! 
	
	Case "nopointer"
		ae_pointer = nopointer! 
	
	Case "size"
		ae_pointer = size! 
	
	Case "sizenesw"
		ae_pointer = sizenesw! 
	
	Case "sizens"
		ae_pointer = sizens! 
	
	Case "sizenwse"
		ae_pointer = sizenwse! 
	
	Case "sizewe"
		ae_pointer = sizewe! 
	
	Case "uparrow"
		ae_pointer = uparrow! 


	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (pointer ae_pointer);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_pointer	The pointer value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the pointer value.
//						If ae_pointer is NULL, the function returns NULL.
//						If ae_pointer is Invalid, the function returns '!'.
//
//	Description:	Converts the pointer enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_pointer) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_pointer

	Case appstarting!
		Return "appstarting"  
	
	Case arrow!
		Return "arrow"  
	
	Case beam!
		Return "beam"  
	
	Case cross!
		Return "cross"  
	
	Case help!
		Return "help"  
	
	Case hourglass!
		Return "hourglass"  
	
	Case hyperlink!
		Return "hyperlink"  
	
	Case icon!
		Return "icon"  
	
	Case nopointer!
		Return "nopointer"  
	
	Case size!
		Return "size"  
	
	Case sizenesw!
		Return "sizenesw"  
	
	Case sizens!
		Return "sizens"  
	
	Case sizenwse!
		Return "sizenwse"  
	
	Case sizewe!
		Return "sizewe"  
	
	Case uparrow!
		Return "uparrow"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_profileroutinekind (string as_source, ref profileroutinekind ae_profileroutinekind);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_profileroutinekind
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to profileroutinekind datatype value.
//	ae_profileroutinekind		A profileroutinekind variable passed by reference which will
//							hold the profileroutinekind value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a profileroutinekind data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_profileroutinekind)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "routineesql"
		ae_profileroutinekind = routineesql! 
	
	Case "routineevent"
		ae_profileroutinekind = routineevent! 
	
	Case "routinefunction"
		ae_profileroutinekind = routinefunction! 
	
	Case "routinegarbagecollection"
		ae_profileroutinekind = routinegarbagecollection! 
	
	Case "routineobjectcreation"
		ae_profileroutinekind = routineobjectcreation! 
	
	Case "routineobjectdestruction"
		ae_profileroutinekind = routineobjectdestruction! 
	
	Case "routineroot"
		ae_profileroutinekind = routineroot! 


	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (profileroutinekind ae_profileroutinekind);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_profileroutinekind	The profileroutinekind value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the profileroutinekind value.
//						If ae_profileroutinekind is NULL, the function returns NULL.
//						If ae_profileroutinekind is Invalid, the function returns '!'.
//
//	Description:	Converts the profileroutinekind enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_profileroutinekind) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_profileroutinekind

	Case routineesql!
		Return "routineesql"  
	
	Case routineevent!
		Return "routineevent"  
	
	Case routinefunction!
		Return "routinefunction"  
	
	Case routinegarbagecollection!
		Return "routinegarbagecollection"  
	
	Case routineobjectcreation!
		Return "routineobjectcreation"  
	
	Case routineobjectdestruction!
		Return "routineobjectdestruction"  
	
	Case routineroot!
		Return "routineroot"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_registryvaluetype (string as_source, ref registryvaluetype ae_registryvaluetype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_registryvaluetype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to registryvaluetype datatype value.
//	ae_registryvaluetype		A registryvaluetype variable passed by reference which will
//							hold the registryvaluetype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a registryvaluetype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_registryvaluetype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "regbinary"
		ae_registryvaluetype = regbinary! 
	
	Case "regexpandstring"
		ae_registryvaluetype = regexpandstring! 
	
	Case "reglink"
		ae_registryvaluetype = reglink! 
	
	Case "regmultistring"
		ae_registryvaluetype = regmultistring! 
	
	Case "regstring"
		ae_registryvaluetype = regstring! 
	
	Case "regulong"
		ae_registryvaluetype = regulong! 
	
	Case "regulongbigendian"
		ae_registryvaluetype = regulongbigendian!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (registryvaluetype ae_registryvaluetype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_registryvaluetype	The registryvaluetype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the registryvaluetype value.
//						If ae_registryvaluetype is NULL, the function returns NULL.
//						If ae_registryvaluetype is Invalid, the function returns '!'.
//
//	Description:	Converts the registryvaluetype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_registryvaluetype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_registryvaluetype

	Case regbinary!
		Return "regbinary"  
	
	Case regexpandstring!
		Return "regexpandstring"  
	
	Case reglink!
		Return "reglink"  
	
	Case regmultistring!
		Return "regmultistring"  
	
	Case regstring!
		Return "regstring"  
	
	Case regulong!
		Return "regulong"  
	
	Case regulongbigendian!
		Return "regulongbigendian" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_richtexttoolbaractivation (string as_source, ref richtexttoolbaractivation ae_richtexttoolbaractivation);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_richtexttoolbaractivation
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to richtexttoolbaractivation datatype value.
//	ae_richtexttoolbaractivation		A richtexttoolbaractivation variable passed by reference which will
//							hold the richtexttoolbaractivation value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a richtexttoolbaractivation data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_richtexttoolbaractivation)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "richtexttoolbaractivationalways"
		ae_richtexttoolbaractivation = richtexttoolbaractivationalways! 
	
	Case "richtexttoolbaractivationnever"
		ae_richtexttoolbaractivation = richtexttoolbaractivationnever! 
	
	Case "richtexttoolbaractivationonedit"
		ae_richtexttoolbaractivation = richtexttoolbaractivationonedit!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (richtexttoolbaractivation ae_richtexttoolbaractivation);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_richtexttoolbaractivation	The richtexttoolbaractivation value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the richtexttoolbaractivation value.
//						If ae_richtexttoolbaractivation is NULL, the function returns NULL.
//						If ae_richtexttoolbaractivation is Invalid, the function returns '!'.
//
//	Description:	Converts the richtexttoolbaractivation enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_richtexttoolbaractivation) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_richtexttoolbaractivation

	Case richtexttoolbaractivationalways!
		Return "richtexttoolbaractivationalways"  
	
	Case richtexttoolbaractivationnever!
		Return "richtexttoolbaractivationnever"  
	
	Case richtexttoolbaractivationonedit!
		Return "richtexttoolbaractivationonedit" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_rowfocusind (string as_source, ref rowfocusind ae_rowfocusind);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_rowfocusind
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to rowfocusind datatype value.
//	ae_rowfocusind		A rowfocusind variable passed by reference which will
//							hold the rowfocusind value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a rowfocusind data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_rowfocusind)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "focusrect"
		ae_rowfocusind = focusrect! 
	
	Case "hand"
		ae_rowfocusind = hand! 
	
	Case "off"
		ae_rowfocusind = off! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (rowfocusind ae_rowfocusind);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_rowfocusind	The rowfocusind value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the rowfocusind value.
//						If ae_rowfocusind is NULL, the function returns NULL.
//						If ae_rowfocusind is Invalid, the function returns '!'.
//
//	Description:	Converts the rowfocusind enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_rowfocusind) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_rowfocusind

	Case focusrect!
		Return "focusrect"  
	
	Case hand!
		Return "hand"  
	
	Case off!
		Return "off"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_saveastype (string as_source, ref saveastype ae_saveastype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_saveastype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to saveastype datatype value.
//	ae_saveastype		A saveastype variable passed by reference which will
//							hold the saveastype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a saveastype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_saveastype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "bmp"
		ae_saveastype = bmp! 
	
	Case "clipboard"
		ae_saveastype = clipboard! 
	
	Case "csv"
		ae_saveastype = csv! 
	
	Case "dbase2"
		ae_saveastype = dbase2! 
	
	Case "dbase3"
		ae_saveastype = dbase3! 
	
	Case "dif"
		ae_saveastype = dif! 
	
	Case "emf"
		ae_saveastype = emf! 
	
	Case "excel"
		ae_saveastype = excel! 
	
	Case "excel5"
		ae_saveastype = excel5! 
	
	Case "excel8"
		ae_saveastype = excel8! 
	
	Case "htmltable"
		ae_saveastype = htmltable! 
	
	Case "jpeg"
		ae_saveastype = jpeg! 
	
	Case "pdf"
		ae_saveastype = pdf! 
	
	Case "png"
		ae_saveastype = png! 
	
	Case "psreport"
		ae_saveastype = psreport! 
	
	Case "sqlinsert"
		ae_saveastype = sqlinsert! 
	
	Case "sylk"
		ae_saveastype = sylk! 
	
	Case "text"
		ae_saveastype = text! 
	
	Case "tiff"
		ae_saveastype = tiff! 
	
	Case "wk1"
		ae_saveastype = wk1! 
	
	Case "wks"
		ae_saveastype = wks! 
	
	Case "wmf"
		ae_saveastype = wmf! 
	
	Case "xlsb"
		ae_saveastype = xlsb! 
	
	Case "xlsx"
		ae_saveastype = xlsx! 
	
	Case "xml"
		ae_saveastype = xml! 
	
	Case "xslfo"
		ae_saveastype = xslfo! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (saveastype ae_saveastype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_saveastype	The saveastype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the saveastype value.
//						If ae_saveastype is NULL, the function returns NULL.
//						If ae_saveastype is Invalid, the function returns '!'.
//
//	Description:	Converts the saveastype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_saveastype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_saveastype

	Case bmp!
		Return "bmp"  
	
	Case clipboard!
		Return "clipboard"  
	
	Case csv!
		Return "csv"  
	
	Case dbase2!
		Return "dbase2"  
	
	Case dbase3!
		Return "dbase3"  
	
	Case dif!
		Return "dif"  
	
	Case emf!
		Return "emf"  
	
	Case excel!
		Return "excel"  
	
	Case excel5!
		Return "excel5"  
	
	Case excel8!
		Return "excel8"  
	
	Case htmltable!
		Return "htmltable"  
	
	Case jpeg!
		Return "jpeg"  
	
	Case pdf!
		Return "pdf"  
	
	Case png!
		Return "png"  
	
	Case psreport!
		Return "psreport"  
	
	Case sqlinsert!
		Return "sqlinsert"  
	
	Case sylk!
		Return "sylk"  
	
	Case text!
		Return "text"  
	
	Case tiff!
		Return "tiff"  
	
	Case wk1!
		Return "wk1"  
	
	Case wks!
		Return "wks"  
	
	Case wmf!
		Return "wmf"  
	
	Case xlsb!
		Return "xlsb"  
	
	Case xlsx!
		Return "xlsx"  
	
	Case xml!
		Return "xml"  
	
	Case xslfo!
		Return "xslfo"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_savemetadata (string as_source, ref savemetadata ae_savemetadata);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_savemetadata
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to savemetadata datatype value.
//	ae_savemetadata		A savemetadata variable passed by reference which will
//							hold the savemetadata value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a savemetadata data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_savemetadata)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "metadataexternal"
		ae_savemetadata = metadataexternal!

	Case "metadatainternal"
		ae_savemetadata = metadatainternal!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (savemetadata ae_savemetadata);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_savemetadata	The savemetadata value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the savemetadata value.
//						If ae_savemetadata is NULL, the function returns NULL.
//						If ae_savemetadata is Invalid, the function returns '!'.
//
//	Description:	Converts the savemetadata enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_savemetadata) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_savemetadata

	Case metadataexternal!
		Return "metadataexternal"

	Case metadatainternal!
		Return "metadatainternal"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_scriptkind (string as_source, ref scriptkind ae_scriptkind);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_scriptkind
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to scriptkind datatype value.
//	ae_scriptkind		A scriptkind variable passed by reference which will
//							hold the scriptkind value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a scriptkind data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_scriptkind)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "scriptevent"
		ae_scriptkind = scriptevent!

	Case "scriptfunction"
		ae_scriptkind = scriptfunction!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (scriptkind ae_scriptkind);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_scriptkind	The scriptkind value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the scriptkind value.
//						If ae_scriptkind is NULL, the function returns NULL.
//						If ae_scriptkind is Invalid, the function returns '!'.
//
//	Description:	Converts the scriptkind enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_scriptkind) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_scriptkind

	Case scriptevent!
		Return "scriptevent"

	Case scriptfunction!
		Return "scriptfunction"

End Choose

//Invalid parameter value
Return "!"
end function

public function string of_string (seektype ae_seektype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_seektype	The seektype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the seektype value.
//						If ae_seektype is NULL, the function returns NULL.
//						If ae_seektype is Invalid, the function returns '!'.
//
//	Description:	Converts the seektype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_seektype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_seektype

	Case frombeginning!
		Return "frombeginning"  
	
	Case fromcurrent!
		Return "fromcurrent"  
	
	Case fromend!
		Return "fromend"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_setpostype (string as_source, ref setpostype ae_setpostype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_setpostype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to setpostype datatype value.
//	ae_setpostype		A setpostype variable passed by reference which will
//							hold the setpostype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a setpostype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_setpostype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "behind"
		ae_setpostype = behind! 
	
	Case "notopmost"
		ae_setpostype = notopmost! 
	
	Case "tobottom"
		ae_setpostype = tobottom! 
	
	Case "topmost"
		ae_setpostype = topmost! 
	
	Case "totop"
		ae_setpostype = totop! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (setpostype ae_setpostype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_setpostype	The setpostype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the setpostype value.
//						If ae_setpostype is NULL, the function returns NULL.
//						If ae_setpostype is Invalid, the function returns '!'.
//
//	Description:	Converts the setpostype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_setpostype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_setpostype

	Case behind!
		Return "behind"  
	
	Case notopmost!
		Return "notopmost"  
	
	Case tobottom!
		Return "tobottom"  
	
	Case topmost!
		Return "topmost"  
	
	Case totop!
		Return "totop"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_sizemode (string as_source, ref sizemode ae_sizemode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_sizemode
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to sizemode datatype value.
//	ae_sizemode		A sizemode variable passed by reference which will
//							hold the sizemode value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a sizemode data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_sizemode)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "autosize"
		ae_sizemode = autosize! 
	
	Case "clip"
		ae_sizemode = clip! 
	
	Case "stretch"
		ae_sizemode = stretch! 
	
	Case "zoom"
		ae_sizemode = zoom!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (sizemode ae_sizemode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_sizemode	The sizemode value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the sizemode value.
//						If ae_sizemode is NULL, the function returns NULL.
//						If ae_sizemode is Invalid, the function returns '!'.
//
//	Description:	Converts the sizemode enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_sizemode) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_sizemode

	Case autosize!
		Return "autosize"  
	
	Case clip!
		Return "clip"  
	
	Case stretch!
		Return "stretch"  
	
	Case zoom!
		Return "zoom" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_spacing (string as_source, ref spacing ae_spacing);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_spacing
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to spacing datatype value.
//	ae_spacing		A spacing variable passed by reference which will
//							hold the spacing value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a spacing data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_spacing)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "spacing1"
		ae_spacing = spacing1! 
	
	Case "spacing15"
		ae_spacing = spacing15! 
	
	Case "spacing2"
		ae_spacing = spacing2!
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (spacing ae_spacing);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_spacing	The spacing value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the spacing value.
//						If ae_spacing is NULL, the function returns NULL.
//						If ae_spacing is Invalid, the function returns '!'.
//
//	Description:	Converts the spacing enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_spacing) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_spacing

	Case spacing1!
		Return "spacing1"  
	
	Case spacing15!
		Return "spacing15"  
	
	Case spacing2!
		Return "spacing2" 
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_sqlfunction (string as_source, ref sqlfunction ae_sqlfunction);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_sqlfunction
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to sqlfunction datatype value.
//	ae_sqlfunction		A sqlfunction variable passed by reference which will
//							hold the sqlfunction value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a sqlfunction data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_sqlfunction)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "sqldbdelete"
		ae_sqlfunction = sqldbdelete! 
	
	Case "sqldbinsert"
		ae_sqlfunction = sqldbinsert! 
	
	Case "sqldbothers"
		ae_sqlfunction = sqldbothers! 
	
	Case "sqldbprocedure"
		ae_sqlfunction = sqldbprocedure! 
	
	Case "sqldbrpc"
		ae_sqlfunction = sqldbrpc! 
	
	Case "sqldbselect"
		ae_sqlfunction = sqldbselect! 
	
	Case "sqldbupdate"
		
		ae_sqlfunction = sqldbupdate! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (sqlfunction ae_sqlfunction);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_sqlfunction	The sqlfunction value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the sqlfunction value.
//						If ae_sqlfunction is NULL, the function returns NULL.
//						If ae_sqlfunction is Invalid, the function returns '!'.
//
//	Description:	Converts the sqlfunction enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_sqlfunction) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_sqlfunction

	Case sqldbdelete!
		Return "sqldbdelete"  
	
	Case sqldbinsert!
		Return "sqldbinsert"  
	
	Case sqldbothers!
		Return "sqldbothers"  
	
	Case sqldbprocedure!
		Return "sqldbprocedure"  
	
	Case sqldbrpc!
		Return "sqldbrpc"  
	
	Case sqldbselect!
		Return "sqldbselect"  
	
	Case sqldbupdate!
		Return "sqldbupdate"
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_sqlpreviewfunction (string as_source, ref sqlpreviewfunction ae_sqlpreviewfunction);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_sqlpreviewfunction
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to sqlpreviewfunction datatype value.
//	ae_sqlpreviewfunction		A sqlpreviewfunction variable passed by reference which will
//							hold the sqlpreviewfunction value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a sqlpreviewfunction data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_sqlpreviewfunction)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "previewfunctionreselectrow"
		ae_sqlpreviewfunction = previewfunctionreselectrow! 
	
	Case "previewfunctionretrieve"
		ae_sqlpreviewfunction = previewfunctionretrieve! 
	
	Case "previewfunctionupdate"
		ae_sqlpreviewfunction = previewfunctionupdate! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (sqlpreviewfunction ae_sqlpreviewfunction);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_sqlpreviewfunction	The sqlpreviewfunction value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the sqlpreviewfunction value.
//						If ae_sqlpreviewfunction is NULL, the function returns NULL.
//						If ae_sqlpreviewfunction is Invalid, the function returns '!'.
//
//	Description:	Converts the sqlpreviewfunction enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_sqlpreviewfunction) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_sqlpreviewfunction

	Case previewfunctionreselectrow!
		Return "previewfunctionreselectrow"  
	
	Case previewfunctionretrieve!
		Return "previewfunctionretrieve"  
	
	Case previewfunctionupdate!
		Return "previewfunctionupdate"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_stgreadmode (string as_source, ref stgreadmode ae_stgreadmode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_stgreadmode
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to stgreadmode datatype value.
//	ae_stgreadmode		A stgreadmode variable passed by reference which will
//							hold the stgreadmode value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a stgreadmode data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_stgreadmode)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "stgread"
		ae_stgreadmode = stgread! 
	
	Case "stgreadwrite"
		ae_stgreadmode = stgreadwrite! 
	
	Case "stgwrite"
		ae_stgreadmode = stgwrite! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (stgreadmode ae_stgreadmode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_stgreadmode	The stgreadmode value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the stgreadmode value.
//						If ae_stgreadmode is NULL, the function returns NULL.
//						If ae_stgreadmode is Invalid, the function returns '!'.
//
//	Description:	Converts the stgreadmode enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_stgreadmode) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_stgreadmode

	Case stgread!
		Return "stgread"  
	
	Case stgreadwrite!
		Return "stgreadwrite"  
	
	Case stgwrite!
		Return "stgwrite"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_stgsharemode (string as_source, ref stgsharemode ae_stgsharemode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_stgsharemode
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to stgsharemode datatype value.
//	ae_stgsharemode		A stgsharemode variable passed by reference which will
//							hold the stgsharemode value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a stgsharemode data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_stgsharemode)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "stgdenynone"
		ae_stgsharemode = stgdenynone! 
	
	Case "stgdenyread"
		ae_stgsharemode = stgdenyread! 
	
	Case "stgdenywrite"
		ae_stgsharemode = stgdenywrite! 
	
	Case "stgexclusive"
		ae_stgsharemode = stgexclusive! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (stgsharemode ae_stgsharemode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_stgsharemode	The stgsharemode value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the stgsharemode value.
//						If ae_stgsharemode is NULL, the function returns NULL.
//						If ae_stgsharemode is Invalid, the function returns '!'.
//
//	Description:	Converts the stgsharemode enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_stgsharemode) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_stgsharemode

	Case stgdenynone!
		Return "stgdenynone"  
	
	Case stgdenyread!
		Return "stgdenyread"  
	
	Case stgdenywrite!
		Return "stgdenywrite"  
	
	Case stgexclusive!
		Return "stgexclusive"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_syncprocesstype (string as_source, ref syncprocesstype ae_syncprocesstype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_syncprocesstype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to syncprocesstype datatype value.
//	ae_syncprocesstype		A syncprocesstype variable passed by reference which will
//							hold the syncprocesstype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a syncprocesstype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_syncprocesstype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "bidirectional"
		ae_syncprocesstype = bidirectional! 
	
	Case "downloadonly"
		ae_syncprocesstype = downloadonly! 
	
	Case "uploadonly"
		ae_syncprocesstype = uploadonly! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (syncprocesstype ae_syncprocesstype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_syncprocesstype	The syncprocesstype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the syncprocesstype value.
//						If ae_syncprocesstype is NULL, the function returns NULL.
//						If ae_syncprocesstype is Invalid, the function returns '!'.
//
//	Description:	Converts the syncprocesstype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_syncprocesstype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_syncprocesstype

	Case bidirectional!
		Return "bidirectional"  
	
	Case downloadonly!
		Return "downloadonly"  
	
	Case uploadonly!
		Return "uploadonly"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function string of_string (tabposition ae_tabposition);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_tabposition	The tabposition value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the tabposition value.
//						If ae_tabposition is NULL, the function returns NULL.
//						If ae_tabposition is Invalid, the function returns '!'.
//
//	Description:	Converts the tabposition enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_tabposition) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_tabposition

	Case tabsonbottom!
		Return "tabsonbottom"  
	
	Case tabsonbottomandtop!
		Return "tabsonbottomandtop"  
	
	Case tabsonleft!
		Return "tabsonleft"  
	
	Case tabsonleftandright!
		Return "tabsonleftandright"  
	
	Case tabsonright!
		Return "tabsonright"  
	
	Case tabsonrightandleft!
		Return "tabsonrightandleft"  
	
	Case tabsontop!
		Return "tabsontop"  
	
	Case tabsontopandbottom!
		Return "tabsontopandbottom"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_textcase (string as_source, ref textcase ae_textcase);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_textcase
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to textcase datatype value.
//	ae_textcase		A textcase variable passed by reference which will
//							hold the textcase value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a textcase data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_textcase)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "anycase"
		ae_textcase = anycase! 
	
	Case "lower"
		ae_textcase = lower! 
	
	Case "upper"
		ae_textcase = upper! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_textcase (textcase ae_textcase);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_textcase	The textcase value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the textcase value.
//						If ae_textcase is NULL, the function returns NULL.
//						If ae_textcase is Invalid, the function returns '!'.
//
//	Description:	Converts the textcase enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_textcase) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_textcase

	Case anycase!
		Return "anycase"  
	
	Case lower!
		Return "lower"  
	
	Case upper!
		Return "upper"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_textstyle (string as_source, ref textstyle ae_textstyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_textstyle
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to textstyle datatype value.
//	ae_textstyle		A textstyle variable passed by reference which will
//							hold the textstyle value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a textstyle data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_textstyle)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "bold"
		ae_textstyle = bold! 
	
	Case "italic"
		ae_textstyle = italic! 
	
	Case "strikeout"
		ae_textstyle = strikeout! 
	
	Case "subscript"
		ae_textstyle = subscript! 
	
	Case "superscript"
		ae_textstyle = superscript! 
	
	Case "underlined"
		ae_textstyle = underlined! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (textstyle ae_textstyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_textstyle	The textstyle value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the textstyle value.
//						If ae_textstyle is NULL, the function returns NULL.
//						If ae_textstyle is Invalid, the function returns '!'.
//
//	Description:	Converts the textstyle enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_textstyle) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_textstyle

	Case bold!
		Return "bold"  
	
	Case italic!
		Return "italic"  
	
	Case strikeout!
		Return "strikeout"  
	
	Case subscript!
		Return "subscript"  
	
	Case superscript!
		Return "superscript"  
	
	Case underlined!
		Return "underlined"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_timerkind (string as_source, ref timerkind ae_timerkind);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_timerkind
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to timerkind datatype value.
//	ae_timerkind		A timerkind variable passed by reference which will
//							hold the timerkind value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a timerkind data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_timerkind)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "clock"
		ae_timerkind = clock! 
	
	Case "process"
		ae_timerkind = process! 
	
	Case "thread"
		ae_timerkind = thread! 
	
	Case "timernone"
		ae_timerkind = timernone! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (timerkind ae_timerkind);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_timerkind	The timerkind value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the timerkind value.
//						If ae_timerkind is NULL, the function returns NULL.
//						If ae_timerkind is Invalid, the function returns '!'.
//
//	Description:	Converts the timerkind enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_timerkind) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_timerkind

	Case clock!
		Return "clock"  
	
	Case process!
		Return "process"  
	
	Case thread!
		Return "thread"  
	
	Case timernone!
		Return "timernone"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_toolbarstyle (string as_source, ref toolbarstyle ae_toolbarstyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_toolbarstyle
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to toolbarstyle datatype value.
//	ae_toolbarstyle		A toolbarstyle variable passed by reference which will
//							hold the toolbarstyle value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a toolbarstyle data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_toolbarstyle)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "contemporarytoolbar"
		ae_toolbarstyle = contemporarytoolbar!

	Case "traditionaltoolbar"
		ae_toolbarstyle = traditionaltoolbar!

	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (toolbarstyle ae_toolbarstyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_toolbarstyle	The toolbarstyle value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the toolbarstyle value.
//						If ae_toolbarstyle is NULL, the function returns NULL.
//						If ae_toolbarstyle is Invalid, the function returns '!'.
//
//	Description:	Converts the toolbarstyle enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_toolbarstyle) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_toolbarstyle

	Case contemporarytoolbar!
		Return "contemporarytoolbar"

	Case traditionaltoolbar!
		Return "traditionaltoolbar"

End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_traceactivity (string as_source, ref traceactivity ae_traceactivity);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_traceactivity
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to traceactivity datatype value.
//	ae_traceactivity		A traceactivity variable passed by reference which will
//							hold the traceactivity value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a traceactivity data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_traceactivity)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "actbegin"
		ae_traceactivity = actbegin! 
	
	Case "acterror"
		ae_traceactivity = acterror! 
	
	Case "actesql"
		ae_traceactivity = actesql! 
	
	Case "actgarbagecollect"
		ae_traceactivity = actgarbagecollect! 
	
	Case "actline"
		ae_traceactivity = actline! 
	
	Case "actobjectcreate"
		ae_traceactivity = actobjectcreate! 
	
	Case "actobjectdestroy"
		ae_traceactivity = actobjectdestroy! 
	
	Case "actprofile"
		ae_traceactivity = actprofile! 
	
	Case "actroutine"
		ae_traceactivity = actroutine! 
	
	Case "acttrace"
		ae_traceactivity = acttrace! 
	
	Case "actuser"
		ae_traceactivity = actuser! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (traceactivity ae_traceactivity);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_traceactivity	The traceactivity value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the traceactivity value.
//						If ae_traceactivity is NULL, the function returns NULL.
//						If ae_traceactivity is Invalid, the function returns '!'.
//
//	Description:	Converts the traceactivity enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_traceactivity) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_traceactivity

	Case actbegin!
		Return "actbegin"  
	
	Case acterror!
		Return "acterror"  
	
	Case actesql!
		Return "actesql"  
	
	Case actgarbagecollect!
		Return "actgarbagecollect"  
	
	Case actline!
		Return "actline"  
	
	Case actobjectcreate!
		Return "actobjectcreate"  
	
	Case actobjectdestroy!
		Return "actobjectdestroy"  
	
	Case actprofile!
		Return "actprofile"  
	
	Case actroutine!
		Return "actroutine"  
	
	Case acttrace!
		Return "acttrace"  
	
	Case actuser!
		Return "actuser"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_tracecategory (string as_source, ref tracecategory ae_tracecategory);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_tracecategory
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to tracecategory datatype value.
//	ae_tracecategory		A tracecategory variable passed by reference which will
//							hold the tracecategory value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a tracecategory data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_tracecategory)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "traceatomic"
		ae_tracecategory = traceatomic! 
	
	Case "tracein"
		ae_tracecategory = tracein! 
	
	Case "traceout"
		ae_tracecategory = traceout! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (tracecategory ae_tracecategory);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_tracecategory	The tracecategory value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the tracecategory value.
//						If ae_tracecategory is NULL, the function returns NULL.
//						If ae_tracecategory is Invalid, the function returns '!'.
//
//	Description:	Converts the tracecategory enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_tracecategory) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_tracecategory

	Case traceatomic!
		Return "traceatomic"  
	
	Case tracein!
		Return "tracein"  
	
	Case traceout!
		Return "traceout"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_treenavigation (string as_source, ref treenavigation ae_treenavigation);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_treenavigation
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to treenavigation datatype value.
//	ae_treenavigation		A treenavigation variable passed by reference which will
//							hold the treenavigation value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a treenavigation data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_treenavigation)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "childtreeitem"
		ae_treenavigation = childtreeitem! 
	
	Case "currenttreeitem"
		ae_treenavigation = currenttreeitem! 
	
	Case "drophighlighttreeitem"
		ae_treenavigation = drophighlighttreeitem! 
	
	Case "firstvisibletreeitem"
		ae_treenavigation = firstvisibletreeitem! 
	
	Case "nexttreeitem"
		ae_treenavigation = nexttreeitem! 
	
	Case "nextvisibletreeitem"
		ae_treenavigation = nextvisibletreeitem! 
	
	Case "parenttreeitem"
		ae_treenavigation = parenttreeitem! 
	
	Case "previoustreeitem"
		ae_treenavigation = previoustreeitem! 
	
	Case "previousvisibletreeitem"
		ae_treenavigation = previousvisibletreeitem! 
	
	Case "roottreeitem"
		ae_treenavigation = roottreeitem! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (treenavigation ae_treenavigation);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_treenavigation	The treenavigation value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the treenavigation value.
//						If ae_treenavigation is NULL, the function returns NULL.
//						If ae_treenavigation is Invalid, the function returns '!'.
//
//	Description:	Converts the treenavigation enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_treenavigation) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_treenavigation

	Case childtreeitem!
		Return "childtreeitem"  
	
	Case currenttreeitem!
		Return "currenttreeitem"  
	
	Case drophighlighttreeitem!
		Return "drophighlighttreeitem"  
	
	Case firstvisibletreeitem!
		Return "firstvisibletreeitem"  
	
	Case nexttreeitem!
		Return "nexttreeitem"  
	
	Case nextvisibletreeitem!
		Return "nextvisibletreeitem"  
	
	Case parenttreeitem!
		Return "parenttreeitem"  
	
	Case previoustreeitem!
		Return "previoustreeitem"  
	
	Case previousvisibletreeitem!
		Return "previousvisibletreeitem"  
	
	Case roottreeitem!
		Return "roottreeitem"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_trigevent (string as_source, ref trigevent ae_trigevent);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_trigevent
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to trigevent datatype value.
//	ae_trigevent		A trigevent variable passed by reference which will
//							hold the trigevent value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a trigevent data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_trigevent)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "activate"
		ae_trigevent = activate! 
	
	Case "begindrag"
		ae_trigevent = begindrag! 
	
	Case "beginlabeledit"
		ae_trigevent = beginlabeledit! 
	
	Case "beginrightdrag"
		ae_trigevent = beginrightdrag! 
	
	Case "clicked"
		ae_trigevent = clicked! 
	
	Case "close"
		ae_trigevent = close! 
	
	Case "closequery"
		ae_trigevent = closequery! 
	
	Case "collapsed"
		ae_trigevent = collapsed! 
	
	Case "collapsing"
		ae_trigevent = collapsing! 
	
	Case "columnclick"
		ae_trigevent = columnclick! 
	
	Case "constructor"
		ae_trigevent = constructor! 
	
	Case "datachange"
		ae_trigevent = datachange! 
	
	Case "datechanged"
		ae_trigevent = datechanged! 
	
	Case "dberror"
		ae_trigevent = dberror! 
	
	Case "deactivate"
		ae_trigevent = deactivate! 
	
	Case "deleteallitems"
		ae_trigevent = deleteallitems! 
	
	Case "deleteitem"
		ae_trigevent = deleteitem! 
	
	Case "destructor"
		ae_trigevent = destructor! 
	
	Case "doubleclicked"
		ae_trigevent = doubleclicked! 
	
	Case "dragdrop"
		ae_trigevent = dragdrop! 
	
	Case "dragenter"
		ae_trigevent = dragenter! 
	
	Case "dragleave"
		ae_trigevent = dragleave! 
	
	Case "dragwithin"
		ae_trigevent = dragwithin! 
	
	Case "editchanged"
		ae_trigevent = editchanged! 
	
	Case "endlabeledit"
		ae_trigevent = endlabeledit! 
	
	Case "expanded"
		ae_trigevent = expanded! 
	
	Case "expanding"
		ae_trigevent = expanding! 
	
	Case "fileexists"
		ae_trigevent = fileexists! 
	
	Case "gesture"
		ae_trigevent = gesture! 
	
	Case "getfocus"
		ae_trigevent = getfocus! 
	
	Case "hide"
		ae_trigevent = hide! 
	
	Case "hotlinkalarm"
		ae_trigevent = hotlinkalarm! 
	
	Case "idle"
		ae_trigevent = idle! 
	
	Case "inputfieldselected"
		ae_trigevent = inputfieldselected! 
	
	Case "insertitem"
		ae_trigevent = insertitem! 
	
	Case "itemchanged"
		ae_trigevent = itemchanged! 
	
	Case "itemchanging"
		ae_trigevent = itemchanging! 
	
	Case "itemcollapsed"
		ae_trigevent = itemcollapsed! 
	
	Case "itemcollapsing"
		ae_trigevent = itemcollapsing! 
	
	Case "itemerror"
		ae_trigevent = itemerror! 
	
	Case "itemexpanded"
		ae_trigevent = itemexpanded! 
	
	Case "itemexpanding"
		ae_trigevent = itemexpanding! 
	
	Case "itemfocuschanged"
		ae_trigevent = itemfocuschanged! 
	
	Case "itempopulate"
		ae_trigevent = itempopulate! 
	
	Case "key"
		ae_trigevent = key! 
	
	Case "linedown"
		ae_trigevent = linedown! 
	
	Case "lineleft"
		ae_trigevent = lineleft! 
	
	Case "lineright"
		ae_trigevent = lineright! 
	
	Case "lineup"
		ae_trigevent = lineup! 
	
	Case "losefocus"
		ae_trigevent = losefocus! 
	
	Case "modified"
		ae_trigevent = modified! 
	
	Case "mousedown"
		ae_trigevent = mousedown! 
	
	Case "mousemove"
		ae_trigevent = mousemove! 
	
	Case "mouseup"
		ae_trigevent = mouseup! 
	
	Case "moved"
		ae_trigevent = moved! 
	
	Case "notify"
		ae_trigevent = notify! 
	
	Case "open"
		ae_trigevent = open! 
	
	Case "other"
		ae_trigevent = other! 
	
	Case "pagedown"
		ae_trigevent = pagedown! 
	
	Case "pageleft"
		ae_trigevent = pageleft! 
	
	Case "pageright"
		ae_trigevent = pageright! 
	
	Case "pageup"
		ae_trigevent = pageup! 
	
	Case "pictureselected"
		ae_trigevent = pictureselected! 
	
	Case "pipeend"
		ae_trigevent = pipeend! 
	
	Case "pipemeter"
		ae_trigevent = pipemeter! 
	
	Case "pipestart"
		ae_trigevent = pipestart! 
	
	Case "printend"
		ae_trigevent = printend! 
	
	Case "printfooter"
		ae_trigevent = printfooter! 
	
	Case "printheader"
		ae_trigevent = printheader! 
	
	Case "printpage"
		ae_trigevent = printpage! 
	
	Case "printstart"
		ae_trigevent = printstart! 
	
	Case "rbuttondown"
		ae_trigevent = rbuttondown! 
	
	Case "rbuttonup"
		ae_trigevent = rbuttonup! 
	
	Case "recognitionresult"
		ae_trigevent = recognitionresult! 
	
	Case "remoteexec"
		ae_trigevent = remoteexec! 
	
	Case "remotehotlinkstart"
		ae_trigevent = remotehotlinkstart! 
	
	Case "remotehotlinkstop"
		ae_trigevent = remotehotlinkstop! 
	
	Case "remoterequest"
		ae_trigevent = remoterequest! 
	
	Case "remotesend"
		ae_trigevent = remotesend! 
	
	Case "rename"
		ae_trigevent = rename! 
	
	Case "resize"
		ae_trigevent = resize! 
	
	Case "retrieveend"
		ae_trigevent = retrieveend! 
	
	Case "retrieverow"
		ae_trigevent = retrieverow! 
	
	Case "retrievestart"
		ae_trigevent = retrievestart! 
	
	Case "rightclicked"
		ae_trigevent = rightclicked! 
	
	Case "rightdoubleclicked"
		ae_trigevent = rightdoubleclicked! 
	
	Case "rowfocuschanged"
		ae_trigevent = rowfocuschanged! 
	
	Case "save"
		ae_trigevent = save! 
	
	Case "scrollhorizontal"
		ae_trigevent = scrollhorizontal! 
	
	Case "scrollvertical"
		ae_trigevent = scrollvertical! 
	
	Case "selected"
		ae_trigevent = selected! 
	
	Case "selectionchanged"
		ae_trigevent = selectionchanged! 
	
	Case "selectionchanging"
		ae_trigevent = selectionchanging! 
	
	Case "show"
		ae_trigevent = show! 
	
	Case "sort"
		ae_trigevent = sort! 
	
	Case "sqlpreview"
		ae_trigevent = sqlpreview! 
	
	Case "stroke"
		ae_trigevent = stroke! 
	
	Case "systemerror"
		ae_trigevent = systemerror! 
	
	Case "systemkey"
		ae_trigevent = systemkey! 
	
	Case "timer"
		ae_trigevent = timer! 
	
	Case "toolbarmoved"
		ae_trigevent = toolbarmoved! 
	
	Case "treenodeselected"
		ae_trigevent = treenodeselected! 
	
	Case "treenodeselecting"
		ae_trigevent = treenodeselecting! 
	
	Case "updateend"
		ae_trigevent = updateend! 
	
	Case "updatestart"
		ae_trigevent = updatestart! 
	
	Case "viewchange"
		ae_trigevent = viewchange! 
	
	Case "wserror"
		ae_trigevent = wserror! 
			
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (trigevent ae_trigevent);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_trigevent	The trigevent value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the trigevent value.
//						If ae_trigevent is NULL, the function returns NULL.
//						If ae_trigevent is Invalid, the function returns '!'.
//
//	Description:	Converts the trigevent enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_trigevent) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_trigevent

	Case activate!
		Return "activate"  
	
	Case begindrag!
		Return "begindrag"  
	
	Case beginlabeledit!
		Return "beginlabeledit"  
	
	Case beginrightdrag!
		Return "beginrightdrag"  
	
	Case clicked!
		Return "clicked"  
	
	Case close!
		Return "close"  
	
	Case closequery!
		Return "closequery"  
	
	Case collapsed!
		Return "collapsed"  
	
	Case collapsing!
		Return "collapsing"  
	
	Case columnclick!
		Return "columnclick"  
	
	Case constructor!
		Return "constructor"  
	
	Case datachange!
		Return "datachange"  
	
	Case datechanged!
		Return "datechanged"  
	
	Case dberror!
		Return "dberror"  
	
	Case deactivate!
		Return "deactivate"  
	
	Case deleteallitems!
		Return "deleteallitems"  
	
	Case deleteitem!
		Return "deleteitem"  
	
	Case destructor!
		Return "destructor"  
	
	Case doubleclicked!
		Return "doubleclicked"  
	
	Case dragdrop!
		Return "dragdrop"  
	
	Case dragenter!
		Return "dragenter"  
	
	Case dragleave!
		Return "dragleave"  
	
	Case dragwithin!
		Return "dragwithin"  
	
	Case editchanged!
		Return "editchanged"  
	
	Case endlabeledit!
		Return "endlabeledit"  
	
	Case expanded!
		Return "expanded"  
	
	Case expanding!
		Return "expanding"  
	
	Case fileexists!
		Return "fileexists"  
	
	Case gesture!
		Return "gesture"  
	
	Case getfocus!
		Return "getfocus"  
	
	Case hide!
		Return "hide"  
	
	Case hotlinkalarm!
		Return "hotlinkalarm"  
	
	Case idle!
		Return "idle"  
	
	Case inputfieldselected!
		Return "inputfieldselected"  
	
	Case insertitem!
		Return "insertitem"  
	
	Case itemchanged!
		Return "itemchanged"  
	
	Case itemchanging!
		Return "itemchanging"  
	
	Case itemcollapsed!
		Return "itemcollapsed"  
	
	Case itemcollapsing!
		Return "itemcollapsing"  
	
	Case itemerror!
		Return "itemerror"  
	
	Case itemexpanded!
		Return "itemexpanded"  
	
	Case itemexpanding!
		Return "itemexpanding"  
	
	Case itemfocuschanged!
		Return "itemfocuschanged"  
	
	Case itempopulate!
		Return "itempopulate"  
	
	Case key!
		Return "key"  
	
	Case linedown!
		Return "linedown"  
	
	Case lineleft!
		Return "lineleft"  
	
	Case lineright!
		Return "lineright"  
	
	Case lineup!
		Return "lineup"  
	
	Case losefocus!
		Return "losefocus"  
	
	Case modified!
		Return "modified"  
	
	Case mousedown!
		Return "mousedown"  
	
	Case mousemove!
		Return "mousemove"  
	
	Case mouseup!
		Return "mouseup"  
	
	Case moved!
		Return "moved"  
	
	Case notify!
		Return "notify"  
	
	Case open!
		Return "open"  
	
	Case other!
		Return "other"  
	
	Case pagedown!
		Return "pagedown"  
	
	Case pageleft!
		Return "pageleft"  
	
	Case pageright!
		Return "pageright"  
	
	Case pageup!
		Return "pageup"  
	
	Case pictureselected!
		Return "pictureselected"  
	
	Case pipeend!
		Return "pipeend"  
	
	Case pipemeter!
		Return "pipemeter"  
	
	Case pipestart!
		Return "pipestart"  
	
	Case printend!
		Return "printend"  
	
	Case printfooter!
		Return "printfooter"  
	
	Case printheader!
		Return "printheader"  
	
	Case printpage!
		Return "printpage"  
	
	Case printstart!
		Return "printstart"  
	
	Case rbuttondown!
		Return "rbuttondown"  
	
	Case rbuttonup!
		Return "rbuttonup"  
	
	Case recognitionresult!
		Return "recognitionresult"  
	
	Case remoteexec!
		Return "remoteexec"  
	
	Case remotehotlinkstart!
		Return "remotehotlinkstart"  
	
	Case remotehotlinkstop!
		Return "remotehotlinkstop"  
	
	Case remoterequest!
		Return "remoterequest"  
	
	Case remotesend!
		Return "remotesend"  
	
	Case rename!
		Return "rename"  
	
	Case resize!
		Return "resize"  
	
	Case retrieveend!
		Return "retrieveend"  
	
	Case retrieverow!
		Return "retrieverow"  
	
	Case retrievestart!
		Return "retrievestart"  
	
	Case rightclicked!
		Return "rightclicked"  
	
	Case rightdoubleclicked!
		Return "rightdoubleclicked"  
	
	Case rowfocuschanged!
		Return "rowfocuschanged"  
	
	Case save!
		Return "save"  
	
	Case scrollhorizontal!
		Return "scrollhorizontal"  
	
	Case scrollvertical!
		Return "scrollvertical"  
	
	Case selected!
		Return "selected"  
	
	Case selectionchanged!
		Return "selectionchanged"  
	
	Case selectionchanging!
		Return "selectionchanging"  
	
	Case show!
		Return "show"  
	
	Case sort!
		Return "sort"  
	
	Case sqlpreview!
		Return "sqlpreview"  
	
	Case stroke!
		Return "stroke"  
	
	Case systemerror!
		Return "systemerror"  
	
	Case systemkey!
		Return "systemkey"  
	
	Case timer!
		Return "timer"  
	
	Case toolbarmoved!
		Return "toolbarmoved"  
	
	Case treenodeselected!
		Return "treenodeselected"  
	
	Case treenodeselecting!
		Return "treenodeselecting"  
	
	Case updateend!
		Return "updateend"  
	
	Case updatestart!
		Return "updatestart"  
	
	Case viewchange!
		Return "viewchange"  
	
	Case wserror!
		Return "wserror"  
			
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_typecategory (string as_source, ref typecategory ae_typecategory);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_typecategory
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to typecategory datatype value.
//	ae_typecategory		A typecategory variable passed by reference which will
//							hold the typecategory value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a typecategory data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_typecategory)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "classorstructuretype"
		ae_typecategory = classorstructuretype! 
	
	Case "enumeratedtype"
		ae_typecategory = enumeratedtype! 
	
	Case "simpletype"
		ae_typecategory = simpletype! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (typecategory ae_typecategory);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_typecategory	The typecategory value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the typecategory value.
//						If ae_typecategory is NULL, the function returns NULL.
//						If ae_typecategory is Invalid, the function returns '!'.
//
//	Description:	Converts the typecategory enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_typecategory) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_typecategory

	Case classorstructuretype!
		Return "classorstructuretype"  
	
	Case enumeratedtype!
		Return "enumeratedtype"  
	
	Case simpletype!
		Return "simpletype"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_userobjects (string as_source, ref userobjects ae_userobjects);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_userobjects
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to userobjects datatype value.
//	ae_userobjects		A userobjects variable passed by reference which will
//							hold the userobjects value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a userobjects data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_userobjects)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "customvisual"
		ae_userobjects = customvisual! 
	
	Case "externalvisual"
		ae_userobjects = externalvisual! 
	
	Case "vbxvisual"
		ae_userobjects = vbxvisual! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (userobjects ae_userobjects);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_userobjects	The userobjects value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the userobjects value.
//						If ae_userobjects is NULL, the function returns NULL.
//						If ae_userobjects is Invalid, the function returns '!'.
//
//	Description:	Converts the userobjects enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_userobjects) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_userobjects

	Case customvisual!
		Return "customvisual"  
	
	Case externalvisual!
		Return "externalvisual"  
	
	Case vbxvisual!
		Return "vbxvisual"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_valschemetype (string as_source, ref valschemetype ae_valschemetype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_valschemetype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to valschemetype datatype value.
//	ae_valschemetype		A valschemetype variable passed by reference which will
//							hold the valschemetype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a valschemetype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_valschemetype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "valalways"
		ae_valschemetype = valalways! 
	
	Case "valauto"
		ae_valschemetype = valauto! 
	
	Case "valnever"
		ae_valschemetype = valnever! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (valschemetype ae_valschemetype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_valschemetype	The valschemetype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the valschemetype value.
//						If ae_valschemetype is NULL, the function returns NULL.
//						If ae_valschemetype is Invalid, the function returns '!'.
//
//	Description:	Converts the valschemetype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_valschemetype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_valschemetype

	Case valalways!
		Return "valalways"  
	
	Case valauto!
		Return "valauto"  
	
	Case valnever!
		Return "valnever"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_varaccess (string as_source, ref varaccess ae_varaccess);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_varaccess
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to varaccess datatype value.
//	ae_varaccess		A varaccess variable passed by reference which will
//							hold the varaccess value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a varaccess data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_varaccess)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "private"
		ae_varaccess = private! 
	
	Case "protected"
		ae_varaccess = protected! 
	
	Case "public"
		ae_varaccess = public! 
	
	Case "system"
		ae_varaccess = system! 
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (varaccess ae_varaccess);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_varaccess	The varaccess value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the varaccess value.
//						If ae_varaccess is NULL, the function returns NULL.
//						If ae_varaccess is Invalid, the function returns '!'.
//
//	Description:	Converts the varaccess enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_varaccess) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_varaccess

	Case private!
		Return "private"  
	
	Case protected!
		Return "protected"  
	
	Case public!
		Return "public"  
	
	Case system!
		Return "system"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_variablecardinalitytype (string as_source, ref variablecardinalitytype ae_variablecardinalitytype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_variablecardinalitytype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to variablecardinalitytype datatype value.
//	ae_variablecardinalitytype		A variablecardinalitytype variable passed by reference which will
//							hold the variablecardinalitytype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a variablecardinalitytype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_variablecardinalitytype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "boundedarray"
		ae_variablecardinalitytype = boundedarray! 
	
	Case "scalartype"
		ae_variablecardinalitytype = scalartype! 
	
	Case "unboundedarray"
		ae_variablecardinalitytype = unboundedarray! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (variablecardinalitytype ae_variablecardinalitytype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_variablecardinalitytype	The variablecardinalitytype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the variablecardinalitytype value.
//						If ae_variablecardinalitytype is NULL, the function returns NULL.
//						If ae_variablecardinalitytype is Invalid, the function returns '!'.
//
//	Description:	Converts the variablecardinalitytype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_variablecardinalitytype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_variablecardinalitytype

	Case boundedarray!
		Return "boundedarray"  
	
	Case scalartype!
		Return "scalartype"  
	
	Case unboundedarray!
		Return "unboundedarray"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_variablekind (string as_source, ref variablekind ae_variablekind);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_variablekind
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to variablekind datatype value.
//	ae_variablekind		A variablekind variable passed by reference which will
//							hold the variablekind value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a variablekind data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_variablekind)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "variableargument"
		ae_variablekind = variableargument! 
	
	Case "variableglobal"
		ae_variablekind = variableglobal! 
	
	Case "variableinstance"
		ae_variablekind = variableinstance! 
	
	Case "variablelocal"
		ae_variablekind = variablelocal! 
	
	Case "variableshared"
		ae_variablekind = variableshared! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (variablekind ae_variablekind);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_variablekind	The variablekind value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the variablekind value.
//						If ae_variablekind is NULL, the function returns NULL.
//						If ae_variablekind is Invalid, the function returns '!'.
//
//	Description:	Converts the variablekind enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_variablekind) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_variablekind

	Case variableargument!
		Return "variableargument"  
	
	Case variableglobal!
		Return "variableglobal"  
	
	Case variableinstance!
		Return "variableinstance"  
	
	Case variablelocal!
		Return "variablelocal"  
	
	Case variableshared!
		Return "variableshared"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_vtextalign (string as_source, ref vtextalign ae_vtextalign);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_vtextalign
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to vtextalign datatype value.
//	ae_vtextalign		A vtextalign variable passed by reference which will
//							hold the vtextalign value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a vtextalign data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_vtextalign)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "bottom"
		ae_vtextalign = bottom! 
	
	Case "multiline"
		ae_vtextalign = multiline! 
	
	Case "top"
		ae_vtextalign = top! 
	
	Case "vcenter"
		ae_vtextalign = vcenter! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (vtextalign ae_vtextalign);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_vtextalign	The vtextalign value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the vtextalign value.
//						If ae_vtextalign is NULL, the function returns NULL.
//						If ae_vtextalign is Invalid, the function returns '!'.
//
//	Description:	Converts the vtextalign enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_vtextalign) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_vtextalign

	Case bottom!
		Return "bottom"  
	
	Case multiline!
		Return "multiline"  
	
	Case top!
		Return "top"  
	
	Case vcenter!
		Return "vcenter"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_vtickmarks (string as_source, ref vtickmarks ae_vtickmarks);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_vtickmarks
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to vtickmarks datatype value.
//	ae_vtickmarks		A vtickmarks variable passed by reference which will
//							hold the vtickmarks value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a vtickmarks data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_vtickmarks)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "vticksonboth"
		ae_vtickmarks = vticksonboth! 
	
	Case "vticksonleft"
		ae_vtickmarks = vticksonleft! 
	
	Case "vticksonneither"
		ae_vtickmarks = vticksonneither! 
	
	Case "vticksonright"
		ae_vtickmarks = vticksonright! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (vtickmarks ae_vtickmarks);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_vtickmarks	The vtickmarks value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the vtickmarks value.
//						If ae_vtickmarks is NULL, the function returns NULL.
//						If ae_vtickmarks is Invalid, the function returns '!'.
//
//	Description:	Converts the vtickmarks enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_vtickmarks) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_vtickmarks

	Case vticksonboth!
		Return "vticksonboth"  
	
	Case vticksonleft!
		Return "vticksonleft"  
	
	Case vticksonneither!
		Return "vticksonneither"  
	
	Case vticksonright!
		Return "vticksonright"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_webpagingmethod (string as_source, ref webpagingmethod ae_webpagingmethod);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_webpagingmethod
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to webpagingmethod datatype value.
//	ae_webpagingmethod		A webpagingmethod variable passed by reference which will
//							hold the webpagingmethod value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a webpagingmethod data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_webpagingmethod)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "callback"
		ae_webpagingmethod = callback! 
	
	Case "postback"
		ae_webpagingmethod = postback! 
	
	Case "xmlclientside"
		ae_webpagingmethod = xmlclientside! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (webpagingmethod ae_webpagingmethod);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_webpagingmethod	The webpagingmethod value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the webpagingmethod value.
//						If ae_webpagingmethod is NULL, the function returns NULL.
//						If ae_webpagingmethod is Invalid, the function returns '!'.
//
//	Description:	Converts the webpagingmethod enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_webpagingmethod) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_webpagingmethod

	Case callback!
		Return "callback"  
	
	Case postback!
		Return "postback"  
	
	Case xmlclientside!
		Return "xmlclientside"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_weekday (string as_source, ref weekday ae_weekday);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_weekday
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to weekday datatype value.
//	ae_weekday		A weekday variable passed by reference which will
//							hold the weekday value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a weekday data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_weekday)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "friday"
		ae_weekday = friday! 
	
	Case "monday"
		ae_weekday = monday! 
	
	Case "saturday"
		ae_weekday = saturday! 
	
	Case "sunday"
		ae_weekday = sunday! 
	
	Case "thursday"
		ae_weekday = thursday! 
	
	Case "tuesday"
		ae_weekday = tuesday! 
	
	Case "wednesday"
		ae_weekday = wednesday! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (weekday ae_weekday);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_weekday	The weekday value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the weekday value.
//						If ae_weekday is NULL, the function returns NULL.
//						If ae_weekday is Invalid, the function returns '!'.
//
//	Description:	Converts the weekday enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_weekday) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_weekday

	Case friday!
		Return "friday"  
	
	Case monday!
		Return "monday"  
	
	Case saturday!
		Return "saturday"  
	
	Case sunday!
		Return "sunday"  
	
	Case thursday!
		Return "thursday"  
	
	Case tuesday!
		Return "tuesday"  
	
	Case wednesday!
		Return "wednesday"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_windowanimationstyle (string as_source, ref windowanimationstyle ae_windowanimationstyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_windowanimationstyle
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to windowanimationstyle datatype value.
//	ae_windowanimationstyle		A windowanimationstyle variable passed by reference which will
//							hold the windowanimationstyle value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a windowanimationstyle data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_windowanimationstyle)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "bottomroll"
		ae_windowanimationstyle = bottomroll! 
	
	Case "bottomslide"
		ae_windowanimationstyle = bottomslide! 
	
	Case "centeranimation"
		ae_windowanimationstyle = centeranimation! 
	
	Case "fadeanimation"
		ae_windowanimationstyle = fadeanimation! 
	
	Case "leftroll"
		ae_windowanimationstyle = leftroll! 
	
	Case "leftslide"
		ae_windowanimationstyle = leftslide! 
	
	Case "noanimation"
		ae_windowanimationstyle = noanimation! 
	
	Case "rightroll"
		ae_windowanimationstyle = rightroll! 
	
	Case "rightslide"
		ae_windowanimationstyle = rightslide! 
	
	Case "toproll"
		ae_windowanimationstyle = toproll! 
	
	Case "topslide"
		ae_windowanimationstyle = topslide! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (windowanimationstyle ae_windowanimationstyle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_windowanimationstyle	The windowanimationstyle value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the windowanimationstyle value.
//						If ae_windowanimationstyle is NULL, the function returns NULL.
//						If ae_windowanimationstyle is Invalid, the function returns '!'.
//
//	Description:	Converts the windowanimationstyle enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_windowanimationstyle) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_windowanimationstyle

	Case bottomroll!
		Return "bottomroll"  
	
	Case bottomslide!
		Return "bottomslide"  
	
	Case centeranimation!
		Return "centeranimation"  
	
	Case fadeanimation!
		Return "fadeanimation"  
	
	Case leftroll!
		Return "leftroll"  
	
	Case leftslide!
		Return "leftslide"  
	
	Case noanimation!
		Return "noanimation"  
	
	Case rightroll!
		Return "rightroll"  
	
	Case rightslide!
		Return "rightslide"  
	
	Case toproll!
		Return "toproll"  
	
	Case topslide!
		Return "topslide"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_windowtype (string as_source, ref windowtype ae_windowtype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_windowtype
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to windowtype datatype value.
//	ae_windowtype		A windowtype variable passed by reference which will
//							hold the windowtype value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a windowtype data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_windowtype)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "child"
		ae_windowtype = child! 
	
	Case "main"
		ae_windowtype = main! 
	
	Case "mdi"
		ae_windowtype = mdi! 
	
	Case "mdihelp"
		ae_windowtype = mdihelp! 
	
	Case "popup"
		ae_windowtype = popup! 
	
	Case "response"
		ae_windowtype = response! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (windowtype ae_windowtype);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_windowtype	The windowtype value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the windowtype value.
//						If ae_windowtype is NULL, the function returns NULL.
//						If ae_windowtype is Invalid, the function returns '!'.
//
//	Description:	Converts the windowtype enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_windowtype) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_windowtype

	Case child!
		Return "child"  
	
	Case main!
		Return "main"  
	
	Case mdi!
		Return "mdi"  
	
	Case mdihelp!
		Return "mdihelp"  
	
	Case popup!
		Return "popup"  
	
	Case response!
		Return "response"  
		
End Choose

//Invalid parameter value
Return "!"
end function

public function integer of_writemode (string as_source, ref writemode ae_writemode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_writemode
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string value to be converted to writemode datatype value.
//	ae_writemode		A writemode variable passed by reference which will
//							hold the writemode value that the string value was
//							converted to.
//
//	Returns: 		integer	 
//						1 if a successful conversion was made.
//						If as_source value is NULL, function returns -1
//						If as_source value is Invalid, function returns -1
//
//	Description:  Converts a string value to a writemode data type value.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	SetNull( ae_writemode)
	return -1
End If

// Lower Source parameter
as_source = Lower( as_source )

// Convert String

Choose Case as_source

	Case "append"
		ae_writemode = append! 
	
	Case "replace"
		ae_writemode = replace! 
	
	Case Else
		// Wrong Parameter Value
		return -1
End Choose

// Conversion done
Return 1
end function

public function string of_string (writemode ae_writemode);//////////////////////////////////////////////////////////////////////////////
//
//	Function:		of_String
//
//	Access:			public
//
//	Arguments:
//	ae_writemode	The writemode value to be converted to a string.
//
//	Returns:  		string		
//						A string representation of the writemode value.
//						If ae_writemode is NULL, the function returns NULL.
//						If ae_writemode is Invalid, the function returns '!'.
//
//	Description:	Converts the writemode enumerated datatype to a 
//						readable string representation.
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
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(ae_writemode) Then
	String ls_null
	SetNull(ls_null)
	Return ls_null
End If

Choose Case ae_writemode

	Case append!
		Return "append"  
	
	Case replace!
		Return "replace"  
		
End Choose

//Invalid parameter value
Return "!"
end function

on pfc_n_cst_conversion.create
call super::create
end on

on pfc_n_cst_conversion.destroy
call super::destroy
end on

