**********************************************************************
      PowerBuilder Foundation Class Library Version 7.0
                   R E L E A S E   N O T E S

	Copyright © 1996-1999 Sybase, Inc. and its subsidiaries.  
	All rights reserved.

	Last Updated: 4/29/99
**********************************************************************

Please take a few minutes to review this file for changes that 
have been made to the libraries.


Contents of this file:
=========================================
CHANGED PFC OBJECTS
NEW PFC/EXTENSION OBJECTS
OBSOLETE PFC/EXTENSION OBJECTS
MIGRATION NOTES
BUGS FIXES
=========================================


**********************************************************************************
CHANGED PFC OBJECTS
**********************************************************************************
In Version 7.0 of PowerBuilder, object structures declared as instance variables 
must be explicitly declared as private.  The following PFC objects were using object
structures.  In order to preserve the extendibility of PFC, these object structures
have been changed to nonvisual attribute classes, as follows:

Library pfcdwsrv.pbl:
=====================
Object:			 	Obsolete Structure:	Replacement Class:
--------------------------	----------------------	--------------------------------
pfc_n_cst_dssrv_multitable	os_updcharacteristics  	pfc_n_cst_dssrv_multitableattrib 
pfc_n_cst_dwsrv_dropdownsearch	os_columns  		pfc_n_cst_dwsrv_dropdownsearchattrib
pfc_n_cst_dwsrv_multitable	os_updcharacteristics  	pfc_n_cst_dwsrv_multitableattrib
pfc_n_cst_dwsrv_querymode	os_querymodeinfo  	pfc_n_cst_dwsrv_querymodeattrib
pfc_n_cst_dwsrv_resize	 	os_resize  		pfc_n_cst_dwsrv_resizeattrib 

Library pfcwnsrv.pbl:
=====================
Object:			 	Obsolete Structure:	Replacement Class:
--------------------------	----------------------	--------------------------------
pfc_n_cst_winsrv_statusbar 	os_dwobjects  		pfc_n_cst_winsrv_statusbarattrib
pfc_n_cst_resize	 	os_resize  		pfc_n_cst_resizeattrib 
pfc_n_cst_winsrv_sheetmanager	os_sheet  		pfc_n_cst_winsrv_sheetmanagerattrib 
pfc_w_toolbars			os_toolbar	 	pfc_n_cst_toolbarattrib	

Library pfcapsrv.pbl:
========================
Object:			 	Obsolete Structure:	Replacement Class:
--------------------------	----------------------	--------------------------------
pfc_n_cst_dwcache	 	os_cachelist  		pfc_n_cst_dwcacheattrib 
pfc_n_cst_trregistration	os_transentry  		pfc_n_cst_trregistrationattrib 

Library pfcmain.pbl:
========================
Object:			 	Obsolete Structure:	Replacement Class:
--------------------------	----------------------	--------------------------------
pfc_u_tv	 		os_datasource  		pfc_n_cst_tvattrib 


**********************************************************************************
NEW PFC/EXTENSION OBJECTS
**********************************************************************************
The new extension objects should be included in your customized extension PBLs.  
For more information or help on retaining customizations to your extension levels
when upgrading to a new release of PFC, please refer to Powersoft Faxline # 44505.
If you are not using the 7.0 PFE, you should copy the new extension objects to your
customied PFE layer.

Library:	 	PFC Object / Extension Object
==============		=======================================================================
pfcdwsrv.pbl		pfc_n_cst_dssrv_multitableattrib / n_cst_dssrv_multitableattrib 		 		
pfcwnsrv.pbl		pfc_n_cst_winsrv_statusbarattrib / n_cst_winsrv_statusbarattrib 		 		
pfcapsrv.pbl		pfc_n_cst_dwcacheattrib / n_cst_dwcacheattrib 			 			
pfcdwsrv.pbl		pfc_n_cst_dwsrv_dropdownsearchattrib / n_cst_dwsrv_dropdownsearchattrib 		 		
pfcdwsrv.pbl		pfc_n_cst_dwsrv_multitableattrib / n_cst_dwsrv_multitableattrib 		 		
pfcdwsrv.pbl		pfc_n_cst_dwsrv_querymodeattrib / n_cst_dwsrv_querymodeattrib 		 		
pfcdwsrv.pbl		pfc_n_cst_dwsrv_resizeattrib / n_cst_dwsrv_resizeattrib 			 			
pfcwnsrv.pbl		pfc_n_cst_resizeattrib / n_cst_resizeattrib			
pfcapsrv.pbl		pfc_n_cst_trregistrationattrib / n_cst_trregistrationattrib 		 		
pfcwnsrv.pbl		pfc_n_cst_winsrv_sheetmanagerattrib / n_cst_winsrv_sheetmanagerattrib 		 		
pfcmain.pbl		pfc_n_cst_tvattrib / n_cst_tvattrib 
pfcmain.pbl		pfc_u_hpb / u_hpb
pfcmain.pbl		pfc_u_vpb / u_vpb
pfcmain.pbl		pfc_u_htb / u_htb
pfcmain.pbl		pfc_u_vtb / u_vtb
pfcmain.pbl		pfc_u_phl / u_phl
pfcmain.pbl		pfc_u_sth / u_sth

**********************************************************************************
OBSOLETE PFC/EXTENSION OBJECTS
**********************************************************************************
The following objects have been obsoleted because the platforms are no longer 
supported by PowerBuilder.

Library:	 	Obsolete PFC Object / Extension Object
========		==========================================================
pfcapsrv.pbl		pfc_n_cst_filesrvwin16 / n_cst_filesrvwin16
			pfc_n_cst_filesrvmac / n_cst_filesrvmac 
			pfc_n_cst_platformwin16 / n_cst_platformwin16 
			pfc_n_cst_platformmac / n_cst_platformmac 

**********************************************************************************
MIGRATION NOTES
**********************************************************************************
If you have made references in your libraries to any of the structures that were
described in the changed objects section, you will need to change then datatype
for your references.  ( Please refer to the Faxline Migration document if you need
further assistance migrating PFC from previous versions )

(Note:  An additional obsolete variable using the new datatype BUT the
old istr_ variable name has been added to each of these objects for the
purpose of assisting migration.   These variables will be removed in
a later release and should not be used.)

The following is a list of the references that have changed:

Object / Variable			Changed to				
=================================	===========================================
pfc_n_cst_dssrv_multitable:
os_updcharacteristics istr_newupdate 	n_cst_dssrv_multitableattrib inv_newupdate
------------------------------------------------------------------------------------------
pfc_n_cst_winsrv_statusbar:
os_dwobjects istr_dwobjects		n_cst_winsrv_statusbarattrib inv_dwobjects
------------------------------------------------------------------------------------------
Object: pfc_w_toolbars: 
os_toolbar istr_toolbar	 		n_cst_toolbarattrib inv_toolbar
istr_toolbar.w_owner   			n_cst_toolbarattrib inv_toolbar.iw_owner
------------------------------------------------------------------------------------------
Object: pfc_n_cst_dwcache:
os_cachelist .istr_cachelist 		n_cst_dwcacheattrib inv_cachelist
------------------------------------------------------------------------------------------
Object: pfc_n_cst_dwsrv_dropdownsearch:	
os_columns.istr_columns  		n_cst_dwsrv_dropdownsearchattrib inv_columns
------------------------------------------------------------------------------------------
Object: pfc_n_cst_dwsrv_multitable: 	
os_updcharacteristics.istr_newupdate  	n_cst_dwsrv_multitableattrib inv_newupdate
------------------------------------------------------------------------------------------
Object: pfc_n_cst_dwsrv_querymode:
os_querymodeinfo.istr_querymodeinfo  	n_cst_dwsrv_querymodeattrib inv_querymodeinfo
------------------------------------------------------------------------------------------
Object: pfc_n_cst_dwsrv_resize:
os_resize.istr_registered  		n_cst_dwsrv_resizeattrib inv_registered
------------------------------------------------------------------------------------------
Object: pfc_n_cst_resize: 
os_resize.istr_registered  		n_cst_resizeattrib inv_registered
------------------------------------------------------------------------------------------
Object: pfc_n_cst_trregistration:	
os_transentry.istr_trans  		n_cst_trregistrationattrib inv_trans
------------------------------------------------------------------------------------------
Object: pfc_n_cst_winsrv_sheetmanager: 
os_sheet.istr_sheet  			n_cst_winsrv_sheetmanagerattrib inv_sheet
------------------------------------------------------------------------------------------
Object: pfc_u_tv: 	
os_datasource.istr_ds  			n_cst_tvattrib inv_ds
------------------------------------------------------------------------------------------

**********************************************************************************
BUGS FIXES
**********************************************************************************
============================================================================================
Object: d_calculator					Drop Down Calculator
		Fix:	Changed button background color to buttonface.
============================================================================================
============================================================================================
Object: d_calendar					Drop Down Calendar
		Fix:	Changed button background color to buttonface.
============================================================================================
============================================================================================
Object: f_setfilesrv					File Services Create/Destroy
		Fix:	Removed logic to create Macintosh or 16-bit Windows file services  
============================================================================================
============================================================================================
Object: f_setplatform					Platform Services Create/Destroy
		Fix:	Removed logic to create Macintosh or 16-bit Windows platform services  
============================================================================================
============================================================================================
Object: pfc_m_master 					PFC Master Menu
CR156985	Fix:	The PFC "vcr" menu items were not layed out like a vcr.
		   	Changed the order to "first, previous, next, and last"
============================================================================================
============================================================================================
Object: pfc_n_cst_datetime				DateTime Service
CR169790	Method:	of_lastdayofmonth
		Fix:	Removed a loop which relied on an invalid date. 
			Added an array containing the mumber of days in each month.

CR162134	Method:	of_relativemonth
		Fix:	Removed a loop which determined the last day in month.  
			The loop was relying on the of_IsValid(date) function to 
			find an invalid date.  In PB 5.0.03+ a date variable can
			only contain a Null or a valid date.

CR188246	Method:	of_relativeyear
		Fix:	Removed a loop which determined the last day in month.  
			The loop was relying on the of_IsValid(date) function to
			find an invalid date.  In PB 5.0.03+ a date variable can
			only contain a Null or a valid date.
============================================================================================
============================================================================================
Object: pfc_n_cst_dropdown				Drop Down Service
		Method:	of_position
		Fix:	Changed the li_rowsafterfirst to long (ll_rowsafterfirst).
============================================================================================
============================================================================================
Object: pfc_n_cst_dssrv					Base Datastore Services
CR183729	Method:	of_GetItem / of_GetItemAny
		Fix:  Change to treat computed columns like normal columns

CR162591	Method:	of_GetItem
		Fix:  Don't LookUpDisplay for Original! values

CR184494	Method:	of_GetItem
		Fix:  Formats containing expression will use default format

internal	Method:	of_BuildExpression
		Fix:  Added "char" datatype to case statement

internal	Method:	of_BuildComparison
		Fix:  Added "char" datatype to case statement
============================================================================================
============================================================================================
Object:	pfc_n_cst_dssrv_multitable
internal	Method:	of_update
		Fix:	Local variable datatype changed from os_updcharacteristics to 
			n_cst_dssrv_multitableattrib type

internal	Method:	of_restoreupdatesettings
		Fix:	Argument datatype changed from os_updcharacteristics to 
			n_cst_dssrv_multitableattrib type

internal	Method:	of_storeupdatesettings
		Fix:	Argument datatype changed from os_updcharacteristics to 
			n_cst_dssrv_multitableattrib type
============================================================================================
============================================================================================
Object: pfc_n_cst_dssrv_report				Datastore Report Service
CR159631	Method:	of_SetColor
		Fix:	Allow for expressions in color values to be restored.

CR159631	Method:	of_SetBorder
		Fix:	Allow for expressions in border values to be restored.
============================================================================================
============================================================================================
Object: pfc_n_cst_dwcache				Caching service
CR171947	Method: of_refresh (string as_id)
		Fix:	Changed the li_rows variable to Long (ll_rows) to allow for > 32K Rows.
============================================================================================
============================================================================================
Object: pfc_n_cst_dwsrv					Base DataWindow Services
CR183729	Method:	of_GetItem / of_GetItemAny
		Fix:	Change to treat computed columns like normal columns

CR162591	Method:	of_GetItem
		Fix:	Don't LookUpDisplay for Original! values

CR184494	Method:	of_GetItem
		Fix:	Formats containing expression will use default format

internal	Method:	of_BuildExpression
		Fix:  Added "char" datatype to case statement

internal	Method:	of_BuildComparison
		Fix:  Added "char" datatype to case statement

============================================================================================
============================================================================================
Object: pfc_n_cst_dwsrv_dropdownsearch			DataWindow Drop Down Search Service
CR162652	Method:	pfc_itemfocuschanged
		Fix:	Due to an invalid test for  ls_editstyle = 'dddw' the service was 
			unable to recover the child handle.  Changed  the test from 
			ls_editstyle <> 'dddw' to ls_editstyle = 'dddw'

internal	Method:	of_deleteitem
		Fix:	Local variable datatype changed from os_columns to 
			n_cst_dwsrv_dropdownsearchattrib type
 
internal	Method:	of_unregister
		Fix:	Local variable datatype changed from os_columns to 
			n_cst_dwsrv_dropdownsearchattrib type
============================================================================================
============================================================================================
Object: pfc_n_cst_dwsrv_find				DataWindow Find Service
		Method:	of_find
		Fix:	Changed the datatype of li_rowfound to long to provide support for
			> 32K rows
============================================================================================
============================================================================================
Object: pfc_n_cst_dwsrv_linkage				Linkage Service
CR186541	Method:	of_register
		Fix:	Allow non-column detail arguments to be registered.  Arguments on the
			on the master must be actual columns.
171023
============================================================================================
============================================================================================
Object:	pfc_n_cst_dwsrv_multitable 
internal	Method:	of_update
		Fix:	Local variable datatype changed from os_updcharacteristics to 
			n_cst_dwsrv_multitableattrib type

internal	Method:	of_restoreupdatesettings
		Fix:	Argument datatype changed from os_updcharacteristics to 
			n_cst_dwsrv_multitableattrib type

internal	Method:	of_storeupdatesettings
		Fix:	Argument datatype changed from os_updcharacteristics to 
			n_cst_dwsrv_multitableattrib type
============================================================================================
============================================================================================
Object: pfc_n_cst_dwsrv_querymode			DataWindow QueryMode Service
CR171023	Method:	of_SetEnabled
		Fix:	Trigger pfc_rowchanged event when QueryMode is turned off
============================================================================================
============================================================================================
Object: pfc_n_cst_dwsrv_report				DataWindow Report Service
CR159631	Method:	of_SetColor
		Fix:	Trigger pfc_rowchanged event when QueryMode is turned off
		Fix:	Allow for expressions in color values to be restored.

CR159631	Method:	of_SetBorder
		Fix:	Allow for expressions in border values to be restored.
============================================================================================
============================================================================================
Object: pfc_n_cst_filesrv				Base File Services
		Method:	of_deltree
		Fix:	Changed datatype of li_Cnt, li_Entries from int to long

		Method:	of_sortdirlist
		Fix:	Change datatypes from int to long
============================================================================================
============================================================================================
Object: pfc_n_cst_filesrvaix				AIX File Services
CR155331	Fix:	Changed external function declarations to library libkernel42.so

CR168832	Method:	of_dirlist
		Fix: Changed return datatype from int to long
============================================================================================
============================================================================================
Object: pfc_n_cst_filesrvhpux				HPUX File Services
CR155331	Fix:	Changed external function declarations to library libkernel42.sl

CR168832	Method:	of_dirlist
		Fix:	Changed return datatype from int to long
============================================================================================
============================================================================================
Object: pfc_n_cst_filesrvsol2				Solaris File Services
CR155331	Fix:	Changed external function declarations to library libkernel42.so

CR168832	Method:	of_dirlist 
		Fix:	Added, not previously implemented
============================================================================================
============================================================================================		
Object: pfc_n_cst_filesrvunicode			Unicode File Services
CR168832	Method:	of_dirlist
		Fix:	Changed return datatype from int to long
============================================================================================
============================================================================================
Object: pfc_n_cst_filesrvwin32				WIN32 File Services
CR168832	Method:	of_dirlist
		Fix:	Changed return datatype from int to long
============================================================================================
============================================================================================
Object: pfc_n_cst_luw					Logical Unit of Work Service
CR187510	Method:	of_GetType
		Fix:	Added support for new controls: vprogressbar, vtrackbar, 
			hprogressbar, htrackbar, picturehyperlink, statichyperlink.
============================================================================================
============================================================================================
Object: pfc_n_cst_lvsrv_datasource			Listview Datasource Service
		Method:	of_retrieve
		Fix:	Changed the datatypes of local "row" related varibles from int to long.

CR156436 	Method:	of_InsertItem
    		Fix:	Performance Improvements:  Removed extraneous rowcounts, and ArrangeAll
============================================================================================
============================================================================================
Object: pfc_n_cst_lvsrv_sort				Listview Sort Service
		Method:	pfc_columnclick event
		Fix:	Added "char" datatype to case statement

 		Method:	pfc_sort event
    		Fix:	Added "char" datatype to case statement
============================================================================================
============================================================================================
Object: pfc_n_cst_platform				Base Platform Services
CR187249	Method:	of_SetFindWindowClasses(new)
		Fix:	Allow specification of non-default class names.

CR188667	Method:	of_GetActiveWindowBorder(new)
		Fix:	Refined calculation of border size, for statusbar service
============================================================================================
============================================================================================
Object: pfc_n_cst_platformaix				AIX Platform Services
CR155331	Fix:	Changed external function declarations to libraries libkernel42.so,
			libuser42.so, libgdi42.so

CR187249	Method:	of_FindWindow
		Fix:	Moved the class names into an instance array.  
			Allow for multiple class names.

CR188667	Method:	of_GetActiveWindowBorder(new)
		Fix:	Refined calculation of border size, for statusbar service
============================================================================================
============================================================================================
Object: pfc_n_cst_platformhpux				HPUX Platform Services
CR155331	Fix:	Changed external function declarations to libraries libkernel42.sl,
			libuser42.sl,libgdi42.sl

CR187249	Method:	of_FindWindow
		Fix:	Moved the class names into an instance array.  
			Allow for multiple class names.

CR188667	Method:	of_GetActiveWindowBorder(new)
		Fix:	Refined calculation of border size, for statusbar service
============================================================================================
============================================================================================
Object: pfc_n_cst_platformsol2				Solaris Platform Services
CR155331	Fix:	Changed external function declarations to libraries libkernel42.so, 
			libuser42.so,libgdi42.so

CR187249	Method:	of_FindWindow
		Fix:	Moved the class names into an instance array.  
			Allow for multiple class names.

CR172404   	Method:	of_GetComputerName
		Fix:	Datatype of size argument should be ulong

CR188667	Method:	of_GetActiveWindowBorder(new)
		Fix:	Refined calculation of border size, for statusbar service
============================================================================================
============================================================================================
Object: pfc_n_cst_platformunicode			Unicode Platform Services
CR187249	Method:	of_FindWindow
		Fix:	Moved the class names into an instance array.  
			Allow for multiple class names.

CR188667	Method:	of_GetActiveWindowBorder(new)
		Fix:	Refined calculation of border size, for statusbar service
============================================================================================
============================================================================================
Object: pfc_n_cst_platformwin32				WIN32 Platform Services
CR187249	Method:	of_FindWindow
		Fix:	Moved the class names into an instance array.  
			Allow for multiple class names.

CR188667	Method:	of_GetActiveWindowBorder(new)
		Fix:	Refined calculation of border size, for statusbar service
============================================================================================
============================================================================================
Object: pfc_n_cst_resize				Resize Service	
CR187510	Method:	of_TypeOf
		Fix:	Added support for new controls: vprogressbar, vtrackbar, 
			hprogressbar, htrackbar, picturehyperlink, statichyperlink.
============================================================================================  
============================================================================================
Object: pfc_n_cst_security				Security Service	
CR187510	Method:	of_SetControlStatus
		Fix:	Added support for new controls: vprogressbar, vtrackbar, 
			hprogressbar, htrackbar, picturehyperlink, statichyperlink.
============================================================================================  
============================================================================================
Object: pfc_n_cst_sql					SQL Service
CR163154	Method: of_parse
		Fix:	Parse for UNION cannot include data from WHERE CLAUSE
============================================================================================
============================================================================================
Object: pfc_n_cst_string				String Service
CR161099	Method:	of_arraytostring ( as_source[], as_Delimiter, ab_processempty, as_ref_string )
		Fix:	Overloaded an existing of_arraytostring function to optionally allow 
			processing of empty string arguments.

CR159859	Method:	of_WordCap
		Fix:  Don't capitalize the next character after apostrophe
============================================================================================
============================================================================================
Object:	pfc_n_cst_trregistration 
internal	Method:	of_unregister
		Fix:	Local variable datatype changed from os_transentry to 
			n_cst_trregistrationattrib type
============================================================================================
============================================================================================
Object: pfc_n_cst_tvsrv					Base Treeview Service
CR183576	Method:	of_SearchChild			
		Fix:	Array Boundary error on empty tree.				  		  										============================================================================================
============================================================================================
Object: pfc_n_cst_tvsrv_levelsource			Treeview Level Service		
CR162735	Method:	of_Retrieve
		Fix:	Fix call to of_BuildExpression, requires string argument	
============================================================================================
============================================================================================
Object: pfc_n_cst_winsrv_preference 			Window Preference Service
CR159688	Method:	of_restore ( ab_UseRegistry, as_KeyOrIni, as_IniSection )
		Fix:	Add logic to restore the window state to maximized or normal
			PTrack Issue#: 474311
============================================================================================
============================================================================================
Object: pfc_n_cst_winsrv_sheetmanager
internal	Method:	of_setcurrentstate
		Fix:	Local variable datatype changed from os_sheet to 
			n_cst_winsrv_sheetmanagerattrib type
============================================================================================
============================================================================================
Object: pfc_n_cst_winsrv_statusbar 			Window StatusBar
CR182367	Method:	of_createdwobject
CR160301	Fix:	Updated datawindow syntax for current version

CR187510	Method:	of_RestoreFocusPoint
		Fix:	Added support for new controls: vprogressbar, vtrackbar, 
			hprogressbar, htrackbar, picturehyperlink, statichyperlink.
============================================================================================
============================================================================================
Object: pfc_n_tr					Transaction Service	
CR155693	Method: of_SetUserIdAndPassword
		Fix:	Added new method to set UserID and DBPass attibutes
			of transaction object for non-ODBC logons.
			
CR155693	Method:	of_SetLogidAndPassword 
		Fix:	Added new method to set LogID and LogPass attibutes
			of transaction object for non-ODBC logons.
============================================================================================
============================================================================================
Object: pfc_u_calendar					Drop Down Calendar
CR162134	Method:	of_drawmonth
CR184373	Fix:	Did not redraw date of 1/1/1900.  Removed an invalid comparison 
			to date(‘50/50/1900’)).  The comparison is no longer needed.  
			Post 5.0.03 PowerBuilder date type cannot contain an  invalid date 
			with an exception of a null value.

CR162134	Method:	of_setdate
CR184373	Fix:	Add code to always redraw for date matching 1/1/1900 to allow date 
			display for January 1900.  Previously the calendar did not redraw
			since the initial value of the previous date was also 1/1/1900.   

CR162134	Method:	of_reset
CR184373	Fix:	If the date is invalid set the calendar date to today's date. 
============================================================================================
============================================================================================
Object: pfc_u_cbx					PFC Checkbox Control
CR162743	Fix:	Changed the text color from black to WndText.
============================================================================================
============================================================================================
Object: pfc_u_dw					PFC DataWindow
CR162625	Method:	clicked
		Fix:	Do not bypass the sort and rowselection processing on linkage failure.  
			Only do so when linkage specifically returns PREVENT_ACTION

CR162625	Method:	pfc_addrow
		Fix:	Posted a new pfc_postinsertrow event

CR162625	Method:	pfc_insertrow
		Fix:	Posted a new pfc_postinsertrow event

CR162625	Method:	pfc_postinsertrow (new)
		Fix:	Add new event

CR171023	Method:	pfc_insertrow, pfc_addrow, pfc_rowchanged, pfc_prerestorerow, 
			clicked, rowfocuschanged, itemfocuschanged, itemchanged, rowfocuschanging
		Fix:	Disable calls to linkage service while querymode is enabled
============================================================================================
============================================================================================
Object: pfc_u_em					PFC Editmask Control
CR162743	Fix:	Changed the text color from black to WndText and the 
			background color from white to WndBkgd.
============================================================================================
============================================================================================
Object: pfc_u_gr					PFC Groupbox Control
CR162743	Fix:	Changed the text color from black to WndText.
============================================================================================
============================================================================================
Object: pfc_u_lb					PFC Listbox Control
CR162743	Fix:	Changed the text color from black to WndText and the 
			background color from white to WndBkgd.
============================================================================================
============================================================================================
Object: pfc_u_lvs					Service Listview Control
CR156436 	Method:	pfc_addall event
    		Fix:	add Arrange(), deferred from pfc_n_cst_lvsrv_datasource.of_InsertItem
============================================================================================
============================================================================================
Object: pfc_u_mle					PFC Multilineedit Control
CR162743	Fix:	Changed the text color from black to WndText and the 
			background color from white to WndBkgd.
============================================================================================
============================================================================================
Object: pfc_u_rb					PFC Radiobutton Control
CR162743	Fix:	Changed the text color from black to WndText.
============================================================================================
============================================================================================
Object: pfc_u_sle					PFC Singlelineedit Control
CR162743	Fix:	Changed the text color from black to WndText and the 
			background color from white to WndBkgd.
============================================================================================
============================================================================================
Object: pfc_u_st					PFC StaticText Control
CR162743	Fix:	Changed the text color from black to WndText.
============================================================================================
============================================================================================
Object: pfc_u_tv					Treeview Control				
CR162228	Method:	of_GetArgs
		Fix:	Changed the li_row datatype to long (ll_row).

CR162228	Method:	of_DeleteItem
		Fix:	Changed the li_row datatype to long (ll_row).
============================================================================================
============================================================================================
Object: pfc_w_filterextended				Extended Filter Dialog
internal	Method:	tab_1.tabpg_values.dw_values doubleclicked event
		Fix:	Added "char" datatype to case statement
============================================================================================
============================================================================================
Object: pfc_w_filtersimple				Simple Filter Dialog
internal	Method:	of_BuildFilterString
		Fix:	Added "char" datatype to case statement
============================================================================================
============================================================================================
Object: pfc_w_find					Find Service
CR163032	Method:	pfc_default event
		Fix:	FindIndex starts with 1.  Should be 0.
============================================================================================
============================================================================================
Object: pfc_w_master					PFC Master Window
CR185691	Method:	pfc_help event
		Fix:	If help type id is not specified open the top-level contents topic

CR158935	Method:	resize event
		Fix:	Change to not resize when window is being restored from a minimized state
============================================================================================
============================================================================================
Object: pfc_w_sortdragdrop				Sort Dialog
CR167821	Method:	open event
		Fix:	Added Modify to left-hand datawindow so we can scroll to long
			column names.  Also added HScrollBar to datawindow
============================================================================================
============================================================================================
Object: pfc_w_statusbar 				Window StatusBar
CR182367	Method:	of_getsystemsettings
CR160301	Fix:	Changed calculation of border height

CR182367	Method:	open
CR160301	Fix:	Added InsertRow to StatusBar dw

CR187510	Method:	of_RestoreFocusPoint
		Fix:	Added support for new controls: vprogressbar, vtrackbar, 
			hprogressbar, htrackbar, picturehyperlink, statichyperlink.
============================================================================================
============================================================================================
Object: pfc_w_zoom					Print Zoom
CR159962	Method:	open event
		Fix:	Allow for dynamically created datawindows
============================================================================================
============================================================================================
Object: all descendant autoinstantiate nonvisual objects			
CR167852	Fix:	Resave descendant autoinstante objects to force PB to
			generate correct sourcecode
============================================================================================
============================================================================================
Fixed in 7.02 EBF Only:
Object: pfc_n_cst_filesrv		
[no cr]		Fix:	Changed of_IncludeFile to checked for files on compressed drives.
============================================================================================
============================================================================================
Fixed in 7.02 EBF Only:
Object: pfc_n_cst_filesrvaix, pfc_n_cst_filesrvhpux, pfc_n_cst_filesrvsol2, 
	pfc_n_cst_filesrvunicode and pfc_n_cst_filesrvwin32

CR162293	Fix:	Change File Handle Variables to long from ulong.  Error return
			codes were not processed correctly otherwise.  The following
			functions were affected:
			of_dirlist, of_getfileattributes, of_getlastwritedatetime,
			of_getcreationdatetime, of_getlongfilename, of_getaltfilename,
			of_getfilesize, of_setlastwritedatetime, of_getlastaccessdate,
			of_setcreationdatetime, of_setlastaccessdate,

============================================================================================
============================================================================================
EBF Only: The following objects had controls resized larger to aid localization:
pfcapsrv.pbl:	d_definedmessages
		d_messageprint
		d_pfcsecurity_allcontrollist
		d_pfcsecurity_applookup
		d_pfcsecurity_controllist
		d_pfcsecurity_groupverify
		d_pfcsecurity_templateupdate
		d_pfcsecurity_userlookup
		d_timerlist
		pfc_w_find
		pfc_w_logon
		pfc_w_message
		pfc_w_pagesetup
		pfc_w_print
		pfc_w_replace
pfcdwsrv.pbl:	d_filtersimple
		d_sortmulti
		pfc_w_filterextended
		pfc_w_filtersimple
		pfc_w_sortdragdrop
		pfc_w_sortmulti
		pfc_w_sortsingle
		pfc_w_restorerow
		pfc_w_zoom
		pfcmain.pbl
		d_calendar
pfcutil.pbl:	d_dwproperty_dates
		d_dwproperty_linkageargs
		d_dwproperty_multitable
		d_dwproperty_srvcal
		d_dwproperty_srvresize
		d_sqlspyprint
		pfc_u_tab_dwproperty
		pfc_u_tab_dwproperty_srv
		pfc_u_tabpg_dwproperty_base
		pfc_u_tabpg_dwproperty_buffers
		pfc_u_tabpg_dwproperty_services
		pfc_u_tabpg_dwproperty_srvcalculator
		pfc_u_tabpg_dwproperty_srvcalendar
		pfc_u_tabpg_dwproperty_srvcalendar2
		pfc_u_tabpg_dwproperty_srvdropdownsearch
		pfc_u_tabpg_dwproperty_srvfilter
		pfc_u_tabpg_dwproperty_srvfind
		pfc_u_tabpg_dwproperty_srvlinkage
		pfc_u_tabpg_dwproperty_srvlinkage2
		pfc_u_tabpg_dwproperty_srvmultitable
		pfc_u_tabpg_dwproperty_srvprintpreview
		pfc_u_tabpg_dwproperty_srvquerymode
		pfc_u_tabpg_dwproperty_srvreport
		pfc_u_tabpg_dwproperty_srvreqcolumn
		pfc_u_tabpg_dwproperty_srvresize
		pfc_u_tabpg_dwproperty_srvrowmanager
		pfc_u_tabpg_dwproperty_srvrowselection
		pfc_u_tabpg_dwproperty_srvsort
		pfc_u_tabpg_dwproperty_srvsyntax
		pfc_u_tabpg_dwproperty_status
		pfc_w_debuglog
		pfc_w_dwproperty
		pfc_w_dwpropertyservices
		pfc_w_sqlspy
		pfc_w_sqlspyinspect
pfcwnsrv.pbl:	pfc_w_toolbars