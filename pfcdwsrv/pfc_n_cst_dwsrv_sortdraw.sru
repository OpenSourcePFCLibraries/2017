HA$PBExportHeader$pfc_n_cst_dwsrv_sortdraw.sru
$PBExportComments$Draws "arrow" to indicate primary dataWindow sort order.
forward
global type pfc_n_cst_dwsrv_sortdraw from n_cst_dwsrv
end type
end forward

global type pfc_n_cst_dwsrv_sortdraw from n_cst_dwsrv
end type
global pfc_n_cst_dwsrv_sortdraw pfc_n_cst_dwsrv_sortdraw

type variables
Public:

	//	Sort Indicator Alignment
	CONSTANT Integer				LEFT							= 0			//	Draw the sort indicator on the left side
	CONSTANT Integer				RIGHT							= 1			//	Draw the sort indicator on the right side
	CONSTANT Integer				AUTO							= 4			//	Draw the sort indicator on the left side if the header text is centered, justified or right justified
																						//	and draw it on the right side if the header text is left justified.  This avoids an overlap of the
																						//	sort indicator and header text when they are both left justified.
Private:

	n_cst_PBUnitConversion		invo_conversion
	n_cst_color						invo_color
	
	string							is_sortDWObject			= ''
	
	Long								il_primaryLineColor		= 0
	Long								il_secondaryLineColor	= 0
	Long								il_backGroundLineColor	= 0
	
	string							is_band						= 'foreground'

	Integer							ii_alignment				= AUTO
end variables

forward prototypes
public subroutine of_draw (datawindow vdw_sort, string vs_dwobject)
public subroutine of_draw (string vs_dwobject)
public subroutine of_draw ()
protected function integer of_getalignment ()
protected subroutine of_setalignment (integer vi_alignment)
public subroutine of_drawnone (datawindow vdw_sort)
public subroutine of_drawnone ()
protected function long of_getcolorlinebackground ()
protected function long of_getcolorlineprimary ()
protected function long of_getcolorlinesecondary ()
protected subroutine of_setcolorlinebackground (long vl_backgroundlinecolor)
protected subroutine of_setcolorlineprimary (long vl_primarylinecolor)
protected subroutine of_setcolorlinesecondary (long vl_secondarylinecolor)
private function string of_getsortdwobject ()
private subroutine of_setsortdwobject (string vs_sortdwobject)
public function boolean of_issortlineclicked (dwobject vdwo_clicked)
public function boolean of_issortlineclicked (string vs_dwobject)
private subroutine of_drawascending (datawindow vdw_sort, integer vi_x, integer vi_y)
private subroutine of_drawascending (integer vi_x, integer vi_y)
private subroutine of_drawdescending (datawindow vdw_sort, integer vi_x, integer vi_y)
private subroutine of_drawdescending (integer vi_x, integer vi_y)
end prototypes

public subroutine of_draw (datawindow vdw_sort, string vs_dwobject);IF IsNull(vs_DWObject) OR Trim(vs_DWObject) = '' THEN RETURN
                                                                        &
//	IF the object to sort on is in number format, then convert it to the
//	object name.
IF Left(vs_DWObject, 1) = '#' THEN
	
	String							ls_name
	ls_name							= vdw_Sort.Describe(vs_DWObject + '.Name')
	
	IF ls_name = '!' OR ls_name = '?' OR ls_name = '' THEN RETURN
	
	vs_DWObject						= ls_name
	
END IF

CHOOSE CASE vdw_Sort.Describe(vs_DWObject + '.Type')
	CASE 'text'
	CASE 'column', 'compute'
		vs_DWObject					= vs_DWObject + of_getDefaultHeaderSuffix()
	CASE ELSE
		RETURN
END CHOOSE

String								ls_Sort = '',	ls_Column

//vdw_Sort.SetRedraw(FALSE)

of_drawNone(vdw_Sort)

IF Lower(Right(vs_DWObject, 2)) = of_getDefaultHeaderSuffix() THEN

	ls_Column						= Lower(Left(vs_DWObject, Len(vs_DWObject) - 2))

	IF vdw_Sort.Describe(ls_Column + '.Type') = 'column'	OR					&
		vdw_Sort.Describe(ls_Column + '.Type') = 'compute' THEN
		
		Long							ll_X,	ll_Y

		ls_Sort						= Lower(vdw_sort.Describe('dataWindow.Table.Sort'))

		Long							ll_pos
		ll_pos						= Pos(ls_Sort, ls_column + ' a')
		
		IF ll_pos = 1	THEN
			
			of_setSortDWObject(vs_DWObject)

			ll_X						= Long(vdw_Sort.Describe(vs_DWObject + '.X'))
			ll_Y						= Long(vdw_Sort.Describe(vs_DWObject + '.Y'))
			
			CHOOSE CASE of_getAlignment()
				CASE AUTO
					IF vdw_Sort.Describe(vs_DWObject + '.Alignment') = '0' THEN
						ll_X			= ll_X + Long(vdw_Sort.Describe(vs_DWObject + '.Width')) - invo_conversion.of_ConvertUnitsX(12, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
					END IF
				CASE RIGHT
					ll_X				= ll_X + Long(vdw_Sort.Describe(vs_DWObject + '.Width')) - invo_conversion.of_ConvertUnitsX(12, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
			END CHOOSE
			
			of_drawAscending(vdw_Sort, ll_X, ll_Y)
			
		ELSE
			
			ll_pos					= Pos(ls_Sort, ls_column + ' d')

			IF ll_pos = 1 THEN
				
				of_setSortDWObject(vs_DWObject)
				
				ll_X					= Long(vdw_Sort.Describe(vs_DWObject + '.X'))
				ll_Y					= Long(vdw_Sort.Describe(vs_DWObject + '.Y'))

				CHOOSE CASE of_getAlignment()
					CASE AUTO
						IF vdw_Sort.Describe(vs_DWObject + '.Alignment') = '0' THEN
							ll_X		= ll_X + Long(vdw_Sort.Describe(vs_DWObject + '.Width')) - invo_conversion.of_ConvertUnitsX(12, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
						END IF
					CASE RIGHT
						ll_X			= ll_X + Long(vdw_Sort.Describe(vs_DWObject + '.Width')) - invo_conversion.of_ConvertUnitsX(12, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
				END CHOOSE

				of_drawDescending(vdw_Sort, ll_X, ll_Y)
				
			END IF
								
		END IF
	END IF
END IF

//vdw_Sort.SetRedraw(TRUE)

RETURN

end subroutine

public subroutine of_draw (string vs_dwobject);IF isValid(idw_requestor) THEN of_draw(idw_requestor, vs_DWObject)

RETURN
end subroutine

public subroutine of_draw ();IF isValid(idw_requestor) THEN of_draw(idw_requestor, of_getSortDWObject())

RETURN
end subroutine

protected function integer of_getalignment ();Return(ii_alignment)
end function

protected subroutine of_setalignment (integer vi_alignment);IF vi_alignment <> LEFT AND vi_alignment <> RIGHT AND vi_alignment <> AUTO THEN Return

ii_alignment						= vi_alignment

RETURN
end subroutine

public subroutine of_drawnone (datawindow vdw_sort);IF vdw_Sort.Describe('sort_ln1_xyzzy.type') = 'line' THEN
	
	of_setSortDWObject("")

	String							ls_Modify
	ls_Modify						= 'DESTROY sort_ln1_xyzzy DESTROY sort_ln2_xyzzy DESTROY sort_ln3_xyzzy '
	
	// Destroy the triangle
	vdw_Sort.Modify(ls_Modify)

END IF

RETURN
end subroutine

public subroutine of_drawnone ();IF isValid(idw_requestor) THEN of_drawNone(idw_requestor)

RETURN
end subroutine

protected function long of_getcolorlinebackground ();Return(il_backgroundLineColor)
end function

protected function long of_getcolorlineprimary ();Return(il_primaryLineColor)
end function

protected function long of_getcolorlinesecondary ();Return(il_secondaryLineColor)
end function

protected subroutine of_setcolorlinebackground (long vl_backgroundlinecolor);il_backGroundLineColor			= vl_backGroundLineColor

RETURN
end subroutine

protected subroutine of_setcolorlineprimary (long vl_primarylinecolor);il_primaryLineColor				= vl_primaryLineColor

RETURN
end subroutine

protected subroutine of_setcolorlinesecondary (long vl_secondarylinecolor);il_secondaryLineColor			= vl_secondaryLineColor

RETURN
end subroutine

private function string of_getsortdwobject ();Return(is_sortDWObject)
end function

private subroutine of_setsortdwobject (string vs_sortdwobject);is_sortDWObject					= vs_sortDWObject

RETURN
end subroutine

public function boolean of_issortlineclicked (dwobject vdwo_clicked);Return(of_isSortLineClicked(String(vdwo_clicked.Name)))
end function

public function boolean of_issortlineclicked (string vs_dwobject);String						ls_ID
ls_ID							= Lower(Left(vs_DWObject, Len('sort_lnx_xyzzy')))

Return(ls_ID = 'sort_ln1_xyzzy' OR ls_ID = 'sort_ln2_xyzzy' OR ls_ID = 'sort_ln3_xyzzy')
end function

private subroutine of_drawascending (datawindow vdw_sort, integer vi_x, integer vi_y);Long									ll_X1,	ll_Y1,	ll_X2,	ll_Y2,	ll_X3,	ll_Y3,	ll_X4,	ll_Y4

vi_X									= invo_conversion.of_ConvertUnitsX(vi_X, Long(vdw_sort.Describe('DataWindow.Units')), invo_conversion.Pixels)
vi_Y									= invo_conversion.of_ConvertUnitsY(vi_Y, Long(vdw_sort.Describe('DataWindow.Units')), invo_conversion.Pixels)

ll_X1									= vi_X + 1
ll_Y1									= vi_Y + 1

ll_X2									= ll_X1 + 4
ll_Y2									= ll_Y1 + 4
ll_X3									= ll_X1 + 3
ll_Y3									= ll_Y1 + 5
ll_X4									= ll_X1 + 8
ll_Y4									= ll_Y1 - 1

ll_X1									= invo_conversion.of_ConvertUnitsX(ll_X1, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
ll_Y1									= invo_conversion.of_ConvertUnitsY(ll_Y1, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
ll_X2									= invo_conversion.of_ConvertUnitsX(ll_X2, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
ll_Y2									= invo_conversion.of_ConvertUnitsY(ll_Y2, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
ll_X3									= invo_conversion.of_ConvertUnitsX(ll_X3, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
ll_Y3									= invo_conversion.of_ConvertUnitsY(ll_Y3, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
ll_X4									= invo_conversion.of_ConvertUnitsX(ll_X4, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
ll_Y4									= invo_conversion.of_ConvertUnitsY(ll_Y4, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))

String								ls_Modify

ls_Modify							= 'CREATE line(band=header x1="' + String(ll_X1)	&
										+ '" y1="' + String(ll_Y2)									&
										+ '" x2="' + String(ll_X4)									&
										+ '" y2="' + String(ll_Y2)									&
										+ '" pen.style="0" pen.width="1" '						&
										+ 'pen.color="'												&
										+ String(of_getColorLinePrimary())						&
										+ '" background.mode="2" visible="1" '					&
										+ 'band=' + is_band + ' background.color="'			&
										+ String(of_getColorLineBackGround())					&
										+ '" name=sort_ln1_xyzzy) '

ls_Modify							= ls_Modify														&
										+ 'CREATE line(band=header x1="' + String(ll_X1) 	&
										+ '" y1="' + String(ll_Y2)									&
										+ '" x2="' + String(ll_X2)									&
										+ '" y2="' + String(ll_Y1) 								&
										+ '" pen.style="0" pen.width="1" '						&
										+ 'pen.color="'												&
										+ String(of_getColorLinePrimary())						&
										+ '" background.mode="2" visible="1" '					&
										+ 'band=' + is_band + ' background.color="'			&
										+ String(of_getColorLineBackGround())					&
										+ '" name=sort_ln2_xyzzy) '

ls_Modify							= ls_Modify														&
										+ 'CREATE line(band=header x1="' + String(ll_X4)	&
										+ '" y1="' + String(ll_Y2)									&
										+ '" x2="' + String(ll_X3)									&
										+ '" y2="' + String(ll_Y4)									&
										+ '" pen.style="0" pen.width="1" '						&
										+ 'pen.color="'												&
										+ String(of_getColorLineSecondary())					&
										+ '" background.mode="2" visible="1" '					&
										+ 'band=' + is_band + ' background.color="'			&
										+ String(of_getColorLineBackGround())					&
										+ '" name=sort_ln3_xyzzy) '
// Create the triangle
vdw_Sort.Modify(ls_Modify)

RETURN
end subroutine

private subroutine of_drawascending (integer vi_x, integer vi_y);IF IsValid(idw_requestor) THEN of_drawAscending(idw_requestor, vi_X, vi_Y)

RETURN
end subroutine

private subroutine of_drawdescending (datawindow vdw_sort, integer vi_x, integer vi_y);Long									ll_X1,	ll_Y1,	ll_X2,	ll_Y2,	ll_X3,	ll_Y3,	ll_X4,	ll_Y4

vi_X									= invo_conversion.of_ConvertUnitsX(vi_X, Long(vdw_sort.Describe('DataWindow.Units')), invo_conversion.Pixels)
vi_Y									= invo_conversion.of_ConvertUnitsY(vi_Y, Long(vdw_sort.Describe('DataWindow.Units')), invo_conversion.Pixels)

ll_X1									= vi_X + 1
ll_Y1									= vi_Y + 1

ll_X2									= ll_X1 + 4
ll_Y2									= ll_Y1 + 4
ll_X3									= ll_X1 + 3
ll_Y3									= ll_Y1 + 5
ll_X4									= ll_X1 + 8
ll_Y4									= ll_Y1 - 1

ll_X1									= invo_conversion.of_ConvertUnitsX(ll_X1, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
ll_Y1									= invo_conversion.of_ConvertUnitsY(ll_Y1, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
ll_X2									= invo_conversion.of_ConvertUnitsX(ll_X2, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
ll_Y2									= invo_conversion.of_ConvertUnitsY(ll_Y2, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
ll_X3									= invo_conversion.of_ConvertUnitsX(ll_X3, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
ll_Y3									= invo_conversion.of_ConvertUnitsY(ll_Y3, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
ll_X4									= invo_conversion.of_ConvertUnitsX(ll_X4, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))
ll_Y4									= invo_conversion.of_ConvertUnitsY(ll_Y4, invo_conversion.Pixels, Long(vdw_sort.Describe('DataWindow.Units')))

String								ls_Modify

ls_Modify							= 'CREATE line(band=header x1="' + String(ll_X1)	&
										+ '" y1="' + String(ll_Y1)									&
										+ '" x2="' + String(ll_X4)									&
										+ '" y2="' + String(ll_Y1)									&
										+ '" pen.style="0" pen.width="1" '						&
										+ 'pen.color="'												&
										+ String(of_getColorLinePrimary())						&
										+ '" background.mode="2" visible="1" '					&
										+ 'band=' + is_band + ' background.color="'			&
										+ String(of_getColorLineBackGround())					&
										+ '" name=sort_ln1_xyzzy) '
	
ls_Modify							= ls_Modify														&
										+ 'CREATE line(band=header x1="' + String(ll_X1)	&
										+ '" y1="' + String(ll_Y1)									&
										+ '" x2="' + String(ll_X2)									&
										+ '" y2="' + String(ll_Y2)									&
										+ '" pen.style="0" pen.width="1" '						&
										+ 'pen.color="'												&
										+ String(of_getColorLinePrimary())						&
										+ '" background.mode="2" visible="1" '					&
										+ 'band=' + is_band + ' background.color="'			&
										+ String(of_getColorLineBackGround())					&
										+ '" name=sort_ln2_xyzzy) '
	
ls_Modify							= ls_Modify														&
										+ 'CREATE line(band=header x1="' + String(ll_X4)	&
										+ '" y1="' + String(ll_Y1)									&
										+ '" x2="' + String(ll_X3)									&
										+ '" y2="' + String(ll_Y3)									&
										+ '" pen.style="0" pen.width="1" '						&
										+ 'pen.color="'												&
										+ String(of_getColorLineSecondary())					&
										+ '" background.mode="2" visible="1" '					&
										+ 'band=' + is_band + ' background.color="'			&
										+ String(of_getColorLineBackGround())					&
										+ '" name=sort_ln3_xyzzy) '
// Create the triangle
vdw_Sort.Modify(ls_Modify)

RETURN
end subroutine

private subroutine of_drawdescending (integer vi_x, integer vi_y);IF isValid(idw_requestor) THEN of_drawDescending(idw_requestor, vi_X, vi_Y)

RETURN
end subroutine

on pfc_n_cst_dwsrv_sortdraw.create
call super::create
end on

on pfc_n_cst_dwsrv_sortdraw.destroy
call super::destroy
end on

event constructor;call super::constructor;//	If you don't like these colors, change them in the descendent
//	n_cst_dwSrv_sortDraw.  You can change the default sort indicator
//	alignment there as well using of_alignment().

of_setColorLinePrimary(invo_color.of_buttonText())
of_setColorLineSecondary(invo_color.of_buttonShadow())
of_setColorLineBackGround(invo_color.of_hiLightText())
end event

