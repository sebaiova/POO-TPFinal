Class {
	#name : #SIPrestamo,
	#superclass : #Object,
	#instVars : [
		'fechaCreacion',
		'fechaEntrega',
		'usuario',
		'colLibros',
		'fechaMaxima'
	],
	#category : #'SI-Domain'
}

{ #category : #'instance creation' }
SIPrestamo class >> new [ 
	self error: 'Usar usuario:libros:dias en lugar de new'.
]

{ #category : #'as yet unclassified' }
SIPrestamo class >> usuario: unUsuario libros: losLibros dias: losDias [	
	^super new initializeUsuario: unUsuario libros: losLibros dias: losDias.
]

{ #category : #accessing }
SIPrestamo >> cantidadLibros [ 
	^colLibros size.
]

{ #category : #accessing }
SIPrestamo >> esDeUsuario: unUsuario [
	^usuario = unUsuario.
]

{ #category : #accessing }
SIPrestamo >> estaActivo [ 
	^ fechaEntrega isNil.
]

{ #category : #'as yet unclassified' }
SIPrestamo >> estaRetrasado [
	^ self estaActivo and: (fechaMaxima isBefore: Date today). 
]

{ #category : #accessing }
SIPrestamo >> fecha [
	^fechaCreacion
]

{ #category : #accessing }
SIPrestamo >> fechaMaxima [ 
	^fechaMaxima 
]

{ #category : #initialization }
SIPrestamo >> initializeUsuario: unUsuario libros: losLibros dias: losDias [
	self initialize.
	usuario := unUsuario .
	colLibros := losLibros.
	fechaMaxima := Date today addDays: losDias.
	fechaCreacion := Date today.
]

{ #category : #accessing }
SIPrestamo >> libros [ 
	^colLibros asArray.
]

{ #category : #registration }
SIPrestamo >> terminar [ 
	fechaEntrega := Date today.
]

{ #category : #accessing }
SIPrestamo >> usuario [ 
	^usuario.
]
