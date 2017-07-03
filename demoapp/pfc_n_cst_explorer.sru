HA$PBExportHeader$pfc_n_cst_explorer.sru
$PBExportComments$The service for windows that need an "Explorer" style interface, with a Horizontal Split Bar between TreeView and ListView.
forward
global type pfc_n_cst_explorer from pfc_n_cst_winsrv
end type
end forward

global type pfc_n_cst_explorer from pfc_n_cst_winsrv
event resize ( )
end type
global pfc_n_cst_explorer pfc_n_cst_explorer

type variables
Private:
     boolean ib_dragable
     dragobject  idrg_leftpane
     dragobject  idrg_rightpane
     dragobject  idrg_leftheader
     dragobject  idrg_rightheader
     u_st_hsplitbar ist_hsplit_bar
     integer is_defaultSplitBarPos = 1200


end variables

forward prototypes
public function integer of_resize ()
public function integer of_setleftpane (dragobject adrg_left_pane)
public function integer of_setrightpane (dragobject adrg_right_pane)
public function integer of_setcontrols (dragobject adrg_leftpane, dragobject adrg_rightpane)
public function integer of_setcontrols (dragobject adrg_leftpane, dragobject adrg_rightpane, dragobject adrg_leftheader, dragobject adrg_rightheader)
public subroutine of_setdefaultsplitbarpos (integer ai_defaultsplitbarpos)
end prototypes

event resize;call pfc_n_cst_winsrv::resize;this.of_resize()
end event

public function integer of_resize ();integer li_explrheight
integer li_explrwidth
integer li_leftY
integer li_rightY
integer li_X
integer li_MicroHelpHeight
w_frame lw_frame

IF iw_requestor.WindowType = MDI! OR iw_requestor.WindowType = MDIHelp! THEN
	lw_frame = iw_requestor
	li_MicroHelpHeight = lw_frame.mdi_1.MicroHelpHeight
	li_explrheight = lw_frame.WorkSpaceHeight ( ) - li_MicroHelpHeight
ELSE
	li_explrheight = iw_requestor.WorkSpaceHeight ( )
END IF

li_explrwidth = iw_requestor.WorkSpaceWidth ( )

IF IsValid (idrg_leftpane) AND IsValid (idrg_rightpane) THEN
	IF IsValid(idrg_leftHeader) AND IsValid(idrg_rightHeader) THEN
		li_leftY = idrg_leftHeader.y + idrg_leftHeader.Height + 23
		li_rightY = idrg_rightHeader.y + idrg_rightHeader.Height + 23
	ELSE
		li_leftY = 1
		li_rightY = 1
	END IF
	/*
	** Reposition explorer controls
	*/
	idrg_leftpane.Move (idrg_leftPane.X, li_leftY)
	IF IsValid(idrg_leftHeader) THEN idrg_leftHeader.Move (idrg_leftpane.X, 1)
	idrg_rightpane.Move (ist_hsplit_bar.X + ist_hsplit_bar.Width + 1, li_rightY)
	IF IsValid(idrg_rightHeader) THEN idrg_rightHeader.Move (ist_hsplit_bar.X + ist_hsplit_bar.Width, 1)
	/*
	**  Resize explorer controls
	*/
	idrg_leftpane.Resize (ist_hsplit_bar.X - idrg_leftPane.X, li_explrheight)
	IF IsValid(idrg_leftHeader) THEN idrg_leftHeader.Resize (ist_hsplit_bar.X, idrg_leftHeader.height)
	idrg_rightpane.Resize (li_explrwidth - ((ist_hsplit_bar.X + &
			ist_hsplit_bar.Width - idrg_leftpane.X)), li_explrheight)
	IF IsValid(idrg_rightHeader) THEN idrg_rightHeader.Resize (li_explrwidth - ((ist_hsplit_bar.X + &
			ist_hsplit_bar.Width) - idrg_leftpane.X), idrg_rightHeader.height)

END IF

ist_hsplit_bar.Width = 23
ist_hsplit_bar.Height = li_explrheight - idrg_leftpane.Y
ist_hsplit_bar.Y = idrg_leftpane.Y

RETURN 0
end function

public function integer of_setleftpane (dragobject adrg_left_pane);integer li_rtnvalue

IF IsValid (adrg_left_pane) THEN
	idrg_leftpane = adrg_left_pane
	li_rtnvalue = 1
ELSE
	li_rtnvalue = -1
END IF

RETURN li_rtnvalue
end function

public function integer of_setrightpane (dragobject adrg_right_pane);integer li_rtnvalue

IF IsValid (adrg_right_pane) THEN
	idrg_rightpane = adrg_right_pane
	li_rtnvalue = 1
ELSE
	li_rtnvalue = -1
END IF

RETURN li_rtnvalue
end function

public function integer of_setcontrols (dragobject adrg_leftpane, dragobject adrg_rightpane);DRAGOBJECT ldrg_null1, ldrg_null2

of_setControls(adrg_leftpane, adrg_rightpane, ldrg_null1, ldrg_null2)

RETURN 0
end function

public function integer of_setcontrols (dragobject adrg_leftpane, dragobject adrg_rightpane, dragobject adrg_leftheader, dragobject adrg_rightheader);INTEGER li_controlMax

idrg_leftpane = adrg_leftpane
idrg_rightpane = adrg_rightpane
idrg_leftheader = adrg_leftheader
idrg_rightheader = adrg_rightheader

iw_requestor.OpenUserObject(ist_hsplit_bar,is_defaultSplitBarPos,1)

li_controlMax = UpperBound(iw_requestor.control)
li_controlMax ++
iw_requestor.control[li_controlMax] = ist_hsplit_bar

RETURN 0
end function

public subroutine of_setdefaultsplitbarpos (integer ai_defaultsplitbarpos);is_defaultSplitBarPos = ai_defaultsplitbarpos

RETURN
end subroutine

on pfc_n_cst_explorer.create
TriggerEvent( this, "constructor" )
end on

on pfc_n_cst_explorer.destroy
TriggerEvent( this, "destructor" )
end on

event destructor;call pfc_n_cst_winsrv::destructor;//IF IsValid(iw_requestor) THEN
//	IF IsValid(ist_hsplit_bar) THEN
//		int asdf
//		asdf++
//		iw_requestor.CloseUserObject(ist_hsplit_bar)
//		asdf++
//	END IF
//END IF
end event

