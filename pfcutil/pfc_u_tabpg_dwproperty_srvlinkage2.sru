HA$PBExportHeader$pfc_u_tabpg_dwproperty_srvlinkage2.sru
$PBExportComments$PFC DataWindow Property - The Linkage service tabpage 2
forward
global type pfc_u_tabpg_dwproperty_srvlinkage2 from u_tabpg_dwproperty_base
end type
type cbx_confirmondelete from u_cbx within pfc_u_tabpg_dwproperty_srvlinkage2
end type
type cbx_confirmonrowchange from u_cbx within pfc_u_tabpg_dwproperty_srvlinkage2
end type
type cbx_synconkeychange from u_cbx within pfc_u_tabpg_dwproperty_srvlinkage2
end type
type st_label_deletestyle from u_st within pfc_u_tabpg_dwproperty_srvlinkage2
end type
type st_label_savesound from u_st within pfc_u_tabpg_dwproperty_srvlinkage2
end type
type sle_savesound from u_sle within pfc_u_tabpg_dwproperty_srvlinkage2
end type
type st_label_updatestyle from u_st within pfc_u_tabpg_dwproperty_srvlinkage2
end type
type ddlb_updatestyle from u_ddlb within pfc_u_tabpg_dwproperty_srvlinkage2
end type
type ddlb_deletestyle from u_ddlb within pfc_u_tabpg_dwproperty_srvlinkage2
end type
type gb_updateonrowchange from u_gb within pfc_u_tabpg_dwproperty_srvlinkage2
end type
type gb_retrievestyleoptions from u_gb within pfc_u_tabpg_dwproperty_srvlinkage2
end type
type ddlb_customupdate from u_ddlb within pfc_u_tabpg_dwproperty_srvlinkage2
end type
type st_customupdate from u_st within pfc_u_tabpg_dwproperty_srvlinkage2
end type
type cbx_updateonrowchange from u_cbx within pfc_u_tabpg_dwproperty_srvlinkage2
end type
end forward

global type pfc_u_tabpg_dwproperty_srvlinkage2 from u_tabpg_dwproperty_base
cbx_confirmondelete cbx_confirmondelete
cbx_confirmonrowchange cbx_confirmonrowchange
cbx_synconkeychange cbx_synconkeychange
st_label_deletestyle st_label_deletestyle
st_label_savesound st_label_savesound
sle_savesound sle_savesound
st_label_updatestyle st_label_updatestyle
ddlb_updatestyle ddlb_updatestyle
ddlb_deletestyle ddlb_deletestyle
gb_updateonrowchange gb_updateonrowchange
gb_retrievestyleoptions gb_retrievestyleoptions
ddlb_customupdate ddlb_customupdate
st_customupdate st_customupdate
cbx_updateonrowchange cbx_updateonrowchange
end type
global pfc_u_tabpg_dwproperty_srvlinkage2 pfc_u_tabpg_dwproperty_srvlinkage2

type variables
Protected:

integer ii_deletestyle = -1
integer ii_updatestyle = -1
integer ii_customupdate = -1
end variables

forward prototypes
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
end prototypes

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
//	 Gets the Object Information.
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
anv_infoattrib.is_name = 'DW Property Linkage Service'
anv_infoattrib.is_description = 'DW Property Linkage Service'

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

// The Property Tab Text.
anv_attrib.is_propertytabtext ='Options'

Return 1
end function

on pfc_u_tabpg_dwproperty_srvlinkage2.create
int iCurrent
call super::create
this.cbx_confirmondelete=create cbx_confirmondelete
this.cbx_confirmonrowchange=create cbx_confirmonrowchange
this.cbx_synconkeychange=create cbx_synconkeychange
this.st_label_deletestyle=create st_label_deletestyle
this.st_label_savesound=create st_label_savesound
this.sle_savesound=create sle_savesound
this.st_label_updatestyle=create st_label_updatestyle
this.ddlb_updatestyle=create ddlb_updatestyle
this.ddlb_deletestyle=create ddlb_deletestyle
this.gb_updateonrowchange=create gb_updateonrowchange
this.gb_retrievestyleoptions=create gb_retrievestyleoptions
this.ddlb_customupdate=create ddlb_customupdate
this.st_customupdate=create st_customupdate
this.cbx_updateonrowchange=create cbx_updateonrowchange
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_confirmondelete
this.Control[iCurrent+2]=this.cbx_confirmonrowchange
this.Control[iCurrent+3]=this.cbx_synconkeychange
this.Control[iCurrent+4]=this.st_label_deletestyle
this.Control[iCurrent+5]=this.st_label_savesound
this.Control[iCurrent+6]=this.sle_savesound
this.Control[iCurrent+7]=this.st_label_updatestyle
this.Control[iCurrent+8]=this.ddlb_updatestyle
this.Control[iCurrent+9]=this.ddlb_deletestyle
this.Control[iCurrent+10]=this.gb_updateonrowchange
this.Control[iCurrent+11]=this.gb_retrievestyleoptions
this.Control[iCurrent+12]=this.ddlb_customupdate
this.Control[iCurrent+13]=this.st_customupdate
this.Control[iCurrent+14]=this.cbx_updateonrowchange
end on

on pfc_u_tabpg_dwproperty_srvlinkage2.destroy
call super::destroy
destroy(this.cbx_confirmondelete)
destroy(this.cbx_confirmonrowchange)
destroy(this.cbx_synconkeychange)
destroy(this.st_label_deletestyle)
destroy(this.st_label_savesound)
destroy(this.sle_savesound)
destroy(this.st_label_updatestyle)
destroy(this.ddlb_updatestyle)
destroy(this.ddlb_deletestyle)
destroy(this.gb_updateonrowchange)
destroy(this.gb_retrievestyleoptions)
destroy(this.ddlb_customupdate)
destroy(this.st_customupdate)
destroy(this.cbx_updateonrowchange)
end on

event pfc_propertypopulate;call super::pfc_propertypopulate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		pfc_propertypopulate
//
//	Arguments:  	None
//
//	Returns:   		Integer
//   1 if it succeeds.
//	 -1 if an error occurs.
//
//	Description:  	
//	Populate the screen edit controls with the current service values.
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

integer 	li_rc
integer	li_style

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_linkage) or Not IsValid(idw_requestor.inv_linkage) Then
	Return -1
End If

// Disable Retrieve Style only options.
If idw_requestor.inv_linkage.of_GetStyle() <> idw_requestor.inv_linkage.RETRIEVE Then
	cbx_updateonrowchange.Enabled = False
End If

// Get the current Delete style.
li_style = idw_requestor.inv_linkage.of_GetDeleteStyle()
// The delete style attributes start at 0, the ddlb index start at 1.
ii_deletestyle = li_style + 1
li_rc = ddlb_deletestyle.SelectItem(ii_deletestyle)

// Get the current Update style.
li_style = idw_requestor.inv_linkage.of_GetUpdateStyle()
ii_updatestyle = li_style
// The update styles are (1 through 4) and then the Custom (5).
If ii_updatestyle >= 5 Then ii_updatestyle = 5
li_rc = ddlb_updatestyle.SelectItem(ii_updatestyle)
ddlb_updatestyle.Event SelectionChanged(ii_updatestyle)

// Get the current Custom Update style.
li_style = idw_requestor.inv_linkage.of_GetCustomUpdate()
ii_customupdate = li_style
// The update styles are (1 through 9).
If ii_customupdate >= 10 Then ii_customupdate = 10
li_rc = ddlb_customupdate.SelectItem(ii_customupdate)

// Determine if Visible Only columns is enabled.
cbx_synconkeychange.Checked = idw_requestor.inv_linkage.of_isSyncOnKeyChange()

// Determine if Update On Row Change is enabled.
cbx_updateonrowchange.Checked = idw_requestor.inv_linkage.of_isUpdateOnRowChange()
cbx_updateonrowchange.Event Clicked()

// Determine if Confirm On Row Change is enabled.
cbx_confirmonrowchange.Checked = idw_requestor.inv_linkage.of_isConfirmOnRowChange()

// Determine if Confirm On Delete is enabled.
cbx_confirmondelete.Checked = idw_requestor.inv_linkage.of_isConfirmOnDelete()

// Get the current Sound File style.
sle_savesound.Text = idw_requestor.inv_linkage.of_GetSaveSound()

Return 1

end event

event pfc_propertyapply;call super::pfc_propertyapply;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		pfc_PropertyApply
//
//	Arguments:  	None
//
//	Returns:   		Integer
//   1 if it succeeds.
//	 -1 if an error occurs.
//
//	Description:  		
//	 Apply the requested changes.
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

integer 	li_rc
integer	li_stylecurrent, li_styledesired
boolean	lb_current, lb_desired
string	ls_current, ls_desired

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_linkage) or Not IsValid(idw_requestor.inv_linkage) Then
	Return -1
End If

// -- Sync On Key Change. --
lb_current = idw_requestor.inv_linkage.of_isSyncOnKeyChange()
lb_desired = cbx_synconkeychange.Checked
// If the desired value differs from the current value.
If  lb_current<> lb_desired Then
	li_rc = idw_requestor.inv_linkage.of_SetSyncOnKeyChange(lb_desired)
End If

// -- Delete Style. --
li_stylecurrent = idw_requestor.inv_linkage.of_GetDeleteStyle()
li_styledesired = ii_deletestyle - 1
// If the desired value differs from the current value.
If li_styledesired >= 0 And li_stylecurrent <> li_styledesired Then
	li_rc = idw_requestor.inv_linkage.of_SetDeleteStyle(li_styledesired)
End If

// -- Update Style. --
li_stylecurrent = idw_requestor.inv_linkage.of_GetUpdateStyle()
// The update styles are (1 through 4) and then the Custom (101).
If ii_updatestyle >= 5 Then 
	li_styledesired = 101
Else
	li_styledesired = ii_updatestyle
End If
// If the desired value differs from the current value.
If li_styledesired >= 0 And li_stylecurrent <> li_styledesired Then
	li_rc = idw_requestor.inv_linkage.of_SetUpdateStyle(li_styledesired)
End If

If ii_updatestyle > 100 Then
	// -- Custom Update. --
	li_stylecurrent = idw_requestor.inv_linkage.of_GetCustomUpdate()
	li_styledesired = ii_customupdate
	// If the desired value differs from the current value.
	If li_styledesired >= 0 And li_stylecurrent <> li_styledesired Then
		li_rc = idw_requestor.inv_linkage.of_SetCustomUpdate(li_styledesired)
	End If
End If

// Retrieve Style only options.
If idw_requestor.inv_linkage.of_GetStyle() = idw_requestor.inv_linkage.RETRIEVE Then
	// -- Update On Row Change. --
	lb_current = idw_requestor.inv_linkage.of_isUpdateOnRowChange()
	lb_desired = cbx_updateonrowchange.Checked
	// If the desired value differs from the current value.
	If  lb_current<> lb_desired Then
		li_rc = idw_requestor.inv_linkage.of_SetUpdateOnRowChange(lb_desired)
	End If

	// Update On Row Change only options.
	If cbx_updateonrowchange.Checked Then
		// -- Confirm On Row Change. --
		lb_current = idw_requestor.inv_linkage.of_isConfirmOnRowChange()
		lb_desired = cbx_confirmonrowchange.Checked
		// If the desired value differs from the current value.
		If  lb_current<> lb_desired Then
			li_rc = idw_requestor.inv_linkage.of_SetConfirmOnRowChange(lb_desired)
		End If

		// -- Confirm On Delete. --
		lb_current = idw_requestor.inv_linkage.of_isConfirmOnDelete()
		lb_desired = cbx_confirmondelete.Checked
		// If the desired value differs from the current value.
		If lb_current<> lb_desired Then
			li_rc = idw_requestor.inv_linkage.of_SetConfirmOnDelete(lb_desired)
		End If

		// -- Sound File. --
		ls_current = Upper(Trim(idw_requestor.inv_linkage.of_GetSaveSound()))
		ls_desired = Upper(Trim(sle_savesound.Text))
		// If the desired value differs from the current value.
		If ls_current<> ls_desired Then
			li_rc = idw_requestor.inv_linkage.of_SetSaveSound(ls_desired)
		End If

	End If
End If

Return 1

end event

event pfc_propertysyntax;call super::pfc_propertysyntax;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		pfc_propertysyntax
//
//	Access:    		Public
//
//	Arguments:  	None
//
//	Returns:   		String
//	  The syntax required to create the currently selections.
//   '!' in error
//
//	Description:  
//	Create the required syntax to match the current selections.
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

integer	li_upper
integer	li_cnt
integer 	li_rc
integer	li_styledesired
string	ls_desired
string	ls_syntax
boolean	lb_desired
n_cst_conversion lnv_conversion

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return '!'
End If
If IsNull(idw_requestor.inv_linkage) or Not IsValid(idw_requestor.inv_linkage) Then
	Return '!'
End If


// -- Sync On Key Change. --
lb_desired = cbx_synconkeychange.Checked
ls_syntax += '~r~nThis.inv_linkage.of_SetSyncOnKeyChange('+lnv_conversion.of_String(lb_desired)+')'

// -- Delete Style. --
li_styledesired = ii_deletestyle - 1
Choose Case li_styledesired
	Case idw_requestor.inv_linkage.DEFAULT
		ls_syntax += '~r~nThis.inv_linkage.of_SetDeleteStyle(inv_linkage.DEFAULT)'
	Case idw_requestor.inv_linkage.DELETE_ROWS 
		ls_syntax += '~r~nThis.inv_linkage.of_SetDeleteStyle(inv_linkage.DELETE_ROWS)'		
	Case idw_requestor.inv_linkage.DISCARD_ROWS
		ls_syntax += '~r~nThis.inv_linkage.of_SetDeleteStyle(inv_linkage.DISCARD_ROWS)'
	Case Else
		ls_syntax += '~r~nThis.inv_linkage.of_SetDeleteStyle('+String(li_styledesired)+')'		
End Choose

// -- Update Style. --
// The update styles are (1 through 4) and then the Custom (101).
If ii_updatestyle >= 5 Then
	li_styledesired = 101
Else
	li_styledesired = ii_updatestyle
End If
Choose Case li_styledesired
	Case idw_requestor.inv_linkage.TOPDOWN
		ls_syntax += '~r~nThis.inv_linkage.of_SetUpdateStyle(inv_linkage.TOPDOWN)'
	Case idw_requestor.inv_linkage.BOTTOMUP 
		ls_syntax += '~r~nThis.inv_linkage.of_SetUpdateStyle(inv_linkage.BOTTOMUP)'		
	Case idw_requestor.inv_linkage.TOPDOWN_BOTTOMUP 
		ls_syntax += '~r~nThis.inv_linkage.of_SetUpdateStyle(inv_linkage.TOPDOWN_BOTTOMUP)'
	Case idw_requestor.inv_linkage.BOTTOMUP_TOPDOWN 
		ls_syntax += '~r~nThis.inv_linkage.of_SetUpdateStyle(inv_linkage.BOTTOMUP_TOPDOWN)'
	Case idw_requestor.inv_linkage.CUSTOM 
		ls_syntax += '~r~nThis.inv_linkage.of_SetUpdateStyle(inv_linkage.CUSTOM)'		
	Case Else
		ls_syntax += '~r~nThis.inv_linkage.of_SetUpdateStyle('+String(li_styledesired)+')'		
End Choose

// The update styles are (1 through 4) and then the Custom (101).
If ii_updatestyle >= 5 Then
	// -- Custom Update. --
	li_styledesired = ii_customupdate
	ls_syntax += '~r~nThis.inv_linkage.of_SetCustomUpdate('+String(li_styledesired)+')'		
End If

// Retrieve Style only options.
If idw_requestor.inv_linkage.of_GetStyle() = idw_requestor.inv_linkage.RETRIEVE Then
	// -- Update On Row Change. --
	lb_desired = cbx_updateonrowchange.Checked
	ls_syntax += '~r~nThis.inv_linkage.of_SetUpdateOnRowChange('+lnv_conversion.of_String(lb_desired)+')'

	// Update On Row Change only options.
	If cbx_updateonrowchange.Checked Then
		// -- Confirm On Row Change. --
		lb_desired = cbx_confirmonrowchange.Checked
		ls_syntax += '~r~nThis.inv_linkage.of_SetConfirmOnRowChange('+lnv_conversion.of_String(lb_desired)+')'
	
		// -- Confirm On Delete. --
		lb_desired = cbx_confirmondelete.Checked
		ls_syntax += '~r~nThis.inv_linkage.of_SetConfirmOnDelete('+lnv_conversion.of_String(lb_desired)+')'

		// -- Sound File. --
		ls_desired = Trim(sle_savesound.Text)
		ls_syntax += '~r~nThis.inv_linkage.of_SetSaveSound("'+ls_desired+'")'	
	End If
End If

Return ls_syntax


Return ls_syntax

end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		constructor
//
//	Description:  	
//	
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

ddlb_updatestyle.Sorted = False
ddlb_deletestyle.Sorted = False
ddlb_customupdate.Sorted = False
end event

type cbx_confirmondelete from u_cbx within pfc_u_tabpg_dwproperty_srvlinkage2
integer x = 247
integer y = 976
integer width = 1207
integer height = 68
integer taborder = 70
string text = "Confirm on &delete"
end type

type cbx_confirmonrowchange from u_cbx within pfc_u_tabpg_dwproperty_srvlinkage2
integer x = 247
integer y = 852
integer width = 1207
integer height = 68
integer taborder = 60
boolean bringtotop = true
string text = "Confirm on row &change"
end type

type cbx_synconkeychange from u_cbx within pfc_u_tabpg_dwproperty_srvlinkage2
integer x = 27
integer y = 36
integer width = 1678
integer height = 68
integer taborder = 10
boolean bringtotop = true
string text = "&Synchronize key on change"
end type

type st_label_deletestyle from u_st within pfc_u_tabpg_dwproperty_srvlinkage2
integer x = 27
integer y = 168
integer width = 690
boolean bringtotop = true
string text = "&Delete style:"
end type

type st_label_savesound from u_st within pfc_u_tabpg_dwproperty_srvlinkage2
integer x = 247
integer y = 1100
integer width = 480
boolean bringtotop = true
string text = "Sa&ve sound:"
end type

type sle_savesound from u_sle within pfc_u_tabpg_dwproperty_srvlinkage2
integer x = 745
integer y = 1092
integer width = 722
integer height = 80
integer taborder = 80
integer accelerator = 118
end type

type st_label_updatestyle from u_st within pfc_u_tabpg_dwproperty_srvlinkage2
integer x = 27
integer y = 296
integer width = 690
boolean bringtotop = true
string text = "&Update style:"
end type

type ddlb_updatestyle from u_ddlb within pfc_u_tabpg_dwproperty_srvlinkage2
integer x = 759
integer y = 296
integer width = 887
integer height = 272
integer taborder = 30
boolean sorted = false
string item[] = {"TopDown","BottomUp","TopDown BottomUp","BottomUp TopDown","Custom"}
integer accelerator = 117
end type

event selectionchanged;call super::selectionchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		selectionchanged
//
//	Arguments:  	
//	index New selection
//
//	Returns:   	None
//
//	Description:  	
//	Notification that the update style has been changed.
//	Store the last selected style.
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

ii_updatestyle = index

// If custom index (5).  Make the object available.
ddlb_customupdate.Enabled = (index = 5)

end event

type ddlb_deletestyle from u_ddlb within pfc_u_tabpg_dwproperty_srvlinkage2
integer x = 759
integer y = 168
integer width = 887
integer height = 272
integer taborder = 20
boolean bringtotop = true
boolean sorted = false
string item[] = {"Default","Delete Rows","Discard Rows"}
integer accelerator = 100
end type

event selectionchanged;call super::selectionchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		selectionchanged
//
//	Arguments:  	None
//
//	Returns:   		None
//
//	Description:  	
//	Store the last selected style.
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

// Store the last selected style.
ii_deletestyle = index
end event

type gb_updateonrowchange from u_gb within pfc_u_tabpg_dwproperty_srvlinkage2
integer x = 87
integer y = 728
integer width = 1490
integer height = 528
integer taborder = 0
string text = ""
end type

type gb_retrievestyleoptions from u_gb within pfc_u_tabpg_dwproperty_srvlinkage2
integer x = 27
integer y = 612
integer width = 1605
integer height = 680
integer taborder = 0
string text = "Retrieve style"
end type

type ddlb_customupdate from u_ddlb within pfc_u_tabpg_dwproperty_srvlinkage2
integer x = 759
integer y = 424
integer width = 887
integer height = 272
integer taborder = 40
boolean sorted = false
string item[] = {"1","2","3","4","5","6","7","8","9","Unknown"}
integer accelerator = 109
end type

event selectionchanged;call super::selectionchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		selectionchanged
//
//	Arguments:  	None
//
//	Returns:   		None
//
//	Description:  	
//	Store the last selected style.
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

// Store the last selected style.
ii_customupdate = index
end event

type st_customupdate from u_st within pfc_u_tabpg_dwproperty_srvlinkage2
integer x = 27
integer y = 424
integer width = 690
boolean bringtotop = true
string text = "Custo&m update:"
end type

type cbx_updateonrowchange from u_cbx within pfc_u_tabpg_dwproperty_srvlinkage2
integer x = 174
integer y = 724
integer width = 1207
integer height = 68
integer taborder = 50
boolean bringtotop = true
string text = "Update on &row change"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  		clicked
//
//	Arguments:  	None
//
//	Returns:   		None
//
//	Description:  		
//	 Enable or Disable the update on row change attributes.
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

boolean lb_available

lb_available = this.Checked

cbx_confirmonrowchange.Enabled = lb_available
cbx_confirmondelete.Enabled = lb_available
st_label_savesound.Enabled = lb_available
sle_savesound.Enabled = lb_available
end event

