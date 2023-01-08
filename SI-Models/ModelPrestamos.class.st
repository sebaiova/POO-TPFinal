Class {
	#name : #ModelPrestamos,
	#superclass : #SIModelAbstractTable,
	#category : #'SI-Models'
}

{ #category : #defaults }
ModelPrestamos >> iconFor: anElement at: idColumn [ 
	(idColumn = 'Fecha Limite') ifTrue: [
				 anElement estaRetrasado ifTrue: [ ^ (self iconNamed: #smallError ) asMorph. ]
										ifFalse: [ ^ (self iconNamed: #calendar) asMorph.  ]
		 ].
	^nil.
]

{ #category : #'as yet unclassified' }
ModelPrestamos >> stringFor: anElement at: idColumn [
	idColumn = 'Fecha Inicio'			ifTrue: [ ^anElement fecha ddmmyyyy ].
	idColumn = 'Fecha Limite'			ifTrue: [ ^anElement fechaMaxima ddmmyyyy ].
	idColumn = 'Cantidad de Libros'	ifTrue: [ ^anElement cantidadLibros ].
	idColumn = 'Usuario'					ifTrue: [ ^anElement usuario dni ].
	^super stringFor: anElement at: idColumn .
]
