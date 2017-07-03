HA$PBExportHeader$pfc_n_cst_sortattrib.sru
$PBExportComments$PFC Attributes for DataWindow Sort service
forward
global type pfc_n_cst_sortattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_sortattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
string	is_sort
string 	is_sortcolumns[]
string	is_colnamedisplay[]
boolean 	ib_usedisplay[]
string 	is_origcolumns[]
string 	is_origorder[]
end variables

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  pfc_n_cst_sortattrib
//
//	Description:  A NVO class to hold attributes for pfc_n_cst_dwsrv_sort
//				     service object.
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

end event

on pfc_n_cst_sortattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_sortattrib.destroy
TriggerEvent( this, "destructor" )
end on

