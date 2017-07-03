HA$PBExportHeader$pfc_n_cst_filterattrib.sru
$PBExportComments$PFC Attributes for DataWindow Filter service
forward
global type pfc_n_cst_filterattrib from n_cst_baseattrib
end type
end forward

global type pfc_n_cst_filterattrib from n_cst_baseattrib autoinstantiate
end type

type variables
Public:
string	is_filter
string 	is_columns[]
string 	is_colnamedisplay[]
string 	is_dbnames[]
u_dw 	idw_dw
end variables

event constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  pfc_n_cst_filterattrib
//
//	Description:  A NVO class to hold attributes for pfc_n_cst_dwsrv_filter
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

on pfc_n_cst_filterattrib.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_filterattrib.destroy
TriggerEvent( this, "destructor" )
end on

