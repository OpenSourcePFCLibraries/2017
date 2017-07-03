HA$PBExportHeader$u_tabresize.sru
forward
global type u_tabresize from u_tab
end type
type tabpage_1 from u_tabpgone within u_tabresize
end type
type tabpage_2 from u_tabpgtwo within u_tabresize
end type
type tabpage_3 from u_tabpgthree within u_tabresize
end type
end forward

global type u_tabresize from u_tab
int Width=1559
int Height=681
boolean CreateOnDemand=true
long BackColor=77571519
tabpage_1 tabpage_1
tabpage_2 tabpage_2
tabpage_3 tabpage_3
end type
global u_tabresize u_tabresize

type variables

end variables

on u_tabresize.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.tabpage_3=create tabpage_3
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=tabpage_1
this.Control[iCurrent+2]=tabpage_2
this.Control[iCurrent+3]=tabpage_3
end on

on u_tabresize.destroy
call super::destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
destroy(this.tabpage_3)
end on

type tabpage_1 from u_tabpgone within u_tabresize
int X=19
int Y=101
int Width=1523
int Height=565
end type

type tabpage_2 from u_tabpgtwo within u_tabresize
int X=19
int Y=101
int Width=1523
int Height=565
end type

type tabpage_3 from u_tabpgthree within u_tabresize
int X=19
int Y=101
int Width=1523
int Height=565
end type

