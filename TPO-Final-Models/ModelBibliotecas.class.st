Class {
	#name : #ModelBibliotecas,
	#superclass : #ModelAbstractTable,
	#instVars : [
		'sistema'
	],
	#category : #'TPO-Final-Models'
}

{ #category : #'instance creation' }
ModelBibliotecas class >> new [ 
	self error: 'Usar sistema: en lugar de new'
]

{ #category : #'instance creation' }
ModelBibliotecas class >> sistema: unSistema [ 
	^super new initializeSistema: unSistema.
]

{ #category : #adding }
ModelBibliotecas >> add: unaBiblioteca [
	sistema agregarBiblioteca: unaBiblioteca.
	self refresh.
]

{ #category : #accessing }
ModelBibliotecas >> cellColumn: column row: rowIndex [
	| element text |
	element := self elementAt: rowIndex.
	text := element asString.
	(column id = 'Nombre') 			ifTrue: [ text := element nombre ].
	(column id = 'Representante')	ifTrue: [ text := element representante ].
	(column id = 'Teléfono')			ifTrue: [ text := element telefono ].
	(column id = 'Dirección')		ifTrue: [ text := element direccion ].
	^ FTCellMorph new
		  addMorphBack: text asMorph;
		  yourself
]

{ #category : #'as yet unclassified' }
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
	array := sistema bibliotecas.
	self changed: #refresh.
]
