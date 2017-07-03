HA$PBExportHeader$pfc_u_tabpg_dwproperty_services.sru
$PBExportComments$PFC DataWindow Property - The services tabpage
forward
global type pfc_u_tabpg_dwproperty_services from u_tabpg_dwproperty_base
end type
type dw_services from u_dw within pfc_u_tabpg_dwproperty_services
end type
type st_servicesavailable from u_st within pfc_u_tabpg_dwproperty_services
end type
type cb_property from u_cb within pfc_u_tabpg_dwproperty_services
end type
type cb_enable from u_cb within pfc_u_tabpg_dwproperty_services
end type
type cb_disable from u_cb within pfc_u_tabpg_dwproperty_services
end type
type mle_description from u_mle within pfc_u_tabpg_dwproperty_services
end type
type gb_description from u_gb within pfc_u_tabpg_dwproperty_services
end type
end forward

global type pfc_u_tabpg_dwproperty_services from u_tabpg_dwproperty_base
event type integer pfc_propertyapplyimmediate ( string as_servicename,  boolean ab_desiredstate )
event type integer pfc_propertyload ( )
event type integer pfc_propertypopulate ( )
event type integer pfc_propertyenablebuttons ( )
event type integer pfc_propertydescription ( )
dw_services dw_services
st_servicesavailable st_servicesavailable
cb_property cb_property
cb_enable cb_enable
cb_disable cb_disable
mle_description mle_description
gb_description gb_description
end type
global pfc_u_tabpg_dwproperty_services pfc_u_tabpg_dwproperty_services

type variables
Protected:

// Enable/Disable constants.
constant string	SERVICE_ENABLED  ='Y'
constant string	SERVICE_DISABLED ='N'

// PFC objects/services constants.
constant integer	DDCALCULATOR =1
constant integer	DDCALENDAR =2
constant integer 	DDSEARCH =3
constant integer	FILTER =4
constant integer 	FIND =5
constant integer 	LINKAGE =6
constant integer	MULTITABLE =7
constant integer 	PRINTPREVIEW =8
constant integer	QUERYMODE =9
constant integer	REPORT =10
constant integer 	REQCOLUMN =11
constant integer 	RESIZE =12
constant integer 	ROWMANAGER =13
constant integer 	ROWSELECT =14
constant integer 	SORT=15

// Temporary storage for the PFC objects.
string		is_object[]
string		is_description[]
string		is_classname[]
string		is_propertypages[]
boolean		ib_switchbuttons[]


end variables

event pfc_propertyapplyimmediate;call super::pfc_propertyapplyimmediate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyApplyImmediate
//
//	Arguments:  
//	 as_servicename	The name of the service which needs to be applied.
//	 ab_desiredstate	The state(T/F) to which the service should be set.
//
//	Returns: Integer
//	 1 = The state was changed.
//  0 = The state was already on the desired setting.
// -1 = Error 
//  -2 = The service was not recognized.  Must likely this is an object on the extension layers.
//
//	Description:  	Change the setting for the service.
//
//	*Note: This should be extended to support non-PFC services.
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

integer	li_rc
integer	li_upper
integer	li_cnt
integer	li_obj
boolean	lb_currentstate

// Check required reference.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If

// Loop to determine if the Object is one of the PFC objects.
li_upper = UpperBound (is_object)
For li_cnt = 1 to li_upper
	If as_servicename = is_object[li_cnt] Then
		li_obj = li_cnt
		Exit
	End If
Next

// Check if object was found in PFC objects loop.
If li_obj > 0 Then
	Choose Case li_obj
		// If the current and desired state do not match, change to the desired state.			
		Case DDCALCULATOR
			lb_currentstate = (IsValid(idw_requestor.iuo_calculator))
			If lb_currentstate <> ab_desiredstate Then
				li_rc = idw_requestor.of_SetDropDownCalculator(ab_desiredstate)
				Return 1
			End If
			Return 0
		Case DDCALENDAR
			lb_currentstate = (IsValid(idw_requestor.iuo_calendar))
			If lb_currentstate <> ab_desiredstate Then
				li_rc = idw_requestor.of_SetDropDownCalendar(ab_desiredstate)
				Return 1
			End If
			Return 0			
		Case DDSEARCH
			lb_currentstate = (IsValid(idw_requestor.inv_dropdownsearch))	
			If lb_currentstate <> ab_desiredstate Then
				li_rc = idw_requestor.of_SetDropDownSearch(ab_desiredstate)
				Return 1
			End If
			Return 0					
		Case FILTER
			lb_currentstate = (IsValid(idw_requestor.inv_filter))
			If lb_currentstate <> ab_desiredstate Then
				li_rc = idw_requestor.of_SetFilter(ab_desiredstate)
				Return 1
			End If
			Return 0					
		Case FIND
			lb_currentstate = (IsValid(idw_requestor.inv_find))
			If lb_currentstate <> ab_desiredstate Then
				li_rc = idw_requestor.of_SetFind(ab_desiredstate)
				Return 1
			End If
			Return 0					
		Case LINKAGE
			lb_currentstate = (IsValid(idw_requestor.inv_linkage))
			If lb_currentstate <> ab_desiredstate Then
				li_rc = idw_requestor.of_SetLinkage(ab_desiredstate)
				Return 1
			End If
			Return 0					
		Case MULTITABLE
			lb_currentstate = (IsValid(idw_requestor.inv_multitable))
			If lb_currentstate <> ab_desiredstate Then
				li_rc = idw_requestor.of_SetMultitable(ab_desiredstate)
				Return 1
			End If
			Return 0					
		Case PRINTPREVIEW
			lb_currentstate = (IsValid(idw_requestor.inv_printpreview))
			If lb_currentstate <> ab_desiredstate Then
				li_rc = idw_requestor.of_SetPrintPreview(ab_desiredstate)
				Return 1
			End If
			Return 0					
		Case QUERYMODE
			lb_currentstate = (IsValid(idw_requestor.inv_querymode))
			If lb_currentstate <> ab_desiredstate Then
				li_rc = idw_requestor.of_SetQueryMode(ab_desiredstate)					
				Return 1
			End If
			Return 0					
		Case REPORT
			lb_currentstate = (IsValid(idw_requestor.inv_report))
			If lb_currentstate <> ab_desiredstate Then
				li_rc = idw_requestor.of_SetReport(ab_desiredstate)
				Return 1
			End If
			Return 0					
		Case REQCOLUMN
			lb_currentstate = (IsValid(idw_requestor.inv_reqcolumn))
			If lb_currentstate <> ab_desiredstate Then
				li_rc = idw_requestor.of_SetReqColumn(ab_desiredstate)
				Return 1
			End If
			Return 0					
		Case RESIZE
			lb_currentstate = (IsValid(idw_requestor.inv_resize))
			If lb_currentstate <> ab_desiredstate Then
				li_rc = idw_requestor.of_SetResize(ab_desiredstate)			
				Return 1
			End If
			Return 0					
		Case ROWMANAGER
			lb_currentstate = (IsValid(idw_requestor.inv_rowmanager))
			If lb_currentstate <> ab_desiredstate Then
				li_rc = idw_requestor.of_SetRowManager(ab_desiredstate)	
				Return 1
			End If
			Return 0					
		Case ROWSELECT
			lb_currentstate = (IsValid(idw_requestor.inv_rowselect))
			If lb_currentstate <> ab_desiredstate Then
				li_rc = idw_requestor.of_SetRowSelect(ab_desiredstate)
				Return 1
			End If
			Return 0					
		Case SORT
			lb_currentstate = (IsValid(idw_requestor.inv_sort))
			If lb_currentstate <> ab_desiredstate Then
				li_rc = idw_requestor.of_SetSort(ab_desiredstate)
				Return 1
			End If
			Return 0					
		Case Else
			// A supposedly PFC object that is not known?
			Return -1
	End Choose	
End If

// Not recognized.
Return -2
end event

event pfc_propertyload;call super::pfc_propertyload;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyLoad
//
//	Arguments:  None
//
//	Returns: Integer
//	 1 = The values were populated.
//
//	Description:  	Populate the desired name and description for each PFC service.
//
//	*Note: This event can be extended to change the name, description, or 
//		classname of the PFC	services. 
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

any			la_rc
integer		li_cnt
integer		li_tabcnt
integer		li_uppertab
integer		li_upper
string		ls_object[]
powerobject lpo_object
n_cst_propertyattrib	lnv_propertyattrib
n_cst_propertyattrib	lnv_empty

// Ensure that the right Index (Constant) is associated to the desired UserObject.
ls_object[ddcalculator] = 'u_calculator'
ls_object[ddcalendar] = 'u_calendar'
ls_object[ddsearch] = 'n_cst_dwsrv_dropdownsearch'
ls_object[filter] = 'n_cst_dwsrv_filter'
ls_object[find] = 'n_cst_dwsrv_find'
ls_object[linkage] = 'n_cst_dwsrv_linkage'
ls_object[multitable] = 'n_cst_dwsrv_multitable'
ls_object[printpreview] = 'n_cst_dwsrv_printpreview'
ls_object[queryMode] = 'n_cst_dwsrv_querymode'
ls_object[report] = 'n_cst_dwsrv_report'
ls_object[reqcolumn] = 'n_cst_dwsrv_reqcolumn'
ls_object[resize] = 'n_cst_dwsrv_resize'
ls_object[rowmanager] = 'n_cst_dwsrv_rowmanager'
ls_object[rowselect] = 'n_cst_dwsrv_rowselection'
ls_object[sort] = 'n_cst_dwsrv_sort'

li_upper = UpperBound(ls_object)
For li_cnt = 1 to li_upper
	lpo_object = Create Using ls_object[li_cnt]
	If IsValid(lpo_object) Then
		// Clear the attributes.
		lnv_propertyattrib = lnv_empty
		
		// Make a Dynamic call to get the attributes.
		la_rc = lpo_object.Dynamic of_GetPropertyInfo(lnv_propertyattrib)
		If ClassName(la_rc) = 'integer' or ClassName(la_rc)='long' Then
			If la_rc < 0 Then Return -1
			
			// -- Gather the attributes. --
			is_classname[li_cnt] = lpo_object.ClassName()			
			is_object[li_cnt] = lnv_propertyattrib.is_name
			If Len(Trim(is_object[li_cnt])) = 0 Then is_object[li_cnt] = is_classname[li_cnt]
			is_description[li_cnt] = lnv_propertyattrib.is_description
			is_propertypages[li_cnt] = '' // Initialize to insure entry is found in array.
			// Create tab delimited list of desired tabpages.
			li_uppertab = UpperBound(lnv_propertyattrib.is_propertypage)
			For li_tabcnt = 1 to li_uppertab
				If li_tabcnt > 1 Then is_propertypages[li_cnt] += '~t'
				is_propertypages[li_cnt] += lnv_propertyattrib.is_propertypage[li_tabcnt]
			Next
			ib_switchbuttons[li_cnt] = lnv_propertyattrib.ib_switchbuttons
		Else
			Return -1
		End If
		Destroy lpo_object
	End If
Next

Return 1
end event

event pfc_propertypopulate;call super::pfc_propertypopulate;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyPopulate
//
//	Arguments:  None
//
//	Returns: Integer
//	 1 = successful
// -1 = Error
//
//	Description:  	Populate the current service settings on to the visual datawindow.
//
//	*Note: This should be extended to support non-PFC services.
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

Integer 	li_row
Integer	li_upper
Integer	li_cnt
String	ls_yesno
String	ls_enabled

// Validate the required reference.
If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then
	Return -1
End If

// Populate the desired name and description for each service.
this.Event pfc_PropertyLoad()

li_upper = UpperBound(is_object)
For li_cnt = 1 to li_upper
	If Len(is_object[li_cnt]) > 0 Then
		li_row = dw_services.InsertRow(0)
		If li_row > 0 Then
			dw_services.Object.servicename.Primary[li_row] = is_object[li_cnt]
			dw_services.Object.servicedescription.Primary[li_row] = is_description[li_cnt]
			dw_services.Object.serviceclassname.Primary[li_row] = is_classname[li_cnt]	
			dw_services.Object.servicepropertypages.Primary[li_row] = is_propertypages[li_cnt]
			If ib_switchbuttons[li_cnt] Then ls_yesno='Y' Else ls_yesno='N'
			dw_services.Object.serviceswitchbuttons.Primary[li_row] = ls_yesno
			
			ls_enabled = SERVICE_DISABLED // Initialize
			Choose Case li_cnt
				Case DDCALCULATOR
					If IsValid(idw_requestor.iuo_calculator) Then ls_enabled = SERVICE_ENABLED
				Case DDCALENDAR
					If IsValid(idw_requestor.iuo_calendar) Then ls_enabled = SERVICE_ENABLED
				Case DDSEARCH
					If IsValid(idw_requestor.inv_dropdownsearch) Then ls_enabled = SERVICE_ENABLED			
				Case FILTER
					If IsValid(idw_requestor.inv_filter) Then ls_enabled = SERVICE_ENABLED
				Case FIND
					If IsValid(idw_requestor.inv_find) Then ls_enabled = SERVICE_ENABLED
				Case LINKAGE
					If IsValid(idw_requestor.inv_linkage) Then ls_enabled = SERVICE_ENABLED
				Case MULTITABLE
					If IsValid(idw_requestor.inv_multitable) Then ls_enabled = SERVICE_ENABLED
				Case PRINTPREVIEW
					If IsValid(idw_requestor.inv_printpreview) Then ls_enabled = SERVICE_ENABLED
				Case QUERYMODE
					If IsValid(idw_requestor.inv_querymode) Then ls_enabled = SERVICE_ENABLED
				Case REPORT
					If IsValid(idw_requestor.inv_report) Then ls_enabled = SERVICE_ENABLED
				Case REQCOLUMN
					If IsValid(idw_requestor.inv_reqcolumn) Then ls_enabled = SERVICE_ENABLED
				Case RESIZE
					If IsValid(idw_requestor.inv_resize) Then ls_enabled = SERVICE_ENABLED
				Case ROWMANAGER
					If IsValid(idw_requestor.inv_rowmanager) Then ls_enabled = SERVICE_ENABLED
				Case ROWSELECT
					If IsValid(idw_requestor.inv_rowselect) Then ls_enabled = SERVICE_ENABLED
				Case SORT
					If IsValid(idw_requestor.inv_sort) Then ls_enabled = SERVICE_ENABLED
			End Choose
			dw_services.Object.serviceenabled.Primary[li_row] = ls_enabled
		End If	
	End If
Next

// Refresh the description.
this.Event pfc_PropertyDescription()

// Refresh the available buttons.
this.Event pfc_PropertyEnableButtons()

Return 1
end event

event pfc_propertyenablebuttons;call super::pfc_propertyenablebuttons;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyEnableButtons
//
//	Arguments: None
//
//	Return:	integer
//	 1 if it succeeds.
// -1 error.
//
//	Description: 
//	As appropriate, Enable or Disable the buttons.
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

long		ll_currentrow
string	ls_pages

// Get the current row.
ll_currentrow = dw_services.GetRow()
If ll_currentrow <= 0 Then
	// Disable all buttons.
	cb_disable.Enabled = False
	cb_enable.Enabled = False
	cb_property.Enabled = False
	Return -1
End If

// As appropriate, Enable or Disable the Switch buttons.	
If Upper(dw_services.Object.serviceswitchbuttons.Primary[ll_currentrow]) = 'Y' Then
	If dw_services.Object.serviceenabled.Primary[ll_currentrow] = SERVICE_ENABLED Then
		cb_disable.Enabled = True
		cb_enable.Enabled = False			
	Else
		cb_disable.Enabled = False		
		cb_enable.Enabled = True			
	End If
Else
	// Note: The datawindow itemchanged will also prevent the switch.
	cb_disable.Enabled = False		
	cb_enable.Enabled = False			
End If

// As appropriate, Enable or Disable the Property button.
If dw_services.Object.serviceenabled.Primary[ll_currentrow] = SERVICE_ENABLED Then
	ls_pages = Trim(dw_services.Object.servicepropertypages.Primary[ll_currentrow])
	cb_property.Enabled = (Len(ls_pages) > 0)
Else
	cb_property.Enabled = False
End If

Return 1
end event

event pfc_propertydescription;call super::pfc_propertydescription;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyDescription
//
//	Arguments:	None
//
//	Return:	integer
//	 1 if it succeeds.
// -1 error.
//
//	Description: 
//	Display the appropriate description.
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

long	ll_currentrow

// Get the current row.
ll_currentrow = dw_services.GetRow()

If ll_currentrow > 0 Then
	// Display the appropriate description.
	mle_description.Text = dw_services.Object.servicedescription[ll_currentrow]
Else
	// Blank out the description.
	mle_description.Text = ''
	Return -1
End If

Return 1
end event

on pfc_u_tabpg_dwproperty_services.create
int iCurrent
call super::create
this.dw_services=create dw_services
this.st_servicesavailable=create st_servicesavailable
this.cb_property=create cb_property
this.cb_enable=create cb_enable
this.cb_disable=create cb_disable
this.mle_description=create mle_description
this.gb_description=create gb_description
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_services
this.Control[iCurrent+2]=this.st_servicesavailable
this.Control[iCurrent+3]=this.cb_property
this.Control[iCurrent+4]=this.cb_enable
this.Control[iCurrent+5]=this.cb_disable
this.Control[iCurrent+6]=this.mle_description
this.Control[iCurrent+7]=this.gb_description
end on

on pfc_u_tabpg_dwproperty_services.destroy
call super::destroy
destroy(this.dw_services)
destroy(this.st_servicesavailable)
destroy(this.cb_property)
destroy(this.cb_enable)
destroy(this.cb_disable)
destroy(this.mle_description)
destroy(this.gb_description)
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Constructor
//
//	Description:  
//	The main dwproperty TabPage.
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


end event

event pfc_propertyapply;call super::pfc_propertyapply;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  pfc_PropertyApply
//
//	Arguments:  None
//
//	Returns: Integer
//	 1 = successful
// -1 = Error
//
//	Description:  	Apply all outstanding changes.
//
// *Note: Notice the behavior of the object in which settings to 'Enabled or True' are 
//		applied immediately and settings to 'Disabled or False' are applied
//		at the last possible moment.  This is done in order not to loose any internal
//		values of the specific service when an user turns it 'from Enabled to Disabled to Enabled'.
//
//	*Note: Notice the 'pfc_applyothers' event call which can be used to support 
// 	non-PFC services.
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

integer 	li_upper
integer	li_return =1
integer 	li_cnt
integer	li_rc
string	ls_servicename
boolean	lb_currentstate
boolean	lb_desiredstate

// Validate the required reference.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If

// Loop around all objects.
li_upper = dw_services.RowCount()
For li_cnt = 1 to li_upper
	
	// Get the service name.
	ls_servicename = dw_services.Object.servicename.Primary[li_cnt]

	// Get the desired state.
	lb_desiredstate = (dw_services.Object.serviceenabled.Primary[li_cnt] = SERVICE_ENABLED)

	// Desired state of True should have already been turned on.
	If lb_desiredstate Then Continue
	
	// Set to the desired state.
	li_rc = this.Event pfc_PropertyApplyImmediate(ls_servicename, lb_desiredstate)
	If li_rc < 0 Then 
		// Continue processing but keep track that at least one failed.
		li_return = -1
	End If
Next

Return li_return
end event

event pfc_propertyopen;call super::pfc_propertyopen;////////////////////////////////////////////////////////////////////////////////
////
////	Event:  pfc_PropertyOpen
////
////	Arguments:  None
////
////	Returns: Integer
////	 1 = successful
//// -1 = Error
////
////	Description:  	Perform Opening processes.
////
////////////////////////////////////////////////////////////////////////////////
////	
////	Revision History
////
////	Version
////	6.0   Initial version
////
////////////////////////////////////////////////////////////////////////////////
////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
////
////////////////////////////////////////////////////////////////////////////////
//
//integer	li_rc
//
////Populate the current service settings on to the visual datawindow.
//li_rc = this.Event pfc_PropertyPopulate()
//
//// Refresh the description.
//this.Event pfc_PropertyDescription()
//
//// Refresh the available buttons.
//this.Event pfc_PropertyEnableButtons()
//
//Return li_rc
Return 1
end event

type dw_services from u_dw within pfc_u_tabpg_dwproperty_services
integer x = 32
integer y = 116
integer width = 1696
integer height = 612
integer taborder = 10
string dataobject = "d_dwproperty_services"
end type

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  itemchanged
//
//	Description:  	Catch the turning of the services on/off.
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

string 	ls_servicename

If IsNull(dwo) then Return
If row <=0 Then Return 

If dwo.Name = 'serviceenabled' Then

	// Check if the state can be changed.
	If Upper(dw_services.Object.serviceswitchbuttons.Primary[row]) = 'N' Then
		// The state cannot be changed.
		Return 2
	End If		
		
	// If the service is being enabled, take immediate action.
	If (data = SERVICE_ENABLED) Then
		ls_servicename = dw_services.Object.servicename.Primary[row]
		If IsNull(ls_servicename) or Len(Trim(ls_servicename)) = 0 Then Return
		Parent.Event pfc_PropertyApplyImmediate(ls_servicename, True)
	End If

End If

// Make sure the appropriate buttons are available(post event). 
Parent.Post Event pfc_PropertyEnableButtons()

Return 
end event

event rowfocuschanged;call super::rowfocuschanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  rowfocuschanged
//
//	Description: 
// Display the appropriate description.
//	As appropriate, Enable or Disable the buttons.
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

// Refresh the description.
Parent.Event pfc_PropertyDescription()

// Refresh the available buttons.
Parent.Event pfc_PropertyEnableButtons()

end event

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Constructor
//
//	Description:  
//	Datawindow displaying the services.
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

// This datawindow is not Updateable.
of_SetUpdateable(False)

// Highlight the current row.
of_SetRowSelect(True)

// Disable the Right Mouse Button Popup Menu.
ib_rmbmenu = False

end event

type st_servicesavailable from u_st within pfc_u_tabpg_dwproperty_services
integer x = 27
integer y = 36
integer width = 1723
string text = "The following Services are accessible:"
end type

type cb_property from u_cb within pfc_u_tabpg_dwproperty_services
integer x = 1344
integer y = 764
integer width = 375
integer taborder = 40
string text = "&Property"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked
//
//	Description:  Open the specific Property window.
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

long		ll_currrow
window	lw_parentwindow

// Get the currently selected row.
ll_currrow = dw_services.GetRow()

If ll_currrow > 0 Then
	SetPointer (HourGlass!)
	
	// Get the information needed by the Property window.
	inv_attrib.is_objectname = dw_services.Object.servicename.Primary[ll_currrow]
	inv_attrib.is_tabpages = dw_services.Object.servicepropertypages.Primary[ll_currrow]

	// Get the parent window ref so that the new window can open in relation to it.
	of_GetParentWindow(lw_parentwindow)
	If IsValid(lw_parentwindow) Then
		inv_attrib.iw_main = lw_parentwindow
	End If
	
	// Open the Property window.
	OpenWithParm (w_dwpropertyservices, inv_attrib)
End If
end event

type cb_enable from u_cb within pfc_u_tabpg_dwproperty_services
integer x = 553
integer y = 764
integer width = 375
integer taborder = 20
string text = "&Enable"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked
//
//	Description:  Enable the current service.
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

long		ll_currentrow
string 	ls_servicename
boolean	lb_desiredestate = True

// Get the current row.
ll_currentrow = dw_services.GetRow()

If ll_currentrow > 0 Then
	// Get the name of the current service.	
	ls_servicename = dw_services.Object.servicename.Primary[ll_currentrow]
	If IsNull(ls_servicename) or Len(Trim(ls_servicename)) = 0 Then Return
	
	// Change the current estate of the checkbox.
	dw_services.Object.serviceenabled.Primary[ll_currentrow] = SERVICE_ENABLED
	
	// Notify the estate has been changed to Enabled.
	Parent.Event pfc_PropertyApplyImmediate(ls_servicename, lb_desiredestate)	
	
	// Refresh the available buttons.
	Parent.Event pfc_PropertyEnableButtons()
	
	// Set focus to the appropriate button.
	cb_disable.SetFocus()
End If
end event

type cb_disable from u_cb within pfc_u_tabpg_dwproperty_services
integer x = 946
integer y = 764
integer width = 375
integer taborder = 30
string text = "&Disable"
end type

event clicked;call super::clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  Clicked
//
//	Description:  Disable the current service.
//
//	*Note: The actual disabling of service(s) are delayed until the 
//		window close operation.
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

long		ll_currentrow
string 	ls_servicename
boolean	lb_desiredestate = False

// Get the current row.
ll_currentrow = dw_services.GetRow()

If ll_currentrow > 0 Then
	// Get the name of the current service.	
	ls_servicename = dw_services.Object.servicename.Primary[ll_currentrow]
	If IsNull(ls_servicename) or Len(Trim(ls_servicename)) = 0 Then Return
	
	// Change the current estate of the checkbox.
	dw_services.Object.serviceenabled.Primary[ll_currentrow] = SERVICE_DISABLED
	
	// Refresh the available buttons.
	Parent.Event pfc_PropertyEnableButtons()
	
	// Set focus to the appropriate button.
	cb_enable.SetFocus()
End If
end event

type mle_description from u_mle within pfc_u_tabpg_dwproperty_services
integer x = 82
integer y = 964
integer width = 1582
integer height = 360
integer taborder = 0
long backcolor = 80263328
string text = "Description Text"
boolean border = false
boolean displayonly = true
borderstyle borderstyle = stylebox!
end type

type gb_description from u_gb within pfc_u_tabpg_dwproperty_services
integer x = 32
integer y = 880
integer width = 1696
integer height = 480
integer taborder = 0
string text = "Description:"
end type

