*************************************************************************
      PowerBuilder Foundation Class Library Version 9.0
                   R E L E A S E   N O T E S

      Copyright © 1996-2003 Sybase, Inc. and its subsidiaries.  
      All rights reserved.

*************************************************************************
      Last Updated: January 17, 2003
*************************************************************************
Please take a few minutes to review this file for fixes that were made in
PowerBuilder 8.0.2 and 9.0. 

*************************************************************************
BUG FIXES IN PFC 9.0
*************************************************************************
CR300376	
	Object: pfc_n_cst_fileSrv, pfc_n_cst_fileSrvwin32
	Method:	OfGetDiskSpace
	Fix:	Method returned a negative number when the calculated 
	        amount of free disk space exceeded 2 gigabytes. Added new
	        method of_GetDiskSpaceEx that takes decimals as arguments
	        instead of longs. of_GetDiskSpace will be obsolete in a
	        future release.

*************************************************************************
BUG FIXES IN PFC 8.0.2
*************************************************************************
PFC.PBR

	CR256529					
	Fix:	The PFC.PBR file can be used to copy bitmaps and 
	        dynamically referenced DataWindow objects into the 
	        executable file for deployment. The following bitmap 
	        files that were removed from PFC have now been removed 
	        from the PFC.PBR file: details.bmp, helptop.bmp, 
	        largeico.bmp, listv.bmp, and smallico.bmp.
	========================================================
PFC DataStore

	CR261992					
	Object:	pfc_u_ds									
	Method:	pfc_print/pfc_printdlg
	Fix:	Changed the return code test to check for 1 on success,
	        otherwise there is an error or the user cancelled.
	Fix:	Set the printer upon return from the print dialog.
	========================================================

*************************************************************************
(c) 1991-2003 Sybase, Inc. and its subsidiaries. All rights reserved.  
Sybase, Inc. and its subsidiaries ("Sybase") claim copyright in this 
rogram and documentation as an unpublishedwork, versions of which were 
first licensed on the date indicated in the foregoing notice. Claim of 
copyright does not imply waiver of Sybase's other rights. See Notice of 
Proprietary Rights.

NOTICE OF PROPRIETARY RIGHTS

This computer program and documentation are confidential trade secrets 
and the property of Sybase, Inc. and its subsidiaries. Use, examination,
reproduction, copying, disassembly, decompilation, transfer and/or 
disclosure to others, in whole or in part, are strictly prohibited except
with the express prior written consent of Sybase, Inc. and its 
subsidiaries.

