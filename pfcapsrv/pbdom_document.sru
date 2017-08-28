HA$PBExportHeader$pbdom_document.sru
forward
global type pbdom_document from pbdom_object
end type
end forward

global type pbdom_document from pbdom_object native "PBDOM170.pbx"
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
public function  boolean			NewDocument (string strRootElementName)
public function  boolean			NewDocument (string strRootElementNamespacePrefix, string strRootElementNamespaceURI, string strRootElementName, string strDocTypePublicId, string strDocTypeSystemId)
public function  pbdom_element		GetRootElement()
public function  pbdom_doctype		GetDocType()
public function  boolean			SaveDocument(string strFileName)
public function  pbdom_element		DetachRootElement()
public function  boolean			HasRootElement()
public function  pbdom_document	SetDocType(pbdom_doctype pbdom_doctype_ref)
public function  pbdom_document	SetRootElement(pbdom_element pbdom_element_ref)
public function  boolean			GetElementsbyTagName(string strTagName ,ref pbdom_element pbdom_element_array[])
public function  string			SaveDocumentIntoString()
public function  pbdom_processinginstruction	GetProcessinginstructionNode()
public function  boolean			SaveDocument(string strFileName, boolean bMinimalEscapesInTextNode)
end type
global pbdom_document pbdom_document

on pbdom_document.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pbdom_document.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

