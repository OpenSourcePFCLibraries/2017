HA$PBExportHeader$w_buildfilter.srw
$PBExportComments$NEW!  Building Dynamic Filter Expressions using the base DataWindow service.
forward
global type w_buildfilter from w_main
end type
type dw_1 from u_dw within w_buildfilter
end type
type cb_close from u_cb within w_buildfilter
end type
type sle_value from u_sle within w_buildfilter
end type
type st_4 from u_st within w_buildfilter
end type
type st_5 from u_st within w_buildfilter
end type
type cb_dwbuildexpr from u_cb within w_buildfilter
end type
type sle_showexpr from u_sle within w_buildfilter
end type
type st_2 from u_st within w_buildfilter
end type
type st_3 from u_st within w_buildfilter
end type
type ddlb_dwoperator from u_ddlb within w_buildfilter
end type
type cb_buildexpr from u_cb within w_buildfilter
end type
type ddlb_operator from u_ddlb within w_buildfilter
end type
type gb_2 from u_gb within w_buildfilter
end type
type st_1 from u_st within w_buildfilter
end type
type cb_reset from u_cb within w_buildfilter
end type
type st_6 from u_st within w_buildfilter
end type
type ddlb_dwcolumn from u_ddlb within w_buildfilter
end type
type st_7 from u_st within w_buildfilter
end type
type mle_2 from u_mle within w_buildfilter
end type
type mle_1 from u_mle within w_buildfilter
end type
type gb_1 from u_gb within w_buildfilter
end type
type st_dwrow from u_st within w_buildfilter
end type
type ddlb_column from u_ddlb within w_buildfilter
end type
type cb_apply from u_cb within w_buildfilter
end type
end forward

global type w_buildfilter from w_main
int X=105
int Y=4
int Width=2715
int Height=1748
boolean TitleBar=true
string Title="PFC Example:  Dynamic Filter Expressions"
boolean Resizable=false
event ue_buildexpr1 ( )
dw_1 dw_1
cb_close cb_close
sle_value sle_value
st_4 st_4
st_5 st_5
cb_dwbuildexpr cb_dwbuildexpr
sle_showexpr sle_showexpr
st_2 st_2
st_3 st_3
ddlb_dwoperator ddlb_dwoperator
cb_buildexpr cb_buildexpr
ddlb_operator ddlb_operator
gb_2 gb_2
st_1 st_1
cb_reset cb_reset
st_6 st_6
ddlb_dwcolumn ddlb_dwcolumn
st_7 st_7
mle_2 mle_2
mle_1 mle_1
gb_1 gb_1
st_dwrow st_dwrow
ddlb_column ddlb_column
cb_apply cb_apply
end type
global w_buildfilter w_buildfilter

on w_buildfilter.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_close)
destroy(this.sle_value)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.cb_dwbuildexpr)
destroy(this.sle_showexpr)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.ddlb_dwoperator)
destroy(this.cb_buildexpr)
destroy(this.ddlb_operator)
destroy(this.gb_2)
destroy(this.st_1)
destroy(this.cb_reset)
destroy(this.st_6)
destroy(this.ddlb_dwcolumn)
destroy(this.st_7)
destroy(this.mle_2)
destroy(this.mle_1)
destroy(this.gb_1)
destroy(this.st_dwrow)
destroy(this.ddlb_column)
destroy(this.cb_apply)
end on

on w_buildfilter.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_close=create cb_close
this.sle_value=create sle_value
this.st_4=create st_4
this.st_5=create st_5
this.cb_dwbuildexpr=create cb_dwbuildexpr
this.sle_showexpr=create sle_showexpr
this.st_2=create st_2
this.st_3=create st_3
this.ddlb_dwoperator=create ddlb_dwoperator
this.cb_buildexpr=create cb_buildexpr
this.ddlb_operator=create ddlb_operator
this.gb_2=create gb_2
this.st_1=create st_1
this.cb_reset=create cb_reset
this.st_6=create st_6
this.ddlb_dwcolumn=create ddlb_dwcolumn
this.st_7=create st_7
this.mle_2=create mle_2
this.mle_1=create mle_1
this.gb_1=create gb_1
this.st_dwrow=create st_dwrow
this.ddlb_column=create ddlb_column
this.cb_apply=create cb_apply
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.sle_value
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.cb_dwbuildexpr
this.Control[iCurrent+7]=this.sle_showexpr
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.ddlb_dwoperator
this.Control[iCurrent+11]=this.cb_buildexpr
this.Control[iCurrent+12]=this.ddlb_operator
this.Control[iCurrent+13]=this.gb_2
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.cb_reset
this.Control[iCurrent+16]=this.st_6
this.Control[iCurrent+17]=this.ddlb_dwcolumn
this.Control[iCurrent+18]=this.st_7
this.Control[iCurrent+19]=this.mle_2
this.Control[iCurrent+20]=this.mle_1
this.Control[iCurrent+21]=this.gb_1
this.Control[iCurrent+22]=this.st_dwrow
this.Control[iCurrent+23]=this.ddlb_column
this.Control[iCurrent+24]=this.cb_apply
end on

type dw_1 from u_dw within w_buildfilter
int X=114
int Y=1104
int Width=2450
int Height=376
int TabOrder=0
string DataObject="d_employeereadonly"
end type

event constructor;call super::constructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	constructor
//
//	Description:
//	Initializes the DataWindow.
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

of_SetTransObject(sqlca)

of_SetRowSelect(true)
of_SetUpdateable(false)

of_Retrieve()

end event

event rowfocuschanged;call super::rowfocuschanged;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	rowfocuschanged
//
//	Description:
//	Set the row value in grouping one equal to the current row number.
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

st_dwrow.text = String(currentrow)
end event

event pfc_retrieve;call super::pfc_retrieve;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_retrieve
//
//	Arguments:
//	None
//
//	Returns:
//	long
//	The number of rows retrieved from the database
// -1 if it fails
// If any argument's value is NULL, pfc_retrieve returns NULL
//
//	Description:
//	Retrieves data into the DataWindow.
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

return this.Retrieve()
end event

event pfc_prermbmenu;call super::pfc_prermbmenu;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	pfc_prermbmenu
//
//	Arguments:
//	am_dw   	the menu that will be displayed when the DataWindow
//				is right clicked.
//
//	Returns:
//	None
//
//	Description:
// Initialize the Right Mouse Menu for the DataWindow.
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

am_dw.m_table.m_insert.enabled = false
am_dw.m_table.m_addrow.enabled = false
am_dw.m_table.m_delete.enabled = false
end event

type cb_close from u_cb within w_buildfilter
int X=2295
int Y=1544
int TabOrder=100
boolean BringToTop=true
string Text="Close"
boolean Cancel=true
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Calls the pfc_close event on the window.
//
//////////////////////////////////////////////////////////////////////////////

parent.event pfc_close()
end event

type sle_value from u_sle within w_buildfilter
int X=2249
int Y=196
int Width=370
int TabOrder=60
boolean BringToTop=true
long BackColor=1090519039
end type

type st_4 from u_st within w_buildfilter
int X=2249
int Y=112
boolean BringToTop=true
string Text="Enter a Value:"
end type

type st_5 from u_st within w_buildfilter
int X=1874
int Y=112
int Width=361
boolean BringToTop=true
string Text="Select Operator:"
end type

type cb_dwbuildexpr from u_cb within w_buildfilter
int X=434
int Y=344
int Width=425
int TabOrder=30
boolean BringToTop=true
string Text="&Build Expression"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Gets the row, column and operator information from the GUI and calls
// the of_BuildExpression(). 
//
//////////////////////////////////////////////////////////////////////////////

long		ll_row
string	ls_column

ll_row = Long(st_dwrow.text)
ls_column = ddlb_dwcolumn.text

sle_showexpr.text = dw_1.inv_rowselect.of_BuildExpression(ll_row, ls_column, ddlb_dwoperator.text)


end event

type sle_showexpr from u_sle within w_buildfilter
int X=814
int Y=972
int Width=1166
int TabOrder=0
boolean BringToTop=true
boolean DisplayOnly=true
long BackColor=77633680
end type

type st_2 from u_st within w_buildfilter
int X=421
int Y=112
boolean BringToTop=true
string Text="Select Column:"
end type

type st_3 from u_st within w_buildfilter
int X=878
int Y=112
int Width=361
boolean BringToTop=true
string Text="Select Operator:"
end type

type ddlb_dwoperator from u_ddlb within w_buildfilter
int X=878
int Y=196
int Width=347
int Height=284
int TabOrder=20
boolean Sorted=false
string Item[]={"=",&
">",&
"<",&
"<>",&
">=",&
"<="}
end type

type cb_buildexpr from u_cb within w_buildfilter
int X=1838
int Y=344
int Width=425
int TabOrder=70
boolean BringToTop=true
string Text="Build &Expression"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Calls of_BuildExpression() passing the column, operator and a data value.
//
//////////////////////////////////////////////////////////////////////////////


sle_showexpr.text = dw_1.inv_rowselect.of_BuildExpression(0, ddlb_column.text,&
	ddlb_operator.text, sle_value.text)



end event

type ddlb_operator from u_ddlb within w_buildfilter
int X=1874
int Y=196
int Width=347
int Height=264
int TabOrder=50
boolean BringToTop=true
boolean Sorted=false
string Item[]={"=",&
">",&
"<",&
"<>",&
">=",&
"<="}
end type

type gb_2 from u_gb within w_buildfilter
int X=1417
int Y=28
int Width=1253
int Height=816
int TabOrder=0
string Text="Build Filter From Supplied Criteria:"
long BackColor=79741120
end type

type st_1 from u_st within w_buildfilter
int X=96
int Y=112
int Width=265
boolean BringToTop=true
string Text="Row:"
end type

type cb_reset from u_cb within w_buildfilter
int X=1920
int Y=1544
int TabOrder=90
boolean BringToTop=true
string Text="&Clear Filter"
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Sets the filter to the expression created by of_BuildExpression(), then
// applies the filter to the DataWindow.
//
//////////////////////////////////////////////////////////////////////////////

dw_1.SetFilter("")
sle_showexpr.text = ""
dw_1.Filter()

end event

type st_6 from u_st within w_buildfilter
int X=1440
int Y=112
int Height=76
boolean BringToTop=true
string Text="Select Column:"
end type

type ddlb_dwcolumn from u_ddlb within w_buildfilter
int X=421
int Y=196
int Width=407
int Height=264
int TabOrder=10
boolean BringToTop=true
boolean Sorted=false
end type

event constructor;// Build the list of columns.

integer li_colcount
integer li_idx
string	ls_colname

li_colcount = Integer( dw_1.Object.DataWindow.Column.Count )

For li_idx = 1 to li_colcount
	ls_colname = dw_1.Describe("#"+ string(li_idx) +".Name")
	If len(ls_colname) > 0 Then
		this.AddItem(ls_colname)
	End If
Next
end event

type st_7 from u_st within w_buildfilter
int X=736
int Y=896
int Width=1317
boolean BringToTop=true
string Text="This is the expression built by the base DataWindow service:"
long BackColor=77633680
end type

type mle_2 from u_mle within w_buildfilter
int X=1477
int Y=492
int Width=1134
int Height=288
int TabOrder=0
boolean BringToTop=true
boolean Border=false
BorderStyle BorderStyle=StyleBox!
boolean AutoVScroll=false
boolean DisplayOnly=true
string Text="You can also build a dynamic filter expression around a value stored in a script variable by simply calling the ~"of_BuildExpression~" function and supplying it with a column, operator and value."
long BackColor=79741120
end type

type mle_1 from u_mle within w_buildfilter
int X=119
int Y=492
int Width=1138
int Height=328
int TabOrder=0
boolean BringToTop=true
boolean Border=false
BorderStyle BorderStyle=StyleBox!
boolean AutoVScroll=false
boolean DisplayOnly=true
string Text="You can use the base DataWindow service to dynamically build a DataWindow filter expression around the data in a selected row and column.  Select a row from the DataWindow below, then select a column and operator.   Click the ~"Build Expression~" button."
long BackColor=79741120
end type

type gb_1 from u_gb within w_buildfilter
int X=32
int Y=24
int Width=1294
int Height=816
int TabOrder=0
string Text="Build Filter from DataWindow Row/Column Specification:"
long BackColor=79741120
end type

type st_dwrow from u_st within w_buildfilter
int X=96
int Y=196
int Width=279
int Height=80
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text=""
Alignment Alignment=Right!
long BackColor=79741120
end type

type ddlb_column from u_ddlb within w_buildfilter
int X=1445
int Y=196
int Width=389
int TabOrder=40
boolean BringToTop=true
boolean Sorted=false
end type

event constructor;// Build the list of columns.

integer li_colcount
integer li_idx
string	ls_colname

li_colcount = Integer( dw_1.Object.DataWindow.Column.Count )

For li_idx = 1 to li_colcount
	ls_colname = dw_1.Describe("#"+ string(li_idx) +".Name")
	If len(ls_colname) > 0 Then
		this.AddItem(ls_colname)
	End If
Next
end event

type cb_apply from u_cb within w_buildfilter
int X=1545
int Y=1544
int TabOrder=80
boolean BringToTop=true
string Text="&Apply Filter"
boolean Default=true
end type

event clicked;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	clicked
//
//	Description:
//	Sets the filter to the expression created by of_BuildExpression(), then
// applies the filter to the DataWindow.
//
//////////////////////////////////////////////////////////////////////////////

dw_1.SetFilter(sle_showexpr.text)
dw_1.Filter()

end event

