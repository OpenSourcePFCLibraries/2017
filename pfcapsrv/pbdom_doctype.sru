HA$PBExportHeader$pbdom_doctype.sru
forward
global type pbdom_doctype from pbdom_object
end type
end forward

global type pbdom_doctype from pbdom_object native "PBDOM170.pbx"
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
public function  pbdom_doctype		SetDocument(pbdom_document pbdom_document_ref)
public function  string			GetInternalSubset()
public function  string			GetPublicID()
public function  string			GetSystemID()
public function  pbdom_doctype		SetInternalSubset(string strInternalSubset)
public function  pbdom_doctype		SetPublicID (string strPublicID)
public function  pbdom_doctype		SetSystemID (string strSystemID)
end type
global pbdom_doctype pbdom_doctype

on pbdom_doctype.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pbdom_doctype.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

