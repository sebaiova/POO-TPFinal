Class {
	#name : #ModelLibros,
	#superclass : #ModelAbstractTable,
	#instVars : [
		'biblioteca',
		'sistema'
	],
	#category : #'TPO-Final-Models'
}

{ #category : #'instance creation' }
ModelLibros class >> biblioteca: unaBiblioteca sistema: elSistema [
	^super new initializeBiblioteca: unaBiblioteca sistema: elSistema.
]

{ #category : #'instance creation' }
ModelLibros class >> new [ 
	self error: 'Usar biblioteca:sistema: en lugar de new'
]

{ #category : #adding }
ModelLibros >> add: unLibro [
	sistema agregarLibro: unLibro enLaBiblioteca:  biblioteca.
	self refresh.
]

{ #category : #accessing }
ModelLibros >> cellColumn: column row: rowIndex [
	| element text |
	element := self elementAt: rowIndex.
	text := element asString.
	(column id = 'Nombre') 		ifTrue: [ text := element nombre ].
	(column id = 'Editorial')	ifTrue: [ text := element editorial ].
	(column id = 'Año')			ifTrue: [ text := element año ].
	(column id = 'Estado')		ifTrue: [ text := element prestado ].
	(column id = 'Autores')		ifTrue: [ text := element autores inject: '- ' into: [ :a :each | a, each nombre , ' - ' ]].
	^ FTCellMorph new
		  addMorphBack: text asMorph;
		  yourself
]

{ #category : #initialization }
ModelLibros >> initializeBiblioteca: unaBiblioteca sistema: elSistema [
	self initialize.
	biblioteca := unaBiblioteca.
	sistema := elSistema.
	self refresh.
"	self elements: sistema bibliotecas. "
	^self.
]

{ #category : #accessing }
ModelLibros >> refresh [ 
	array := biblioteca libros.
	self changed: #refresh.
]

{ #category : #removing }
ModelLibros >> remove: unLibro [ 
	biblioteca removerLibro: unLibro.
	self refresh.
]
