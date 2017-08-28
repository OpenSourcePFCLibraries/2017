HA$PBExportHeader$pbdom_processinginstruction.sru
forward
global type pbdom_processinginstruction from pbdom_object
end type
end forward

global type pbdom_processinginstruction from pbdom_object native "PBDOM170.pbx"
public function  string			GetName()
public function  string			GetText()
public function  boolean			GetContent(ref pbdom_object pbdom_object_array[])
public function  pbdom_object		AddContent(pbdom_object pbdom_object_ref)
public function  pbdom_object		InsertContent(pbdom_object pbdom_object_new, pbdom_object pbdom_object_ref)
public function  boolean			RemoveContent(pbdom_object pbdom_object_ref)
public function  pbdom_object		SetContent(pbdom_object pbdom_object_array[])
public function  boolean			SetName(string strName)
public function  pbdom_object		Clone(boolean bDeep)
public function  boolean			Equals(pbdom_object pbdom_object_ref)
public function  long				GetObjectClass()
public function  string			GetObjectClassString()
public function  pbdom_document	GetOwnerDocumentObject()
public function  pbdom_object		Detach()
public function  pbdom_object		GetParentObject()
public function  boolean			HasChildren()
public function  string			GetTextNormalize()
public function  string			GetTextTrim()
public function  boolean			IsAncestorObjectOf(pbdom_object pbdom_object_ref)
public function  pbdom_object		SetParentObject(pbdom_object pbdom_object_ref)
public function  string						GetData()
public function  boolean						GetNames(ref string name_array[])
public function  string						GetTarget()
public function  string						GetValue(string strName)
public function  boolean						RemoveValue(string strName)
public function  pbdom_processinginstruction	SetData(string strData)
public function  pbdom_processinginstruction	SetValue(string strName, string strValue)
end type
global pbdom_processinginstruction pbdom_processinginstruction

on pbdom_processinginstruction.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pbdom_processinginstruction.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

