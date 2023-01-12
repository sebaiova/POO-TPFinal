Class {
	#name : #SIModelBibliotecas,
	#superclass : #SIModelAbstractTable,
	#instVars : [
		'sistema'
	],
	#category : #'SI-Models'
}

{ #category : #'instance creation' }
SIModelBibliotecas class >> sistema: unSistema [ 
	^super new initializeSistema: unSistema.
]

{ #category : #adding }
SIModelBibliotecas >> agregar: unaBiblioteca [
	| a |
	a := sistema agregarBiblioteca: unaBiblioteca.
	self refresh.
	^a.
]

{ #category : #initialization }
SIModelBibliotecas >> initializeSistema: unSistema [
	self initialize.
	sistema := unSistema.
	self refresh.
	^self.
]

{ #category : #refresh }
SIModelBibliotecas >> refresh [ 
	elements := sistema bibliotecas.
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
