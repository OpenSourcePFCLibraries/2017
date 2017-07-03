HA$PBExportHeader$w_pfcsecurity_frame.srw
$PBExportComments$PFC Security Admin frame
forward
global type w_pfcsecurity_frame from w_frame
end type
end forward

global type w_pfcsecurity_frame from w_frame
integer x = 5
integer y = 4
integer width = 2962
integer height = 1860
string title = "PFC Security Administration"
string menuname = "m_pfcsecurity_frame"
windowstate windowstate = maximized!
long backcolor = 80921269
boolean toolbarvisible = false
end type
global w_pfcsecurity_frame w_pfcsecurity_frame

on w_pfcsecurity_frame.create
call super::create
if IsValid(this.MenuID) then destroy(this.MenuID)
if this.MenuName = "m_pfcsecurity_frame" then this.MenuID = create m_pfcsecurity_frame
end on

on w_pfcsecurity_frame.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
//	Object Name:  w_pfcsecurity_frame
//
//	Description:  MDI frame for PFC Security administration utility
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
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License

//
// https://opensource.org/licenses/MIT
//
// ======================================================================
//
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
//////////////////////////////////////////////////////////////////////////////

end event

event pfc_postopen;call super::pfc_postopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  postopen
//
//	Arguments:None
//
//	Returns:  None
//
//	Description:  Get login information, halt application if unable to connect to database
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
// Open Source PowerBuilder Foundation Class Libraries
//
// Copyright (c) 2004-2017, All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted in accordance with the MIT License

//
// https://opensource.org/licenses/MIT
//
// ======================================================================
//
// This software consists of voluntary contributions made by many
// individuals and was originally based on software copyright (c) 
// 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
// information on the Open Source PowerBuilder Foundation Class
// Libraries see https://github.com/OpenSourcePFCLibraries
//
//////////////////////////////////////////////////////////////////////////////

integer	li_rc


open(w_pfcsecurity_login,this)  // get the login information
if dbhandle(gnv_app.inv_trans) = 0 then
	halt close
	return
end if


end event

