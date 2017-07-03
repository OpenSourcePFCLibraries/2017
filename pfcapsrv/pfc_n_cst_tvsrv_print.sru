HA$PBExportHeader$pfc_n_cst_tvsrv_print.sru
$PBExportComments$PFC TreeView Print service
forward
global type pfc_n_cst_tvsrv_print from n_cst_tvsrv
end type
end forward

global type pfc_n_cst_tvsrv_print from n_cst_tvsrv
end type
global pfc_n_cst_tvsrv_print pfc_n_cst_tvsrv_print

type variables

end variables

forward prototypes
public function integer of_printtree (long al_handle, boolean ab_canceldialog, string as_pictname, string as_selpictname)
public function integer of_printtree (long al_handle, boolean ab_canceldialog, string as_levelpicts[10], string as_levelselpicts[10])
public function integer of_printtree (long al_handle, boolean ab_canceldialog)
public function integer of_printtree ()
public function integer of_printtree (long al_handle)
protected function string of_buildtree (long al_handle, string as_picts, string as_levelpicts)
protected function integer of_printtree (long al_handle, boolean ab_canceldialog, string as_pictname, string as_selpictname, string as_levelpicts[10], string as_levelselpicts[10])
protected function string of_buildtreeparentsiblings (long al_handle)
end prototypes

public function integer of_printtree (long al_handle, boolean ab_canceldialog, string as_pictname, string as_selpictname);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_PrintTree
//
//	Access:		public
//
//	Arguments:
//	al_Handle			The handle of the TreeView item to start building the tree.  Pass 0
//							to print the entire tree.
//	ab_CancelDialog	True - display the Cancel Printing dialog,
//							False - do not display the dialog.
//	as_PictName			The file name to display as the picture.
//	as_SelPictName		The file name to display as the selected picture.
//
//	Returns:		Integer
//					1 if successful, -1 if an error occurrs.
//
//	Description:	Print the TreeView.  
//
//		This function overloads the real of_PrintTree which is protected.  Use this
//		format of the function when the same picture is desired for all levels of the tree.
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

String	ls_Picts[10], ls_SelPicts[10]

Return of_PrintTree(al_Handle, ab_CancelDialog, as_PictName, as_SelPictName, ls_Picts, ls_SelPicts)

end function

public function integer of_printtree (long al_handle, boolean ab_canceldialog, string as_levelpicts[10], string as_levelselpicts[10]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_PrintTree
//
//	Access:		public
//
//	Arguments:
//	al_Handle		The handle of the TreeView item to start building the tree.  Pass 0
//						to print the entire tree.
//	ab_CancelDialog	True - display the Cancel Printing dialog,
//							False - do not display the dialog.
//	as_LevelPicts[10]	The file names for all the pictures to display a different picture for
//							each level.
//	as_LevelSelPicts[10]	The file names for all the pictures to display a different selected
//								picture for each level.
//
//	Returns:		Integer
//					1 if successful, -1 if an error occurrs.
//
//	Description:	Print the TreeView.  
//
//		This function overloads the real of_PrintTree which is protected.  Use this
//		format of the function when a different picture is desired for each level of the tree.
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

String	ls_Pict, ls_SelPict

Return of_PrintTree(al_Handle, ab_CancelDialog, ls_Pict, ls_SelPict, as_LevelPicts, as_LevelSelPicts)

end function

public function integer of_printtree (long al_handle, boolean ab_canceldialog);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_PrintTree
//
//	Access:		public
//
//	Arguments:
//	al_Handle		The handle of the TreeView item to start building the tree.  Pass 0
//						to print the entire tree.
//	ab_CancelDialog		True - display the Cancel Printing dialog,
//								False - do not display the dialog.
//
//	Returns:		Integer
//					1 if successful, -1 if an error occurrs.
//
//	Description:	Print the TreeView.  
//
//		This function overloads the real of_PrintTree which is protected.  Use this
//		format of the function when the same picture is desired for all levels of the tree.
//
//		This function will default to using "folder.bmp" for the picture and "foldopen.bmp"
//		for the selected picture.
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

String	ls_Picts[10], ls_SelPicts[10]

Return of_PrintTree(al_Handle, ab_CancelDialog, "folder.bmp", "foldopen.bmp", ls_Picts, ls_SelPicts)

end function

public function integer of_printtree ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_PrintTree
//
//	Access:		public
//
//	Arguments:	None.
//
//	Returns:		Integer
//					1 if successful, -1 if an error occurrs.
//
//	Description:	Print the TreeView.  
//
//		This function overloads the real of_PrintTree which is protected.  Use this
//		format of the function to print the entire tree with the same picture for all 
//		levels.
//
//		This function will default to using "folder.bmp" for the picture and "foldopen.bmp"
//		for the selected picture.
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

String	ls_Picts[10], ls_SelPicts[10]

Return of_PrintTree(0, False, "folder.bmp", "foldopen.bmp", ls_Picts, ls_SelPicts)

end function

public function integer of_printtree (long al_handle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_PrintTree
//
//	Access:		public
//
//	Arguments:
//	al_Handle	The handle of the TreeView item to start building the tree.  Pass 0
//					to print the entire tree.
//
//	Returns:		Integer
//					1 if successful, -1 if an error occurrs.
//
//	Description:	Print the TreeView.  
//
//		This function overloads the real of_PrintTree which is protected.  Use this
//		format of the function when the same picture is desired for all levels.
//
//		This function will default to using "folder.bmp" for the picture and "foldopen.bmp"
//		for the selected picture.
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

String	ls_Picts[10], ls_SelPicts[10]

Return of_PrintTree(al_Handle, False, "folder.bmp", "foldopen.bmp", ls_Picts, ls_SelPicts)

end function

protected function string of_buildtree (long al_handle, string as_picts, string as_levelpicts);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_BuildTree
//
//	Access:		protected
//
//	Arguments:
//	al_Handle		The handle of the TreeView item to start building the tree.
// as_Picts			The file names for the picture and selected picture to display.
// as_LevelPicts	The file names for all the pictures and selected pictures to display
//						when using a different picture for each level.
//
//	Returns:		String
//					The ImportString data to populate the DataWindow that will be printed.
//
//	Description:	Build the data to populate the DataWindow that will be printed to print
//						a TreeView.  This function is called by of_PrintTree and is recurrsive.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
// 9.0	Fix CR296838
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

String				ls_Return
Long					ll_Next
TreeViewItem		ltvi_Item

If al_Handle <= 0 Then Return ""

itv_requestor.GetItem(al_Handle, ltvi_Item)

ls_Return = " ~t" + left(ltvi_Item.Label,55) + "~t" + as_Picts
If ltvi_Item.Selected Then
	ls_Return = ls_Return + "~t1"
Else
	ls_Return = ls_Return + "~t0"
End if
	
If ltvi_Item.Expanded Then
	ls_Return = ls_Return + "~t1"
Else
	ls_Return = ls_Return + "~t0"
End if

If ltvi_Item.Children Then
	ls_Return = ls_Return + "~t1~t0"
Else
	ls_Return = ls_Return + "~t0"
	If itv_requestor.FindItem(NextTreeItem!, al_Handle) > 0 Then
		ls_Return = ls_Return + "~t1"
	Else
		ls_Return = ls_Return + "~t0"
	End if
End if

ls_Return = ls_Return + "~t" + String(ltvi_Item.Level) + "~t" + as_LevelPicts

// Fix CR296838
ls_Return = ls_Return + "~t" + of_buildtreeparentsiblings(al_handle) + "~r~n"

If ltvi_Item.Expanded And ltvi_Item.Children Then
	ll_Next = itv_requestor.FindItem(ChildTreeItem!, al_Handle)
	ls_Return = ls_Return + of_buildtree(ll_Next, as_Picts, as_LevelPicts)
End if

ll_Next = itv_requestor.FindItem(NextTreeItem!, al_Handle)
ls_Return = ls_Return + of_buildtree(ll_Next, as_Picts, as_LevelPicts)

Return ls_Return

end function

protected function integer of_printtree (long al_handle, boolean ab_canceldialog, string as_pictname, string as_selpictname, string as_levelpicts[10], string as_levelselpicts[10]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_PrintTree
//
//	Access:		protected
//
//	Arguments:
//	al_Handle			The handle of the TreeView item to start building the tree.  Pass 0
//							to print the entire tree.
//	ab_CancelDialog	True - display the Cancel Printing dialog,
//							False - do not display the dialog.
//	as_PictName			The file name to display as the picture.
//	as_SelPictName		The file name to display as the selected picture.
//	as_LevelPicts[10]	The file names for all the pictures to display a different picture for
//							each level.
//	as_LevelSelPicts[10]	The file names for all the pictures to display a different selected
//								picture for each level.
//
//	Returns:		Integer
//					1 if successful, -1 if an error occurrs.
//
//	Description:	Print the TreeView.  
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

Integer	li_Cnt, li_RC
String	ls_Picts, ls_LevelPicts
n_ds		lds_Print
string	ls_ret

If al_Handle < 0 Then Return -1

If al_Handle = 0 Then al_Handle = itv_requestor.FindItem(RootTreeItem!, 0)

// Determine the picture and selected picture
If as_PictName = "" Then
	ls_Picts = " ~t"
Else
	ls_Picts = as_PictName + "~t"
End If

If as_SelPictName = "" Then
	ls_Picts = ls_Picts + " "
Else
	ls_Picts = ls_Picts + as_SelPictName
End If

For li_Cnt = 1 To 10
	ls_LevelPicts = ls_LevelPicts + as_LevelPicts[li_Cnt] + "~t"
Next
	
ls_LevelPicts = ls_LevelPicts + as_LevelSelPicts[1]
For li_Cnt = 2 To 10
	ls_LevelPicts = ls_LevelPicts + "~t" + as_LevelSelPicts[li_Cnt]
Next

// Create the DataStore to be used to print the TreeView
lds_Print = Create n_ds
lds_Print.DataObject = "d_printtree"

ls_ret = of_buildtree(al_Handle, ls_Picts, ls_LevelPicts)
If lds_Print.ImportString(ls_ret) <= 0 Then Return -1
li_RC = lds_Print.Print(ab_CancelDialog)
Destroy lds_Print

Return li_RC

end function

protected function string of_buildtreeparentsiblings (long al_handle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:	of_buildtreeparentsiblings
//
//	Access:		protected
//
//	Arguments:
//	al_Handle		The handle of the TreeView item to start building the tree.
//
//	Returns:		String
//					The ImportString data to populate the DataWindow that will be printed.
//
//	Description:	
//	Function added by Vipul. The function recursively goes through ancestors of an item
//	and builds a string of flags indicating whether they had siblings or not.
//	These flags would be picked by d_printree's parentsiblings field which helps display
//	lines beween nodes. The Lines between nodes should only appear if there is a sibling
//	waiting to be printed (NextTreeItem)
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	9.0   Initial version
//			Added to fix CR296838 (June 2003)
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License

 *
 * https://opensource.org/licenses/MIT
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//
//////////////////////////////////////////////////////////////////////////////

long ll_Next
string ls_Return

ll_Next = itv_requestor.FindItem(ParentTreeItem!, al_Handle)

if ll_Next > 0 then
	ls_Return = of_buildtreeparentsiblings(ll_Next)
	if itv_requestor.FindItem(NextTreeItem!, ll_Next) > 0 then
			ls_Return = ls_Return + "1"
		else
			ls_Return = ls_Return + "0"
	end if
else
	ls_Return = "0"
end if

return ls_Return
end function

on pfc_n_cst_tvsrv_print.create
call super::create
end on

on pfc_n_cst_tvsrv_print.destroy
call super::destroy
end on

