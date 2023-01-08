Class {
	#name : #SIModelLibros,
	#superclass : #SIModelBibliotecas,
	#instVars : [
		'biblioteca'
	],
	#category : #'SI-Models'
}

{ #category : #'instance creation' }
SIModelLibros class >> biblioteca: unaBiblioteca [
	^super new initializeBiblioteca: unaBiblioteca sistema: nil.
]

{ #category : #'instance creation' }
SIModelLibros class >> biblioteca: unaBiblioteca sistema: elSistema [
	^super new initializeBiblioteca: unaBiblioteca sistema: elSistema.
]

{ #category : #accessing }
SIModelLibros class >> prestamo: unPrestamo [ 
	^ self biblioteca: unPrestamo.
]

{ #category : #adding }
SIModelLibros >> add: unLibro [
	sistema agregarLibro: unLibro enLaBiblioteca:  biblioteca.
	self refresh.
]

{ #category : #defaults }
SIModelLibros >> iconFor: anElement at: idColumn [ 
	idColumn = 'Disponible' ifTrue: [
				 anElement prestado ifTrue: [ ^ (self iconNamed: #testRed ) asMorph. ]
										ifFalse: [ ^ (self iconNamed: #testGreen) asMorph.  ]
		 ].
	idColumn = 'Titulo' ifTrue: [ 
				anElement esAudioLibro ifTrue: [ ^ (self iconNamed: #smallVolume) asMorph. ]
											ifFalse: [ ^ (self iconNamed: #book) asMorph. ]
		 ].
	^nil.
]

{ #category : #initialization }
SIModelLibros >> initializeBiblioteca: unaBiblioteca sistema: elSistema [
	self initialize.
	biblioteca := unaBiblioteca.
	sistema := elSistema.
	self refresh.
	^self.
]

{ #category : #accessing }
SIModelLibros >> refresh [ 
	elements := biblioteca libros.
	self changed: #refresh.
]

{ #category : #removing }
SIModelLibros >> remove: unLibro [ 
	biblioteca removerLibro: unLibro.
	self refresh.
]

{ #category : #'as yet unclassified' }
SIModelLibros >> stringFor: anElement at: idColumn [
	idColumn = 'Titulo'		ifTrue: [ ^anElement nombre ].
	idColumn = 'Año'			ifTrue: [ ^anElement año ].
	idColumn = 'Editorial'	ifTrue: [ ^anElement editorial ].
	idColumn = 'Disponible'	ifTrue: [ ^'' ].
	idColumn = 'Autores'		ifTrue: [ ^anElement autores inject: '- ' into: [ :a :each | a, each nombre , ' - ' ]].
	^super stringFor: anElement at: idColumn .

]
