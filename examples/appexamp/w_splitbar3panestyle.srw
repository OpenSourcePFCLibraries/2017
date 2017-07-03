HA$PBExportHeader$w_splitbar3panestyle.srw
$PBExportComments$SplitBar 3 Pane Style Example
forward
global type w_splitbar3panestyle from w_main
end type
type rte_topright from u_rte within w_splitbar3panestyle
end type
type mle_bottom from u_mle within w_splitbar3panestyle
end type
type st_h1 from u_st_splitbar within w_splitbar3panestyle
end type
type st_v1 from u_st_splitbar within w_splitbar3panestyle
end type
type rte_topleft from u_rte within w_splitbar3panestyle
end type
end forward

global type w_splitbar3panestyle from w_main
int X=713
int Y=376
int Width=1006
int Height=968
boolean TitleBar=true
string Title="PFC Example - Split Bar 3 Pane Style"
rte_topright rte_topright
mle_bottom mle_bottom
st_h1 st_h1
st_v1 st_v1
rte_topleft rte_topleft
end type
global w_splitbar3panestyle w_splitbar3panestyle

type variables

end variables

on w_splitbar3panestyle.create
int iCurrent
call super::create
this.rte_topright=create rte_topright
this.mle_bottom=create mle_bottom
this.st_h1=create st_h1
this.st_v1=create st_v1
this.rte_topleft=create rte_topleft
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rte_topright
this.Control[iCurrent+2]=this.mle_bottom
this.Control[iCurrent+3]=this.st_h1
this.Control[iCurrent+4]=this.st_v1
this.Control[iCurrent+5]=this.rte_topleft
end on

on w_splitbar3panestyle.destroy
call super::destroy
destroy(this.rte_topright)
destroy(this.mle_bottom)
destroy(this.st_h1)
destroy(this.st_v1)
destroy(this.rte_topleft)
end on

event pfc_preopen;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_preopen
//
//	Arguments:
//	None
//
//	Returns:
// None
//
//	Description:
// Register with the SplitBar and Resize service.
//
//////////////////////////////////////////////////////////////////////////////

// Register the controls with the Vertical SplitBar
st_v1.of_Register(rte_topleft, st_v1.LEFT)
st_v1.of_Register(rte_topright, st_v1.RIGHT)

// Register the controls with the Horizontal SplitBar
st_h1.of_Register(rte_topleft, st_h1.ABOVE)
st_h1.of_Register(rte_topright, st_h1.ABOVE)
st_h1.of_Register(st_v1, st_h1.ABOVE)
st_h1.of_Register(mle_bottom, st_h1.BELOW)

// Window Resize behavior
of_SetResize(true)
inv_resize.of_Register(rte_topright, 0, 0, 100, 0)
inv_resize.of_Register(st_h1, 0, 0, 100, 0)
inv_resize.of_Register(mle_bottom, 0, 0, 100, 100)

end event

type rte_topright from u_rte within w_splitbar3panestyle
int X=411
int Y=8
int Width=539
int Height=448
int TabOrder=20
boolean BringToTop=true
end type

on rte_topright.create
call super::create
HScrollBar=true
VScrollBar=true
RulerBar=true
BackColor=1090519039
InputFieldBackColor=1090519039
end on

type mle_bottom from u_mle within w_splitbar3panestyle
int X=18
int Y=476
int Width=933
int Height=368
int TabOrder=30
boolean BringToTop=true
long TextColor=33554432
end type

type st_h1 from u_st_splitbar within w_splitbar3panestyle
int X=18
int Y=456
int Width=933
end type

type st_v1 from u_st_splitbar within w_splitbar3panestyle
int X=389
int Y=8
int Width=18
int Height=448
end type

type rte_topleft from u_rte within w_splitbar3panestyle
int X=18
int Y=8
int Width=370
int Height=448
int TabOrder=10
boolean BringToTop=true
end type

on rte_topleft.create
call super::create
HScrollBar=true
VScrollBar=true
RulerBar=true
BackColor=1090519039
InputFieldBackColor=1090519039
end on

