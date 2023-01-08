Class {
	#name : #ModelLibros,
	#superclass : #ModelBibliotecas,
	#instVars : [
		'biblioteca'
	],
	#category : #'SI-Models'
}

{ #category : #'instance creation' }
ModelLibros class >> biblioteca: unaBiblioteca [
	^super new initializeBiblioteca: unaBiblioteca sistema: nil.
]

{ #category : #'instance creation' }
ModelLibros class >> biblioteca: unaBiblioteca sistema: elSistema [
	^super new initializeBiblioteca: unaBiblioteca sistema: elSistema.
]

{ #category : #accessing }
ModelLibros class >> prestamo: unPrestamo [ 
	^ self biblioteca: unPrestamo.
]

{ #category : #adding }
ModelLibros >> add: unLibro [
	sistema agregarLibro: unLibro enLaBiblioteca:  biblioteca.
	self refresh.
]

{ #category : #defaults }
ModelLibros >> iconFor: anElement at: idColumn [ 
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
ModelLibros >> initializeBiblioteca: unaBiblioteca sistema: elSistema [
	self initialize.
	biblioteca := unaBiblioteca.
	sistema := elSistema.
	self refresh.
	^self.
]

{ #category : #accessing }
ModelLibros >> refresh [ 
	elements := biblioteca libros.
	self changed: #refresh.
]

{ #category : #removing }
ModelLibros >> remove: unLibro [ 
	biblioteca removerLibro: unLibro.
	self refresh.
]

{ #category : #'as yet unclassified' }
ModelLibros >> stringFor: anElement at: idColumn [
	idColumn = 'Titulo'		ifTrue: [ ^anElement nombre ].
	idColumn = 'Año'			ifTrue: [ ^anElement año ].
	idColumn = 'Editorial'	ifTrue: [ ^anElement editorial ].
	idColumn = 'Disponible'	ifTrue: [ ^'' ].
	idColumn = 'Autores'		ifTrue: [ ^anElement autores inject: '- ' into: [ :a :each | a, each nombre , ' - ' ]].
	^super stringFor: anElement at: idColumn .

]
