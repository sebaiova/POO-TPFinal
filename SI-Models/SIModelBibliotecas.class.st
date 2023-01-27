Class {
	#name : #SIModelBibliotecas,
	#superclass : #SIModelAbstractTable,
	#category : #'SI-Models'
}

{ #category : #adding }
SIModelBibliotecas >> agregar: unaBiblioteca [
	| a |
	a := iface sys agregarBiblioteca: unaBiblioteca.
	self refresh.
	^a.
]

{ #category : #refresh }
SIModelBibliotecas >> refresh [ 
	elements := iface sys bibliotecas.
	self changed: #refresh.
]

{ #category : #'as yet unclassified' }
SIModelBibliotecas >> stringFor: anElement at: idColumn [
	idColumn = 'Nombre'			ifTrue: [ ^anElement nombre ].
	idColumn = 'Representante'	ifTrue: [ ^anElement representante ].
	idColumn = 'Teléfono'			ifTrue: [ ^anElement telefono ].
	idColumn = 'Dirección'		ifTrue: [ ^anElement direccion ].
	idColumn = 'ID'					ifTrue: [ ^anElement id ].
	^super stringFor: anElement at: idColumn .
]
