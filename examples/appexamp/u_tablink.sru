HA$PBExportHeader$u_tablink.sru
forward
global type u_tablink from u_tab
end type
type tabpage_1 from u_custinfotab within u_tablink
end type
type tabpage_2 from u_prodlinetab within u_tablink
end type
type tabpage_3 from u_salesreptab within u_tablink
end type
end forward

global type u_tablink from u_tab
int Width=2560
int Height=724
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
global u_tablink u_tablink

on u_tablink.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tabpage_1
this.Control[iCurrent+2]=this.tabpage_2
this.Control[iCurrent+3]=this.tabpage_3
end on

on u_tablink.destroy
call super::destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

type tabpage_1 from u_custinfotab within u_tablink
int X=18
int Y=100
int Width=2523
int Height=608
long BackColor=80263328
string Text="Customer (by Scroll)"
long TabBackColor=80263328
end type

type tabpage_2 from u_prodlinetab within u_tablink
int X=18
int Y=100
int Width=2523
int Height=608
long BackColor=80263328
string Text="Items Ordered (by Retrieval)"
long TabBackColor=80263328
end type

type tabpage_3 from u_salesreptab within u_tablink
int X=18
int Y=100
int Width=2523
int Height=608
long BackColor=80263328
long TabBackColor=80263328
end type

