HA$PBExportHeader$pfcscanner_n_cst_filesrvsol2.sru
$PBExportComments$PFC Solaris File handler service
forward
global type pfcscanner_n_cst_filesrvsol2 from pfcscanner_n_cst_filesrv
end type
end forward

global type pfcscanner_n_cst_filesrvsol2 from pfcscanner_n_cst_filesrv
end type
global pfcscanner_n_cst_filesrvsol2 pfcscanner_n_cst_filesrvsol2

type prototypes
end prototypes

type variables
end variables

forward prototypes
end prototypes

on pfcscanner_n_cst_filesrvsol2.create
call super::create
end on

on pfcscanner_n_cst_filesrvsol2.destroy
call super::destroy
end on

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//	Event:  Constructor
//	Description:	Set the instance variables for the directory separator
//						and wildcard for all files for this OS.
//////////////////////////////////////////////////////////////////////////////
//	Rev. History:	Version
//						5.0.02   Initial version
//////////////////////////////////////////////////////////////////////////////
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2017, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the MIT License
 * 
 *
 * http://www.gnu.org/copyleft/lesser.html
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see https://github.com/OpenSourcePFCLibraries
*/
//////////////////////////////////////////////////////////////////////////////
is_Separator = "/"
is_AllFiles = "*"
is_FileType = "pbl"
end event

