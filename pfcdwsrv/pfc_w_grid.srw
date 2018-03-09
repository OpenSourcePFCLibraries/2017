HA$PBExportHeader$pfc_w_grid.srw
$PBExportComments$PFC Grid service dialog window
forward
global type pfc_w_grid from w_response
end type
type cbx_restore from checkbox within pfc_w_grid
end type
type cb_down from pfc_u_cb within pfc_w_grid
end type
type cb_up from pfc_u_cb within pfc_w_grid
end type
type cb_invisible_all from pfc_u_cb within pfc_w_grid
end type
type cb_visible_all from pfc_u_cb within pfc_w_grid
end type
type cb_apply from pfc_u_cb within pfc_w_grid
end type
type cb_ok from pfc_u_cb within pfc_w_grid
end type
type cb_cancel from pfc_u_cb within pfc_w_grid
end type
type dw_1 from u_dw within pfc_w_grid
end type
end forward

global type pfc_w_grid from w_response
integer width = 3054
integer height = 1620
boolean center = true
boolean ib_isupdateable = false
event pfc_visibleall ( )
event pfc_invisibleall ( )
event pfc_up ( )
event pfc_down ( )
cbx_restore cbx_restore
cb_down cb_down
cb_up cb_up
cb_invisible_all cb_invisible_all
cb_visible_all cb_visible_all
cb_apply cb_apply
cb_ok cb_ok
cb_cancel cb_cancel
dw_1 dw_1
end type
global pfc_w_grid pfc_w_grid

type variables
Public:
constant integer	UP 		= 1
constant integer	DOWN 	= 2

Protected:
u_dw		idw_requestor
end variables

forward prototypes
protected function integer of_refresh ()
public function integer of_move (integer ai_direction)
public function integer of_visibleall ()
public function integer of_invisibleall ()
protected function integer of_setvisible (string as_exp)
end prototypes

event pfc_visibleall();//////////////////////////////////////////////////////////////////////////////
//
// Event:			pfc_visibleall
//
// Access:			public
//
// Returns:			(none)
//						
//
// Description:	Make all entries of the list visible
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial version
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
this.of_visibleall( )
end event

event pfc_invisibleall();//////////////////////////////////////////////////////////////////////////////
//
// Event:			pfc_invisibleall
//
// Access:			public
//
// Returns:			(none)
//						
//
// Description:	Make all entries of the list invisible
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial version
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

this.of_invisibleall( )
end event

event pfc_up();//////////////////////////////////////////////////////////////////////////////
//
// Event:			pfc_up
//
// Access:			public
//
// Returns:			(none)
//						
//
// Description:	Change the order of appearance of the selected entry by
//						moving it up of one position.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial version
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

of_move( UP )
end event

event pfc_down();//////////////////////////////////////////////////////////////////////////////
//
// Event:			pfc_down
//
// Access:			public
//
// Returns:			(none)
//						
//
// Description:	Change the order of appearance of the selected entry by
//						moving it down of one position.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial version
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

of_move( DOWN )
end event

protected function integer of_refresh ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_refresh
//
// Access:			Protected
//
// Returns:			integer
//						 1, success
//						-1, failure
//
// Description:	Refresh repository contents & display it
//
// Usage:			This methos is called by the open() event.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial version
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

integer 	li_rc = success
integer	li_limit

// Populate Dialog
li_rc = idw_requestor.inv_grid.of_populate()
if li_rc <> success then return failure


li_rc = idw_requestor.inv_grid.ids_repository.sharedata( dw_1 )
if li_rc <> success then return failure

// Reset modifications status
dw_1.resetupdate( )

return li_rc
end function

public function integer of_move (integer ai_direction);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_move
//
// Access:			Public
//
// Arguments:
// ai_direction:		UP (1) 
//						DOWN (2)
//
// Returns:			integer
//						 1, success
//						-1, failure
//
// Description:	change the order of appearance of the current selection
//						by moving it into the specified direction.
//
// Usage:			This method is called by the pfc_up() & pfc_down() events.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial version
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

long		ll_selection[]
long		ll_i
long		ll_limit
long		ll_current
long		ll_previous
long		ll_next
string		ls_order_previous
string		ls_order_next
string		ls_order_current
string		ls_order_tmp

// Get actual row selection
ll_limit = dw_1.inv_rowselect.of_selectedcount( ll_selection )

// if no row selected, quit wihout doing anytihing
if ll_limit < 1 then return no_action

// Move selection into the specified direction
choose case ai_direction
	case up
		// Do nothing if the first selected row is the first row of the list
		if ll_selection[1] = 1 then return no_action
		for ll_i = 1 to ll_limit
			ll_current = ll_selection[ll_i]
			ll_previous = ll_current - 1
			ls_order_tmp = dw_1.object.column_order[ ll_previous  ]
			ls_order_previous = dw_1.object.column_order[ll_current]
			ls_order_current = ls_order_tmp
			dw_1.object.column_order[ll_previous] = ls_order_previous
			dw_1.object.column_order[ll_current ] = ls_order_current
		next
	case down
		// Do nothing if the last selected row is the last one of the list
		if ll_selection[ll_limit] = dw_1.rowcount( ) then return no_action
			for ll_i = ll_limit to ll_limit step -1
				ll_current 	= ll_selection[ll_i]
				ll_next 		= ll_current + 1
			ls_order_tmp = dw_1.object.column_order[ll_next]
			ls_order_next = dw_1.object.column_order[ll_current]
			ls_order_current = ls_order_tmp
			dw_1.object.column_order[ll_next] = ls_order_next
			dw_1.object.column_order[ll_current ] = ls_order_current
		next
	case else
		return failure
end choose

dw_1.sort()

return success
end function

public function integer of_visibleall ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_visibleall
//
// Access:			Public
//
// Returns:			integer
//						 1, success
//						-1, failure
//
// Description:	Make all entries of the repostitory viisible
//
// Usage:			This method is invoked when the pfc_visibleall() event
//							is called.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial version
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

return this.of_Setvisible("1")
end function

public function integer of_invisibleall ();//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_invisibleall
//
// Access:			Public
//
// Returns:			integer
//						 1, success
//						-1, failure
//
// Description:	Make all entries of the repostitory invisible
//
// Usage:			This method is invoked when the pfc_invisibleall() event
//							is called.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial version
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

return this.of_Setvisible( "0" )
end function

protected function integer of_setvisible (string as_exp);//////////////////////////////////////////////////////////////////////////////
//
// Function:		of_setvisible
//
// Access:			Protected
//
// Arguments:
// as_exp:		Visible expression to be applied as set in the DW
//						painter.
//
// Returns:			integer
//						 1, sucess
//						-1, failure
//
// Description:	Set all entries visible
//
// Usage:			This method is called by the of_visibleall() &
//							of_invisibleall() methods.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial version
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

long 	ll_i
long	ll_limit

if isnull(as_exp) or len(trim(as_exp)) = 0 then return failure

ll_limit = dw_1.rowcount()
if ll_limit < 1 then return no_action

for ll_i = 1 to ll_limit
	dw_1.object.column_visible[ll_i] = as_exp
next

return success
end function

on pfc_w_grid.create
int iCurrent
call super::create
this.cbx_restore=create cbx_restore
this.cb_down=create cb_down
this.cb_up=create cb_up
this.cb_invisible_all=create cb_invisible_all
this.cb_visible_all=create cb_visible_all
this.cb_apply=create cb_apply
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_restore
this.Control[iCurrent+2]=this.cb_down
this.Control[iCurrent+3]=this.cb_up
this.Control[iCurrent+4]=this.cb_invisible_all
this.Control[iCurrent+5]=this.cb_visible_all
this.Control[iCurrent+6]=this.cb_apply
this.Control[iCurrent+7]=this.cb_ok
this.Control[iCurrent+8]=this.cb_cancel
this.Control[iCurrent+9]=this.dw_1
end on

on pfc_w_grid.destroy
call super::destroy
destroy(this.cbx_restore)
destroy(this.cb_down)
destroy(this.cb_up)
destroy(this.cb_invisible_all)
destroy(this.cb_visible_all)
destroy(this.cb_apply)
destroy(this.cb_ok)
destroy(this.cb_cancel)
destroy(this.dw_1)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////////////
//
// Event: Open
//
// Description:	Prepare dialog & refresh content
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//	12.5		Initial version
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

// Extented

PowerObject	lpo

// Get ref to the requestor dw
lpo = message.PowerObjectParm
if isnull( lpo) or not isvalid( lpo ) then return failure
idw_requestor = lpo

// Enable extented row selection
dw_1.of_setrowselect( true )
dw_1.inv_rowselect.of_setstyle( dw_1.inv_rowselect.single )

// Set Dialog title
this.title = idw_requestor.inv_grid.of_getdialogtitle( )

// Refresh content
this.of_refresh( )

end event

event pfc_cancel;call super::pfc_cancel;//////////////////////////////////////////////////////////////////////////////
//
// Event: pfc_cancel
//
// Description:	Cancel layout changes & close dialog
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial version
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
// Extends

closewithreturn( this, "#CANCEL#" )
end event

event pfc_default;call super::pfc_default;//////////////////////////////////////////////////////////////////////////////
//
// Event: pfc_default
//
// Description:	Apply layout and close dialog.
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5	Initial version
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

// Apply changes only if modifications have been made
// or restore of original layout has been requested
if cbx_restore.checked = true then
	this.event pfc_apply()
elseif dw_1.modifiedcount( ) > 0 then
	this.event pfc_apply()
end if

closewithreturn( this, "#DEFAULT#" )
end event

event pfc_apply;call super::pfc_apply;//////////////////////////////////////////////////////////////////////////////
//
// Event: pfc_apply
//
// Description:	Apply current layout
//
//////////////////////////////////////////////////////////////////////////////
//
// Revision History
//
// Version
//		12.5		Initial version
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

if cbx_restore.checked = true then
	idw_requestor.inv_grid.of_restoreoriginallayout( )
else
	idw_requestor.inv_grid.of_apply()	
end if
end event

type cbx_restore from checkbox within pfc_w_grid
integer x = 1271
integer y = 1424
integer width = 590
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Restore original layout"
end type

type cb_down from pfc_u_cb within pfc_w_grid
integer x = 951
integer y = 1412
integer width = 192
integer taborder = 80
integer textsize = -12
fontcharset fontcharset = symbol!
fontfamily fontfamily = anyfont!
string facename = "Wingdings"
string text = "$$HEX1$$f200$$ENDHEX$$"
end type

event clicked;call super::clicked;parent.event pfc_down()
end event

type cb_up from pfc_u_cb within pfc_w_grid
integer x = 745
integer y = 1412
integer width = 192
integer taborder = 70
integer textsize = -12
fontcharset fontcharset = symbol!
fontfamily fontfamily = anyfont!
string facename = "Wingdings"
string text = "$$HEX1$$f100$$ENDHEX$$"
end type

event clicked;call super::clicked;parent.event pfc_up()
end event

type cb_invisible_all from pfc_u_cb within pfc_w_grid
integer x = 379
integer y = 1412
integer taborder = 60
string text = "Invisible All"
end type

event clicked;call super::clicked;parent.event pfc_invisibleall()
end event

type cb_visible_all from pfc_u_cb within pfc_w_grid
integer x = 14
integer y = 1412
integer taborder = 50
string text = "Visible All"
end type

event clicked;call super::clicked;parent.event pfc_visibleall()
end event

type cb_apply from pfc_u_cb within pfc_w_grid
integer x = 1934
integer y = 1412
integer taborder = 40
string text = "Apply"
end type

event clicked;call super::clicked;parent.event pfc_apply()
end event

type cb_ok from pfc_u_cb within pfc_w_grid
integer x = 2299
integer y = 1412
integer taborder = 30
string text = "OK"
boolean default = true
end type

event clicked;call super::clicked;parent.event pfc_default()
end event

type cb_cancel from pfc_u_cb within pfc_w_grid
integer x = 2665
integer y = 1412
integer taborder = 20
string text = "Cancel"
boolean cancel = true
end type

event clicked;call super::clicked;parent.event pfc_cancel()
end event

type dw_1 from u_dw within pfc_w_grid
integer x = 18
integer y = 20
integer width = 3003
integer height = 1348
integer taborder = 10
string title = "none"
string dataobject = "d_dwsrv_grid_ui"
boolean hscrollbar = true
end type

