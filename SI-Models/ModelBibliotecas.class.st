Class {
	#name : #ModelBibliotecas,
	#superclass : #SIModelAbstractTable,
	#instVars : [
		'sistema'
	],
	#category : #'SI-Models'
}

{ #category : #'instance creation' }
ModelBibliotecas class >> sistema: unSistema [ 
	^super new initializeSistema: unSistema.
]

{ #category : #adding }
ModelBibliotecas >> agregar: unaBiblioteca [
	| a |
	a := sistema agregarBiblioteca: unaBiblioteca.
	self refresh.
	^a.
]

{ #category : #accessing }
ModelBibliotecas >> getModelLibros: ofIndex [ 
	^ModelLibros biblioteca: (self elementAt: ofIndex) sistema: sistema.
	
]

{ #category : #initialization }
ModelBibliotecas >> initializeSistema: unSistema [
	self initialize.
	sistema := unSistema.
	self refresh.
	^self.
]

{ #category : #refresh }
ModelBibliotecas >> refresh [ 
	elements := sistema bibliotecas.
	self changed: #refresh.
]

{ #category : #'as yet unclassified' }
ModelBibliotecas >> stringFor: anElement at: idColumn [
	idColumn = 'Nombre'			ifTrue: [ ^anElement nombre ].
	idColumn = 'Representante'	ifTrue: [ ^anElement representante ].
	idColumn = 'Teléfono'			ifTrue: [ ^anElement telefono ].
	idColumn = 'Dirección'		ifTrue: [ ^anElement direccion ].
	idColumn = 'ID'					ifTrue: [ ^anElement id ].
	^super stringFor: anElement at: idColumn .
]
