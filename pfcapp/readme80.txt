**********************************************************************
      PowerBuilder Foundation Class Library Version 8.0
                   R E L E A S E   N O T E S

      Copyright © 1996-2001 Sybase, Inc. and its subsidiaries.  All rights reserved.

      Last Updated: May 2, 2001 
**********************************************************************

Please take a few minutes to review this file for changes that have been made to the libraries.


Contents of this file:
=========================================
CHANGED PFC OBJECTS
OBSOLETE PFC/EXTENSION OBJECTS
MIGRATION NOTES
BUGS FIXES
=========================================

**********************************************************************************
CHANGED PFC OBJECTS
**********************************************************************************
pfcapsrv.pbl(s_printdlgattib):  Item s_printer added.

**********************************************************************************
OBSOLETE PFC/EXTENSION OBJECTS
**********************************************************************************
1) pfccom32.dll is no longer being shipped with PFC.   There was only 1 routine in this dll, pfc_printdlg, which invoked 
the Windows Common Print Dialog.  This routine has been moved to pbvm80.dll and the external function declaration
has been changed in the appropriate platform services. 
ALSO NOTE:  The return code from this dialog is 0 when the user cancels.  It was previously set to -1.  Therefore you
should verify any place you are testing this return code. 

**********************************************************************************
MIGRATION NOTES
**********************************************************************************
1) The rbuttonup event that was mapped on a number of PFC controls is not an appropriate event to invoke Popup menus.  
In some cases, the rbuttonup event will no longer fire due to a change in the Microsoft implementation of these controls.
Therefore, a new event 'contextmenu' mapped to pbm_contextmenu message has been implemented where appropriate 
and the PFC code that had previously been assigned to rbuttonup event has been moved to the contextmenu event.
If you have extended the rbuttonup event in your extension layers, you should review this code and determine whether
it should be moved to the new contextmenu event.
The controls affected are:
pfc_u_ddlb, pfc_u_ddplb, pfc_u_em, pfc_u_lv, pfc_u_lvs, pfc_u_mle, pfc_u_oc and pfc_u_sle.

**********************************************************************************
OTHER NOTES
**********************************************************************************
PowerBuilder 8.0 has implemented a number of Runtime Enhancements, many of which can also be found as PFC 
Functionality.   For example, you can call a new 8.0 CreateDirectory function from PowerScript.  Except where noted 
below, the existing PFC routines that duplicate this functionality were not changed to use the new PowerScript
functions.   This was a deliberate decision intended to avoid any unexpected behavior resulting from the change.   

The Transport object has been obsoleted in PowerBuilder Version 8.  The PFC Transport class, pfc_n_trp, will remain 
in PFC, but may be obsoleted in future versions.

**********************************************************************************
BUGS FIXES
**********************************************************************************

File Services

	Object:	pfc_n_cst_filesrv						
	Method:	of_IncludeFile 
	Fix:		Changed to checked for files on compressed drives.
	============================================================================================
	CR162293								
	Object:	pfc_n_cst_filesrvaix 						
			pfc_n_cst_filesrvhpux
 			pfc_n_cst_filesrvsol2
			pfc_n_cst_filesrvunicode
			pfc_n_cst_filesrvwin32
	Method:	of_DirList, of_GetFileAttributes, of_GetLastWriteDateTime, of_GetCreationDateTime,
			of_GetLongFileName, of_GetAltFileName, of_GetFileSize, of_SetLastWriteDateTime, 
			of_GetLastAccessDate, of_SetCreationDateTime, of_SetLastAccessDate
	Fix:		Change File Handle Variables to long from ulong.  Error return
			codes were not processed correctly otherwise.
	============================================================================================

Platform Services

	CR206827						
	Object:	pfc_n_cst_platformaix				
			pfc_n_cst_platformhpux
			pfc_n_cst_platformsol2
	Fix:		Updated Wind/U to 4.3
	============================================================================================
	CR156359							
	Object:	pfc_n_cst_platformwin32					
			pfc_n_cst_platformunicode
	Fix:		Print Dialog called from of_PrintDlg did not always allow the setting or getting of number of copies.
			NOTE:  The return code on the cancel is action has changed from -1 to 0.
	============================================================================================
	CR196951							
	Object:	pfc_n_cst_platformwin32						
			pfc_n_cst_platformunicode
			pfc_n_cst_platformaix
			pfc_n_cst_platformhpux
			pfc_n_cst_platformsol2
	Fix:		StaticText object not being deleted under certain error conditions
	============================================================================================
	CR209985					
	Object:	pfc_n_cst_platformwin32					
			pfc_n_cst_platformunicode			
	Method:	of_printdlg
	Fix:		Initialization of s_printer item in s_printdlgattrib
	============================================================================================
	CR155936				
	Object:	pfc_n_cst_platformaix					
			pfc_n_cst_platformhpux
			pfc_n_cst_platformsol2
			pfc_n_cst_platformwin32		
			pfc_n_cst_platformunicode
	Method:	of_getfreememory
	Fix:		Changed to return physical memory available
============================================================================================

String Services

	CR200744							
	Object:	pfc_n_cst_string			
	Method:	of_GetToken
	Fix:		li_pos variable changed to long ll_pos

	Method:	of_WordCap
	Fix:		Changed to use new PowerScript WordCap function
	============================================================================================

Base DataWindow Service

	Object:	pfc_n_cst_dwsrv
			pfc_n_cst_dssrv				
	Method:	of_dwArguments (Format 1,2 )	
	Fix:		Changed to use new Describe attribute to get arguments
	============================================================================================
	CR212254	
	Object:	pfc_n_cst_dwsrv
			pfc_n_cst_dssrv				
	Method: 	of_SetItem (Format 2) 
	Fix:		Datetime columns with only date value are sometimes converting time incorrectly.
	============================================================================================

DataWindow Find Service

	CR156563							
	Object:	pfc_n_cst_dwsrv_find						
	Method:	of_IncludeComputes ( New!)
			boolean ib_IncludeComputes = False ( New!)
	Fix:		Enhancement to Find Dialog to optionally allow the inclusion of computed
			fields in the find where.
			Note: To allow computed fields to be included, call of_IncludeComputes ( True ) prior to
			the pfc_finddlg event.
	============================================================================================

DataWindow Linkage Service

	CR223001					
	Object: 	pfc_n_cst_dwsrv_linkage
	Method: 	of_UndoModified and pfc_rowfocuschanging, pfc_preinsertrow & pfc_clicked
	Fix: 	Undo modifications should walk the dw linkage chain.  Added overloaded of_UndoModified called from pfc_clicked.

	CR220166
	Method: 	pfc_rowfocuschanged
	Fix:		Extra retrieves could be caused in a parent-child-grandchild relationship
	============================================================================================

DataWindow MultiTable Update Service

	CR188777							
	Object:	pfc_n_cst_dwsrv_multitable				
			pfc_n_cst_dssrv_multitable
	Method:	of_Register
	Fix:		When update table contains owner name, append owner name to table for equal comparisons.
	===========================================================================================

DateTime Service

	CR192862							
	Object:	pfc_n_cst_datetime
	Method:	of_weeknumber
	Fix:		Function returning 0 for 1st week in January.  Should start at 1.
	============================================================================================

DW Cache Service

	CR230724					
	Object: 	pfc_n_cst_dwcache
	Method: 	of_refresh, of_register
	Fix: 	Return type for of_Refresh return code should be long.
	===========================================================================================

Resize Service

	CR190210						
	Object:	pfc_n_cst_resize				
	Method: 	of_resize
	Fix:		Drawing objects not repositioning properly.  Move function not changing X and Y
			Coordinates.  Changed Move to direct assignment of X and Y
	===========================================================================================

Calendar Service

	CR201067							
	Object:	d_calendar							
	Fix:		Changed names of text objects for days of week to
			t_monday, t_tuesday, t_wednesday, t_thursday, t_friday,
			t_saturday, t_sunday to aid localization.
	============================================================================================
	CR195643							
	Object:	pfc_u_calendar					
	Method:	of_reset
	Fix:		Column of type datetime ends up with Invalid Date for initial value
	============================================================================================

Listview Service

	CR222227						
	Object: 	pfc_n_cst_lvsrv_datasource
	Method: 	of_InsertItem
	Fix: 	Some required code was commented in error.
	===========================================================================================

PFC DataWindow

	CR209391, CR209985					
	Object:	pfc_u_dw									
	Method:	pfc_print/pfc_printdlg
	Fix:		Changed the return code test to check for 1 on success, otherwise there is an error or the user cancelled.
	Fix:		Set the printer upon return from the print dialog.
	============================================================================================
	CR161849					
	Object: 	pfc_u_dw
	Method: 	pfc_validation
	Fix: 	Change ib_updateonly to lb_updateonly to reflect proper naming conventions
	============================================================================================

PFC Graph

	CR200744							
	Object:	pfc_u_gr						
	Fix:		Changed TextColor to Window Background
	============================================================================================

PFC Treeview

	CR220705					
	Object: 	pfc_u_tvs
	Method: 	rightclicked
	Fix: 	Right-click on tree item needs to make item the current tree item
	============================================================================================
	CR187254						
	Object:	d_printtree							
	Fix:		Repositioned hidden items so that tree report does not print blank pages
	============================================================================================

PFC Listboxes

	CR160063						
	Object: 	pfc_u_lb
			pfc_u_plb
	Method: 	pfc_selectall
	Fix: 	Improved performance of SetState method
	============================================================================================

PFC Transaction Class

	CR215399						
	Object:	pfc_n_tr	
	Method: 	of_rollback
	Fix:		Rollback should execute outside of IsValid test
	============================================================================================

Print Preview Zoom Dialog

	CR208687							
	Object:	pfc_w_zoom								
	Fix:		Print Zoom dialog not setting dialog to previous settings
	============================================================================================

PFC Master Window

	CR224882					
	Object: 	pfc_w_master
	Method: 	of_setresize
	Fix: 	Modified to initially set window dimensions based on the class definition.  Solves resize problems when sheet is layered.
	============================================================================================

PFC Print Dialog

	CR209985				
	Object:	s_printdlgattrib								
	Fix:		Added a printer item to the structure, s_printer.  Returns the name 
			of the printer chosen in the dialog and is used to set the printer.
	============================================================================================

Demo Application (PEAT)

	CR160070							
	Fix:		Disable Open Menu item when the project sheet is already opened.
	============================================================================================

PFC Security

	CR233616						
	Object:	d_pfcsecurity_groupverify								
	Fix:		Verification of group did not work when user was not part of any group, therefore
			this needed to verify against the security_users, not security_groupings which is for
			assigned users.
	============================================================================================
PFC Security Administrator

	CR191387							
	Fix:		Security Administrator missing Help system.  
			Changed to invoke main PFC help file.
	============================================================================================

PFC Security Scanner

	CR199651						
	Fix:		Scanner not picking up new items in inherited menu
	CR231438
	Fix:		Cascading menu items sometimes missing 1st item
	CR230554
	Fix:		Scanner doesn't remove previously scanned items that are now obsolete
	CR217821  						
	Object: 	pfcscanner_n_cst_securityscanner
	Fix: 	Code change in of_explodeobject() to handle  all tab controls and user objects
     			which in turn have further branch of tab or user objects.
	============================================================================================

PFC Security Database

	CR155713							
	Object:	pfc.db									
	Fix:		Changed application column length to 40.
	============================================================================================

PFC Master Menu

	CR228421							
	Object:	pfc_m_master								
	Fix:		Changed menu toolbar bitmaps to new stock icons
	============================================================================================
