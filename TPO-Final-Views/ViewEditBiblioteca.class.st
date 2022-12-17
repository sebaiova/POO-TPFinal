Class {
	#name : #ViewEditBiblioteca,
	#superclass : #ViewEdit,
	#category : #'TPO-Final-Views'
}

{ #category : #initialization }
ViewEditBiblioteca >> initialize: biblioteca [
	| tabs |
	self	initialize
			addMorph: (tabs := Tabs new).	
	tabs addPage: (TabPage new) label: 'Datos'.
	tabs addPage: (TabPage new) label: 'Libros'.	
	tabs addPage: (TabPage new) label: 'Prestamos'.	
	tabs selectedPageIndex: 1.
	^self.
]
