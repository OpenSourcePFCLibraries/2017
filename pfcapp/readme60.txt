
      PowerBuilder Foundation Class Library Version 6.5
                           
                         RELEASE NOTES

*****************************************************************
*								*
* 	Welcome to PFC Version 6.5 for PowerBuilder.   		*
*								*
*****************************************************************

Copyright © 1996-1998 Sybase, Inc. and its subsidiaries.  All rights reserved.

Please take a few minutes to review this file for changes and bug fixes
that have been made to the libraries.


Contents of this file:
=====================
New Libraries
New Extension Objects
New Syntax
Obsolete Library
Migration Notes
Changes and Bugs Fixed



=================================================================
NEW LIBRARIES
=================================================================
PFC 6.0 contains two new libraries for utility-oriented services:
PFCUTIL.PBL
PFEUTIL.PBL

Both existing and new PFC applications should include these libraries
in their application paths.

The following PFE-level objects from prior versions of PFC have been 
moved to PFEUTIL.PBL.  If you have existing applications with customized
extension PBLs, you may wish to synchronize their contents with the
object list found in PFEUTIL.PBL.  This is not required.

The following objects were moved to PFEUTIL.PBL:
n_cst_debug
n_cst_sqlspy
w_debuglog
w_sqlspy
w_sqlspyinspect



=================================================================
NEW EXTENSION OBJECTS (there are no new objects for 6.5)
=================================================================
These extension objects should be included in your customized 
extension PBLs.  The object name, PowerBuilder library, and 
release are listed for each new extension object.
For more information or help on retaining customizations to your 
extension levels when upgrading to a new release of PFC, please 
refer to Powersoft Faxline #4505.

Note:  this step is only necessary for migrating existing PFC 
applications to a newer version of PFC.

5.0.02	n_cst_filesrvmac			pfeapsrv.pbl
5.0.02	n_cst_filesrvsol2			pfeapsrv.pbl
5.0.02	n_cst_platformmac			pfeapsrv.pbl
5.0.02	n_cst_platformsol2			pfeapsrv.pbl
5.0.02	w_print					pfeapsrv.pbl

6.0	n_cst_apppreference			pfeapsrv.pbl
6.0	n_cst_color				pfeapsrv.pbl
6.0	n_cst_columnattrib			pfeapsrv.pbl
6.0	n_cst_dberrorattrib			pfeapsrv.pbl
6.0	n_cst_dropdown				pfeapsrv.pbl
6.0	n_cst_filesrvaix			pfeapsrv.pbl
6.0	n_cst_filesrvhpux			pfeapsrv.pbl
6.0	n_cst_infoattrib			pfeapsrv.pbl
6.0	n_cst_linkedlistbase			pfeapsrv.pbl
6.0	n_cst_linkedlistnode			pfeapsrv.pbl
6.0	n_cst_linkedlistnodecompare		pfeapsrv.pbl
6.0	n_cst_list				pfeapsrv.pbl
6.0	n_cst_luw				pfeapsrv.pbl
6.0	n_cst_lvsrv				pfeapsrv.pbl
6.0	n_cst_lvsrv_datasource			pfeapsrv.bpl
6.0	n_cst_lvsrv_sort			pfeapsrv.pbl
6.0	n_cst_lvsrvattrib			pfeapsrv.pbl
6.0	n_cst_metaclass				pfeapsrv.pbl
6.0	n_cst_mru				pfeapsrv.pbl
6.0	n_cst_mruattrib				pfeapsrv.pbl
6.0	n_cst_nodebase				pfeapsrv.pbl
6.0	n_cst_nodecomparebase			pfeapsrv.pbl
6.0	n_cst_platformaix			pfeapsrv.pbl
6.0	n_cst_platformhpux			pfeapsrv.pbl
6.0	n_cst_queue				pfeapsrv.pbl
6.0	n_cst_stack				pfeapsrv.pbl
6.0	n_cst_tmgmultiple			pfeapsrv.pbl
6.0	n_cst_tmgregisterattrib			pfeapsrv.pbl
6.0	n_cst_tmgsingle				pfeapsrv.pbl
6.0	n_cst_tree				pfeapsrv.pbl
6.0	n_cst_treenode				pfeapsrv.pbl
6.0	n_cst_treenodecompare			pfeapsrv.pbl
6.0	n_cst_tvsrv				pfeapsrv.pbl
6.0	n_cst_tvsrv_levelsource			pfeapsrv.pbl
6.0	n_cst_tvsrv_print			pfeapsrv.pbl
6.0	n_cst_tvsrvattrib			pfeapsrv.pbl

6.0	n_cst_dssrv_multitable			pfedwsrv.pbl
6.0	n_cst_dssrv_printpreview		pfedwsrv.pbl
6.0	n_cst_dssrv_report			pfedwsrv.pbl
6.0	n_cst_dwsrv_resize			pfedwsrv.pbl
6.0	n_cst_restorerowattrib			pfedwsrv.pbl
6.0	w_restorerow				pfedwsrv.pbl

6.0	m_lvs					pfemain.pbl
6.0	m_tvs					pfemain.pbl
6.0	n_base					pfemain.pbl
6.0	n_cst_baseattrib			pfemain.pbl
6.0	n_cst_calculatorattrib			pfemain.pbl
6.0	n_cst_calendarattrib			pfemain.pbl
6.0	n_cxinfo				pfemain.pbl
6.0	n_cxk					pfemain.pbl
6.0	n_dda					pfemain.pbl
6.0	n_dsa					pfemain.pbl
6.0	n_inet					pfemain.pbl
6.0	n_ir					pfemain.pbl
6.0	n_oo					pfemain.pbl
6.0	n_ostg					pfemain.pbl
6.0	n_ostm					pfemain.pbl
6.0	n_srv					pfemain.pbl
6.0	n_tmg					pfemain.pbl
6.0	u_base					pfemain.pbl
6.0	u_calculator				pfemain.pbl
6.0	u_calendar				pfemain.pbl
6.0	u_lvs					pfemain.pbl
6.0	u_progressbar				pfemain.pbl
6.0	u_st_splitbar				pfemain.pbl
6.0	u_tvs					pfemain.pbl

6.0	*n_cst_dwpropertyattrib			pfeutil.pbl
6.0	*n_cst_dwsrv_property			pfeutil.pbl
6.0	*n_cst_propertyattrib			pfeutil.pbl
6.0	*u_tab_dwproperty			pfeutil.pbl
6.0	*u_tab_dwproperty_srv			pfeutil.pbl
6.0	*u_tabpg_dwproperty_base		pfeutil.pbl
6.0	*u_tabpg_dwproperty_buffers		pfeutil.pbl
6.0	*u_tabpg_dwproperty_services		pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvcalculator	pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvcalendar		pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvcalendar2	pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvdropdownsearch	pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvfilter		pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvfind		pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvlinkage		pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvlinkage2		pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvmultitable	pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvprintpreview	pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvquerymode	pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvreport		pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvreqcolumn	pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvresize		pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvrowmanager	pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvrowselection	pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvsort		pfeutil.pbl
6.0	*u_tabpg_dwproperty_srvsyntax		pfeutil.pbl
6.0	*u_tabpg_dwproperty_status		pfeutil.pbl
6.0	*w_dwproperty				pfeutil.pbl
6.0	*w_dwpropertyservices			pfeutil.pbl

* = these objects are in a new PFC PBL.  No action should be required
to incorporate these objects into existing customized extension libraries
as long as you will be including PFEUTIL.PBL in your application path.



=================================================================
NEW SYNTAX
=================================================================
There has been new syntax added to PFC for consistency, ease of use
in the product, and new functionality.  Some existing syntax has been 
"obsoleted" in favor of the new syntax.  This syntax will be removed from 
PFC in a future version of the product.

Old syntax			New syntax
----------			----------
all prefixed constants		CAPS and non-prefixed
pfc_n_cst_dwsrv
  of_GetColumnNameSource	of_GetColumnDisplayNameStyle
  of_SetColumnNameSource	of_SetColumnDisplayNameStyle
  of_RefreshDDDWs		of_PopulateDDDWs
pfc_n_cst_dwsrv_linkage
  of_SetUpdateBottomUp		of_SetUpdateStyle
  of_GetUpdateBottomUp		of_GetUpdateStyle
  of_SetUseColLinks		of_SetStyle
  of_GetUseColLinks		of_GetStyle
  of_GetValue
  of_SetArguments		of_Register
  of_ResetArguments		of_UnRegister
  of_GetArguments		of_GetRegistered
  of_LinkTo			of_SetMaster
  of_UnLink			of_ResetMaster
  ib_updatebottomup		ii_updatestyle
pfc_n_cst_dwsrv_dropdownsearch
  of_AddColumn			of_Register
  of_GetColumn			of_GetRegistered
pfc_n_cst_dwsrv_multitable
  of_AddToUpdate 		of_Register
pfc_n_cst_security
  of_GetType
  of_FindEntry
  of_GetTag
  of_ScanDataWindow
  of_InitScanProcess
  of_ScanWindow
  of_AddObject
  of_ScanControlArray
pfc_u_dw
  pfc_retrievedddw		pfc_populatedddw
  of_GetUpdateable		of_IsUpdateable
pfc_n_cst_datetime
  of_DayofWeek			DayNumber
pfc_w_dwdebugger		pfc_w_dwproperty
pfc_w_undelete			pfc_w_restorerow



=================================================================
OBSOLETE LIBRARY
=================================================================
PFCOLD.PBL contains objects which have been obsoleted from PFC.
You will need to include it when migrating PFC applications to PFC 6.0.

After your existing PFC apps have been migrated, it is only necessary
to include this library if you have customized extension objects which 
depend on it.

Note that all obsoleted objects do have replacement objects.



=================================================================
MIGRATION NOTES
=================================================================
PFC 6.0 introduced events mapped to the standard event IDs. If you have declared 
user events in descendants of these objects and mapped them to the same IDs 
problems may be encountered when migrating from PFC 5.0 applications.
New events are:
pfc_u_dw - dropdown - pbm_dwndropdown
pfc_u_base - resize - pbm_size			

Please refer to the Faxline Migration document if you need further assistance
migrating PFC 5.0 applications to PFC 6.0.



=================================================================
CHANGES AND BUGS FIXED
=================================================================

Debug Services
--------------
Object:	d_debuglog, pfc_n_cst_sqlspy
Method:	
Fix:	Added Century to date format
Tech support#:	497810


String Service
--------------
Object:	pfc_n_cst_string
Method:	of_getkeyvalues
Fix:	Corrected to make sure that the keyword is a standalone word instead of a portion of a word
Tech support#:	452691


DateTime Service
----------------
Object:	pfc_n_cst_datetime
Method:	of_IsValid(date)
Fix:	Remove comparison to invalid date.  Previously, 1-1-1900 was being returned as an 
	invalid date but in reality it is a valid date.  Thus doing an of_isvalid of a valid 
	date of 1-1-1900 would be returned as invalid (false).
Tech support#:	497810


Message/Error Service
---------------------
Object:	pfc_n_cst_error
Method:	of_message
Fix:	Removed unwanted beep(1) call
Tech support#:	490782


Timing Service
--------------
Object:	pfc_n_cst_tmgsingle
Method:	
Fix:	Removed instance variable reference to  the n_cst_datetime object.
Tech support#:	498664


Transaction Registration Service
--------------------------------
Object:	pfc_n_cst_trregistration
Method:	Destructor
Fix:	Enhanced code so that different behaviors can be performed when destroying the service.
Tech support#:	


File Service
------------
Object:	pfc_n_cst_filesrv
Method:	of_sortdirlist
Fix:	Destroy local datastore explicitly
Tech support#:	

Object:	pfc_n_cst_filesrv
Method:	pfc_n_cst_filesrvwin32,  pfc_n_cst_filesrvsol2, pfc_n_cst_filesrvmac, of_convertpbdatetimetofile
Fix:	Corrected milisecond formatting which caused overflow of millisecond uint.
Tech support#:	423591

Object:	pfc_n_cst_filesrv
Method:	of_filewrite
Fix:	Correct to handle writing of strings > 60k.
Tech support#:	489023

Object:	pfc_n_cst_filesrvaix, pfc_n_cst_filesrvhpux
Method:	of_convertpbdatetimetofile
Fix:	Corrected milisecond formatting which caused overflow of millisecond uint.
Tech support#:	423591


Dropdown service
----------------
Object:	pfc_n_cst_dropdown
Method:	of_Position
Fix:	Corrected issues dealing with DataWindow Group Headers and Trailers.
Tech support#:	


PFC Treeview
------------
Object:	pfc_u_tv, pfc_n_cst_tvsrv
Method:	of_finditem, of_searchchild, of_findfirstitem
Fix:	Rewrote of_finditem, of_searchchild, of_findfirstitem to be non-recursive.
	Recursive logic was causing GPF's on trees with 50+ items on win16 platform.
Tech support#:	477984, 437966, 361483, 473371, 465619, 457014, 455714, 451537, 
		440876, 413306, 411618

Object:	pfc_u_tv
Method:	of_refreshitem
Fix:	Fix return code to return 1 on success, not 0
Tech support#:	377319

Object:	pfc_u_tv
Method:	of_SetDatasource
Fix:	of_SetDatasource returns error condition on following conditions: 
	labelcolumn does not exist or not string(-4); 
	settransobject failure (-5)
Tech support#:	426572

Object:	pfc_u_tv
Method:	of_PopulateLevel
Fix:	of_PopulateLevel return code checking: 
	settransobject (-5); 
	retrieve (-3); 
	updateable dw (-4); 
	label column creation (-2)
Tech support#:	426567, 371950

Object:	pfc_u_tv
Method:	
Fix:	Change code for Datastore's SetTransObject to use PFC of_SetTransobject function
Tech support#:	426567


PFC Listview
------------
Object:	pfc_u_lv
Method:	of_deletecolumns
Fix:	Add check to see if there are columns to delete
Tech support#:	449985

Object:	pfc_u_lv
Method:	
Fix:	Change code for Datastore's SetTransObject to use PFC of_SetTransobject function
Tech support#:	426567


PFC Windows
-----------
Object:	pfc_w_master
Method:	CloseQuery event
Fix:	Corrected so that window is not hidden prior to displaying a closequery message
Tech support#:	473364

Object:	pfc_w_splash, pfc_w_logon, pfc_w_about
Method:	
Fix:	Corrected so that if there is no application logo the picture control will be made invisible
Tech support#:	460506


PFC Menus
---------
Object:	pfc_m_master
Method:	
Fix:	Corrected minimize all functionality which left all other window positioning 
	menu items permantly disabled.
Tech support#:	473367


PFC Editmask
------------
Object:	pfc_u_em
Method:	of_SetDropDownCalculator and of_SetDropDownCalendar
Fix:	Corrected so as to tell the object to behave as a dropdown object.
Tech support#:	499227

Object:	pfc_u_em
Method:	of_SetDropDownCalculator and of_SetDropDownCalendar
Fix:	Enhanced so that the message object information is not lost when an 
	OpenUserObject function is executed.
Tech support#:	486438


PFC Message object
------------------
Object:	pfc_n_msg
Method:	
Fix:	of_CopyTo, of_Get/of_Set, and instance variables added.  This was done to allow fixes 
in other places dealing with the message object being owerwritten.	
Tech support#:	


PFC DataWindow
--------------
Object:	pfc_u_dw
Method:	pfc_print
Fix:	Destroy local datastore prior to returning under error condition
Tech support#:	488591

Object:	pfc_u_dw
Method:	rbuttonup
Fix:	script caused 64K segment problem when compiling to 16bit machine code
Tech support#:	425448

Object:	pfc_u_dw
Method:	rbuttonup
Fix:	Corrected so that dwo.protect works properly for protect expressions.
	The Cut and Copy on the PopUp menu now work with protect expression.
Tech support#:	498701

Object:	pfc_u_dw
Method:	of_Retrieve
Fix:	Corrected function return type from integer to long.
Tech support#:	494086

Object:	pfc_u_dw
Method:	rbuttonup
Fix:	Isolated calls to the shared variable snv_property.  This allows for 
	regular overriding of the rbuttonup event.
Tech support#:	498692

Object:	pfc_u_dw
Method:	of_SetDropDownCalculator and of_SetDropDownCalendar
Fix:	Enhanced so that the message object information is not lost when an 
	OpenUserObject function is executed.
Tech support#:	486438
	
Object:	pfc_u_dw
Method:	of_CheckRequired and pfc_checkrequirederror
Fix:	Allow options to better handle customization without having to override 
	the entire function.
Tech support#:	473361


DataWindow PrintPreview Service
-------------------------------
Object:	pfc_n_cst_dwsrv_printpreview, pfc_n_cst_dssrv_printpreview
Method:	of_SetEnabled
Fix:	Corrected by adding check to prevent error condition when datawindow is nested
Tech support#:	401957


DataWindow Linkage Service
--------------------------
Object:	pfc_n_cst_dwsrv_linkage
Method:	of_Retrieve
Fix:	Corrected so that when appropriate scrolling occurs to the desired row 
	after a retrieve
Tech support#:	490794

Object:	pfc_n_cst_dwsrv_linkage
Method:	of_retrieveDetails
Fix:	Corrected so that the return code of an internal PowerScript retrieve call is captured 
	by a long type variable.
Tech support#:	495410


DataWindow Base Service
-----------------------
Object:	pfc_n_cst_dwsrv & pfc_n_cst_dssrv
Method:	of_setitem
Fix:	Correct where number and real datatypes were being converted into long datatypes
Tech support#:	432602

Object:	pfc_n_cst_dwsrv & pfc_n_cst_dssrv
Method:	of_GetItem
Fix:	Corrected so that LookUpDisplay values for DropDownListBoxes are handled.  Computed fields 
	expressions were also improved.
Tech support#:	468405
