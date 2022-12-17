Class {
	#name : #ViewBiblioteca,
	#superclass : #View,
	#category : #'TPO-Final-Views'
}

{ #category : #initialization }
ViewBiblioteca >> initialize: biblioteca [
	| tabs |
	super initialize: biblioteca.
	self addMorph: (Row new 
				addMorph: Spacer new;
				addMorph: (Button new: 'Atras' target: self message: #close)
				);
			addMorph: (Spacer new addMorph: (tabs := Tabs new)).
				
	tabs addPage: (ViewEditBiblioteca new: biblioteca) label: 'Datos'.
	tabs addPage: (TabPage new) label: 'Libros'.	
	tabs addPage: (TabPage new) label: 'Prestamos'.	
	tabs selectedPageIndex: 1.
	^self.
]
