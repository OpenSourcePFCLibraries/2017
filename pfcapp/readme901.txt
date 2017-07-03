**********************************************************************
      PowerBuilder Foundation Class Library Version 9.0.1
                   R E L E A S E   N O T E S

      Copyright © 1996-2003 Sybase, Inc. and its subsidiaries.  All 
      rights reserved.

      Last Updated: July 11, 2003

**********************************************************************
BUG FIXES IN PFC 9.0.1 AND 8.0.3 BUILD 9972
**********************************************************************

PFC TreeView

	CR296838					
	Object:	n_cst_tvsrv_print									
	Method:	of_BuildTreeParentSiblings
	Fix:	Introduced a new function of_buildtreeparentsiblings() 
                to record the lines linking sibling items in a 
		TreeView control. The function description follows.

Description
Builds part of the string used to populate a DataStore so that lines 
linking sibling items are represented when the TreeView is printed.

Access
Protected

Syntax
tvcontrol.instancename.of_buildtreeparentsiblings ( handle )

Argument 	Description
tvcontrol	Instance name of the u_tvs-based TreeView control
instancename	Instance name of n_cst_tvsrv_print (the u_tvs default
		 is inv_print)
handle		Long containing the handle of the TreeView item from 
		which to start building the data to print

Return value
String. Returns a string that represents the sibling relationship
between items in the tree view. The string is used in conjunction with
the string returned from the of_buildtree function to populate a 
temporary DataStore object that can be printed.

Usage
Internal.

Examples
This example appends the output from the of_BuildTree function to the
output from of_BuildTreeParentSiblings:
...
ls_Return += "~t" + String(ltvi_Item.Level) + "~t" + as_LevelPicts

ls_Return += "~t" + of_buildtreeparentsiblings(al_handle) + "~r~n"

If ltvi_Item.Expanded And ltvi_Item.Children Then
	ll_Next = itv_requestor.FindItem(ChildTreeItem!, al_Handle)
	ls_Return += of_buildtree(ll_Next, as_Picts, as_LevelPicts)
End if
 
*******************************************************************
BUG FIXES IN PFC 9.0
*******************************************************************
	CR300376	
	Object: pfc_n_cst_fileSrv, pfc_n_cst_fileSrvwin32
	Method:	OfGetDiskSpace
	Fix:	Method returned a negative number when the 
	        calculated amount of free disk space exceeded 2 
	        gigabytes. Added new method  of_GetDiskSpaceEx that
	        takes decimals as arguments instead of longs. 
	        of_GetDiskSpace will be obsolete in a future release.

**********************************************************************
BUG FIXES IN PFC 8.0.2
**********************************************************************

PFC.PBR

	CR256529					
	Fix:	The PFC.PBR file can be used to copy bitmaps and 
	        dynamically referenced DataWindow objects into the 
	        executable file for deployment. The following bitmap 
	        files that were removed from PFC have now been removed
	        from the PFC.PBR file: details.bmp, helptop.bmp, 
	        largeico.bmp, listv.bmp, and smallico.bmp.
======================================================================
	
PFC DataStore

	CR261992					
	Object:	pfc_u_ds									
	Method:	pfc_print/pfc_printdlg
	Fix:	Changed the return code test to check for 1 on
	        success, otherwise there is an error or the user 
	        cancelled. Set the printer upon return from the print
	        dialog box.
======================================================================
