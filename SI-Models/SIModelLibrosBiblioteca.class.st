Class {
	#name : #SIModelLibrosBiblioteca,
	#superclass : #SIModelBibliotecas,
	#category : #'SI-Models'
}

{ #category : #adding }
SIModelLibrosBiblioteca >> add: unLibro [
	iface sys agregarLibro: unLibro enLaBiblioteca: iface lib.
	self refresh.
]

{ #category : #adding }
SIModelLibrosBiblioteca >> agregar: unLibro [
	iface sys agregarLibro: unLibro enLaBiblioteca: iface lib.
	self refresh.
]

{ #category : #defaults }
SIModelLibrosBiblioteca >> iconFor: anElement at: idColumn [ 
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

{ #category : #accessing }
SIModelLibrosBiblioteca >> refresh [ 
	elements := iface lib libros.
	self changed: #refresh.
]

{ #category : #removing }
SIModelLibrosBiblioteca >> remove: unLibro [ 
	iface lib removerLibro: unLibro.
	self refresh.
]

{ #category : #removing }
SIModelLibrosBiblioteca >> removeAt: index [ 
	self remove: (elements at: index).
]

{ #category : #'as yet unclassified' }
SIModelLibrosBiblioteca >> stringFor: anElement at: idColumn [
	idColumn = 'Titulo'		ifTrue: [ ^anElement nombre ].
	idColumn = 'Año'			ifTrue: [ ^anElement año ].
	idColumn = 'Editorial'	ifTrue: [ ^anElement editorial ].
	idColumn = 'Disponible'	ifTrue: [ ^'' ].
	idColumn = 'Autores'		ifTrue: [ ^anElement autores inject: '- ' into: [ :a :each | a, each nombre , ' - ' ]].
	^super stringFor: anElement at: idColumn .

]
